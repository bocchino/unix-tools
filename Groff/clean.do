#!/bin/sh

# ----------------------------------------------------------------------
# clean.do
# ----------------------------------------------------------------------

for dir in Lst Present Redline Resume XRef
do
  echo $dir/clean
done | xargs redo

for file in `find . -name '*~'`;
do
  rm $file
done

rm -f installed
