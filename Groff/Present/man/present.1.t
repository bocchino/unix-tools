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
.TH PRESENT 1 "3 October 2014"
.\" ---------------------------------------------------------------------- 
.SH NAME
.\" ---------------------------------------------------------------------- 
.B present 
\- construct presentations using
.B slide
and
.B groff_mp
.\" ---------------------------------------------------------------------- 
.SH SYNOPSIS
.\" ---------------------------------------------------------------------- 
.B present \-v
.br
.B present
[
.B \-p
]
[
.B \-s
.I n
]
[
.B --
]
.IR files .\|.\|.\&
.\" ---------------------------------------------------------------------- 
.SH DESCRIPTION
.\" ---------------------------------------------------------------------- 
.B present
is a preprocessor that generates presentations consisting 
of multiple slides.
It uses
.BR slide (1)
to process the individual slides, adds slide numbers, and
assembles the result into a file that can be processed
with
.BR groff_mp (7).
.\" ---------------------------------------------------------------------- 
.SH OPTIONS
.\" ---------------------------------------------------------------------- 
The special option
.B \-\^\-
marks the end of the options.
.TP
.B \-v
Print the version number and exit.
.TP
.B \-p
Generate a printout:
do not expand animations into separate slides.
See
.BR slide (1).
.TP
.BI \-s " n"
Specify
.I n
as the starting number.
See
.BR "Slide numbers" .
.\" ---------------------------------------------------------------------- 
.SH USAGE
.\" ---------------------------------------------------------------------- 
.B
present
assembles a sequence of
.I logical slides
into a file that
.BR groff_mp (7)
can format as a 
.IR "presentation body" .
Each logical slide corresponds to a single input file named on
the command line.
The logical slides are processed and included in the output
in the order in which they appear.
For example the command
.IP
.EX
.B present body.1.t body.2.t body.3.t > body.t
.EE
.LP
processes the files
.BR body.1.t , 
.BR body.2.t , 
and
.B body.3.t
in order and writes the result into the file
.BR body.t .
.LP
.\" ---------------------------------------------------------------------- 
.SS Title slides
.\" ---------------------------------------------------------------------- 
In a typical usage, you generate a title slide using
.BR slide (1),
generate the body using
.BR present ,
append the title slide to the front of the body,
and send the whole thing through
.BR groff_mp (7)
to create the finished presentation.
For example:
.IP
.EX
.nf
.B {
.B \ \ slide title.t
.B \ \ present body.1.t body.2.t body.3.t
.B } | groff -mp -P-l -Tps | ps2pdf - > presentation.pdf
.fi
.EE
.LP
This procedure causes the slide numbering to work out properly,
as explained in the following section.
.\" ---------------------------------------------------------------------- 
.SS Slide numbers
.\" ---------------------------------------------------------------------- 
.B present
assigns each logical slide a number starting with the
.I "starting number"
and increasing by one.
If the optional command-line argument
.BI -s " n"
is present, then the starting number is
.IR n ;
otherwise it defaults to 2.
The default is 2 because the title slide (slide 1) is typically generated
separately and given no number; see
.BR "Title slides" .
When processing logical slide
.IR n ,
.B present
invokes
.B slide
with
.IR n
as the slide number argument (see
.BR slide (1)),
causing the number
.I n
to appear in the lower right-hand corner of the slide.
.\" ---------------------------------------------------------------------- 
.SS Printouts
.\" ---------------------------------------------------------------------- 
As discussed in
.BR slide (1),
if animation is used, then each logical slide may correspond to
several physical slides.
This behavior may be suppressed by invoking
.B present
with the option
.B -p
(for printout).
For example:
.IP
.EX
.nf
.B {
.B \ \ slide title.t
.B \ \ present -p body.1.t body.2.t body.3.t
.B } | groff -mp -P-l -Tps | ps2pdf - > printout.pdf
.fi
.EE
.LP
The
.B -p
option is passed to
.B slide
when it is invoked.
.\" ---------------------------------------------------------------------- 
.SH "SEE ALSO"
.\" ---------------------------------------------------------------------- 
.BR groff_mp (7),
.BR slide (1)
.\" ---------------------------------------------------------------------- 
.SH AUTHOR
.\" ---------------------------------------------------------------------- 
Robert L. Bocchino Jr.\&
.RI ( bocchino@jpl.nasa.gov )
.nf
Jet Propulsion Laboratory
California Institute of Technology
Copyright \[co] 2014 California Institute of Technology
.fi
