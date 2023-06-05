UNIX Tools for Typesetting and Shell Programming
================================================

*Rob Bocchino*  
**Jet Propulsion Laboratory**  
California Institute of Technology  
Copyright (C) 2014-2023 California Institute of Technology

This repository contains several UNIX command-line tools.
Many of the tools add functionality to the
[groff](http://www.gnu.org/software/groff/) typesetting system.
Others are useful even if you don't use groff.

Contents
--------

At the top level, there are three directories:

### Groff

This directory contains groff utilities
that support the following:

 - Comparing two groff documents and preparing a third
   document that highlights the changes (i.e., a "redline").

 - Creating auto-numbered lists within `groff ms` or `groff man`.

 - Automatically managing cross references to figures, tables,
   section headings, etc.

 - Creating presentation slides, so you can use groff instead
   of PowerPoint for your presentations.

 - Creating resumes and CVs.

### Shell

This directory contains shell functions and 
scripts for performing various useful tasks, 
including the following:

 - Sorting the blocks (paragraphs) of a text document.
   This is like sorting lines, but the "lines" consist of
   continguous non-blank lines separated by blank lines.

 - Generating HTML tables from a simple text format using
   blocks. The blocks are the rows, and the lines with
   a block are the columns.

 - Filtering blocks.

 - Reordering the fields within a block.

 - Concatenating two or more PDF documents into a single
   document.

Requirements
------------

To build and run the software, you will need standard
UNIX command-line tools.

Installation
------------

See the README files in the `Groff` and `Shell`
directories for installation instructions.
