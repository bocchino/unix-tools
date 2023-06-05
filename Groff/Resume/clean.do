#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

for dir in example man; do
  redo $dir/clean
done

for file in `find . -name '*~'`; do
  rm $file
done
