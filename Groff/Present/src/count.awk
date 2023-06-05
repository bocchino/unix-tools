# ----------------------------------------------------------------------
# count.awk: count number of slides in animation
# ----------------------------------------------------------------------
# Part of the Present package
# Copyright (c) 2014 California Institute of Technology
# ----------------------------------------------------------------------

BEGIN { n = 1 }
$1 == ".AN" {
  if ($2 > n) n = $2
  if ($3 != "" && $3 > n) n = $3
}
END { print n }
