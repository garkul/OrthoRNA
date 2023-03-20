#!bin/bash
#Downloading the necessary files to search for orthologous 
#HUMAN FILES
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz -P ./organisms/

#GORILLA FILES
# Download and unpack gorilla genome.
wget https://hgdownload.soe.ucsc.edu/goldenPath/gorGor6/bigZips/gorGor6.fa.gz -P ./organisms/gorilla/
gunzip ./organisms/gorilla/gorGor6.fa.gz
# Download liftOver chain file.
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToGorGor6.over.chain.gz -P ./organisms/gorilla/
# Download annotation file.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/008/122/165/GCF_008122165.1_Kamilah_GGO_v0/GCF_008122165.1_Kamilah_GGO_v0_genomic.gff.gz
gunzip ./organisms/gorilla/GCF_008122165.1_Kamilah_GGO_v0_genomic.gff.gz
grep -P $"\tgene\t" ./organisms/gorilla/GCF_008122165.1_Kamilah_GGO_v0_genomic.gff > ./organisms/gorilla/GCF_008122165.1_Kamilah_GGO_v0_genomic_genes.gff

#MARMOSET FILES
# Download and unpack marmoset genome.
wget https://hgdownload.soe.ucsc.edu/goldenPath/calJac4/bigZips/calJac4.fa.gz -P ./organisms/marmoset/
gunzip ./organisms/marmoset/calJac4.fa.gz
# Download liftOver chain file.
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToCalJac4.over.chain.gz -P ./organisms/marmoset/
# Download annotation file.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/009/663/435/GCF_009663435.1_Callithrix_jacchus_cj1700_1.1/GCF_009663435.1_Callithrix_jacchus_cj1700_1.1_genomic.gff.gz -P ./organisms/marmoset/
gunzip ./organisms/marmoset/GCF_009663435.1_Callithrix_jacchus_cj1700_1.1_genomic.gff.gz
grep -P $"\tgene\t" ./organisms/marmoset/GCF_009663435.1_Callithrix_jacchus_cj1700_1.1_genomic.gff > ./organisms/marmoset/GCF_009663435.1_Callithrix_jacchus_cj1700_1.1_genomic_genes.gff

#PIG FILES
# Download and unpack pig genome.
wget https://hgdownload.soe.ucsc.edu/goldenPath/susScr11/bigZips/susScr11.fa.gz -P ./organisms/pig/
gunzip ./organisms/pig/susScr11.fa.gz
#Download liftOver chain file.
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToSusScr11.over.chain.gz -P ./organisms/pig/
#Download annotation file.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/003/025/GCF_000003025.6_Sscrofa11.1/GCF_000003025.6_Sscrofa11.1_genomic.gff.gz -P ./organisms/pig/
gunzip ./organisms/pig/GCF_000003025.6_Sscrofa11.1_genomic.gff.gz
grep -P $"\tgene\t" ./organisms/pig/GCF_000003025.6_Sscrofa11.1_genomic.gff > ./organisms/pig/GCF_000003025.6_Sscrofa11.1_genomic_genes.gff

#HORSE FILES
# Download and unpack horse genome.
wget https://hgdownload.soe.ucsc.edu/goldenPath/equCab3/bigZips/equCab3.fa.gz -P ./organisms/horse/
gunzip ./organisms/horse/equCab3.fa.gz
#Download liftOver chain file.
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToEquCab3.over.chain.gz -P ./organisms/horse/
#Download annotation file.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/002/863/925/GCF_002863925.1_EquCab3.0/GCF_002863925.1_EquCab3.0_genomic.gff.gz -P ./organisms/horse/
gunzip ./organisms/horse/GCF_002863925.1_EquCab3.0_genomic.gff.gz
grep -P $"\tgene\t" ./organisms/horse/GCF_002863925.1_EquCab3.0_genomic.gff > ./organisms/horse/GCF_002863925.1_EquCab3.0_genomic_genes.gff


