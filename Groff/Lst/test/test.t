.LP
This is a list:
.OL 1
.LI
Item 1.
.LI
Item 2.
.LI
Item 3.
.OL I
.LI
Sub-item
.LI
Sub-item
.LI
Sub-item
.LI
Sub-item
.LI
Sub-item
.LI
Sub-item
.LE
.LE
.LP
This is a marked list with non-bullets as the default mark.
.ML
.LI XXVI.  
This is an item.
.LI "a b c"
This is an item whose mark contains spaces.
.LI """a b c"""
This is an item whose mark contains spaces and quotes.
.LI "a ""b"" c"
More quotes.
.LE
.LP
This is a marked list with bullets as the default mark.
.ML \[bu]
.LI
Bullet.
.LE
.LP
This is a marked list with a custom bullet.
.ML
.LI \[bu]
Bullet.
.IP
This is an indented paragraph.
.LE
.LP
This is a nested list of custom marks.
.ML
.LI 1.
Item
.LI 2.
Item
.ML
.LI a.
Item
.LI b.
Item
.LE
.LE
.LP
Another list with custom marks.
.ML
.LI 1.
Item.
.ML
.LI a.
Item.
.ML
.LI i.
This is an item with a larger amount of text, to test
what happens when the line is filled.
.LE
.LE
.LE
.LP
Single-item custom-mark list.
.ML \fBCustom\fR
.LI
Item.
.LE
.LP
List with left paragraph.
.OL 1
.LI
Item.
.LP
Paragraph.
.LI
Item.
.LE
