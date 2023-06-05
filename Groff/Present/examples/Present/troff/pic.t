.\" ---------------------------------------------------------------------- 
.ST "Drawings: Pic"
.\" ---------------------------------------------------------------------- 
.DS B
.FA 16
.ft C
.HI
\&.PS
\&PT: box invis width .5 height 0.7 
\&"plain text " at PT.e rjust
\&arrow right 1.25 from PT.e
\&Groff: box "Groff" width 1.5 height 0.875 shaded "skyblue"
\&arrow right 1.25 from Groff.e
\&HTML: box invis width 0.7 height 0.7 
\&" HTML" at HTML.w ljust
\&PDF: box invis width 0.7 height 0.7 with .s at HTML.n
\&" PDF" at PDF.w ljust
\&arrow from 1/4<Groff.ne,Groff.se> to PDF.w
\&DOTS: box invis width 0.7 height 0.7 with .n at HTML.s
\&" ..." at DOTS.w ljust
\&arrow from 3/4<Groff.ne,Groff.se> to DOTS.w
\&.PE
.EH
.DE
.FA 18
.sp -1v
.PS
PT: box invis width .5 height 0.7 
.AN 2
"plain text " at PT.e rjust
.AE 1 2
arrow right 1.25 from PT.e color "white"
.AN 2
arrow right 1.25 from PT.e
.AE
Groff: box invis width 1.5 height 0.875
arrow right 1.25 from Groff.e color "white"
HTML: box invis width 0.7 height 0.7 
PDF: box invis width 0.7 height 0.7 with .s at HTML.n
DOTS: box invis width 0.7 height 0.7 with .n at HTML.s
.AN 3 7
box "Groff" width 1.5 height 0.875 at Groff
.AE
.AN 7
box "Groff" width 1.5 height 0.875 shaded "skyblue" at Groff
.AE
.AN 4
" PDF" at PDF.w ljust
arrow from 1/4<Groff.ne,Groff.se> to PDF.w
.AE
.AN 5
arrow right 1.25 from Groff.e
" HTML" at HTML.w ljust
.AE
.AN 6
" ..." at DOTS.w ljust
arrow from 3/4<Groff.ne,Groff.se> to DOTS.w
.AE
.PE
.\" ---------------------------------------------------------------------- 
