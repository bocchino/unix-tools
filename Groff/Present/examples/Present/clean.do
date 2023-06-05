#!/bin/sh

# ----------------------------------------------------------------------
# clean.do: remove generated files
# ----------------------------------------------------------------------

. ./defs.sh

rm -f presentation.t presentation.pdf
rm -f printout.t printout.pdf

patterns="*.slide.t *.slide.pdf *~"
for pattern in $patterns; do
  for file in `find . -name "$pattern"`; do
    rm $file
  done
done
