# ----------------------------------------------------------------------
# animate.awk: expand animation into individual slides
# ----------------------------------------------------------------------
# Part of the Present package
# Copyright (c) 2014 California Institute of Technology
# ----------------------------------------------------------------------

BEGIN {
  SKIP=0
  PRINT=1
  state=PRINT
  i = ARGV[1]
  ARGV[1] = ""
  if (i > 1) print ".bp"
}

$1 == ".AN" { 
  if (i >= $2 && $3 == "") state = PRINT
  else if (i >= $2 && i <= $3 - 1) state = PRINT
  else state = SKIP
  next
}
  
$1 == ".AE" {
  state = PRINT
  next
}

{ if (state == PRINT) print $0 }
