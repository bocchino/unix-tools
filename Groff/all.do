#!/bin/sh

# ----------------------------------------------------------------------
# all.do
# ----------------------------------------------------------------------

for dir in Lst Present Redline Resume XRef
do
  echo $dir/all
done | xargs redo-ifchange
