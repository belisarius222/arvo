::
::::  /HOON/HTTP/LIB
  ::
  ::
  ::
/?    310
::
=,  MIMES:HTML
=,  HTML
|%
++  REQUEST
  $:  DOMAIN/(LIST CORD)
      END-POINT/PATH
      REQ-TYPE/$?($GET {$POST P/JSON})
      HEADERS/MATH:EYRE
      QUERIES/QUAY:EYRE
  ==
++  SEND
  |=  {OST/BONE POUR-PATH/WIRE PARAMS/REQUEST}
  :^  OST  %THEM  POUR-PATH
  `(UNIT HISS:EYRE)`[~ (REQUEST-TO-HISS PARAMS)]
::
++  REQUEST-TO-HISS
  |=  REQUEST  ^-  HISS:EYRE
  =-  ~&  HISS=-  -
  :-  ^-  PARSED-URL/PURL:EYRE
      :+  :+  SECURITY=%.Y
            PORT=~
          HOST=[%.Y [PATH=DOMAIN]]
        ENDPOINT=[EXTENSIONS=~ POINT=END-POINT]       ::  ++PORK,
      Q-STRINGS=QUERIES                               ::  ++QUAY
  ?@  REQ-TYPE
    [%GET HEADERS ~]
  [%POST HEADERS ~ (AS-OCTT:MIMES:HTML (EN-JSON P.REQ-TYPE))]
--
