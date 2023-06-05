Groff
=====

This directory contains several tools for use with the 
[groff](http://www.gnu.org/software/groff/) typesetting system.

Contents
--------

There are five tools, each contained within
its own subdirectory:

1. `Lst`: A preprocessor for producing formatted
   lists in documents formatted with `groff ms`
   or `groff man`.

2. `Present`: A macro package and preprocessors 
   for producing presentation slides.

3. `Redline`: A tool for comparing two groff documents 
    and preparing a third document that highlights the changes 
    (i.e., a "redline").

4. `Resume`: A macro package for producing resumes
   and CVs.

5. `XRef`: A preprocessor for managing internal
   cross-references in documents formatted with
   `groff ms` and `lst`.

Installing the Software
-----------------------

To install the software, carry out the following steps:

1. Copy the file `dirs.default` in this directory to
   `dirs.sh`:

       cp dirs.default dirs.sh

   This file is a short shell script that stores the settings for
   several environment variables used by the build system.

2. Edit `dirs.sh` so that the following settings are correct 
   for your system:

     - `BIN`: The place to install executable files.
        Set to `/usr/bin` by default.

     - `GROFF`: The location of your groff installation
        Set to `/usr/share/groff` by default.

     - `MAN`: The location of the source files for your
        man pages.
        Set to `/usr/share/man` by default.

   In most cases the defaults should work.
   You will need to change them if, for example, you have
   installed groff somewhere other than `/usr/share/groff`.

3. Issue the command `./all_do` to build the software.

4. Issue the command `./install` (or `sudo ./install`, if necessary)
   to install the software as follows:

     - Macro packages in `$GROFF/site-tmac`.

     - Man pages for macro packages in `$MAN/man7`.

     - Preprocessors in `$BIN`.

     - Helper scripts for the `present` preprocessor in 
       `$GROFF/present`.

     - Man pages for preprocessors in `$MAN/man1`.

   The names and locations of the installed files are written
   to the file `installed`.

Using the Software
------------------

Once the software is installed, you can get more information
as follows:

  - Lst: `man lst`

  - Present: `man groff_mp`, `man present`, `man slide`, `man outline`

  - Redline: `man redline`

  - Resume: `man groff_mr`.

  - XRef: `man xref`

You can also look at the examples and tests in the tool subdirectories
to see examples of the tools in action.

Reinstalling the Software
-------------------------

To reinstall the software, run `./clean_do` followed by `./build_do`
and `./install`.
