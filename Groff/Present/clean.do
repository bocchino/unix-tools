#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

for dir in man examples; do
  redo $dir/clean
done

for file in `find . -name '*~'`; do
  rm $file
done
