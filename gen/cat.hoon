::  CONCATENATE FILE LISTINGS
::
::::  /HOON/CAT/GEN
  ::
/?    310
/+    PRETTY-FILE, SHOW-DIR
::
::::
  ::
:-  %SAY
|=  {^ {ARG/(LIST PATH)} VANE/?($G $C)}
=-  TANG+(FLOP `TANG`(ZING -))
%+  TURN  ARG
|=  PAX/PATH
^-  TANG
=+  ARK=.^(ARCH (CAT 3 VANE %Y) PAX)
?^  FIL.ARK
  ?:  =(%SCHED -:(FLOP PAX))
    [>.^((MAP @DA CORD) (CAT 3 VANE %X) PAX)<]~
  [LEAF+(SPUD PAX) (PRETTY-FILE .^(NOUN (CAT 3 VANE %X) PAX))]
?-     DIR.ARK                                          ::  HANDLE AMBIGUITY
    ~
  [ROSE+[" " `~]^~[LEAF+"~" (SMYT PAX)]]~
::
    {{@T ~} ~ ~}
  $(PAX (WELP PAX /[P.N.DIR.ARK]))
::
    *
  =-  [PALM+[": " ``~]^-]~
  :~  ROSE+[" " `~]^~[LEAF+"*" (SMYT PAX)]
      `TANK`(SHOW-DIR VANE PAX DIR.ARK)
  ==
==
