#!/bin/sh

# ---------------------------------------------------------------------- 
# default.pdf.do
# ---------------------------------------------------------------------- 

redo-ifchange $2
tbl < $2 | groff -man | ps2pdf - > $3
