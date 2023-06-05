# ----------------------------------------------------------------------
# marks.awk: convert @@ notation to groff marks
# ----------------------------------------------------------------------
# Part of the Present package
# Copyright (c) 2014 California Institute of Technology
# ----------------------------------------------------------------------

BEGIN { FS = "@@" }
/@@/ {
  printf(".mk %sy\n", $2)
  printf("%s", $1)
  printf("\\k[%sx]", $2)
  print $3
  next
}
{ print $0 }
