::
::::  /HOON/ASK-MAIL/MAR
  ::
/?    310
=,  FORMAT
=,  MIMES:HTML
|_  TXT/CORD
::
++  GRAB                                                ::  CONVERT FROM
  |%
  ++  NOUN  @T                                          ::  CLAM FROM %NOUN
  ++  JSON  SO:DEJS
  --
++  GROW
  |%
  ++  PSAL  ;DIV: {(TRIP TXT)}
  ++  MIME  [TEXT+/PLAIN (AS-OCTS TXT)]
  --
--
