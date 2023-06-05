#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

for dir in test man; do
  redo $dir/clean
done

for file in `find . -name '*~'`; do
  rm $file
done
