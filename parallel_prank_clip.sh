#!/bin/bash

# By: Ryan K Schott
# Mutiple sequence codon alingment using PRANK (https://ariloytynoja.github.io/prank-msa/)
# and ClipKit (https://github.com/jlsteenwyk/clipkit)
# Parallelized using gnu parallel (https://www.gnu.org/software/parallel/)
# Usage: bash parallel_prank_clip.sh *.fas
# Or: bash parallel_prank_clip.sh file1.fas file2.fas file3.fas ...

parallel -j 4 "prank -d={} -o={.}_prank -codon +F && \
clipkit {.}_prank.best.fas -o {.}_prank_clip.fas --codon" ::: $@
