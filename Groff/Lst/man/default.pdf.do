#!/bin/sh

# ---------------------------------------------------------------------- 
# default.pdf.do
# ---------------------------------------------------------------------- 

redo-ifchange $2
groff -man < $2 | ps2pdf - > $3
