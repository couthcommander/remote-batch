#!/bin/bash
FILE="exposure1"
R -e "knitr::knit('$FILE.Rnw')"
pdflatex $FILE.tex && pdflatex $FILE.tex && rm -f $FILE.log $FILE.aux $FILE.tex
