::
::::  /HOON/XML/MAR
  ::
/?    310
  ::
::::  COMPUTE
  ::
=,  MIMES:HTML
=,  HTML
|_  XML/@T
::
++  GROW                                                ::  CONVERT TO
  |%                                                    ::
  ++  MIME  [/APPLICATION/XML (AS-OCTS XML)]            ::  TO %MIME
  ++  HYMN  (NEED (DE-XML XML))                         ::  TO %HYMN
  --                                                    ::
++  GRAB  |%                                            ::  CONVERT FROM
          ++  NOUN  @T                                  ::  CLAM FROM %NOUN
          ++  MIME  |=({P/MITE Q/OCTS} Q.Q)             ::  RETRIEVE FORM $MIME
--        --
