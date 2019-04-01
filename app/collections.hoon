::
::::  /APP/COLLECTIONS/HOON
  ::
/?  309
/-  HALL
/+  COLLECTIONS
::
::  COLS:
::
::    RUN COLLECTIONS-ITEM RENDERER ON CHILDREN OF /WEB/COLLECTIONS
::    COMBINE WITH A BUNTED CONFIG IN A +COLLECTION STRUCTURE DEFINED IN
::    /LIB/COLLECTIONS BECAUSE THE TOP LEVEL COLLECTION HAS NO CONFIG FILE
::
::    WHENEVER ANY OF THE CLAY FILES THAT COMPOSE THIS RENDERER CHANGE, THIS APP
::    WILL RECOMPILE AND THE +PREP ARM WILL FIRE. WE THEN CHECK WHICH FILES
::    CHANGED AND NOTIFY THE CORRESPONDING HALL CIRCLE OF THAT CHANGE
::
/=  COLS
  /^  COLLECTION:COLLECTIONS
  /;  |=  A=(MAP KNOT ITEM:COLLECTIONS)
      [*CONFIG:COLLECTIONS A]
  /:  /===/WEB/COLLECTIONS  /_  /COLLECTIONS-ITEM/
::
=,  COLLECTIONS
=,  SPACE:USERLIB
::
::  STATE:
::
::    STORES THE COLLECTION BUILT BY ABOVE BY :COLS SO THAT WE CAN COMPARE OLD
::    AND NEW VERSIONS WHENEVER THE RENDERED DATA CHANGES
::
~%  %LANDSCAPE  ..^IS  ~
|_  [BOL=BOWL:GALL STA=STATE]
::
::  +THIS: APP CORE SUBJECT
::
++  THIS  .
::
::  +PREP:
::
::    ON INITIAL BOOT, CREATE TOP LEVEL HALL CIRCLE FOR COLLECTIONS, CALLED %C
::
::    ON SUBSEQUENT COMPILES, CALL +TA-UPDATE:TA ON THE OLD COLLECTION DATA,
::    THEN UPDATE STATE TO STORE THE NEW COLLECTION DATA
::
++  PREP
  ~/  %LAND-PREP
  |=  OLD=(UNIT STATE)
  ^-  (QUIP MOVE _THIS)
  ?~  OLD
    :_  THIS
    ;:  WELP
      =<  TA-DONE
      (~(TA-HALL-CREATE-CIRCLE TA ~ BOL) /C 'COLLECTIONS')
    ::
      :~  [OST.BOL %PEER /CIRCLES [OUR.BOL %HALL] /CIRCLES/[(SCOT %P OUR.BOL)]]
          [OST.BOL %PEER /INBOX [OUR.BOL %HALL] /CIRCLE/INBOX/CONFIG/GRAMS]
          [OST.BOL %PEER /INVITES [OUR.BOL %HALL] /CIRCLE/I/GRAMS]
        ::
      ::    ?.  =(%DUKE (CLAN:TITLE OUR.BOL))
      ::      ~
      ::    :_  ~
      ::    :*  OST.BOL  %POKE  /CLIENT-ACTION  [OUR.BOL %HALL]
      ::        %HALL-ACTION  %SOURCE  %INBOX  &
      ::        (SY [[(^SEIN:TITLE OUR.BOL) %URBIT-META] ~]~)
      ::    ==
      ==
    ==
  ?-    -.U.OLD
      %0
    =/  MOW=(LIST MOVE)
      =<  TA-DONE
      (~(TA-UPDATE TA ~ BOL) COL.U.OLD COLS)
    :-  MOW
    %=  THIS
      STA  [%0 COLS STR.U.OLD]
    ==
  ==
::
::  +MACK:
::
::    RECIEVE ACKNOWLEDGEMENT FOR PERMISSIONS CHANGES, PRINT ERROR IF IT FAILED
::
++  MACK
  |=  [WIR=WIRE ERR=(UNIT TANG)]
  ^-  (QUIP MOVE _THIS)
  ?~  ERR
    [~ THIS]
  (MEAN U.ERR)
::
::  +COUP: RECIEVE ACKNOWLEDGEMENT FOR POKE, PRINT ERROR IF IT FAILED
::
++  COUP
  |=  [WIR=WIRE ERR=(UNIT TANG)]
  ^-  (QUIP MOVE _THIS)
  ?~  ERR
    [~ THIS]
  (MEAN U.ERR)
