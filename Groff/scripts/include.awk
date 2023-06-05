#!/usr/bin/awk -f

# ----------------------------------------------------------------------
# include.awk: include files in AWK scripts
# ----------------------------------------------------------------------

/^#include/ { 
  print "\n# start of file "$2"\n"
  system("cat "$2)
  print "\n# end of file "$2"\n"
  next 
}

{ print }
