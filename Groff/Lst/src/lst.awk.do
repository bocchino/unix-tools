#!/bin/sh

# ----------------------------------------------------------------------
# lst.awk.do
# ----------------------------------------------------------------------

redo-ifchange lst.awk.in ../../lib/macros.awk ../../lib/lst-mark.awk
../../scripts/include.awk < lst.awk.in > $3
chmod +x $3
