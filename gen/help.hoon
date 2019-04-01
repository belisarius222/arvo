::  DESCRIBE AVAILABLE COMANDS: +HELP, +HELP %TREE, +HELP %HOOD
::
::::  /HOON/HELP/GEN
  ::
/?    310
::
::::
  ::
|%
++  PATH-HEPS
  |=  A/PATH  ^-  TAPE
  ?~  A  ""
  |-  ^-  TAPE
  %+  WELP  (TRIP I.A)
  ?~  T.A  ""
  ['-' $(A T.A)]
::
++  REND
  |=  {A/@THOON B/PATH}  ^-  TANK
  =;  C/(PAIR TAPE TAPE)
    =/  TAB  (SUB 10 (MOD (LENT "{P.C}  ") 10))
    [%PALM ["  {(REAP TAB ' ')}" ``~] LEAF+P.C LEAF+Q.C ~]
  :-  ?-  B
        ~  "/"  :: XX !! MAYBE?
        {$HOOD ^}  "|{(PATH-HEPS T.B)}"
        ^          "+{(PATH-HEPS B)}"  :: XX DEAL WITH :HALL|FOO
      ==
  =/  C  (TO-WAIN:FORMAT A)
  ?~  C  "~"
  ?.  =('::  ' (END 3 4 I.C))
    "<UNDOCUMENTED>"
  (TRIP I.C)
::
++  READ-AT
  |=  {LEN/@U PAX/PATH}
  |=  {NAM/@T ARK/ARCH}  ^-  (UNIT {@T PATH})
  ?.  (~(HAS BY DIR.ARK) %HOON)  ~
  %+  BIND  (FILE:SPACE:USERLIB (WELP PAX /[NAM]/HOON))
  |=  A/*  ^-  {CORD PATH}
  [;;(@T A) (WELP (SLAG LEN PAX) /[NAM])]
--
::
:-  %SAY
|=  {{NOW/TIME @ OUR/SHIP ^} TYP/$@(~ {P/TERM ~}) ~}
=/  PAX/PATH  /(SCOT %P OUR)/HOME/(SCOT %DA NOW)/GEN  :: XX HARDCODED
=+  LEN=(LENT PAX)
=.  PAX  ?~(TYP PAX (WELP PAX /[P.TYP]))
:-  %TANG  %-  FLOP  ^-  TANG
=+  ARK=.^(ARCH CY+PAX)
%+  WELP
  ?~  TYP  ~
  =/  RED  ((READ-AT LEN (SCAG LEN PAX)) P.TYP ARK) :: XX UGLY
  (DROP (BIND RED REND))
|-  ^-  TANG
=+  =<  ARL=~(TAP BY (~(URN BY DIR.ARK) .))
    |=({A/@T ~} .^(ARCH CY+(WELP PAX /[A])))
%+  WELP
  =/  DIR/(LIST {@ PATH})
    (MURN ARL (READ-AT LEN PAX))
  `TANG`(TURN (SORT DIR AOR) REND)
%-  ZING  ^-  (LIST TANG)
%+  TURN  (SORT ARL AOR)
|=  {A/@T B/ARCH}
^$(PAX (WELP PAX /[A]), ARK B)
