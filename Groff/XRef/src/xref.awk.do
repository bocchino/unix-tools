#!/bin/sh

# ----------------------------------------------------------------------
# xref.awk.do
# ----------------------------------------------------------------------

redo-ifchange xref.awk.in ../../lib/lst-mark.awk
../../scripts/include.awk < xref.awk.in > $3