#DOG FILES
# Download and unpack dog genome.
wget http://hgdownload.soe.ucsc.edu/goldenPath/canFam6/bigZips/canFam6.fa.gz -P ./organisms/dog/
gunzip ./organisms/dog/canFam6.fa.gz
# Download liftOver chain file.
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToCanFam6.over.chain.gz -P ./organisms/dog/
# Download annotation file.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/014/441/545/GCF_014441545.1_ROS_Cfam_1.0/GCF_014441545.1_ROS_Cfam_1.0_genomic.gff.gz -P ./organisms/dog/
gunzip ./organisms/dog/GCF_014441545.1_ROS_Cfam_1.0_genomic.gff.gz
grep -P $"\tgene\t" ./organisms/dog/GCF_014441545.1_ROS_Cfam_1.0_genomic.gff > ./organisms/dog/GCF_014441545.1_ROS_Cfam_1.0_genomic_genes.gff

#CAT FILES
# Download and unpack cat genome.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/018/350/175/GCF_018350175.1_F.catus_Fca126_mat1.0/GCF_018350175.1_F.catus_Fca126_mat1.0_genomic.fna.gz -P ./organisms/cat/
gunzip ./organisms/cat/GCF_018350175.1_F.catus_Fca126_mat1.0_genomic.fna.gz
# Download liftOver chain file.
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToGCF_018350175.1.over.chain.gz -P ./organisms/cat/
# Download annotation file.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/018/350/175/GCF_018350175.1_F.catus_Fca126_mat1.0/GCF_018350175.1_F.catus_Fca126_mat1.0_genomic.gff.gz -P ./organisms/cat/
gunzip ./organisms/cat/GCF_018350175.1_F.catus_Fca126_mat1.0_genomic.gff.gz
grep -P $"\tgene\t" ./organisms/cat/GCF_018350175.1_F.catus_Fca126_mat1.0_genomic.gff > ./organisms/cat/GCF_018350175.1_F.catus_Fca126_mat1.0_genomic_genes.gff


#MOUSE FILES
# Download and unpack mouse genome.
wget https://hgdownload.soe.ucsc.edu/goldenPath/mm10/bigZips/mm10.fa.gz -P ./organisms/mouse/
gunzip ./organisms/mouse/mm10.fa.gz
# Download liftOver chain file.
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToMm10.over.chain.gz -P ./organisms/mouse/
# Download annotation file.
wget http://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/gencode.vM25.annotation.gff3.gz -P ./organisms/mouse/
gunzip ./organisms/mouse/gencode.vM25.annotation.gff3.gz
grep -P $"\tgene\t" ./organisms/mouse/gencode.vM25.annotation.gff3 > ./organisms/mouse/gencode.vM25.annotation.genes.gff3

#CHICKEN FILES
# Download and unpack chicken genome.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/016/699/485/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.fna.gz -P ./organisms/chicken/ 
gunzip ./organisms/chicken/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.fna.gz
# Download liftOver chain file.
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToGCF_016699485.2.over.chain.gz -P ./organisms/chicken/
# Download chicken annotation file.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/016/699/485/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.gff.gz -P ./organisms/chicken/
gunzip ./organisms/chicken/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.gff.gz
grep -P $"\tgene\t" ./organisms/chicken/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic.gff > ./organisms/chicken/GCF_016699485.2_bGalGal1.mat.broiler.GRCg7b_genomic_genes.gff


#PLATYPUS FILES
# Download and unpack platypus genome.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/004/115/215/GCF_004115215.2_mOrnAna1.pri.v4/GCF_004115215.2_mOrnAna1.pri.v4_genomic.fna.gz -P ./organisms/platypus/
gunzip ./organisms/platypus/GCF_004115215.2_mOrnAna1.pri.v4_genomic.fna.gz
# Download liftOver chain file.
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/liftOver/hg38ToGCF_004115215.2.over.chain.gz -P ./organisms/platypus/
# Download platypus annotation file.
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/004/115/215/GCF_004115215.2_mOrnAna1.pri.v4/GCF_004115215.2_mOrnAna1.pri.v4_genomic.gff.gz -P ./organisms/platypus/
gunzip ./organisms/platypus/GCF_004115215.2_mOrnAna1.pri.v4_genomic.gff.gz
grep -P $"\tgene\t" ./organisms/platypus/GCF_004115215.2_mOrnAna1.pri.v4_genomic.gff > ./organisms/platypus/GCF_004115215.2_mOrnAna1.pri.v4_genomic_genes.gff