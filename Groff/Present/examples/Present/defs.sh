#!/bin/sh

# ---------------------------------------------------------------------- 
# defs.sh
# ---------------------------------------------------------------------- 

preamble="troff/header.t troff/title.t"
body="troff/groff.t
troff/present.t
troff/title-and-bullets.t
troff/annotations.t
troff/pic.t
troff/comparison.t
troff/try-it.t"

# Make a .t file
make_t() {
  redo-ifchange $preamble $body scripts/highlight.awk defs.sh
  {
    cat troff/header.t
    slide troff/title.t
    present $2 $body
  } | awk -f scripts/highlight.awk > $1
}

