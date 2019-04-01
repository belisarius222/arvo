|%
++  STATIC                                              :: FREEZE .MDH HOON SUBSET
  |=  GEN/HOON  ^-  {INF/(MAP TERM DIME) ELM/MANX}
  ?+    -.GEN
      =/  GEN  ~(OPEN AP GEN)
      ?:  =(GEN ^GEN)  ~|([%CRAM-DYNAMIC -.GEN] !!)
      $(GEN GEN)
  ::
    $XRAY  [~ (SINGLE (SHUT GEN))]
    ^     [(MALT (FRONTMATTER P.GEN)) (SINGLE (SHUT Q.GEN))]
  ==
::
++  SINGLE                                              :: UNWRAP ONE-ELEM MARL
  |=  XML/MARL  ^-  MANX
  ?:  ?=({* ~} XML)  I.XML
  ~|(%MANY-ELEMS !!)
::
++  SHUT-MART                                           :: XML ATTRS
  |=({N/MANE V/(LIST BEER:HOOT)} [N (TURN V |=(A/BEER:HOOT ?^(A !! A)))])
::
++  SHUT                                                :: AS XML CONSTANT
  |=  GEN/HOON  ^-  MARL
  ?+    -.GEN  ~|([%BAD-XML -.GEN] !!)
      $DBUG  $(GEN Q.GEN)
  ::
      $XRAY
    [[N.G.P.GEN (TURN A.G.P.GEN SHUT-MART)] $(GEN [%MCTS C.P.GEN])]~
  ::
      $MCTS
    ?~  P.GEN  ~
    =-  (WELD - $(P.GEN T.P.GEN))
    ?^  -.I.P.GEN  $(GEN [%XRAY I.P.GEN])
    ~|  [%SHUT-TUNA -.I.P.GEN]
    ?+  -.I.P.GEN  !!
      $MANX  ?>(?=($XRAY -.P.I.P.GEN) $(GEN P.I.P.GEN))
      $MARL  ?>(?=($MCTS -.P.I.P.GEN) $(GEN P.I.P.GEN))
    ==
  ==
::
::
++  FRONTMATTER                                         :: PARSE ~[[%FOO 1] [%BAR ~S2]]
  |=  GEN/HOON  ^-  (LIST {TERM DIME})
  ?:  ?=({$BUST $NULL} GEN)  ~
  ?:  ?=($DBUG -.GEN)  $(GEN Q.GEN)
  ?.  ?=($CLSG -.GEN)  ~|([%BAD-FRONTMATTER -.GEN] !!)
  %+  TURN  P.GEN
  |=  GEN/HOON
  ?.  ?=(^ -.GEN)
    =/  GEN  ~(OPEN AP GEN)
    ?:  =(GEN ^GEN)  ~|([%BAD-FRONTMATTER-ELEM -.GEN] !!)
    $(GEN GEN)
  =/  HED  (AS-DIME P.GEN)
  ?.  =(%TAS P.HED)  ~|([%BAD-FRONTMATTER-KEY-TYPE P.HED] !!)
  [Q.HED (AS-DIME Q.GEN)]
::
++  AS-DIME                                            :: %FOO ~.FOO 0VBAR ETC
  |=  GEN/HOON  ^-  DIME
  ?:  ?=($DBUG -.GEN)  $(GEN Q.GEN)
  ?.  ?=({?($ROCK $SAND) @ @} GEN)  ~|([%BAD-LITERAL GEN] !!)
  +.GEN
--
