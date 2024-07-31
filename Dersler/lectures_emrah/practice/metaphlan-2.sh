#!/bin/bash

#SBATCH --job-name=metaphlan
#SBATCH --partition=barbun
#SBATCH --ntasks-per-node=4
#SBATCH --output=logs/slurm-%j.out
#SBATCH --error=logs/slurm-%j.err

export PATH=/truba/home/egitim/miniconda3/envs/anmet4evogen/bin:${PATH}

SAMPLE=$1

metaphlan data/${SAMPLE}.fasta.gz \
    --input_type fasta \
    --bowtie2db /truba/home/egitim/Workshop_emrah/databases/metaphlan_3.0/ \
    -x mpa_v30_CHOCOPhlAn_201901 \
    --bowtie2out results/metaphlan/${SAMPLE}.bowtie2 \
    -s results/metaphlan/${SAMPLE}.sam > results/metaphlan/${SAMPLE}.txt