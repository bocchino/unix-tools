#!/usr/bin/awk -f

# ----------------------------------------------------------------------
# macros.awk
# Handle macro-style commands
# ----------------------------------------------------------------------

# Skip till after the last occurrence of re in s
function skip(s, re)
{
  pos = 1
  while ((n = match(s, re)) > 0) {
    len = n + RLENGTH-1
    pos += len
    s = substr(s, len + 1)
  }
  return pos
}

# Match re in s at or after n
function match_from(s, re, n)
{
  right = substr(s, n)
  pos = match(right, re)
  return pos > 0 ? n - 1 + pos : 0
}

# Parse arguments, treating $1 as the command name
# Respects quotes "..." and ""
function parse_args(     arg_str, fields, pos) 
{
  # Strip off the macro name
  split($0, fields, "^" $1)
  arg_str = fields[2]
  num_args = 0
  # Do until no more args
  while (arg_str != "") {
    # Strip off leading whitespace
    pos = match(arg_str, "^"FS)
    if (pos == 1) arg_str = substr(arg_str, RLENGTH + 1)
    # Quoted argument: strip off leading " and find next " after last ""
    if (substr(arg_str, 1, 1) == "\"") {
      arg_str = substr(arg_str, 2)
      start = skip(arg_str, "\"\"")
      end = match_from(arg_str, "\"", start)
    }
    # Unquoted argument: find next FS
    else end = match(arg_str, FS)
    # No terminator found: rest of string is last arg
    if (end == 0) {
      args[++num_args] = substr(arg_str, 1)
      arg_str = ""
    }
    # Terminator found: store arg and strip from front of arg_str
    else {
      args[++num_args] = substr(arg_str, 1, end - 1)
      arg_str = substr(arg_str, end + RLENGTH)
    }
  }
}

# Get a macro argument
function get_arg(i) {
  if (i <= 0 || i > num_args)
    return ""
  return args[i]
}
