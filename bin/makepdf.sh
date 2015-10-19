#!/bin/bash
# FILE : makepdf.sh
# Function: Creates ONE pdf file from a directory of multiple png scans.
# Copyright (C) 2006 Dave Crouse <dave NOSPAMat usalug.org>
# ----------------------------------------------------------------- #
#
# NOTES:
# Scans must be in .png format, or change the imagetype variable.
# Converts each png image file to a pdf file.
#

#######################
# VARIABLE: Change this to jpg, bmp, or whatever image file type your
converting from.
imagetype="png"
#######################

# Test to make sure required programs are installed.
if [[ -z $( type -p convert ) ]]; then echo -e "ImageMagick -- NOT
INSTALLED !";exit ;fi
if [[ -z $( type -p pdftk ) ]]; then echo -e "pdftk -- NOT INSTALLED
!";exit ;fi

read -p "What would you like to name your new pdf file ? :" newname;
for i in *.${imagetype} ; do convert $i $i.pdf;done;
pdftk *.pdf cat output $newname.pdf;
for i in *.${imagetype} ; do rm -f $i.pdf;done;
echo "Conversion complete. PDF file ${newname}.pdf created.";

exit