::
::  +POKE-COLLECTIONS-ACTION:
::
::    THE MAIN INTERFACE FOR CREATING AND DELETING COLLECTIONS AND ITEMS
::
++  POKE-COLLECTIONS-ACTION
  ~/  %COLL-POKE-COLLECTIONS-ACTION
  |=  ACT=ACTION
  ^-  (QUIP MOVE _THIS)
  ?:  =(WHO.ACT OUR.BOL)
    :_  THIS
    =<  TA-DONE
    (~(TA-ACT TA ~ BOL) ACT)
  ::  FORWARD POKE IF ITS NOT MEANT FOR US
  ::
  :_  THIS
  :_  ~
  :*  OST.BOL  %POKE
      /FORWARD-COLLECTIONS-ACTION
      [WHO.ACT %COLLECTIONS]
      %COLLECTIONS-ACTION  ACT
  ==
::
::  +POKE-JSON
::
::    UTILITY FOR SETTING WHETHER OR NOT TO DISPLAY THE ONBOARDING PAGE
::
++  POKE-JSON
  ~/  %COLL-POKE-JSON
  |=  JON=JSON
  ^-  (QUIP MOVE _THIS)
  ?:  ?=([%O [[%ONBOARD %B ?] ~ ~]] JON)
    :_  THIS
    =<  TA-DONE
    (~(TA-WRITE TA ~ BOL) /WEB/LANDSCAPE/ONBOARD/JSON [%JSON !>(JON)])
  [~ THIS]
::
::  +POKE-COLLECTIONS-COMMAND
::
++  POKE-COLLECTIONS-COMMAND
  |=  COD=COMMAND
  ^-  (QUIP MOVE _THIS)
  ?-    -.COD
      %CHAT-INVITE
    :_  THIS
    :-  :*  OST.BOL
            %POKE
            /PERMIT
            [OUR.BOL %HALL]
            %HALL-ACTION
            %PERMIT
            NOM.COD
            %.Y
            WHO.COD
        ==
    %+  TURN  ~(TAP IN WHO.COD)
    |=  GUY=@P
    ^-  MOVE
    :*  OST.BOL
        %POKE
        /INVITE
        [OUR.BOL %HALL]
        %HALL-ACTION
        %PHRASE
        AUD=(SY [GUY %I] ~)
        SES=[%INV & OUR.BOL NOM.COD]~
    ==
    ::
      %COLLECTION-INVITE
    :_  THIS
    :-  :*  OST.BOL
            %POKE
            /PERMIT
            [OUR.BOL %HALL]
            %HALL-ACTION
            %PERMIT
            NOM.COD
            %.Y
            WHO.COD
        ==
    %+  TURN  ~(TAP IN WHO.COD)
    |=  GUY=@P
    ^-  MOVE
    :*  OST.BOL
        %POKE
        /INVITE
        [OUR.BOL %HALL]
        %HALL-ACTION
        %PHRASE
        AUD=(SY [GUY %I] ~)
        SES=[%APP COL.COD [%INV & OUR.BOL NOM.COD]]~
    ==
  ==
::
::  +PEER:
::
++  PEER
  |=  WIR=WIRE
  ^-  (QUIP MOVE _THIS)
  ::~&  PEER-PRIZE+STR.STA
  :_  THIS
  [OST.BOL %DIFF %COLLECTIONS-PRIZE STR.STA]~
::
::  +REAP: RECIEVE ACKNOWLEDGEMENT FOR PEER, RETRY ON FAILURE
::
++  REAP
  |=  [WIR=WIRE ERR=(UNIT TANG)]
  ^-  (QUIP MOVE _THIS)
  ::~&  REAP+[WIR =(~ ERR)]
  ?~  ERR
    ::  XX SEND MESSAGE TO USERS INBOX
    [~ THIS]
  ?~  WIR
    (MEAN [LEAF+"INVALID WIRE FOR DIFF: {(SPUD WIR)}"]~)
  ?+  I.WIR
    (MEAN [LEAF+"INVALID WIRE FOR DIFF: {(SPUD WIR)}"]~)
  ::
      %CIRCLES
    :_  THIS
    [OST.BOL %PEER /CIRCLES [OUR.BOL %HALL] /CIRCLES/[(SCOT %P OUR.BOL)]]~
  ::
      %INBOX
    :_  THIS
    [OST.BOL %PEER /INBOX [OUR.BOL %HALL] /CIRCLE/INBOX/CONFIG/GRAMS]~
  ::
      %INVITES
    :_  THIS
    [OST.BOL %PEER /INVITES [OUR.BOL %HALL] /CIRCLE/I/GRAMS]~
  ::
      %OUR
    ?<  ?=(~ T.WIR)
    :_  THIS
    [OST.BOL %PEER /OUR/[I.T.WIR] [OUR.BOL %HALL] /CIRCLE/[I.T.WIR]/CONFIG]~
  ==
