#!/bin/sh

# ---------------------------------------------------------------------- 
# default.slide.t.do: generate a troff file for a single slide
# ---------------------------------------------------------------------- 

redo-ifchange troff/header.t troff/$2.t scripts/highlight.awk
{
  cat troff/header.t
  slide troff/$2.t
} | awk -f scripts/highlight.awk > $3
