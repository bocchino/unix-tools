#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

rm -f redline.t redline.pdf

for file in `find . -name '*~'`; do
  rm $file
done