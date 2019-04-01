::   REWRITE QUERY STRING KEYS
::
::::  /HOON/HEP-TO-CAB/LIB
  ::
/?    310
::
::::  ~FYR
  ::
=<  TERM
|%
++  GSUB                                            ::  REPLACE CHARS
  |=  {A/@T B/@T T/@T}
  ^-  @T
  ?:  =('' T)  T
  %+  MIX  (LSH 3 1 $(T (RSH 3 1 T)))
  =+  C=(END 3 1 T)
  ?:(=(A C) B C)
::
++  TERM  |=(A/^TERM (GSUB '-' '_' A))              ::  SINGLE ATOM
++  PATH  |=(A/^PATH (TURN A TERM))                 ::  PATH ELEMENTS
++  QUAY                                            ::  QUERY STRING KEYS
  |=  A/QUAY:EYRE  ^+  A
  %+  TURN  A
  |=({P/@T Q/@T} [(TERM P) Q])
--