::
::  +QUIT:
::
++  QUIT
  |=  WIR=WIRE
  ^-  (QUIP MOVE _THIS)
  ?~  WIR
    (MEAN [LEAF+"INVALID WIRE FOR DIFF: {(SPUD WIR)}"]~)
  ?+  I.WIR
    (MEAN [LEAF+"INVALID WIRE FOR DIFF: {(SPUD WIR)}"]~)
  ::
      %CIRCLES
    :_  THIS
    [OST.BOL %PEER /CIRCLES [OUR.BOL %HALL] /CIRCLES/[(SCOT %P OUR.BOL)]]~
  ::
      %INBOX
    :_  THIS
    [OST.BOL %PEER /INBOX [OUR.BOL %HALL] /CIRCLE/INBOX/CONFIG/GRAMS]~
  ::
      %INVITES
    :_  THIS
    [OST.BOL %PEER /INVITES [OUR.BOL %HALL] /CIRCLE/I/GRAMS]~
  ::
      %OUR
    ?<  ?=(~ T.WIR)
    :_  THIS
    [OST.BOL %PEER /OUR/[I.T.WIR] [OUR.BOL %HALL] /CIRCLE/[I.T.WIR]/CONFIG]~
  ==
::
::  +DIFF-HALL-PRIZE:
::
++  DIFF-HALL-PRIZE
  |=  [WIR=WIRE PIZ=PRIZE:HALL]
  ^-  (QUIP MOVE _THIS)
  ::
  ::
  ::~&  PRIZE+[WIR PIZ]
  ?~  WIR
    (MEAN [LEAF+"INVALID WIRE FOR DIFF: {(SPUD WIR)}"]~)
  ?+  I.WIR
    (MEAN [LEAF+"INVALID WIRE FOR DIFF: {(SPUD WIR)}"]~)
  ::
  ::  %CIRCLES: SUBSCRIBE TO THE CONFIGURATION OF EACH OF OUR CIRCLES
  ::
      %CIRCLES
    ?>  ?=(%CIRCLES -.PIZ)
    =/  NOMS=(SET NAME:HALL)  (~(DIF IN CIS.PIZ) (SY ~[%INBOX %I %PUBLIC]))
    :_  THIS(OUR-CIRCLES.STR.STA (~(UNI IN OUR-CIRCLES.STR.STA) NOMS))
    ^-  (LIST MOVE)
    %+  TURN  ~(TAP IN NOMS)
    |=  NOM=NAME:HALL
    ^-  MOVE
    [OST.BOL %PEER /OUR/[NOM] [OUR.BOL %HALL] /CIRCLE/[NOM]/CONFIG]
  ::
  ::  %INBOX: FILL INBOX CONFIG, MESSAGES AND REMOTE CONFIGS WITH PRIZE DATA
  ::
      %INBOX
    ?>  ?=(%CIRCLE -.PIZ)
    :-  ~
    %=    THIS
        CON.INBOX.STR.STA  `LOC.COS.PIZ
    ::
        ENV.INBOX.STR.STA  NES.PIZ
    ::
        CIRCLES.STR.STA
      %-  ~(UNI IN CIRCLES.STR.STA)
      ^-  (MAP CIRCLE:HALL (UNIT CONFIG:HALL))
      (~(RUN BY REM.COS.PIZ) |=(A=CONFIG:HALL `A))
    ==
  ::
  ::  %INVITES: FILL INVITE MESSAGES WITH PRIZE DATA
  ::
      %INVITES
    ?>  ?=(%CIRCLE -.PIZ)
    :-  ~
    %=  THIS
      INVITES.STR.STA  NES.PIZ
    ==
  ::
  ::  %OUR:
  ::
      %OUR
    ?>  ?=(%CIRCLE -.PIZ)
    =/  NOM=NAME:HALL  &2:WIR
    ::  XX TODO: SEND RUMOR OR LET CONFIG-CHANGE HANDLE IT?
    ::
    :-  ~
    %=    THIS
        CIRCLES.STR.STA
      (~(PUT BY CIRCLES.STR.STA) [OUR.BOL NOM] `LOC.COS.PIZ)
    ::
      OUR-CIRCLES.STR.STA  (~(PUT IN OUR-CIRCLES.STR.STA) NOM)
    ==
  ==
::
::  +DIFF-HALL-RUMOR
::
++  DIFF-HALL-RUMOR
  |=  [WIR=WIRE RUM=RUMOR:HALL]
  ^-  (QUIP MOVE _THIS)
  ::~&  RUMOR+[WIR RUM]
  ?~  WIR
    (MEAN [LEAF+"INVALID WIRE FOR DIFF: {(SPUD WIR)}"]~)
  =;  UPD=[MOW=(LIST MOVE) STA=_THIS]
    :_  STA.UPD
    %+  WELP  MOW.UPD
    %+  TURN  (PREY:PUBSUB:USERLIB /PRIMARY BOL)
    |=  [=BONE *]
    [BONE %DIFF %HALL-RUMOR RUM]
  ?+  I.WIR
    (MEAN [LEAF+"INVALID WIRE FOR DIFF: {(SPUD WIR)}"]~)
  ::
  ::  %CIRCLES:
  ::
      %CIRCLES
    ::~&  %CIRCLES
    ?>  ?=(%CIRCLES -.RUM)
    =?    DMS.STR.STA
        ?&  (IS-DM-CIRCLE OUR.BOL CIR.RUM)
          !(~(HAS BY DMS.STR.STA) CIR.RUM)
        ==
      (~(PUT BY DMS.STR.STA) CIR.RUM OUR.BOL ~)
    ?:  ADD.RUM
      :_  THIS(OUR-CIRCLES.STR.STA (~(PUT IN OUR-CIRCLES.STR.STA) CIR.RUM))
      [OST.BOL %PEER /OUR/[CIR.RUM] [OUR.BOL %HALL] /CIRCLE/[CIR.RUM]/CONFIG]~
    :_  THIS(OUR-CIRCLES.STR.STA (~(DEL IN OUR-CIRCLES.STR.STA) CIR.RUM))
    [OST.BOL %PULL /OUR/[CIR.RUM] [OUR.BOL %HALL] ~]~
  ::
  ::  %INBOX:
  ::
      %INBOX
    ?>  ?=(%CIRCLE -.RUM)
    ?+  -.RUM.RUM
      ::~&  INBOX-UNPROCESSED-RUMOR+RUM.RUM
      [~ THIS]
    ::
    ::  %REMOVE:
    ::
        %REMOVE
      ::~&  %INBOX-REMOVE
        ::~&  %REMOVED-STORY
      [~ THIS]
    ::
    ::  %GRAM: INBOX HAS RECIEVED MESSAGES
    ::
        %GRAM
      ::~&  %INBOX-GRAM
      ::  XX TODO: HANDLE STACK TRACE MESSAGE WHEN FOREIGN CIRCLE IS KILLED?
      ::
      ?:  (IS-DM-CIRCLE SRC.RUM.RUM)
        =/  DMS=[INI=SHIP ENV=(LIST ENVELOPE:HALL)]
          (~(GOT BY DMS.STR.STA) NOM.SRC.RUM.RUM)
        =.  ENV.DMS  [NEV.RUM.RUM ENV.DMS]
        :-  ~
        %=  THIS
          ENV.INBOX.STR.STA  [NEV.RUM.RUM ENV.INBOX.STR.STA]
          DMS.STR.STA        (~(PUT BY DMS.STR.STA) NOM.SRC.RUM.RUM DMS)
        ==
      :-  ~  ::(SEND-RUMOR [%NEW-MSG %INBOX NEV.RUM.RUM])
      THIS(ENV.INBOX.STR.STA [NEV.RUM.RUM ENV.INBOX.STR.STA])
    ::
    ::  %CONFIG: INBOX CONFIG HAS CHANGED
    ::
        %CONFIG
      =*  CIRC  CIR.RUM.RUM
      ?+  -.DIF.RUM.RUM
        ::~&  INBOX-UNPROCESSED-CONFIG+DIF.RUM.RUM
        [~ THIS]
      ::
      ::  %REMOVE: CIRCLE HAS BEEN ERASED
      ::
          %REMOVE
        ::~&  %INBOX-CONFIG-REMOVE
        :-  ~  ::(SEND-RUMOR %CONFIG-CHANGE CIR.RUM.RUM ~)
        %=    THIS
            CIRCLES.STR.STA
          (~(DEL BY CIRCLES.STR.STA) CIR.RUM.RUM)
        ==
      ::
      ::  %SOURCE: THE SOURCES OF OUR INBOX HAVE CHANGED
      ::
          %SOURCE
        ::~&  %INBOX-CONFIG-SOURCE
        ?.  =(CIRC [OUR.BOL %INBOX])
          [~ THIS]
        ::  WE'VE ADDED A SOURCE TO OUR INBOX
        ::
        ?>  ?=(^ CON.INBOX.STR.STA)
        ?:  ADD.DIF.RUM.RUM
          =/  CONF=CONFIG:HALL
            %=  U.CON.INBOX.STR.STA
              SRC  (~(PUT IN SRC.U.CON.INBOX.STR.STA) SRC.DIF.RUM.RUM)
            ==
          :-  ~  ::(SEND-RUMOR %CONFIG-CHANGE [OUR.BOL %INBOX] `CONF)
          %=    THIS
              CON.INBOX.STR.STA  `CONF
          ::
              CIRCLES.STR.STA
            ?:  (~(HAS BY CIRCLES.STR.STA) CIR.SRC.DIF.RUM.RUM)
              CIRCLES.STR.STA
            (~(PUT BY CIRCLES.STR.STA) CIR.SRC.DIF.RUM.RUM ~)
          ==
        ::  WE'VE REMOVED A SOURCE FROM OUR INBOX
        ::
        =/  CONF=CONFIG:HALL
          %=  U.CON.INBOX.STR.STA
            SRC  (~(DEL IN SRC.U.CON.INBOX.STR.STA) SRC.DIF.RUM.RUM)
          ==
        ::~&  INBOX+CONF
        :-  ~  ::(SEND-RUMOR %CONFIG-CHANGE [OUR.BOL %INBOX] `CONF)
        %=    THIS
            CON.INBOX.STR.STA  `CONF
        ::
            CIRCLES.STR.STA
          ?:  =(OUR.BOL HOS.CIR.SRC.DIF.RUM.RUM)
            CIRCLES.STR.STA
          (~(DEL BY CIRCLES.STR.STA) CIR.SRC.DIF.RUM.RUM)
        ==
      ::
      ::  %FULL: RECIEVED A FULL CONFIG UPDATE FOR ONE OF OUR SOURCES
      ::
          %FULL
        ::~&  %INBOX-CONFIG-FULL
        =*  CONF  COF.DIF.RUM.RUM
        :-  ~  ::(SEND-RUMOR %CONFIG-CHANGE CIRC `CONF)
        %=  THIS
          CIRCLES.STR.STA  (~(PUT BY CIRCLES.STR.STA) CIRC `CONF)
        ==
      ::
      ::  %READ: RECIEVED A READ RECIEPT
      ::
          %READ
        ?.  =([OUR.BOL %INBOX] CIR.RUM.RUM)
          [~ THIS]
        ?>  ?=(^ CON.INBOX.STR.STA)
        :-  ~
        %=  THIS
          RED.U.CON.INBOX.STR.STA  RED.DIF.RUM.RUM
        ==
      ==
    ==
  ::
  ::  %INVITES:
  ::
      %INVITES
    ::~&  %INVITES
    ?>  ?=(%CIRCLE -.RUM)
    ?>  ?=(%GRAM -.RUM.RUM)
    ?+  -.SEP.GAM.NEV.RUM.RUM
      [~ THIS(INVITES.STR.STA [NEV.RUM.RUM INVITES.STR.STA])]
    ::
        %INV
      =/  CIRC=CIRCLE:HALL  CIR.SEP.GAM.NEV.RUM.RUM
      ?:  (IS-DM-CIRCLE CIRC)
        =/  WHO=(SET SHIP)  (SY (RASH NOM.CIRC (MORE DOT FED:AG)))
        =/  ACT=POKE  [%HALL-ACTION %NEWDM WHO]
        :-  [OST.BOL %POKE /JOIN-DM [OUR.BOL %HALL] ACT]~
        %=  THIS
          INVITES.STR.STA  [NEV.RUM.RUM INVITES.STR.STA]
          DMS.STR.STA      (~(PUT BY DMS.STR.STA) NOM.CIRC HOS.CIRC ~)
        ==
      =/  ACT=POKE  [%HALL-ACTION %SOURCE %INBOX & (SY [CIRC ~] ~)]
      :-  ~
      THIS(INVITES.STR.STA [NEV.RUM.RUM INVITES.STR.STA])
    ==
  ::
  ::  %OUR:
  ::
      %OUR
    ?>  ?=(%CIRCLE -.RUM)
    ?+  -.RUM.RUM
      ::~&  OUR-UNPROCESSED-RUMOR+RUM.RUM
      [~ THIS]
    ::
    ::  %REMOVE:
    ::
        %REMOVE
        ::~&  %OUR-REMOVE
      [~ THIS]
    ::
    ::  %CONFIG:
    ::
        %CONFIG
      =*  CIRC  CIR.RUM.RUM
      =*  DIFF  DIF.RUM.RUM
      ?+  -.DIFF
        ::~&  OUR-UNPROCESSED-CONFIG+DIFF
        [~ THIS]
      ::
      ::  %FULL: RECIEVED A FULL CONFIG UPDATE FOR ONE OF OUR SOURCES
      ::
          %FULL
        ::~&  %OUR-CONFIG-FULL
        =*  CONF  COF.DIF.RUM.RUM
        :-  ~  ::(SEND-RUMOR %CONFIG-CHANGE CIRC `CONF)
        %=  THIS
          CIRCLES.STR.STA  (~(PUT BY CIRCLES.STR.STA) CIRC `CONF)
        ==
      ::
      ::  %READ: RECIEVED A READ RECIEPT
      ::
          %READ
        =/  CONF  (NEED (~(GOT BY CIRCLES.STR.STA) CIRC))
        =.  RED.CONF  RED.DIF.RUM.RUM
        :-  ~
        %=  THIS
          CIRCLES.STR.STA  (~(PUT BY CIRCLES.STR.STA) CIRC `CONF)
        ==
      ==
    ==
  ==
