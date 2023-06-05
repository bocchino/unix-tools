.\" ---------------------------------------------------------------------- 
.NH 1
Heading 1
.TG H1 #NH
.\" ---------------------------------------------------------------------- 
.LP
@H1
.\" ---------------------------------------------------------------------- 
.NH 2
Heading 1.1
.TG NH!H1.1
.\" ---------------------------------------------------------------------- 
.LP
@NH!H1.1
.IC FIG
.TG FIG!F #NH.#FIG
.LP
Figure @FIG!F
.nf
.DC LINE 0
line 1
line 2
.TG LINE!L
line 3
.fi
.LP
@LINE!L
.OL 1
.LI
Item
.LI
.TG OL!A
Item @OL!A
.OL a
.LI
.TG OL!B
Item @OL!B
.LE
.LP
.LP
@UNDEF!REF
