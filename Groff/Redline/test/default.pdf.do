#!/bin/sh

# ----------------------------------------------------------------------
# default.pdf.do
# ----------------------------------------------------------------------

redo-ifchange $2.t
cat $2.t | groff -ms -Tps | ps2pdf - > $3