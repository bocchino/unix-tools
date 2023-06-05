Shell
=====

This directory contains shell functions and scripts for
performing various useful tasks.

For more information, see the source files in the `src`
directory of each subdirectory.
The files contain comments explaining what they do and
how to use them.

Installation
------------

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

3. Issue the command `./install` to install the software
   into `$BIN`. If writing to $BIN requires administrator
   privileges, then use `sudo`: `sudo ./install`.

The names and locations of the installed files are written
to the file `installed`.
