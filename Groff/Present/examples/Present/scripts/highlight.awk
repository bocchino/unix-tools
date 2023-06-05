# ----------------------------------------------------------------------
# highlight.awk
# ----------------------------------------------------------------------

function highlight (s, color) {
  return "\\m[" color "]\\f[CB]" s "\\f[]\\m[]"
}

BEGIN {
  in_code = 0
}
/^\.HI/ { in_code = 1 }
/^\.EH/ { in_code = 0 }
# Comments
in_code && /^\\\&\.\\\\"/ {
  $0 = highlight($0, "blue")
}
# Groff control codes
in_code && /\\\&\.[[:alpha:]]/ {
  $1 = "\\m[orange2]\\f[CB]" $1 "\\f[]\\m[]"
}
{ print }
