.\" ---------------------------------------------------------------------- 
.ig
Author: Rob Bocchino
Jet Propulsion Laboratory
California Institute of Technology
Copyright (C) 2013 California Institute of Technology
..
.\" ---------------------------------------------------------------------- 
.nr MI 5n
.\" ---------------------------------------------------------------------- 
.TH SLIDE 1 "3 October 2014"
.\" ---------------------------------------------------------------------- 
.SH NAME
.\" ---------------------------------------------------------------------- 
.B slide 
\- process presentation slides using 
.B mp
.\" ---------------------------------------------------------------------- 
.SH SYNOPSIS
.\" ---------------------------------------------------------------------- 
.B slide \-v
.br
.B slide
[
.B \-n
.I n
]
[
.B \-p
]
.I file
.\" ---------------------------------------------------------------------- 
.SH DESCRIPTION
.\" ---------------------------------------------------------------------- 
.B slide
is a preprocessor that extends the set of commands available
for typesetting presentation slides with
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
.BI \-n " n"
Specify the number
.I n
of the slide in a larger presentation; see
.BR "Slide numbers" .
.TP
.B \-p
Process the slide in printout mode:
do not expand animations into separate slides.
See
.BR Animations .
.\" ---------------------------------------------------------------------- 
.SH USAGE
.\" ---------------------------------------------------------------------- 
.B slide
processes a single input file, which must be named on the command line.
.SS Presentation titles
To set a presenation title, you issue the command
.B .PT
[
.I spacing
[
.I font-size
]], followed by the title text,
followed by the command
.BR .ET .
For example:
.IP
.EX
.nf
.ft B
\&.PT
A Presentation
\&.ET
.ft
.fi
.EE
.LP
In the
.B .PT
command,
.ML \[bu]
.LI
.I spacing
is an optional argument specifying the amount of vertical
space to insert between the top margin and the title; the default
value is 2.75i.
.LI
.I font-size
is an optional argument specifying the title font size;
the default is 34p. 
.LE 
.LP
The title appears in bold face and in the title color (see
.BR groff_mp (7)).
The title text may span several lines.
The title is set in no-fill mode, so line breaks in the input
text are reflected in the output.
.SS Marks
A
.I mark
is a groff identifier surrounded by the characters 
.B @@
on each side.
For example, the character sequence 
.B @@a@@ 
is a mark with identifier 
.BR a .
A mark maps its identifier to the location where
the mark occurs in the groff output.
You can use the identifier as the target of a
.B .JM
command; see
.BR groff_mp (7).
.LP
A mark must be embedded in text processed by groff.
To jump to a point inside a graphic you can place a
mark just before the graphic; when jumping to the mark
you can provide a horizontal and vertical offset to
the target point.
.LP
If you need to suppress the interpretation of
.B @@
as a mark delimiter, then you can write
\fB@\\&@\fR.
Alternatively, you can define a string containing
.BR @@ ,
since interpretation of marks is done prior to
expansion of strings.
.SS Captions
A
.I caption 
is a bit of text appearing in an annotation; see
.BR groff_mp (7).
To compose a caption, you issue the command
.B .CS 
[
.I mode
[
.I hoffset
[
.I voffset
]]], followed by the caption text, followed by the command
.BR .CE .
In the
.B .CS
command,
.ML \[bu]
.LI
.I mode
is an optional argument specifying the justification mode;
it must be one of
.B L
(for left-justified text),
.B R
(for right-justified text), or
.B C
(for centered text).
The default value is
.BR L .
.LI
.I hoffset
and
.I voffset
are optional horizontal and vertical offsets to be applied
before writing the caption.
The default value of
.I hoffset
is 0, and the default value of
.I voffset
is 0.25v.
.LE 
.LP
The caption text may span several lines.
The caption is set in no-fill mode, so line breaks in the input
text are reflected in the output.
.LP
Where the caption appears depends on the justification mode:
in left-justified mode 
the caption text appears to the right of the current position,
in right-justified mode it appears
to the left of the current position,
and in centered mode it is centered on the current position.
``Current position'' means the position that results
after applying
.I hoffset
and
.IR voffset .
Inside
.I hoffset
and
.IR voffset ,
the register 
.B CW
records the width of the longest line in the caption
(in machine units), and this register can be used
to position the text relative to its width.
For example, the command
.IP
.EX
\fB.CS C \\n[CW]u/2u\fR
.EE
.LP
produces a centered caption whose left edge is aligned with
the position that existed immediately before the command was
issued.
.SS
Animations
.B slide
allows you to create simple animations by expanding a single
logical slide into several physical slides, adding or removing
display and control text on successive slides.
By showing the physical slides in succession you can make
text and graphics appear, disappear,
move, change color or font, etc.
.LP
To create an animation, you do the following:
.OL 1
.LI 
Issue the command
\fB.AN\fR \fIstart\fR [ \fIstop\fR ].
.LI
Write some input text that you want to appear or disappear.
.LI
Issue the command
.BR .AE .
.LE
.LP
In the
.B .AN
command,
.I start
and
.I stop
must be integers greater than zero.
As explained further below,
.I start
is the number of the first physical slide where
the text enclosed by
.B .AN
and
.B .AE
appears, and
.I stop
(if present) is the number of the first physical slide
where it disappears.
.LP
When
.B slide
processes an input file describing a logical slide
with one or more
.B .AN
commands, it converts that single logical slide into a
number of physical slides equaling the highest value of
.I start
or
.I stop
appearing in any
.B .AN
command.
The physical slides are numbered in sequence starting with 1 
for this purpose.
.LP
When generating the physical slides,
.B slide
copies each line of the input slide 
to the corresponding line of each physical slide
as follows:
.ML \[bu]
.LI
If the line appears between an
.B .AN
command and an 
.B .AE
command, then
.B slide
copies the line onto the physical slides whose numbers
fall between
.I start
and
.I stop 
\- 1, inclusive, where
.I start
and
.I stop
are the arguments of the
.B .AN
command.
If there is no
.I stop
argument, then 
.B slide
copies the line into every physical slide from
.I start
onwards.
.LI
All other lines are copied to every physical slide.
.LE
.LP
For example, the following sequence of commands
.IP
.nf
.EX
.B Hello
.B .AN 2 3
.B there
.B .AE
.EE
.fi
.LP
generates three physical slides; slides 1 and
3 say
.BR Hello ,
while slide 2 says
.BR "Hello there" .
Showing these slides in succession would create the 
appearance that the word
.B there
had appeared and then disappeared.
.LP
Here are some tips for using animations effectively:
.OL 1
.LI
Animations are very useful for making annotations
(see
.BR groff_mp (7))
appear and disappear as you direct the audience's
attention to different points on your slide.
.LI
You can make control text, in addition to displayed text,
appear and disappear.
For example, by putting
.B .gcolor
commands inside
.BR .AN " \|.\|.\|.\| " .AE
blocks, you can make text and drawings change color
on successive slides.
.LI
You can place animations inside
.BR eqn (1)
formulas,
.BR pic (1)
pictures,
and
.BR tbl (1)
tables to make parts of formulas, pictures, or tables
appear, disappear, or change their appearance. 
.LI
You can put disconnected chunks of text in animations
with the same start and end parameters, making them
appear, disappear, or change appearance together.
For example, you could have an arrow appear inside a
.B pic
drawing along with some explanatory text outside
the drawing.
.LE
.LP
If
.B slide
is invoked in printout mode (with the
.B -p
option), then the input slide is converted to
the single physical slide that results from deleting
all
.B .AN
and
.B .AE
commands.
This is often useful for creating a document suitable
for printing.
.SS
Slide numbers
If the optional command-line argument
.BI -n " n"
is present, then
.B slide
inserts a command
.BI .SN " n"
(see
.BR groff_mp (7)) 
that displays
.I n
as the slide number.
If the slide contains animation commands (see above),
then all physical slides generated from
that slide are assigned the same page number
.IR n .
.LP
Usually you do not provide a slide number argument to
.B slide
directly; instead
.BR present (1)
supplies it when assembling multiple slides into a
presentation.
.\" ---------------------------------------------------------------------- 
.SH "SEE ALSO"
.\" ---------------------------------------------------------------------- 
.BR groff_mp (7),
.BR present (1)
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
