#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

redo Present/clean

for file in `find . -name '*~'`; do
  rm $file
done
