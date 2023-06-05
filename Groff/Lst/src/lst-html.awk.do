#!/bin/sh

# ----------------------------------------------------------------------
# lst-html.awk.do
# ----------------------------------------------------------------------

redo-ifchange lst-html.awk.in ../../lib/macros.awk
../../scripts/include.awk < lst-html.awk.in > $3
chmod +x $3
