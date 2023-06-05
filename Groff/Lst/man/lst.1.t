.\" ---------------------------------------------------------------------- 
.TH LST 1 "11 November 2014"
.\" ---------------------------------------------------------------------- 
.SH NAME
lst \- preprocess lists for
.B "groff ms" 
or 
.BR "groff man" .
.\" ---------------------------------------------------------------------- 
.SH SYNOPSIS
.\" ---------------------------------------------------------------------- 
.B lst
[
.B -v --version
]
[
.B -h --html
]
[
.B --
]
[
.IR files .\|.\|.\&
]
.\" ---------------------------------------------------------------------- 
.SH OPTIONS
.\" ---------------------------------------------------------------------- 
The option
.BR -- ,
if present, marks the end of the options.
The filename
.B -
indicates the standard input.
.TP
.B -v --version
Print the version number and exit.
.TP
.B -h --html
Generate HTML output.
.\" ---------------------------------------------------------------------- 
.SH DESCRIPTION
.\" ---------------------------------------------------------------------- 
.B lst
is a preprocessor for
.B "groff ms"
or
.BR "groff man" .
It provides directives for typesetting lists.
.\" ---------------------------------------------------------------------- 
.SH USAGE
.\" ---------------------------------------------------------------------- 
Usage is standard for a troff preprocessor;
you invoke
.B lst
on an input file before passing it to
.B "groff ms"
or
.BR "groff man" .
For example:
.IP
.EX
lst in.t | groff -ms | ps2pdf - > out.pdf
.EE
.LP
If one or more file names appear on the command line, then
.B lst
processes the files in order; otherwise it reads from standard input.
.LP
.B lst
provides two kinds of lists:
marked lists and outline lists.
Either kind may be nested within the other.
.LP
While designed to work with
.B ms
or
.BR man ,
.B lst
should work in any environment that provides directives
.BR .IP , 
.BR .RS , 
and
.B .RE
as defined in those packages.
.\" ---------------------------------------------------------------------- 
.SS "Marked lists"
.\" ---------------------------------------------------------------------- 
A
.I marked list
is an indented list of items each of which is preceded
by a right-aligned mark, for example a bullet.
You define a marked list as follows:
.OL 1 5n
.LI
The list begins with 
.BI ".ML [" mark " [" tindent " [" mindent ]]]\fR,
where
.OL a 5n
.LI
.I mark
defines the mark for each list item
(for example, 
.B \e(bu 
for a bullet).
If no mark is specified, then the empty string is used.
.LI
.I tindent
sets the indentation for the text of each list item.
If no
.I tindent
is specified, then the default indentation associated
with the
.B .IP
directive is used.
When using
.BR ms ,
the default indentation is stored in the register
.B PI
(see
.BR Registers ).
Specifying
.I tindent
also sets the default indentation.
.LI
.I mindent
sets the indentation for the mark for each list item,
measured from the current left margin to the
right side of the mark.
If no
.I mindent
is specified, then the value of the register
.B MI
is used (see
.BR Registers ).
Specifying
.I mindent
does not set register
.BR MI .
.LE
.LI
Each list item begins with
.BI ".LI [" mark ]\fR,
where
.I mark
is an optional mark for the current list item.
If no mark is specified, then the mark appearing in the
.B .ML
directive beginning the list is used.
.LI
The list ends with
.BR .LE .
.LE
.LP
For example, the following lines define a marked list 
containing three bulleted items, with a paragraph indent
of 5n and a mark indent of 4n:
.IP
.EX
.nf
\&.ML \e(bu 5n 4n
\&.LI
This is item 1.
\&.LI
This is item 2.
\&.LI
This is item 3.
\&.LE
.fi
.EE
.LP
After processing with
.BR man ,
the output is as follows:
.ML \(bu 5n 4n
.LI
This is item 1.
.LI
This is item 2.
.LI
This is item 3.
.LE
.\" ---------------------------------------------------------------------- 
.SS "Outline lists"
.\" ---------------------------------------------------------------------- 
An
.I "outline list"
is similar to a numbered list, but instead of providing a single
mark for all elements, you provide an
.I "outline mark"
such as 1 or a; the provided mark is used for the first element in the
list, and then auto-incremented for each subsequent element.
.LP
You define an outline list as follows:
.OL 1 5n
.LI 
The list begins with
.BI ".OL [" mark " [" tindent " [" mindent "]]]"\&
, where
.OL a 5n
.LI
.I mark
is one of the outline marks defined in the next section.
.LI
.I tindent
and
.I mindent
operate as described in the section
.BR "Marked lists" ,
above.
.LE
.LI
Each list item begins with
.BI ".LI [" mark ]\&
, where
.I mark
is an optional mark for the current list item.
If no mark is specified, then the mark corresponding to the
current outline mark and position is used.
.LI
The list ends with
.BR .LE .
.LE
.LP
For example, the following lines define an outline list
containing three numbered items, with a paragraph indent
of 5n and a mark indent of 4n:
.IP
.EX
.nf
\&.OL 1 5n 4n
\&.LI
This is item 1.
\&.LI
This is item 2.
\&.LI
This is item 3.
\&.LE
.fi
.EE
.LP
After processing with
.BR man ,
the output is as follows:
.OL 1 5n 4n
.LI
This is item 1.
.LI
This is item 2.
.LI
This is item 3.
.LE
.\" ---------------------------------------------------------------------- 
.SS "Outline marks"
.\" ---------------------------------------------------------------------- 
The following outline marks are available:
.TP
.B 1
Denotes a list marked 1, 2, 3, etc.
.TP
.B A
Denotes a list marked A, B, C, etc.
.TP
.B a
Denotes a list marked a, b, c, etc.
.TP
.B I
Denotes a list marked I, II, III, etc.
.TP
.B i
Denotes a list marked i, ii, iii, etc.
.LP
Lists marked with A, a, I, or i must have 26 or fewer elements.
Lists marked with 1 may have any number of elements. 
.\" ---------------------------------------------------------------------- 
.SS "Nested lists"
.\" ---------------------------------------------------------------------- 
Either kind of list may be nested arbitrarily within the other.
After preprocessing, nested lists are enclosed
in
.B .RS
and
.B .RE
directives, so each level of nesting is indented properly.
.LP
For example, the following lines define an outline containing
two nested lists:
.IP
.EX
.nf
\&.OL 1 5n 4n
\&.LI
This is item 1.
\&.LI
This is item 2.
\&.LI
This is item 3.
\&.OL a 5n 4n
\&.LI
This is item 3(a).
\&.LI
This is item 3(b).
\&.LE
\&.LE
.fi
.EE
.LP
After processing with
.BR man ,
the output is as follows:
.OL 1 5n 4n
.LI
This is item 1.
.LI
This is item 2.
.LI
This is item 3.
.OL a 5n 4n
.LI
This is item 3(a).
.LI
This is item 3(b).
.LE
.LE
.\" ---------------------------------------------------------------------- 
.SS "Registers"
.\" ---------------------------------------------------------------------- 
The
.B lst
preprocessor uses the following number registers:
.TP
.B PI
When preprocessing for
.BR ms ,
register
.B PI
stores the default indentation for list items and is set whenever a
new indentation is specified.
This behavior is inherited from
.BR ms ;
it does not apply to
.BR man .
.TP
.B MI
Register
.B MI
always stores the default value of the mark indentation.
Initially it is set to 4n.
It may be set in the usual way for troff number registers; for
example
.IP
.EX
\&.nr MI 3n
.EE
.IP
sets the value of
.B MI
to 3n.
The
.B MI
value is not changed by specifying a mark indentation in a
.B .ML
or
.B .OL
directive.
.\" ---------------------------------------------------------------------- 
.SS "Generating HTML"
.\" ---------------------------------------------------------------------- 
.LP
By default
.B lst
generates output suitable for further processing by a non-HTML device 
(PS, PDF, ASCII, etc.).
Sending this output through
.BR grohtml (1)
will produce HTML, but the formatting may be a bit rough.
To get better-looking results, use the
.B -h
or
.B --html
command-line switch:
.IP
.EX
lst -h in.t | groff -ms -Thtml > out.html
.EE
.LP
The
.B -h
switch changes the output as follows:
.ML \[bu] 5n 4n
.LI
Outline lists are translated to HTML ordered lists.
.LI
A marked list beginning with
.B .ML \e(bu 
or 
.B .ML \e[bu] 
is translated to an HTML unordered list.
All marks are rendered as bullets; any optional marks in list
items are ignored.
.LI
Any other marked list is translated to an HTML table.
.LE
.\" ---------------------------------------------------------------------- 
.SH "SEE ALSO"
.\" ---------------------------------------------------------------------- 
.BR groff_man (7),
.BR groff_ms (7).
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
