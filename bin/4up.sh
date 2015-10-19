#!/bin/bash
# FILE : 4up.sh
# Function: Make a 4-up pdf arrangement of a pdf (four pages shrunk to fit on one landscape page)
# Use: ./4up.sh outputfile.pfd inputfile.pdf
# ----------------------------------------------------------------- #

# Variables

outputfile=$1
inputfile=$2

# Test to make sure the required program is installed, then run it.

if [[ -z $( type -p texexec ) ]]; then echo -e "texexec could not be found";exit ;fi
texexec --paper=landscape --pdfcombine --combination=2*2 --result $outputfile $inputfile

exit

