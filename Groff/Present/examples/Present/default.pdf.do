#!/bin/sh

# ----------------------------------------------------------------------
# default.pdf.do: generate a pdf file from a troff file
# ----------------------------------------------------------------------

redo-ifchange $2.t
cat $2.t | pic | tbl | eqn | groff -mp -Tps -P-l | ps2pdf - > $3
