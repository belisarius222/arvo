::
::::  /HOON/ELEM/MAR
  ::
/?    310
=,  MIMES:HTML
=,  HTML
|_  OWN/MANX
::
++  GROW                                                ::  CONVERT TO
  |%
  ++  HYMN  ;HTML:(HEAD BODY:"+{OWN}")                  ::  CONVERT TO %HYMN
  ++  HTML  (CRIP (EN-XML HYMN))                        ::  CONVERT TO %HTML
  ++  MIME  [/TEXT/HTML (AS-OCTS HTML)]                 ::  CONVERT TO %MIME
  --
++  GARB  /SNIP                                         ::  GRABBED BY
++  GRAB  |%                                            ::  CONVERT FROM
          ++  NOUN  MANX                                ::  CLAM FROM %NOUN
--        --
