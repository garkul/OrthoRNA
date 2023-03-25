#!bin/bash

source /home/garkul/anaconda3/etc/profile.d/conda.sh
conda activate orthoenv

declare -A org_genomes
declare -A org_annotations
declare -A org_chainfiles
declare -A outdirs

org_genomes[gorilla]="./organisms/gorilla/gorGor6.fa" 
org_genomes[pig]="./organisms/pig/susScr11.fa" 
org_genomes[marmoset]="./organisms/marmoset/calJac4.fa" 
org_genomes[horse]="./organisms/horse/equCab3.fa" 
org_genomes[dog]="./organisms/dog/canFam6.fa" 
org_genomes[mouse]="./organisms/mouse/mm10.fa" 
org_genomes[chicken]="./organisms/chicken/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.fna"
org_genomes[platypus]="./organisms/platypus/GCF_004115215.2_mOrnAna1.pri.v4_genomic.fna"
org_genomes[cat]="./organisms/cat/GCF_018350175.1_F.catus_Fca126_mat1.0_genomic.fna"

org_annotations[gorilla]="./organisms/gorilla/GCF_008122165.1_Kamilah_GGO_v0_genomic_genes.gff" 
org_annotations[pig]="./organisms/pig/GCF_000003025.6_Sscrofa11.1_genomic_genes.gff" 
org_annotations[marmoset]="./organisms/marmoset/GCF_009663435.1_Callithrix_jacchus_cj1700_1.1_genomic_genes.gff" 
org_annotations[horse]="./organisms/horse/GCF_002863925.1_EquCab3.0_genomic_genes.gff" 
org_annotations[dog]="./organisms/dog/Canis_lupus_familiarisboxer.Dog10K_Boxer_Tasha_genes_ucsc.108.gff3" 
org_annotations[mouse]="./organisms/mouse/gencode.vM25.annotation.genes.gff3" 
org_annotations[chicken]="./organisms/chicken/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic_genes.gff" 
org_annotations[platypus]="./organisms/platypus/GCF_004115215.2_mOrnAna1.pri.v4_genomic_genes.gff"
org_annotations[cat]="./organisms/cat/GCF_018350175.1_F.catus_Fca126_mat1.0_genomic_genes.gff"

org_chainfiles[gorilla]="./organisms/gorilla/hg38ToGorGor6.over.chain.gz"   
org_chainfiles[pig]="./organisms/pig/hg38ToSusScr11.over.chain.gz" 
org_chainfiles[marmoset]="./organisms/marmoset/hg38ToCalJac4.over.chain.gz" 
org_chainfiles[horse]="./organisms/horse/hg38ToEquCab3.over.chain.gz" 
org_chainfiles[dog]="./organisms/dog/hg38ToCanFam6.over.chain.gz"
org_chainfiles[mouse]="./organisms/mouse/hg38ToMm10.over.chain.gz" 
org_chainfiles[chicken]="./organisms/chicken/hg38ToGCF_016699485.2.over.chain.gz"
org_chainfiles[platypus]="./organisms/platypus/hg38ToGCF_004115215.2.over.chain.gz"
org_chainfiles[cat]="./organisms/cat/hg38ToGCF_018350175.1.over.chain.gz"

outdirs[gorilla]="./result/gorilla_result/" 
outdirs[pig]="./result/pig_result/" 
outdirs[marmoset]="./result/marmoset_result/" 
outdirs[horse]="./result/horse_result/" 
outdirs[dog]="./result/dog_result/" 
outdirs[mouse]="./result/mouse_result/" 
outdirs[chicken]="./result/chicken_result/"
outdirs[platypus]="./result/platypus_result/" 
outdirs[cat]="./result/cat_result/"


ortho2align run_pipeline -query_genes "$1" -query_genome ./organisms/hg38.p13.fa -subject_annotation "${org_annotations[$2]}" -subject_genome "${org_genomes[$2]}" -liftover_chains "${org_chainfiles[$2]}" -outdir "${outdirs[$2]}" --annotate --fdr -cores "$3"
conda deactivate