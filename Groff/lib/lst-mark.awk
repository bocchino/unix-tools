#!/usr/bin/awk -f

# ----------------------------------------------------------------------
# lst-mark.awk: compute mark corresponding to outline position
# ----------------------------------------------------------------------

BEGIN {
  marks["A",1] = "A"; marks["A",2] = "B"; marks["A",3] = "C"
  marks["A",4] = "D"; marks["A",5] = "E"; marks["A",6] = "F"
  marks["A",7] = "G"; marks["A",8] = "H"; marks["A",9] = "I"
  marks["A",10] = "J"; marks["A",11] = "K"; marks["A",12] = "L"
  marks["A",13] = "M"; marks["A",14] = "N"; marks["A",15] = "O"
  marks["A",16] = "P"; marks["A",17] = "Q"; marks["A",18] = "R"
  marks["A",19] = "S"; marks["A",20] = "T"; marks["A",21] = "U"
  marks["A",22] = "V"; marks["A",23] = "W"; marks["A",24] = "X"
  marks["A",25] = "Y"; marks["A",26] = "Z"
  marks["a",1] = "a"; marks["a",2] = "b"; marks["a",3] = "c"
  marks["a",4] = "d"; marks["a",5] = "e"; marks["a",6] = "f"
  marks["a",7] = "g"; marks["a",8] = "h"; marks["a",9] = "i"
  marks["a",10] = "j"; marks["a",11] = "k"; marks["a",12] = "l"
  marks["a",13] = "m"; marks["a",14] = "n"; marks["a",15] = "o"
  marks["a",16] = "p"; marks["a",17] = "q"; marks["a",18] = "r"
  marks["a",19] = "s"; marks["a",20] = "t"; marks["a",21] = "u"
  marks["a",22] = "v"; marks["a",23] = "w"; marks["a",24] = "x"
  marks["a",25] = "y"; marks["a",26] = "z"
  marks["I",1] = "I"; marks["I",2] = "II"; marks["I",3] = "III"
  marks["I",4] = "IV"; marks["I",5] = "V"; marks["I",6] = "VI"
  marks["I",7] = "VII"; marks["I",8] = "VIII"; marks["I",9] = "IX"
  marks["I",10] = "X"; marks["I",11] = "XI"; marks["I",12] = "XII"
  marks["I",13] = "XIII"; marks["I",14] = "XIV"; marks["I",15] = "XV"
  marks["I",16] = "XVI"; marks["I",17] = "XVII"; marks["I",18] = "XVIII"
  marks["I",19] = "XIX"; marks["I",20] = "XX"; marks["I",21] = "XXI"
  marks["I",22] = "XXII"; marks["I",23] = "XXIII"; marks["I",24] = "XXIV"
  marks["I",25] = "XV"; marks["I",26] = "XVI"
  marks["i",1] = "i"; marks["i",2] = "ii"; marks["i",3] = "iii"
  marks["i",4] = "iv"; marks["i",5] = "v"; marks["i",6] = "vi"
  marks["i",7] = "vii"; marks["i",8] = "viii"; marks["i",9] = "ix"
  marks["i",10] = "x"; marks["i",11] = "xi"; marks["i",12] = "xii"
  marks["i",13] = "xiii"; marks["i",14] = "xiv"; marks["i",15] = "xv"
  marks["i",16] = "xvi"; marks["i",17] = "xvii"; marks["i",18] = "xviii"
  marks["i",19] = "xix"; marks["i",20] = "xx"; marks["i",21] = "xxi"
  marks["i",22] = "xxii"; marks["i",23] = "xxiii"; marks["i",24] = "xxiv"
  marks["i",25] = "xv"; marks["i",26] = "xvi"
}

function lst_mark(mark, count) {
  if (mark ~ /^[0-9]+$/)
    return count
  if (marks[mark, count] != "")
    return marks[mark, count]
  return mark
}

