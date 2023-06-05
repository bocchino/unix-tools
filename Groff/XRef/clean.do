#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

for dir in src man test; do
  echo $dir/clean
done | xargs redo

for file in `find . -name '*~'`; do
  rm $file
done
