#!/bin/sh

# ----------------------------------------------------------------------
# redline.t.do
# ----------------------------------------------------------------------

redo-always
diff -u file1.t file2.t | redline -d file2.t > $3
