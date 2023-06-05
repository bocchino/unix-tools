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
.TH GROFF_MP 7 "7 November 2014"
.\" ---------------------------------------------------------------------- 
.SH NAME
.\" ---------------------------------------------------------------------- 
groff_mp \- groff mp macros
.\" ---------------------------------------------------------------------- 
.SH SYNOPSIS
.\" ---------------------------------------------------------------------- 
.B groff
.B \-mp
[
.IR options .\|.\|.\&
]
[
.IR files .\|.\|.\&
]
.br
.B groff
.B \-m\ mp
[
.IR options .\|.\|.\&
]
[
.IR files .\|.\|.\&
]
.\" ---------------------------------------------------------------------- 
.SH DESCRIPTION
.\" ---------------------------------------------------------------------- 
.B mp 
is a macro package for the
.B groff
typesetting system.
It provides commands for typesetting presentation
slides.
.\" ---------------------------------------------------------------------- 
.SH USAGE
.\" ---------------------------------------------------------------------- 
.B mp
is designed to work with the
.BR slide (1)
and
.BR present (1)
macro preprocessors; typical usage patterns are
.IP
.EX
.B slide slide.t | groff -mp -P-l -Tps | ps2pdf - > slide.pdf
.EE
.LP
(to produce a single presentation slide) and
.IP
.EX
.B present slide.2.t 
\&.\|.\|. 
.B slide.n.t > body.t
.br
.B cat title.t body.t | groff -mp -P-l -Tps | ps2pdf - > presentation.pdf
.EE
.LP
(to produce a presentation consisting of several slides).
Notice the switch
.BR -P-l ,
which tells
.B groff
to lay out the slides in landscape mode.
.B mp
provides basic macros for typesetting presentations,
which the preprocessors use to provide additional 
capabilities.
.LP
.B mp
is based on
.BR groff_ms (7),
so the macros and registers of
.B ms
are available for writing presentations.
.\" ---------------------------------------------------------------------- 
.SS "Slide layout"
.\" ---------------------------------------------------------------------- 
A presentation typically consists of a
.I "title slide"
followed by one or more
.IR "interior slides" .
.TP
.B "Title slides"
.RS
A title slide typically consists of the presentation title
followed by additional information such as author names
and affiliations.
To typeset the title, you use the
.B .PT
command defined in
.BR slide (1).
To typeset additional information, you use
.B groff
and
.B ms
commands (vertical spaces, displays, font size and style
changes, etc.).
You can also use the font size commands described in
.BR "Font size" ,
below.
.LP
If you want your title slide to include the same heading
as the interior slides, then you can use the
.B .ST
command with an empty title.
The
.B .ST
command is discussed in the next section.
.RE
.TP
.B "Interior slides"
.RS
An interior slide typically consists of a slide title
followed by text, pictures, and other material.
To typeset the title, you use the command
.BI ".ST " title\fR;
if
.I title
contains any spaces, then it must be set off in double quotes.
The title appears in bold face font in the title color (see
.BR "Registers and strings" ).
To typeset the body of the slide, you use the
.BR mp 
commands described below, together with some combination of
.BR slide (1)
commands,
.B ms
commands, and
.B groff
commands.
The material in the body can include bullet points and 
text boxes (described below) as well as
.B pic
drawings,
.B eqn
formulas, etc.
.LP
If you want a different style for your slide titles, then
you can redefine the macro
.BR ST .
The redefined macro should observe the following conventions:
.ML \[bu]
.LI
It should reset the
.BR groff_ms (7)
registers
.B VS
and
.B PS
to their default values of 12 and 10 (or other suitable
defaults).
That way, changes in the vertical spacing or point size
of previous slides will not affect the layout of the
current slide.
.LI
It should end with the command
.BR ".BZ" ,
to support the
.B .BS
command (see
.BR "Text boxes" ,
below).
.LE
.RE
.\" ---------------------------------------------------------------------- 
.SS "Bullet points"
.\" ---------------------------------------------------------------------- 
A 
.I "bullet point"
is an indented paragraph preceded by a bullet or other marker.
.TP
.B General bullet points
.RS
The most general way to write a bullet point is to issue the command
.B .BP 
.I space font-size marker
on a single line, followed by the text of the bullet point on
subsequent lines.
The arguments to this command are not optional.
Their meaning is as follows:
.ML \[bu]
.LI
.I space
is the amount of vertical space preceding the bullet point.
.LI
.I font-size
is the font size of the bullet point.
.LI
.I marker
is the text to be used as the marker.
.LE
.RE
.TP
.B Predefined hierarchy
.RS
Typically bullet points are arranged in an outline-like
hierarchy.
.B mp
provides the following macros for bullet points 
at the first three levels of the hierarchy:
.TP
\fB.L1\fR [ \fImarker\fR ]
Expands to 
.B .BP 0.2i 24
.I marker
if one is given, otherwise 
\fB.BP 0.2i 24 \\[bu]\fR.
.TP
\fB.L2\fR [ \fImarker\fR ]
Expands to 
.B .BP 0.1i 20
.I marker
if one is given, otherwise 
\fB.BP 0.1i 20 \\-\fR.
.TP
\fB.L3\fR [ \fImarker\fR ]
Expands to 
.B .BP 0.05i 18
.I marker
if one is given, otherwise 
\fB.BP 0.05i 18 \\[bu]\fR.
.LP
You can redefine these macros and/or define additional levels in
a similar fashion as necessary.
.RE
.TP
.B Indentation of bullet points
.RS
.B mp
produces bullet points using the
.B .IP
command of
.BR groff_ms (7).
The register
.B .PI
controls the paragraph indentation in the usual way.
The register
.B .MI
controls the amount of indentation from the left margin
to the right side of the marker.
To produce the proper indentation for bullet points
at levels two and higher, you can use the
.B .RS
and
.B .RE
commands of 
.BR ms .
.RE
.\" ---------------------------------------------------------------------- 
.SS "Annotations"
.\" ---------------------------------------------------------------------- 
An 
.I "annotation"
is a bit of explanatory text connected to the main material
by a line.
Annotations are useful for explaining and calling attention
to particular points in a slide.
With the animation feature of
.BR slide (1)
annotations can be made to appear and disappear;
this is useful for highlighting several points in succession.
.TP
.B Writing annotations
.RS
To write an annotation, you carry out the following steps:
.OL 1
.LI
Write out some text containing an annotation mark.
.LI
Jump to the mark.
.LI
Draw a line.
.LI
Write out a caption containing explanatory text.
.LI
Return to the end of the main text.
.LE
.LP
To carry out steps 1 and 4, you use the mark and caption
features described in
.BR slide (1).
Steps 2, 3, and 5 are discussed below.
.RE
.TP
.B Jumping to a mark
.RS
.B mp
provides the following commands for jumping to a mark:
.TP
\fB.JM \fIlabel \fR[ \fIvoffset \fR[ \fIhoffset \fR] ]
.B Jump to a mark.
.I label
is the label of the mark to jump to; see
.BR slide (1)
for more information.
.I hoffset
and
.I voffset
are an optional horizontal and vertical offset by which
to move the current position after jumping to the mark.
.TP
\fB.JA \fIlabel \fR[ \fIhoffset \fR]
.B Jump above a mark.
Equivalent to
.BI ".JM " label " -0.75v " hoffset\fR.
This command is useful for starting an annotation just 
above the text at the point of the mark.
Usually the next command is to draw a line
going up and either left or right.
.TP
\fB.JB \fIlabel \fR[ \fIhoffset \fR]
.B Jump below a mark.
Equivalent to
.BI ".JM " label " 0.25v " hoffset\fR.
This command is useful for starting an annotation just 
below the text at the point of the mark.
Usually the next command is to draw a line
going down and either left or right.
.RE
.TP
.B Drawing a line
.RS
The command
\fB.LN \fIhoffset voffset \fR[ \fIafter \fR[ \fIbefore \fR] ]
draws a line from the current position to the point reached
after moving by
.I hoffset
in the horizontal direction and
.I voffset
in the vertical direction.
The arguments
.I after
and
.IR before ,
if present, are written out immediately after and before the 
line drawing command, respectively.
.RE
.TP
.B Returning from a mark
.RS
The command
.BI ".RM " label
(return from mark) returns to the position that was 
current just before jumping to label
.IR label .
Jumps and returns need not be properly
nested; for example it is possible to jump to mark
.IR a ,
then jump to mark
.IR b ,
then return from
.IR a .
.RE
.\" ---------------------------------------------------------------------- 
.SS "Font size"
.\" ---------------------------------------------------------------------- 
.B mp
provides the following commands for controlling the font size:
.TP
.BI ".FA " size
.RS
.B Font size absolute.
Set the font size to
.I size
and the vertical spacing to
.I size
+ 2.
.RE
.TP
.BI ".FD " offset
.RS
.B Font size delta.
Adjust the font size and vertical spacing by
.IR offset ,
which must be an integer and may be negative.
.RE
.LP
The font size commands use the 
.BR groff (1)
instructions
.B .vs
and
.BR .ps ;
they do not set the registers
.B VS
and
.BR PS 
defined by
.BR groff_ms (7).
As a result, the requested changes occur immediately and
last only until the start of the next paragraph.
At the next paragraph, the font and vertical space are reset to
the values given by the
.B VS
and
.B PS
registers.
.\" ---------------------------------------------------------------------- 
.SS "Text boxes"
.\" ---------------------------------------------------------------------- 
It is often useful to lay out the material of a slide
in several boxes:
for example, two columns of text side by side,
or some text next to a figure, or multiple figures.
To support this kind of layout,
.B mp
provides the following commands.
.TP
.BI ".BS " hoffset " " voffset " " width 
.B Box start.
Start a text box of width
.I width
with its upper left corner at the point
.RI ( hoffset ", " voffset ).
.I hoffset
is measured from the left side of the slide, and
.I voffset
is measured from the box zero position, which is usually 
at the bottom edge of the slide title (see the description of the
.B .BZ
command below). 
.TP
.B .BE
.B Box end.
Reset the left margin and line length to the values 
they had before the last
.B .BS
command.
.TP
.B .BZ
.B Box zero.
Establish the vertical position corresponding to a
.I voffset
of 0 in the
.B .BS
command.
Ordinarily this should be the last command in the expansion
of the
.B ST
macro (see above).
.\" ---------------------------------------------------------------------- 
.SS "Slide numbers"
.\" ---------------------------------------------------------------------- 
The command
.BI ".SN " n
inserts the text
.I n
(usually the current slide number) at the lower right-hand corner
of the current text area, calculated using the line length
.BR LL ,
header margin
.BR HM ,
and footer margin
.BR FM .
Usually you do not invoke this command directly; instead 
.BR slide (1)
uses it when constructing a presentation slide.
.\" ---------------------------------------------------------------------- 
.SS "Registers and strings"
.\" ---------------------------------------------------------------------- 
.B mp
establishes new defaults for the following registers defined by
.BR groff_ms (1):
.TS
center, tab(|);
cb cb cb
ab l l.
Register|Meaning|Default
_
PI|Paragraph indent|0.5i
HM|Header margin|0.5i
FM|Footer margin|0.5i
PO|Page offset|0.75i
LL|Line length|9.5i
.TE
.LP
In addition,
.B mp
uses the following registers and strings:
.ML \[bu]
.LI
The register
.B MI
controls the mark indentation for bullet points.
The default value is 0.3i.
.LI
The string
.B titlecolor
controls the color of the text in the presentation
title and the slide titles.
The default value is black.
.LE
.\" ---------------------------------------------------------------------- 
.SH "SEE ALSO"
.\" ---------------------------------------------------------------------- 
.BR groff (1),
.BR groff_ms (7),
.BR present (1),
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
