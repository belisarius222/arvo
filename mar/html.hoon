::
::::  /HOON/HTML/MAR
  ::
/?    310
  ::
::::  COMPUTE
  ::
=,  HTML
|_  HTM/@T
::
++  GROW                                                ::  CONVERT TO
  |%                                                    ::
  ++  MIME  [/TEXT/HTML (MET 3 HTM) HTM]                ::  TO %MIME
  ++  HYMN  (NEED (DE-XML HTM))                         ::  TO %HYMN
  --                                                    ::
++  GRAB  |%                                            ::  CONVERT FROM
          ++  NOUN  @T                                  ::  CLAM FROM %NOUN
          ++  MIME  |=({P/MITE Q/OCTS} Q.Q)             ::  RETRIEVE FORM $MIME
          --
++  GRAD  %MIME
--
