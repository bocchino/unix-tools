#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

rm -f test.pdf 

for file in `find . -name '*~'`; do
  rm $file
done
