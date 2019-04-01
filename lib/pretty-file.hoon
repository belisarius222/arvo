::  UNTYPED BEST-GUESS PRINTER
::
::::  /HOON/PRETTY-FILE/LIB
  ::
/?    310
::
=<  PRETTY-FILE
|%
++  PRETTY-NOUN
  |=  PRI/*  ^-  TANK
  ?~  PRI
    LEAF+"~"
  ?@  PRI
    LEAF+?:(((SANE %TAS) PRI) <`@TAS`PRI> <PRI>)
  =<  ROSE+[" " ?:(- "~[" "[") "]"]^+
  |-  ^-  {? (LIST TANK)}
  ?~  +.PRI
    [& ^$(PRI -.PRI) ~]
  ?@  +.PRI
    [| ^$(PRI -.PRI) ^$(PRI +.PRI) ~]
  [+< - +>]:[^$(PRI -.PRI) $(PRI +.PRI)]
::
++  VALE-CORD  |=(A/CORD `?`(LEVY (TRIP A) |=(B/@ |((GTE B 32) =(10 B)))))
::
++  WAIN-TO-TANG  |=(A/WAIN (TURN A |=(B/CORD LEAF+(TRIP B))))
++  PRETTY-FILE
  |=  FYL/*  ^-  TANG
  =+  `(UNIT WAIN)`?@(FYL `(TO-WAIN:FORMAT FYL) ((SOFT WAIN) FYL))
  ?^  -  (WAIN-TO-TANG U)
  [(PRETTY-NOUN FYL)]~
--