::
::  +SEND-RUMOR: SEND A RUMOR TO ALL SUBSCRIBERS
::
++  SEND-RUMOR
  |=  RUM=RUMOR
  ::~&  SEND-RUMOR+RUM
  ^-  (LIST MOVE)
  %+  TURN  (PREY:PUBSUB:USERLIB /PRIMARY BOL)
  |=  [=BONE *]
  [BONE %DIFF %COLLECTIONS-RUMOR RUM]
::
::  +POKE-NOUN: DEBUGGING STUFF
::
++  POKE-NOUN
  |=  A=@TAS
  ^-  (QUIP MOVE _THIS)
  ?+    A
    [~ THIS]
  ::
      %CHECK-ALL-SUBS
    ~&  'HERE ARE ALL INCOMING SUBS'
    ~&  ^-  (LIST (PAIR SHIP PATH))
        %+  TURN  ~(TAP BY SUP.BOL)
        |=  [B=BONE S=SHIP P=PATH]
        ^-  (PAIR SHIP PATH)
        [S P]
    [~ THIS]
  ::
      %PRINT-STATE
    ~&  STR.STA
    [~ THIS]
  ::
      %REBUILD-SUBS
    :_  THIS
    :~  [OST.BOL %PEER /CIRCLES [OUR.BOL %HALL] /CIRCLES/[(SCOT %P OUR.BOL)]]
        [OST.BOL %PEER /INBOX [OUR.BOL %HALL] /CIRCLE/INBOX/CONFIG/GRAMS]
        [OST.BOL %PEER /INVITES [OUR.BOL %HALL] /CIRCLE/I/GRAMS]
    ==
  ==
::
++  IS-DM-CIRCLE
  |=  CIRC=CIRCLE:HALL
  ^-  ?
  ?=  ^
  (RUSH NOM.CIRC (MORE DOT FED:AG))
--
