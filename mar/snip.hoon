::
::::  /HOON/SNIP/MAR
  ::
/?    310
=,  HTML
|%
  ++  WORDS  1
  ++  HEDTAL
    =|  MET/MARL
    |=  A/MARL  ^-  {HED/MARL TAL/MARL}
    ?~  A  [~ ~]
    ?.  ?=($H1 N.G.I.A)
      ?:  ?=($META N.G.I.A)
        $(A T.A, MET [I.A MET])
      =+  HAD=$(A C.I.A)
      ?^  -.HAD  HAD
      $(A T.A)
    [C.I.A (WELD (FLOP MET) (LIMIT WORDS T.A))]
  ::
  ++  LIMIT
    |=  {LIM/@U MAL/MARL}
    =<  RES
    |-  ^-  {REM/@U RES/MARL}
    ?~  MAL  [LIM ~]
    ?~  LIM  [0 ~]
    =+  ^-  {LAM/@U HED/MANX}
      ?:  ?=(_;/(**) I.MAL)
        [LIM ;/(TAY)]:(DEWORD LIM V.I.A.G.I.MAL)
      [REM ELE(C RES)]:[ELE=I.MAL $(MAL C.I.MAL)]
    [REM - RES]:[HED $(LIM LAM, MAL T.MAL)]
  ::
  ++  DEWORD
    |=  {LIM/@U TAY/TAPE}  ^-  {LIM/@U TAY/TAPE}
    ?~  TAY  [LIM TAY]
    ?~  LIM  [0 ~]
    =+  WER=(DOT 1^1 TAY)
    ?~  Q.WER
      [LIM - TAY]:[I.TAY $(TAY T.TAY)]
    =+  NEX=$(LIM (DEC LIM), TAY Q.Q.U.Q.WER)
    [-.NEX [(WONK WER) +.NEX]]
--
::
::
=,  MIMES:HTML
|_  {HED/MARL TAL/MARL}
::
++  GROW                                                ::  CONVERT TO
  |%
  ++  MIME
    =<  MIME
    |%
    ++  ELEM  ;DIV:(H1:"*{HED}" DIV:"*{TAL}")           ::  CONVERT TO %ELEM
    ++  HYMN  ;HTML:(HEAD:TITLE:"SNIP" BODY:"+{ELEM}")  ::  CONVERT TO %HYMN
    ++  HTML  (CRIP (EN-XML HYMN))                      ::  CONVERT TO %HTML
    ++  MIME  [/TEXT/HTML (AS-OCTS HTML)]               ::  CONVERT TO %MIME
    --
  --
++  GRAB  |%                                            ::  CONVERT FROM
          ++  NOUN  {MARL MARL}                         ::  CLAM FROM $NOUN
          ++  ELEM  |=(A/MANX (HEDTAL +.A))
--        --
