#!/bin/sh

# ----------------------------------------------------------------------
# default.do: generate file from file.t
# ----------------------------------------------------------------------

if ! test -e $2.t
then
  echo 'invalid target '$2 >&2
  exit 1
fi

lst_awk=../../Lst/src/lst.awk
redo-ifchange $lst_awk $2.t
awk -f $lst_awk < $2.t > $3
