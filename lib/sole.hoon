::
::::  /HOON/SOLE/LIB
  ::
/?    310
/-    *SOLE
::::
  ::
|_  SOLE-SHARE                                          ::  SHARED-STATE ENGINE
++  ABET  +<
++  APPLY
  |=  TED/SOLE-EDIT
  ^+  +>
  ?-    -.TED
    $DEL  +>.$(BUF (WELD (SCAG P.TED BUF) (SLAG +(P.TED) BUF)))
    $INS  +>.$(BUF (WELD (SCAG P.TED BUF) `_BUF`[Q.TED (SLAG P.TED BUF)]))
    $MOR  |-  ^+  +>.^$
          ?~  P.TED
            +>.^$
          $(P.TED T.P.TED, +>.^$ ^$(TED I.P.TED))
    $NOP  +>.$
    $SET  +>.$(BUF P.TED)
  ==
::
::::
::  ++TRANSMUTE: SYMMETRIC OPERATIONAL TRANSFORMATION.
::
::  FOR ANY SOLE STATE +>, OBEYS
::
::      =+  [X=(TRANSMUTE A B) Y=(TRANSMUTE B A)]
::      .=  (APPLY:(APPLY A) X)
::          (APPLY:(APPLY B) Y)
::
++  TRANSMUTE                                         ::  DEX AS AFTER SIN
  |=  {SIN/SOLE-EDIT DEX/SOLE-EDIT}
  ~|  [%TRANSMUTE SIN DEX]
  ^-  SOLE-EDIT
  ?:  ?=($MOR -.SIN)
    |-  ^-  SOLE-EDIT
    ?~  P.SIN  DEX
    $(P.SIN T.P.SIN, DEX ^$(SIN I.P.SIN))
  ::
  ?:  ?=($MOR -.DEX)
    :-  %MOR
    |-  ^-  (LIST SOLE-EDIT)
    ?~  P.DEX  ~
    [^$(DEX I.P.DEX) $(P.DEX T.P.DEX)]
  ::
  ?:  |(?=($NOP -.SIN) ?=($NOP -.DEX))  DEX
  ?:  ?=($SET -.SIN)                    [%NOP ~]
  ?:  ?=($SET -.DEX)                    DEX
  ::
  ?-    -.SIN
      $DEL
    ?-  -.DEX
      $DEL  ?:  =(P.SIN P.DEX)  [%NOP ~]
            ?:((LTH P.SIN P.DEX) DEX(P (DEC P.DEX)) DEX)
      $INS  ?:((LTH P.SIN P.DEX) DEX(P (DEC P.DEX)) DEX)
    ==
  ::
      $INS
    ?-  -.DEX
      $DEL  ?:((LTE P.SIN P.DEX) DEX(P +(P.DEX)) DEX)
      $INS  ?:  =(P.SIN P.DEX)
              ?:((LTH Q.SIN Q.DEX) DEX DEX(P +(P.DEX)))
            ?:((LTE P.SIN P.DEX) DEX(P +(P.DEX)) DEX)
    ==
  ==
::
++  COMMIT                                            ::  LOCAL CHANGE
  |=  TED/SOLE-EDIT
  ^-  SOLE-SHARE
  ABET:(APPLY(OWN.VEN +(OWN.VEN), LEG [TED LEG]) TED)
::
::::
::  ++INVERSE: INVERSE OF CHANGE IN CONTEXT.
::
::  FOR ANY SOLE STATE +>, OBEYS
::
::      =(+> (APPLY:(APPLY A) (INVERSE A)))
::
++  INVERSE                                           ::  RELATIVE INVERSE
  |=  TED/SOLE-EDIT
  ^-  SOLE-EDIT
  =.  TED  ?.(?=({$MOR * ~} TED) TED I.P.TED)
  ?-  -.TED
    $DEL  [%INS P.TED (SNAG P.TED BUF)]
    $INS  [%DEL P.TED]
    $MOR  :-  %MOR
          %-  FLOP
          |-  ^-  (LIST SOLE-EDIT)
          ?~  P.TED  ~
          :-  ^$(TED I.P.TED)
          $(P.TED T.P.TED, +>.^$ (APPLY I.P.TED))
    $NOP  [%NOP ~]
    $SET  [%SET BUF]
  ==
::
++  RECEIVE                                           ::  NATURALIZE EVENT
  |=  SOLE-CHANGE
  ^-  {SOLE-EDIT SOLE-SHARE}
  ?.  &(=(HIS.LER HIS.VEN) (LTE OWN.LER OWN.VEN))
    ~&  [%RECEIVE-SYNC HIS+[HIS.LER HIS.VEN] OWN+[OWN.LER OWN.VEN]]
    !!
  ?>  &(=(HIS.LER HIS.VEN) (LTE OWN.LER OWN.VEN))
  ?>  |(!=(OWN.LER OWN.VEN) =(`@`0 HAW) =(HAW (SHAM BUF)))
  =.  LEG  (SCAG (SUB OWN.VEN OWN.LER) LEG)
  ::  ~?  !=(OWN.LER OWN.VEN)  [%MISS-LEG LEG]
  =+  DAT=(TRANSMUTE [%MOR LEG] TED)
  ::  ~?  !=(~ LEG)  [%TRANSMUTE FROM+TED TO+DAT ~]
  [DAT ABET:(APPLY(HIS.VEN +(HIS.VEN)) DAT)]
::
++  REMIT                                             ::  CONDITIONAL ACCEPT
  |=  {CAL/SOLE-CHANGE ASK/$-((LIST @C) ?)}
  ^-  {(UNIT SOLE-CHANGE) SOLE-SHARE}
  =+  OLD=BUF
  =^  DAT  +>+<.$  (RECEIVE CAL)
  ?:  (ASK BUF)
    [~ +>+<.$]
  =^  LIC  +>+<.$  (TRANSMIT (INVERSE(BUF OLD) DAT))
  [`LIC +>+<.$]
::
++  TRANSMIT                                          ::  OUTGOING CHANGE
  |=  TED/SOLE-EDIT
  ^-  {SOLE-CHANGE SOLE-SHARE}
  [[[HIS.VEN OWN.VEN] (SHAM BUF) TED] (COMMIT TED)]
::
++  TRANSCEIVE                                        ::  RECEIVE AND INVERT
  |=  SOLE-CHANGE
  ^-  {SOLE-EDIT SOLE-SHARE}
  =+  OLD=BUF
  =^  DAT  +>+<.$  (RECEIVE +<.$)
  [(INVERSE(BUF OLD) DAT) +>+<.$]
::
++  TRANSPOSE                                         ::  ADJUST POSITION
  |=  POS/@UD
  =+  DAT=(TRANSMUTE [%MOR LEG] [%INS POS `@C`0])
  ?>  ?=($INS -.DAT)
  P.DAT
--
