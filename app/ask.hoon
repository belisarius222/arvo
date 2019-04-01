::
::::  /HOON/ASK/APP
  ::
/?    310
/+    SOLE, PREY
=,    SOLE
|%
  ++  CARD
    $%  {$DIFF $SOLE-EFFECT SOLE-EFFECT}
    ==
  ++  INVITED  ?($NEW $SENT $IGNORED)
  ++  EMAIL  @T
--
::
=,  GALL
|_  $:  BOW/BOWL
        ADR/(MAP EMAIL {TIME INVITED})
        SOS/(MAP BONE SOLE-SHARE)
        WOM/(UNIT SHIP)
        ADMINS/(SET SHIP)
    ==
++  PROMPT
  ^-  SOLE-PROMPT
  ?~  WOM  [& %ASK-SHIP ":WOMB-SHIP? ~"]
  =/  NEW  NEW-ADRS
  ?~  NEW  [& %$ "<LISTENING> (0) [L,A,I,W,?]"]
  [& %$ ": APPROVE {<ASK.I.NEW>}? ({<(LENT NEW)>}) [Y,N,L,A,I,W,?]"]
::
++  PEER-SOLE
  |=  PATH
  ^-  (QUIP {BONE CARD} _+>)
  ~|  [%NOT-IN-WHITELIST SRC.BOW]
  ?>  |((~(HAS IN ADMINS) SRC.BOW) =(OUR.BOW SRC.BOW))
  :_  +>.$(SOS (~(PUT BY SOS) OST.BOW *SOLE-SHARE))
  =-  [(EFFECT %MOR PRO+PROMPT -)]~
  =+  ALL=ADRS
  [(RENDER ALL) (TURN ALL PUT-MAIL)]
::
++  RENDER                            :: SHOW LIST OF INVITES
  |=  A/(LIST {TIME EMAIL INVITED})  ^-  SOLE-EFFECT
  ?:  =(~ A)  TXT+"~"
  TAN+(FLOP (TURN A MESSAGE))
::
++  ADRS
  =-  (SORT - |=([A=[=TIME *] B=[=TIME *]] (LTH TIME.A TIME.B)))
  %+  TURN  ~(TAP BY ADR)
  |=({A/EMAIL B/TIME C/INVITED} [TYM=B ASK=A INV=C])
::
++  NEW-ADRS  (SKIM ADRS |=({@ @ INV/INVITED} =(%NEW INV)))
++  IGNORED-ADRS  (SKIM ADRS |=({@ @ INV/INVITED} =(%IGNORED INV)))
++  EFFECT  |=(FEC/SOLE-EFFECT [OST.BOW %DIFF %SOLE-EFFECT FEC])
++  MESSAGE
  |=  {NOW/TIME ASK/@T INV/INVITED}  ^-  TANK
  =.  NOW  (SUB NOW (MOD NOW ~S1))
  LEAF+"ASK: {<INV>} {<NOW>} {(TRIP ASK)}"
::
++  PUT-MAIL   |=({@ ASK/@T INV/INVITED} =+(PAX=(RASH ASK UNIX-PATH) [%SAV PAX `@T`INV]))
++  UNIX-PATH  ::  SPLIT INTO PATH OF "NAME" AND "EXTENSION"
  ;~  (GLUE DOT)
    (COOK CRIP (STAR ;~(LESS DOT NEXT)))
    ;~(PLUG (COOK CRIP (STAR NEXT)) (EASY ~))
  ==
