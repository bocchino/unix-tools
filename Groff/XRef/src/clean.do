#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

rm -f xref.awk

for file in `find . -name '*~'`; do
  rm $file
done
