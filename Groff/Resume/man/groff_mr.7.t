.\" ---------------------------------------------------------------------- 
.nr MI 5n
.\" ---------------------------------------------------------------------- 
.TH GROFF_MR 7 "11 October 2014"
.\" ---------------------------------------------------------------------- 
.SH NAME
.\" ---------------------------------------------------------------------- 
groff_mr \- groff mr macros
.\" ---------------------------------------------------------------------- 
.SH SYNOPSIS
.\" ---------------------------------------------------------------------- 
.B groff
.B \-mr
[
.IR options .\|.\|.\&
]
[
.IR files .\|.\|.\&
]
.br
.B groff
.B \-m\ mr
[
.IR options .\|.\|.\&
]
[
.IR files .\|.\|.\&
]
.\" ---------------------------------------------------------------------- 
.SH DESCRIPTION
.\" ---------------------------------------------------------------------- 
.B mr 
is a macro package for the
.BR groff (1)
typesetting system.
It extends
.BR groff_ms (7)
with commands for typesetting resumes and CVs.
.\" ---------------------------------------------------------------------- 
.SH USAGE
.\" ---------------------------------------------------------------------- 
When you invoke
.BR mr ,
.BR groff_ms (7)
is automatically included, so all the macros and registers of
.B ms
are available for writing your resume.
The additional macros provided by
.B mr
are discussed below.
.\" ---------------------------------------------------------------------- 
.SS Macros
.\" ---------------------------------------------------------------------- 
.TP
.BI ".NA " name
.\" ---------------------------------------------------------------------- 
.RS
.B Name.
Set
.I name
centered and in bold face in a size three points greater than 
the current font size.
Typically, this is the first macro invoked in setting your resume,
and
.I name
is your name.
.RE
.\" ---------------------------------------------------------------------- 
.TP
.BI ".FL " text
.\" ---------------------------------------------------------------------- 
.RS
.B "Flush left."
Set
.I text
flush with the left margin, followed by a line break.
.RE
.\" ---------------------------------------------------------------------- 
.TP
.BI ".FR " text
.\" ---------------------------------------------------------------------- 
.RS
.B "Flush right."
Set
.I text
flush with the right margin, followed by a line break.
.RE
.\" ---------------------------------------------------------------------- 
.TP
.BI ".SU " subject
.\" ---------------------------------------------------------------------- 
.RS
.B "Subject heading."
This macro lets you divide your resume into different subject areas.
It sets the subject name
.I subject
flush with the left margin, in bold face, in a size one point greater 
than the current font size.
It draws a horizontal line under the subject name.
.RE
.\" ---------------------------------------------------------------------- 
.TP
.BI ".IN " "name dates"
.\" ---------------------------------------------------------------------- 
.RS
.B "Institution."
This macro lets you specify an institution where you worked.
It sets 
.I name
flush with the left margin, in bold face, and
.I dates
flush with the right margin, also in bold face, on the same
line.
Typically,
.I dates
represent the dates where you worked at the institution:
for example, 2003\-2010 or 2013\-present.
.RE
.\" ---------------------------------------------------------------------- 
.TP
.BI ".IH " "text"
.\" ---------------------------------------------------------------------- 
.RS
.B "Italicized heading."
Set
.I text
as an italicized heading, flush with the left margin.
.RE
.\" ---------------------------------------------------------------------- 
.TP
.B .PA
.\" ---------------------------------------------------------------------- 
.RS
.B "Paragraph."
Begin a new paragraph.
This macro is similar to
.B .LP
in
.BR ms ,
but the vertical spacing is different.
.RE
.\" ---------------------------------------------------------------------- 
.TP
.BI ".PH " header
.\" ---------------------------------------------------------------------- 
.RS
.B "Paragraph with header."
Similar to
.BR .PA ,
but the paragraph starts with the text
.B header
in italics, followed by a period.
.RE
.\" ---------------------------------------------------------------------- 
.TP
.BI ".CT " "authors title publication"
.\" ---------------------------------------------------------------------- 
.RS
.B Citation.
A general form of citation, for citing publications.
.I authors
is a list of the authors,
.I title
is the title of the publication, and
.I publication
is all the other publication information (conference or journal
name, location, date, etc.).
.RE
.\" ---------------------------------------------------------------------- 
.SS Registers
.\" ---------------------------------------------------------------------- 
.B mr
establishes new defaults for the following registers defined by
.BR groff_ms (7):
.TS
center, tab(|);
cb cb cb
ab l l.
Register|Meaning|Default
_
HM|Header margin|1i
FM|Footer margin|1i
PO|Page offset|1i
LL|Line length|6.5i
.TE
.\" ---------------------------------------------------------------------- 
.SH "SEE ALSO"
.\" ---------------------------------------------------------------------- 
.BR groff (1),
.BR groff_ms (7)
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
