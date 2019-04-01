::  BASIC AUTHENTICATION
::
::::  /HOON/BASIC-AUTH/LIB
  ::
=,  EYRE
|%
++  KEYS  @T
--
::
::::
  ::
|_  {BAL/(BALE KEYS) ~}
++  AUTH
  |%
  ++  HEADER
    ^-  CORD
    ?~  KEY.BAL
      ~_  LEAF+"RUN |INIT-AUTH-BASIC {<`PATH`DOM.BAL>}"
      ~|(%BASIC-AUTH-NO-KEY !!)
    (CAT 3 'BASIC ' KEY.BAL)
  --
::
++  ADD-AUTH-HEADER
  |=  A/HISS  ^-  HISS
  ~&  AUTH+(EN-PURL:HTML P.A)
  %_(A Q.Q (~(ADD JA Q.Q.A) %AUTHORIZATION HEADER:AUTH))
::
++  STANDARD
  |%
  ++  OUT-ADDING-HEADER
    |=  A/HISS  ^-  SEC-MOVE
    [%SEND (ADD-AUTH-HEADER A)]
  --
--
