.\" ----------------------------------------------------------------------
.\" eqn delimiters 
.\" ----------------------------------------------------------------------
.EQ
delim $$
include "/usr/share/misc/eqnchar"
.EN
.\" ----------------------------------------------------------------------
.\" Titles
.\" ---------------------------------------------------------------------- 
.de ST
\&
.  nr VS 12
.  nr PS 10
.  FA 20
.  LP
.  sp -2.5v
.  DS C
.  FA 36
.  gcolor brown
.  B "\\$1"
.  gcolor
.  DE
.  sp 1v
\l'\\n[LL]u'
.  sp 1v
.  BZ
..
.\" ---------------------------------------------------------------------- 
.\" Parameters
.\" ---------------------------------------------------------------------- 
.ds titlecolor brown
.\" ---------------------------------------------------------------------- 
.\" Slide numbers
.\" ---------------------------------------------------------------------- 
.de SN
.  LP
.  FA 14
.  MR 8.5i-\\n[HM]u-\\n[FM]u+0.5i \\n[LL]u \\$1
..
.\" ---------------------------------------------------------------------- 
.\" Pro and Con markers
.\" ---------------------------------------------------------------------- 
.ds Pro \fB\m[limegreen]\[OK]\m[]\fR
.ds Con \fB\m[red]X\m[]\fR