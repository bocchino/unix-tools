.ds F1 "\[co] 2014\-2023 California Institute of Technology
.ds F2 "Government sponsorship acknowledged
.ds LF \s[10]\v'-2.5i-2v'\*[F1]\v'1v'\h'-\w'\*[F1]'u'\*[F2]
.\" ---------------------------------------------------------------------- 
.ST "GNU Troff (Groff)"
.\" ---------------------------------------------------------------------- 
.L1
A document formatting system
.L1
Converts marked-up text to various formats
.L1
Descends from the venerable
.B troff
of AT&T Bell Labs
.L1
Available on all Unix systems
.RS
.L2
Linux
.L2
Mac OS X
.L2
Windows Subsystem for Linux
.RE
.LP
.FA 18
.sp -1v
.PS
PT: box invis width .5 height 0.7 
"plain text " at PT.e rjust
arrow right 1.25 from PT.e
Groff: box "Groff" width 1.5 height 0.875 shaded "skyblue"
arrow right 1.25 from Groff.e
HTML: box invis width 0.7 height 0.7 
" HTML" at HTML.w ljust
PDF: box invis width 0.7 height 0.7 with .s at HTML.n
" PDF" at PDF.w ljust
arrow from 1/4<Groff.ne,Groff.se> to PDF.w
DOTS: box invis width 0.7 height 0.7 with .n at HTML.s
" ..." at DOTS.w ljust
arrow from 3/4<Groff.ne,Groff.se> to DOTS.w
.PE
.\" ---------------------------------------------------------------------- 
