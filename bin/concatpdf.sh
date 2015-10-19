#!/bin/bash
# FILE : concatpdf.sh
# Function: Concatenates a number of pdf's using texexec or gs
# Use: concatpdf.sh outfile.pdf infile1.pdf infile2.pdf ...
# ----------------------------------------------------------------- #
#
# You can use either texexec or ghostscript. Uncomment the appropriate 
# line below to choose
#

# Variables

outputfile=$1
shift 1

inputfiles=""
until [ -z "$1" ]
do
	if [ ! -e $1 ]; then
		echo File $1 not found. Exiting.
		exit
	fi
	inputfiles="${inputfiles}$1 "
	shift 1
done

# Test to make sure the required program is installed, then run it.

#if [[ -z $( type -p texexec ) ]]; then echo -e "texexec could not be found";exit ;fi
#texexec --pdfarrange --result $outputfile $inputfiles

if [[ -z $( type -p gs ) ]]; then echo -e "gs could not be found"; exit; fi
gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$outputfile $inputfiles

exit

