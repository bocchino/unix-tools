# ----------------------------------------------------------------------
# title.awk: process presentation title
# ----------------------------------------------------------------------
# Part of the Present package
# Copyright (c) 2014 California Institute of Technology
# ----------------------------------------------------------------------

BEGIN { 
  TRUE = 1
  FALSE = 0
  in_title = FALSE 
  num_lines = 0
}
$1 == ".PT" {
  if (in_title) {
    print "nested PT at line " NR > "/dev/stderr"
    exit 1
  }
  title_space = ($2 == "") ? "2.75i" : $2
  title_size = ($3 == "") ? "34" : $3
  in_title = TRUE
  num_lines = 0
  next
}
$1 == ".ET" {
  if (!in_title) {
    print "ET outside title at line " NR > "/dev/stderr"
    exit 1
  } 
  in_title = FALSE
  print ".LP"
  print "\\&"
  printf(".sp %s\n", title_space)
  print ".DS C"
  printf(".FA %s\n", title_size)
  print ".gcolor \\*[titlecolor]"
  print "'nf"
  print ".ft B"
  for (i = 1; i <= num_lines; ++i)
    print (lines[i])
  print ".ft"
  print ".gcolor"
  print ".DE"
  next
}
{ 
  if (in_title)
    lines[++num_lines] = $0
  else
    print $0
}
