#!/bin/sh

# ----------------------------------------------------------------------
# default.pdf.do
# ----------------------------------------------------------------------

xref=../src/xref
lst_awk=../../Lst/src/lst.awk

redo-ifchange $lst_awk $2.t
$xref < $2.t | awk -f $lst_awk | groff -ms -Tps | ps2pdf - > $3