::
++  POKE-ASK-ADMINS
  |=  A/(SET SHIP)
  ?>  =(OUR.BOW SRC.BOW)
  `+>.$(ADMINS A)
::
++  POKE-ASK-MAIL
  |=  ASK/@T
  ^-  (QUIP {BONE CARD} _+>)
  ~|  HAVE-MAIL+ASK
  ?<  (~(HAS BY ADR) ASK)
  =.  ADR  (~(PUT BY ADR) ASK NOW.BOW %NEW) :: XX ELECTROPLATING
  :_  +>.$
  =/  NEW  [NOW.BOW ASK %NEW]
  =+  [MEZ=[(MESSAGE NEW)]~ PRO=PROMPT SAV=(PUT-MAIL NEW)]
  %+  TURN  (PREY /SOLE BOW)
  |=({OST/BONE ^} (EFFECT(OST.BOW OST) %MOR TAN+MEZ PRO+PROMPT SAV ~))
::
++  POKE-SOLE-ACTION
  |=  ACT/SOLE-ACTION
  ^-  (QUIP {BONE CARD} _+>)
  =/  SOM  (~(GOT BY SOS) OST.BOW)
  ?-    -.ACT
      $CLR  `+>.$
      $RET
    ?^  WOM  [[(EFFECT MOR+HELP)]~ +>.$]    :: SHOW HELP
    ?:  =(~ BUF.SOM)  [[(EFFECT TXT+"PLEASE ENTER WOMB SHIP")]~ +>.$]
    =/  TRY  (ROSE (TUFA BUF.SOM) FED:AG)
    ?.  ?=({%& ^} TRY)
      [[(EFFECT BEL+~)]~ +>.$]
    =>  .(WOM P.TRY)  :: XX TMI
    (TRANSMIT SET+~ PRO+PROMPT ~)   :: XX HANDLE MULTIPLE LINKS?
  ::
      $DET                              :: REJECT ALL INPUT
    =^  INV  SOM  (~(TRANSCEIVE SOLE SOM) +.ACT)
    =.  SOS  (~(PUT BY SOS) OST.BOW SOM)
    ?~  WOM
      =/  TRY  (ROSE (TUFA BUF.SOM) FED:AG)
      ?:  -.TRY  `+>.$
      (TRANSMIT INV BEL+~ ~)
    ?:  =(`*`"?" BUF.SOM)  (TRANSMIT INV HELP)
    ?:  =(`*`"A" BUF.SOM)  (TRANSMIT INV (RENDER ADRS) ~)
    ?:  =(`*`"L" BUF.SOM)  (TRANSMIT INV (RENDER NEW-ADRS) ~)
    ?:  =(`*`"I" BUF.SOM)  (TRANSMIT INV (RENDER IGNORED-ADRS) ~)
    ?:  =(`*`"N" BUF.SOM)
      =/  NEW  NEW-ADRS
      ?~  NEW  (TRANSMIT INV BEL+~ ~)
      =.  INV.I.NEW  %IGNORED
      =.  ADR  (~(PUT BY ADR) ASK.I.NEW [TYM INV]:I.NEW)
      (TRANSMIT INV TAN+[(MESSAGE I.NEW)]~ PRO+PROMPT ~)
    ?:  =(`*`"Y" BUF.SOM)
      =/  NEW  NEW-ADRS
      ?~  NEW  (TRANSMIT INV BEL+~ ~)
      =.  INV.I.NEW  %SENT  :: XX PENDING
      =-  [[(INVITE ASK.I.NEW) -<] ->]
      =.  ADR  (~(PUT BY ADR) ASK.I.NEW [TYM INV]:I.NEW)
      (TRANSMIT INV TAN+[(MESSAGE I.NEW)]~ PRO+PROMPT ~)
    ?:  =(`*`"W" BUF.SOM)
      =>  .(WOM ~)  :: XX TMI
      (TRANSMIT INV PRO+PROMPT ~)
    (TRANSMIT INV BEL+~ ~)
  ==
++  TRANSMIT
  |=  {INV/SOLE-EDIT MOR/(LIST SOLE-EFFECT)}
  =/  SOM  (~(GOT BY SOS) OST.BOW)
  =^  DET  SOM  (~(TRANSMIT SOLE SOM) INV)
  =.  SOS  (~(PUT BY SOS) OST.BOW SOM)
  [[(EFFECT MOR+[DET+DET MOR])]~ +>.$]
::
++  HELP
  ^-  (LIST SOLE-EFFECT)
  =-  (SCAN - (MORE (JUST '\0A') (STAG %TXT (STAR PRN))))
  %+  WELP
    ?~  [NEW-ADRS]  ""
    """
    Y - INVITE CURRENT ASK
    N - IGNORE CURRENT ASK

    """
  """
  L - LIST NEW ASKS
  I - LIST IGNORED ASKS
  A - LIST ALL ASKS
  W - RESET WOMB SHIP
  ? - PRINT HELP
  """
::
++  INVITE
  |=  ASK/EMAIL
  ~|  %ASK-STUB-INVITE
  !!
--
