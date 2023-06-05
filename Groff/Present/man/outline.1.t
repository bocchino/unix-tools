.\" ---------------------------------------------------------------------- 
.ig
Author: Rob Bocchino
Jet Propulsion Laboratory
California Institute of Technology
Copyright (C) 2014 California Institute of Technology
..
.\" ---------------------------------------------------------------------- 
.nr MI 5n
.\" ---------------------------------------------------------------------- 
.TH OUTLINE 1 "29 October 2014"
.\" ---------------------------------------------------------------------- 
.SH NAME
.\" ---------------------------------------------------------------------- 
.B outline 
\- construct outline slides for
.B slide
and
.B groff_mp
.\" ---------------------------------------------------------------------- 
.SH SYNOPSIS
.B outline
.IR file [ .t ]
.\" ---------------------------------------------------------------------- 
.SH DESCRIPTION
.B outline
generates outline slides for 
.BR slide (1)
and
.BR groff_mp (7)
from a template provided by the user.
.\" ---------------------------------------------------------------------- 
.SH USAGE
.B
outline
expects exactly one argument, which is the name of a file containing
the template for an outline slide in
.BR groff_mp (7)
format.
For example:
.IP
.EX
.B outline outline.t
.EE
.LP
For each level-one bullet point 
.B .L1 
contained in the input file (see
.BR groff_mp (7)),
.B outline
produces a new file in which that bullet point appears in bold
face, and the rest of the slide is unaltered.
If each of the 
.B .L1 
bullet points represents a section of the presentation,
then each generated slide can be used at the start of a new section,
with the bullet point corresponding to that section highlighted.
.LP
The input file name may be either
.I file
or
.IB file .t\fR,
where
.I file
does not end in
.BR .t .
In either case, the
.IR n th
file written is \fIfile\fB-\fIn\fB.t\fR.
.LP
.I file
may be a path name that includes slashes.
For example the command
.IP
.EX
.B outline troff/outline.t
.EE
.LP
produces output files
.BR troff/outline-1.t ,
.BR troff/outline-2.t ,
etc.
.\" ---------------------------------------------------------------------- 
.SH "SEE ALSO"
.BR groff_mp (7),
.BR slide (1)
.\" ---------------------------------------------------------------------- 
.SH AUTHOR
Robert L. Bocchino Jr.\&
.RI ( bocchino@jpl.nasa.gov ).
.nf
Jet Propulsion Laboratory
California Institute of Technology
Copyright \[co] 2014 California Institute of Technology
.fi
