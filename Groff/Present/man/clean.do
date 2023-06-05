#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

. ./defs.sh

for file in $files; do
  rm -f $file $file.pdf
done

for file in `find . -name '*~'`; do
  rm $file
done
