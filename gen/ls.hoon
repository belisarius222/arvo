::  LIST DIRECTORY SUBNODES
::
::::  /HOON/LS/GEN
  ::
/?    310
/+    SHOW-DIR
::
::::
  ::
~&  %
:-  %SAY
|=  {^ {ARG/PATH ~} VANE/?($G $C)}
=+  LON=.^(ARCH (CAT 3 VANE %Y) ARG)
TANG+[?~(DIR.LON LEAF+"~" (SHOW-DIR VANE ARG DIR.LON))]~
