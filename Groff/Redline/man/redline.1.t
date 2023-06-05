.\" ---------------------------------------------------------------------- 
.TH REDLINE 1 "7 October 2014"
.\" ---------------------------------------------------------------------- 
.SH NAME
redline \- produce a redline comparison of a groff document.
.\" ---------------------------------------------------------------------- 
.SH SYNOPSIS
.\" ---------------------------------------------------------------------- 
.B "redline -v"
.br
.B redline
[
.B -d
]
[
.B --
]
.I file
.\" ---------------------------------------------------------------------- 
.SH OPTIONS
.\" ---------------------------------------------------------------------- 
The option
.BR -- ,
if present, marks the end of the options.
.TP
.B -v
Print the version number and exit.
.TP
.B -d
Show deletions.
.\" ---------------------------------------------------------------------- 
.SH DESCRIPTION
.\" ---------------------------------------------------------------------- 
.B redline
accepts as input (1) a groff source file
.I file 
and (2) a diff of
.I file
against a previous version.
It adds redline markings to
.I file
and writes the result to standard output.
New text appears in red; optionally deleted text may appear
in gray.
.\" ---------------------------------------------------------------------- 
.SH USAGE
.\" ---------------------------------------------------------------------- 
A typical usage looks like this:
.IP
.EX
diff -u old.t new.t | redline new.t
.EE
.LP
As shown,
.B redline
accepts two inputs:
.OL 1
.LI
A 
.BR diff (1)
comparison of the old file and the new file on standard input.
.LI
The new file, which must be named on the command line.
.LE
.LP
.B redline
produces, on standard output, a new version of
.B new.t
with the added text colored red.
If the
.B -d
option is selected, then deleted text appears in gray; otherwise
it does not appear at all.
.LP
Note that the
.B -u
option of
.BR diff (1)
must be selected.
Any tool that produces equivalent output (such as
.BR "git diff" )
may be used to produce the comparison.
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
