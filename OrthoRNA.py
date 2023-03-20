import sys
import subprocess
import shlex
import seaborn as sns
import pandas as pd
import numpy as np

from matplotlib import pyplot as plt
from matplotlib.patches import Patch
from multiprocessing import Pool
from functools import partial

def OrthoRNA(bed_with_rna_coord=sys.argv[1], cores=sys.argv[2]):
    #ORTHO2ALIGN PARALLELIZATION
    ortho2align_multiprocess(bed_with_rna_coord, cores)

    #RESULT VISUSLIZATION
    org = ['gorilla', 'marmoset', 'pig', 'horse', 'dog', 'cat', 'mouse', 'chicken', 'platypus']
    #Reading files
    initial_df = pd.read_csv('./test_pipe.bed', sep='\t', header=None)

    for i in org:
        org_df = []
        locals()['{}_annot'.format(i)] = pd.read_csv('./result/{}_result/annotation_files/bestSignificant.annotation.tsv'.format(i), sep='\t')
        org_df.append(locals()['{}_annot'.format(i)])

    for i in org:
        locals()['{}_bed'.format(i)] = pd.read_csv('./result/{}_result/bestSignificant.subject_orthologs.bed'.format(i), sep='\t', header=None)
        locals()['{}_bed'.format(i)] = locals()['{}_bed'.format(i)].iloc[:, [3,4]]
        locals()['{}_bed'.format(i)] = locals()['{}_bed'.format(i)].set_index(3)
        locals()['{}_bed'.format(i)].index.names = [None]
        locals()['{}_bed'.format(i)] = locals()['{}_bed'.format(i)].rename(columns={4: i})


    #Сonstructing a table of orthologues (0/1)
    df_binar_all = pd.DataFrame(np.nan, index=initial_df[3], columns=['human'])
    df_binar_all.index.names = [None]
    df_binar_all['human'] = 1
    for i in org:
        df_binar_all = add_organism(locals()['{}_annot'.format(i)], df_binar_all, i)
    df_binar_all.to_csv('./result/binary_table_of_orthologues.tab', sep="\t", index=True)
    
    #Adding an annotation for orthologues
    annot_df = add_organism_annotation(org_df, org, df_binar_all)
    annot_df['exist'] = annot_df.sum(axis=1)
    exist_annot_list = annot_df.pop('exist')

    #Drawing an illustration for df_binar_all
    palette = sns.color_palette("hls", len(org))
    pal = dict(zip(exist_annot_list.unique(), palette))
    row_colors = exist_annot_list.map(pal)
    handles = [Patch(facecolor=pal[name]) for name in pal]
    clustermap(df_binar_all, row_colors, handles, pal, "./result/binary_map.png")

    #Сonstructing a table of orthologues with aligment scores
    df_bed = pd.DataFrame('human', index=initial_df[3], columns=['human'])
    df_bed.index.names = [None]
    for i in org:
        df_bed = add_organism_score(locals()['{}_bed'.format(i)], df_bed)
    df_bed = df_bed.drop(columns=['human'])

    #Normalisation (Query RNA length)
    rna_length = dict()
    for i in initial_df[3].tolist():
        rna_length[i] = int(initial_df[initial_df[3] == i][2]) - int(initial_df[initial_df[3] == i][1])
    df_bed = df_bed.div(rna_length, axis='index')
    df_bed.to_csv('./result/score_table_of_orthologues.tab', sep="\t", index=True)
    

    #Drawing an illustration df_bed
    clustermap(df_bed, row_colors, handles, pal, "./result/score_map.png")

    #Сonstructing a table with annotations of orthologues
    annot_merge = pd.DataFrame(columns=['Query'])
    annot_merge['Query']=initial_df[3]
    for i in org:
        df_tmp = locals()['{}_annot'.format(i)].iloc[:,[0,1]]
        df_tmp = df_tmp.rename(columns={"Orthologs": i})
        annot_merge = pd.merge(annot_merge, df_tmp, on='Query', how='outer') 
    annot_merge.to_csv('./result/annotation_table_of_orthologues.tab', sep="\t", index=True)


def ortho2align_task(bed_with_rna_coord, org_name):
    with open("./ortho2align_stderr/ortho2align_stderr_{}.log".format(org_name), "w") as err:
            cmd = 'bash script.sh {} {}'.format(bed_with_rna_coord, org_name)
            process = subprocess.Popen(
                shlex.split(cmd),
                stderr=err,
            )
            process.wait()
    return 

def ortho2align_multiprocess(bed_with_rna_coord, cores):
    org = ['gorilla', 'marmoset', 'pig', 'horse', 'dog', 'cat', 'mouse', 'chicken', 'platypus']
    with Pool(int(cores)) as pool:
        results = pool.map(partial(ortho2align_task, bed_with_rna_coord), org)
    return results


def add_organism(org_name_df, df, col_name):
    df[col_name] = 0
    df.loc[df.index.isin(org_name_df['Query']), col_name] = 1
    return df

def add_organism_annotation(org_df, org, df):
    df_tmp = pd.DataFrame(0, index=df.index, columns=list(df))
    i = 0
    for org_name_df in org_df:
        exist_annot = org_name_df[org_name_df['Orthologs'] != 'NotAnnotated']['Query'].tolist()
        df_tmp.loc[df_tmp.index.isin(exist_annot), org[i]] = 1
        i += 1
    return df_tmp

def clustermap(df, row_colors, handles, pal, fig_name, bool=True):
    sns.set(font_scale=1.5)
    mask = df.isin([0])
    clustermap = sns.clustermap(df.T, col_colors=row_colors, mask=mask.T, cmap="viridis", linewidths=3, linecolor='black',
                                tree_kws=dict(linewidths=4, colors=(0, 0, 0)))
    clustermap.cax.set_visible(bool)
    plt.setp(clustermap.ax_heatmap.get_yticklabels(), rotation=0)
    plt.legend(handles, pal, title='Число аннотированных ортологов', bbox_to_anchor=(1, 1), bbox_transform=plt.gcf().transFigure)
    plt.savefig(fig_name)


def add_organism_score(org_name_df, df):
    df1 = df.join(org_name_df).fillna(0)
    return df1

if __name__ == "__main__":
    OrthoRNA()