.\" ---------------------------------------------------------------------- 
.TH XREF 1 "3 October 2014"
.\" ---------------------------------------------------------------------- 
.SH NAME
xref \- process cross references for
.BR "groff ms" .
.\" ---------------------------------------------------------------------- 
.SH SYNOPSIS
.\" ---------------------------------------------------------------------- 
.B xref
[
.B -v
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
.B -v
Print the version number and exit.
.\" ---------------------------------------------------------------------- 
.SH DESCRIPTION
.\" ---------------------------------------------------------------------- 
.B xref
is a preprocessor for
.BR groff_ms (7).
It provides commands for managing cross references, for
example references to figures or section numbers.
.\" ---------------------------------------------------------------------- 
.SH USAGE
.\" ---------------------------------------------------------------------- 
Usage is standard for a troff preprocessor;
you invoke
.B xref
on an input file before passing it to
.BR ms .
For example:
.IP
.EX
xref in.t | groff -ms | ps2pdf - > out.pdf
.EE
.LP
If one or more file names appear on the command line, then
.B xref
processes the files in order; otherwise it reads from standard input.
.LP
To use
.BR xref ,
you define
.I counters
and
.IR tags .
Counters count things \[em] for example, how many figures
appear before a certain point in the document.
Tags associate a label with a value, usually the value of a counter
computed at the point in the text where the tag is defined.
You use the label to refer to the value, and
the program substitutes the value for the label in all its uses.
.LP
.B xref
should work in environments other than
.BR ms .
However,
.B xref
assumes the following:
.OL 1 5n
.LI
Sections are denoted using the
.B NH
command (see
.BR groff_ms (7)).
If this is not true, then cross references to section numbers
won't work as described below.
.LI
The
.BR lst (1)
preprocessor is used for processing lists.
If this is not true, then cross references to list items
won't work as described below.
.LE
.\" ---------------------------------------------------------------------- 
.SS Defining tags
.\" ---------------------------------------------------------------------- 
To define a tag, you use the command
.BI ".TG " label " [" value ]\fR,
where
.ML \[bu] 5n
.LI
.I label
specifies the label for the tag.
.LI
.I value
specifies the value  associated with the label.
.LE
.LP
For example,
.B .TG color green
associates the value
.B green
with the label
.BR color .
.LP
The value may contain the name of one or more counters
(see below), each preceded by the character
.BR # .
For each such counter name, the program removes the
.B #
and the name and substitutes the value of the counter
before assigning the tag value to the label.
For example, suppose the counters
.B #NH
and
.B #FIG
have values 1 and 3.
Then
.B .TG A #NH
associates the value 1
with the label
.BR A ,
and
.B .TG B #NH.#FIG
associates the value 1.3 with the label 
.BR B .
.LP
If the tag label contains an embedded 
.B !\& 
character, then all characters up to the 
.B !\& 
are interpreted as the name of a counter, and the value of 
the tag is the value of the counter.
For example,
.B .TG NH!A
is equivalent to
.BR ".TG NH!A #NH" .
This notation makes the counter name a 
prefix of the tag label.
This is useful for ensuring that tags associated with
different counters are assigned different labels.
.LP
Subject to the interpretation of 
.BR !\&
as described above, any sequence of non-space characters 
may function as a label.
In particular, only the first 
.BR !\&
is so interpreted; subsequent instances of
.BR !\& 
can be used to organize tags into a hierarchical structure.
For example,
.B "NH!A!B"
is a legal tag label.
.\" ---------------------------------------------------------------------- 
.SS "Using tags"
.\" ---------------------------------------------------------------------- 
You may use a tag anywhere in the source text, including before
its definition.
.B xref
performs two passes over the source text 
\[em] one to resolve tag values and another to substitute values
for labels \[em]
so forward-defined tags work as expected.
.LP
To use a tag, write the character
.B @
followed by the tag name.
The program will substitute the tag's value for the 
.B @
and the label.
For example, the following input produces a section called
Introduction and then (assuming this is the first section in
the document) the text ``This is section 1.''
.IP
.EX
.nf
\&.NH 1
Introduction
\&.TG NH!intro
\&.LP
This is section @\&NH!intro.
.fi
.EE
.LP
If one tag label is a prefix of another, the longest matching
label is used to do the substitution.
.LP
Any sequence of
.B @
followed by alphanumeric or underscore characters, followed by
.B !\&
is interpreted as a tag label.
If no tag with that label is defined, the program issues a warning.
To suppress this behavior, you can place the character
.B \[rs]&
(a non-printing, zero-width character) between the
.B @
and the
.BR ! .
For example, the sequence
.B @\[rs]&A!
will produce the sequence
.B @A!
in the groff output without issuing a warning.
.\" ---------------------------------------------------------------------- 
.SS "Predefined counters"
.\" ---------------------------------------------------------------------- 
.B xref
currently provides the following predefined counters:
.OL 1 5n
.LI
The counter 
.BR NH 
represents the number of the most recent heading defined with 
.BR .NH .
.LI
The counter 
.BR LINE 
refers to the current line.
.LI
The counter 
.BR OL 
indicates the current position in the outline hierarchy specified 
with the
.B .OL
command of 
.BR lst (1).
.LE
.LP
Additional counters (e.g., for counting page numbers) may
be provided in future versions.
.LP
The 
.BR LINE 
counter is useful for referring to lines, e.g., in program
text embedded in the document.
To start counting from a particular place (for example, 
the beginning of the embedded text), place the command
.B .DC LINE 0
just before the line where you want to start counting.
(The
.BR .DC
command is described below.)
For example:
.IP
.EX
.nf
\&.nf
\&.DC LINE 0
Line 1
Line 2
\&.TG LINE!A
Line 3
\&.fi
\&.LP
Reference to line @\&LINE!A.
.fi
.EE
.LP
After processing with
.BR xref ,
the output is as follows:
.IP
.nf
.DC LINE 0
Line 1
Line 2
.TG LINE!A
Line 3
.fi
.IP
Reference to line @LINE!A.
.EE
.LP
The 
.BR OL 
counter is useful for referring to items in outline lists.
For example:
.IP
.EX
.nf
\&.OL 1 5n 4n
\&.LI
\&.TG OL!A
Item @\&OL!A.
\&.LI
\&.TG OL!B
Item @\&OL!B.
\&.OL a 5n 4n
\&.LI
\&.TG OL!C
Item @\&OL!C.
\&.LI
\&.TG OL!D
Item @\&OL!D.
\&.LE
\&.LE
.fi
.EE
.LP
After processing with
.B xref
and
.BR lst ,
the output is as follows:
.OL 1 5n 4n
.LI
.TG OL!A
Item @OL!A.
.LI
.TG OL!B
Item @OL!B.
.OL a 5n 4n
.LI
.TG OL!C
Item @OL!C.
.LI
.TG OL!D
Item @OL!D.
.LE
.LE
.LP
When using the 
.BR OL 
counter, you must pass the source text first through
.B xref
and then through
.BR lst .
.\" ---------------------------------------------------------------------- 
.SS "User-defined counters"
.\" ---------------------------------------------------------------------- 
Any sequence of characters that is not a prefix of any other counter
name (including a predefined counter name) and
that does not contain
.BR !
may function as the name of a user-defined counter.
The following commands are available for setting the value
of a user-defined counter:
.TP
.BI ".DC " "counter value"
Define the counter
.I counter
with the value
.IR value .
.TP
.BI ".IC " counter
Increment the value of the counter
.IR counter .
.LP
For example, the following source text generates the output
``Reference to Figure 2.''
.IP
.EX
.nf
\&.DC FIG 0
\&.\\" Figure 1 goes here
\&.IC FIG
\&.\\" Figure 2 goes here
\&.IC FIG
\&.TG FIG!A
Reference to Figure @\&FIG!A.
.fi
.EE
.LP
As discussed under
.BR "Predefined counters" ,
the
.B .DC
command may be used with the
.B LINE
counter to reset the current line number.
Otherwise, the
.B .DC
and
.B .IC
commands should not be used with the predefined counters.
.\" ---------------------------------------------------------------------- 
.SS "Resolution of counters"
.\" ---------------------------------------------------------------------- 
.LP
Note that counter names are resolved
.I only
in tag definitions (as discussed in
.BR "Defining tags" ), 
and not in the main text.
For example, the following source text produces
``Figure #FIG,'' not ``Figure 1.''
.IP
.EX
.nf
\&.DC FIG 1 
Figure #\&FIG.
.fi
.EE
.LP
To use the value of a counter in the text, you first have to
define a tag:
.IP
.EX
.nf
\&.DC FIG 1
\&.TG FIG!A
Figure @\&FIG!A.
.fi
.EE
.LP
The counter FIG is resolved in defining the tag (line 2), and then
the tag value is resolved in line 3.
.\" ---------------------------------------------------------------------- 
.SH "SEE ALSO"
.\" ---------------------------------------------------------------------- 
.BR lst (1).
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
