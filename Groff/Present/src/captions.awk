# ----------------------------------------------------------------------
# captions.awk: process captions
# ----------------------------------------------------------------------
# Part of the Present package
# Copyright (c) 2014 California Institute of Technology
# ----------------------------------------------------------------------

function max_len(strings,  i) {
  result = ""
  for (i in strings) {
    s = strings[i]
    if (length(s) > length(result))
      result = s 
  }
  return result  
}

function print_line(line, mode) {
  if (mode == "R")
    printf("\\h'-\\w'%s\~\~'u'%s\\v'1v'", line, line)
  else if (mode == "C")
    printf("\\h'-\\w'%s'u/2u'%s\\h'-\\w'%s'u/2u'\\v'1v'", 
           line, line, line)
  else
    printf("%s\\h'-\\w'%s'u'\\v'1v'", line, line)
}

function reset() {
  in_caption = FALSE 
  num_lines = 0
  mode = ""
  voffset = ""
  hoffset = ""
}

BEGIN { 
  TRUE = 1
  FALSE = 0
  reset()
}

$1 == ".CS" {
  if (in_caption) {
    print "nested caption at line " NR > "/dev/stderr"
    exit 1
  }
  in_caption = TRUE
  mode = $2
  hoffset = $3
  voffset = $4
  if (voffset == "") voffset = "0.25v"
  next
}

$1 == ".CE" {
  if (!in_caption) {
    print "CE outside caption at line " NR > "/dev/stderr"
    exit 1
  } 
  print ".nr fI \\n(.u"
  print "'nf"
  printf(".nr CW \\w'%s'u\n", max_len(lines))
  if (hoffset != "") printf("\\h'%s'", hoffset);
  if (voffset != "") printf("\\v'%s'", voffset)
  for (i = 1; i <= num_lines; ++i)
    print_line(lines[i], mode)
  print ""
  print ".if !\\n(fI=0 .fi"
  reset()
  next
}
{ 
  if (in_caption)
    lines[++num_lines] = $0
  else
    print $0
}
