::
::::  /HOON/JSON/MAR
  ::
/?    310
  ::
::::  COMPUTE
  ::
=,  EYRE
=,  FORMAT
=,  HTML
|_  JON/JSON
::
++  GROW                                                ::  CONVERT TO
  |%
  ++  MIME  [/APPLICATION/JSON (AS-OCTS:MIMES -:TXT)]   ::  CONVERT TO %MIME
  ++  TXT   [(CRIP (EN-JSON JON))]~
  --
++  GRAB
  |%                                                    ::  CONVERT FROM
  ++  MIME  |=({P/MITE Q/OCTS} (FALL (RUSH (@T Q.Q) APEX:DE-JSON) *JSON))
  ++  NOUN  JSON                                        ::  CLAM FROM %NOUN
  ++  NUMB  NUMB:ENJS
  ++  TIME  TIME:ENJS
  --
++  GRAD  %MIME
--
