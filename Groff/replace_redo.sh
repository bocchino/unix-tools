#!/bin/sh

# ----------------------------------------------------------------------
# Replace redo with do
# ----------------------------------------------------------------------

. ./dirs.sh

if test -z "$BIN"
then
  echo "variable $BIN is not set" 1>&2
  exit 1
fi

export PATH=$PWD/scripts/do:$PATH:$BIN
