::
::::  /HOON/X-URB/MAR
  ::
/?    310
=,  FORMAT
=,  MIMES:HTML
=,  HTML
::
|_  MAX=MANX
++  GROW                                                ::  CONVERT TO
  |%
  ++  MIME  [/TEXT/HTML (AS-OCTS HTML)]                 ::  CONVERT TO %MIME
  ++  HTML  (CRIP (EN-XML HYMN))                        ::  CONVERT TO %HTML
  ++  HYMN  MAX
  --
++  GRAB
  |%                                                    ::  CONVERT FROM
  ++  NOUN  MANX                                        ::  CLAM FROM %NOUN
  --
--
