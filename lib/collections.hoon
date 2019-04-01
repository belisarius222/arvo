::
::::  /HOON/COLLECTIONS/LIB
  ::
/?  309
/-  HALL
/+  CRAM, ELEM-TO-REACT-JSON
:: ::
~%  %COLLECTIONS-LIB  ..IS  ~
|%
+$  MOVE  [BONE CARD]
::
+$  CARD
  $%  [%INFO WIRE TORO:CLAY]
      [%POKE WIRE DOCK POKE]
      [%PERM WIRE DESK PATH RITE:CLAY]
      [%PEER WIRE DOCK PATH]
      [%PULL WIRE DOCK ~]
      [%DIFF DIFF]
  ==
::
+$  DIFF
  $%  [%COLLECTIONS-PRIZE PRIZE]
      [%COLLECTIONS-RUMOR RUMOR]
      [%HALL-RUMOR RUMOR:HALL]
  ==
::
+$  POKE
  $%  [%HALL-ACTION ACTION:HALL]
      [%COLLECTIONS-ACTION ACTION]
      [%JSON JSON]
  ==
::
+$  STATE
  $%  [%0 COL=COLLECTION STR=STREAMS]
  ==
::
+$  STREAMS
  $:  ::  INBOX CONFIG AND MESSAGES
      ::
      INBOX=[CON=(UNIT CONFIG:HALL) ENV=(LIST ENVELOPE:HALL)]
      ::  NAMES AND CONFIGS OF ALL CIRCLES WE KNOW ABOUT
      ::
      CIRCLES=(MAP CIRCLE:HALL (UNIT CONFIG:HALL))
      ::  NAMES OF ALL CIRCLES WE OWN
      ::
      OUR-CIRCLES=(SET NAME:HALL)
      ::  LIST OF MESSAGES IN ALL OUR DM CIRCLES
      ::
      DMS=(MAP NAME:HALL [INI=SHIP ENV=(LIST ENVELOPE:HALL)])
      ::  ALL THE DM INVITES WE'VE RECEIVED
      ::
      INVITES=(LIST ENVELOPE:HALL)
  ==
::
+$  PRIZE
  $:  ::  INBOX CONFIG AND MESSAGES
      ::
      INBOX=[CON=(UNIT CONFIG:HALL) ENV=(LIST ENVELOPE:HALL)]
      ::  NAMES AND CONFIGS OF ALL CIRCLES WE KNOW ABOUT
      ::
      CIRCLES=(MAP CIRCLE:HALL (UNIT CONFIG:HALL))
      ::  NAMES OF ALL CIRCLES WE OWN
      ::
      OUR-CIRCLES=(SET NAME:HALL)
      ::  LIST OF MESSAGES IN ALL OUR DM CIRCLES
      ::
      DMS=(MAP NAME:HALL [INI=SHIP ENV=(LIST ENVELOPE:HALL)])
      ::  ALL THE DM INVITES WE'VE RECEIVED
      ::
      INVITES=(LIST ENVELOPE:HALL)
  ==
::
+$  RUMOR
  $%  ::  IF CONFIG IS GIVEN, EITHER ADD NEW CIRCLE OR UPDATE EXISTING ONE
      ::  IF CONFIG IS NIL THEN DELETE CIRCLE
      ::
      [%CONFIG-CHANGE CIR=CIRCLE:HALL CON=(UNIT CONFIG:HALL)]
      ::  RECIEVED A NEW INBOX MESSAGE OR DM INVITE
      ::
      [%NEW-MSG NOM=?(%INBOX %INVITES) ENV=ENVELOPE:HALL]
  ==
::
+$  COMMAND
  $%  [%CHAT-INVITE NOM=NAME:HALL WHO=(SET SHIP)]
      [%COLLECTION-INVITE NOM=NAME:HALL COL=TERM WHO=(SET SHIP)]
  ==
+$  COLLECTION  [META=CONFIG DATA=(MAP NOM=KNOT =ITEM)]
::
+$  ITEM
  $~  [%ERROR ~]
  $%  [%COLLECTION COL=COLLECTION]
      [%RAW RAW=RAW-ITEM]
      [%BOTH COL=COLLECTION RAW=RAW-ITEM]
      [%ERROR ~]
  ==
::
+$  RAW-ITEM
  $%  [%UDON META=(MAP KNOT CORD) DATA=@T]
  ==
::
+$  CONFIG
  $:  FULL-PATH=BEAM
      NAME=@T
      DESCRIPTION=@T
    ::
      AUTHOR=@P
    ::
      DATE-CREATED=@DA
      LAST-MODIFIED=@DA
    ::
      TYPE=@TAS
      COMMENTS=?
      SORT-KEY=(UNIT @)
      VISIBLE=?
    ::
  ==
::
+$  ACTION
  $:  WHO=SHIP
      DEK=DESK
      ACTS=(LIST SUB-ACTION)
  ==
::
+$  SUB-ACTION
  $%  [%WRITE PAX=PATH FOR=FORM]
      [%DELETE PAX=PATH]
      [%PERMS PAX=PATH R=RULE:CLAY W=RULE:CLAY]
    ::
      [%COLLECTION PAX=PATH NAME=@T DESC=@T COMMENTS=? VISIBLE=? TYPE=@TAS]
      [%POST PAX=PATH NAME=@T TYPE=@TAS COMMENTS=? CONTENT=@T EDIT=?]
      [%COMMENT PAX=PATH CONTENT=@T]
  ==
::
+$  FORM
  $%  [%UDON @T]
      [%COLLECTIONS-CONFIG CONFIG]
  ==
::
++  COLLECTION-ERROR
  ~/  %COLL-COLLECTION-ERROR
  |=  COL=COLLECTION
  ^-  ?
  |-
  =/  VALS=(LIST ITEM)  ~(VAL BY DATA.COL)
  %+  ROLL  VALS
  |=  [I=ITEM OUT=_|]
  ^-  ?
  ?:  OUT  OUT
  ?+  -.I
    %.N
    %ERROR       %.Y
    %COLLECTION  ^$(COL COL.I)
    %BOTH        ^$(COL COL.I)
  ==
::::
::::  /MAR/SNIP
::::
++  WORDS  1
++  HEDTAL
  =|  MET/MARL
  |=  A/MARL  ^-  {HED/MARL TAL/MARL}
  ?~  A  [~ ~]
  :: LOOKS LIKE IT ONLY TERMINATES IF IT FINDS AN H1?
  ?.  ?=($H1 N.G.I.A)
    ?:  ?=($META N.G.I.A)
      $(A T.A, MET [I.A MET])
    =+  HAD=$(A C.I.A)
    ?^  -.HAD  HAD
    $(A T.A)
  [C.I.A (WELD (FLOP MET) (LIMIT WORDS T.A))]
  ::
::
++  LIMIT
  ~/  %COLL-LIMIT
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
  ~/  %COLL-DEWORD
  |=  {LIM/@U TAY/TAPE}  ^-  {LIM/@U TAY/TAPE}
  ?~  TAY  [LIM TAY]
  ?~  LIM  [0 ~]
  =+  WER=(DOT 1^1 TAY)
  ?~  Q.WER
    [LIM - TAY]:[I.TAY $(TAY T.TAY)]
  =+  NEX=$(LIM (DEC LIM), TAY Q.Q.U.Q.WER)
  [-.NEX [(WONK WER) +.NEX]]
::
::  JSON
::
++  ITEM-TO-JSON
  ~/  %COLL-ITEM-TO-JSON
  |=  ITM=ITEM
  ^-  JSON
  ?-    -.ITM
      %ERROR  (FROND:ENJS:FORMAT %ERROR ~)
  ::
      %COLLECTION
    %+  FROND:ENJS:FORMAT
    %COLLECTION  (COLLECTION-TO-JSON COL.ITM)
  ::
      %RAW
    %-  FROND:ENJS:FORMAT
    [%ITEM (RAW-TO-JSON RAW.ITM)]
  ::
      %BOTH
    %-  PAIRS:ENJS:FORMAT
    :~  [%ITEM (RAW-TO-JSON RAW.ITM)]
        [%COLLECTION (COLLECTION-TO-JSON COL.ITM)]
    ==
  ==
::
++  COLLECTION-TO-JSON
  ~/  %COLL-COLLECTION-TO-JSON
  |=  COL=COLLECTION
  ^-  JSON
  %-  PAIRS:ENJS:FORMAT
  :~  [%META (CONFIG-TO-JSON META.COL)]
      :+  %DATA  %A
      %+  TURN  ~(TAP BY DATA.COL)
      |=  [NOM=KNOT ITE=ITEM]
      ^-  JSON
      %-  PAIRS:ENJS:FORMAT
      :~  [%FILENAME %S NOM]
          [%ITEM (ITEM-TO-JSON ITE)]
      ==
  ==
::
++  RAW-TO-JSON
  ~/  %COLL-RAW-TO-JSON
  |=  RAW=RAW-ITEM
  ^-  JSON
  =/  ELM=MANX  ELM:(STATIC:CRAM (REAM DATA.RAW))
  =/  REC=JSON  (ELEM-TO-REACT-JSON ELM)
  %-  PAIRS:ENJS:FORMAT
  :~  [%DATA REC]
      [%META (META-TO-JSON META.RAW)]
  ==
::
++  CONFIG-TO-JSON
  ~/  %COLL-CONFIG-TO-JSON
  |=  CON=CONFIG
  ^-  JSON
  ?:  =(CON *CONFIG)
    ~
  %-  PAIRS:ENJS:FORMAT
  :~  :-  %FULL-PATH
        :-  %A
        %+  TURN  (EN-BEAM:FORMAT FULL-PATH.CON)
        |=  A=@TA
        [%S A]
      :-  %NAME           [%S NAME.CON]
      :-  %DESC           [%S DESCRIPTION.CON]
      :-  %AUTHOR          (SHIP:ENJS:FORMAT AUTHOR.CON)
      :-  %DATE-CREATED   (TIME:ENJS:FORMAT DATE-CREATED.CON)
      :-  %LAST-MODIFIED  (TIME:ENJS:FORMAT LAST-MODIFIED.CON)
      :-  %TYPE           [%S TYPE.CON]
      :-  %COMMENTS       [%B COMMENTS.CON]
      :-  %SORT-KEY       ?~(SORT-KEY.CON ~ (NUMB:ENJS:FORMAT U.SORT-KEY.CON))
      :-  %VISIBLE        [%B VISIBLE.CON]
  ==
::
++  META-TO-JSON
  ~/  %COLL-META-TO-JSON
  |=  META=(MAP KNOT CORD)
  ^-  JSON
  %-  PAIRS:ENJS:FORMAT
  %+  TURN  ~(TAP BY META)
  |=  [KEY=@T VAL=@T]
  ^-  [@T JSON]
  [KEY [%S VAL]]
::
++  UDON-TO-FRONT
  ~/  %COLL-UDON-TO-FRONT
  |=  U=@T
  ^-  (MAP KNOT CORD)
  %-  ~(RUN BY INF:(STATIC:CRAM (REAM U)))
  |=  A=DIME  ^-  CORD
  ?+  (END 3 1 P.A)  (SCOT A)
    %T  Q.A
  ==
::
::  +PATH-TO-CIRCLE:
::
::    TAKES A CLAY PATH AND RETURNS A HALL CIRCLE
::    FOR A PATH /FOO/BAR IT RETURNS A CIRCLE WITH A :NAME %C-FOO-BAR
::
++  PATH-TO-CIRCLE
  ~/  %COLL-PATH-TO-CIRCLE
  |=  [PAX=PATH OUR=@P]
  ^-  CIRCLE:HALL
  =.  PAX
    ?:  ?=([%WEB %COLLECTIONS *] PAX)
      (WELD /C (SLAG 2 `PATH`PAX))
    ?:  ?=([%COLLECTIONS *] PAX)
      (WELD /C (SLAG 1 `PATH`PAX))
    ?:  ?=([%C *] PAX)
      `PATH`PAX
    `PATH`(WELD /C PAX)
  =/  NAM=TERM
  %+  ROLL  `(LIST @TA)`PAX
  |=  [SEG=@TA OUT=TERM]
  %^  CAT  3
    ?:(=(%$ OUT) OUT (CAT 3 OUT '-'))
    ((HARD @TAS) SEG)
  [OUR NAM]
::
::  +ALLOWED-BY: CHECKS IF SHIP :WHO IS ALLOWED BY THE PERMISSION RULES IN :DIC
::
++  ALLOWED-BY
  ~/  %COLL-ALLOWED-BY
  |=  [WHO=@P DIC=DICT:CLAY OUR=@P]
  ^-  ?
  ?:  =(WHO OUR)  &
  =/  IN-LIST=?
    ?|  (~(HAS IN P.WHO.RUL.DIC) WHO)
      ::
        %-  ~(REP BY Q.WHO.RUL.DIC)
        |=  [[@TA CRU=CREW:CLAY] OUT=_|]
        ?:  OUT  &
        (~(HAS IN CRU) WHO)
    ==
  ?:  =(%BLACK MOD.RUL.DIC)
    !IN-LIST
  IN-LIST
::
::  +COLLECTION-NOTIFY: XX
::
++  COLLECTION-NOTIFY
  ~/  %COLL-COLLECTION-NOTIFY
  |=  [PAX=PATH CONF=CONFIG]
  ^-  JSON
  %-  PAIRS:ENJS:FORMAT
  :~  ['AUTHOR' [%S (CRIP (SCOW %P AUTHOR.CONF))]]
      ['HOST' [%S (CRIP (SCOW %P P.FULL-PATH.CONF))]]
      ['PATH' [%A (TURN PAX |=(A=@TA `JSON`[%S A]))]]
      ['NAME' [%S NAME.CONF]]
      ['DATE' [%S (CRIP (SCOW %DA LAST-MODIFIED.CONF))]]
      ['TYPE' [%S TYPE.CONF]]
  ==
::
::  +ITEM-NOTIFY: XX
::
++  ITEM-NOTIFY
  ~/  %COLL-ITEM-NOTIFY
  |=  [PAX=PATH RAW=RAW-ITEM NOW=@DA BYK=BEAK]
  ^-  JSON
  =/  AUTHOR  (FALL (~(GET BY META.RAW) %AUTHOR) ~.ANON)
  =/  HOST  (FALL (~(GET BY META.RAW) %HOST) ~.ANON)
  =/  DAT    (FALL (~(GET BY META.RAW) %LAST-MODIFIED) (SCOT %DA NOW))
  =/  NOM    (FALL (~(GET BY META.RAW) %NAME) ~.NO-TITLE)
  =/  TYP    (FALL (~(GET BY META.RAW) %TYPE) ~.NO-TYPE)
  ::
  =/  ELM=MANX   ELM:(STATIC:CRAM (REAM DATA.RAW))
  =/  SNIP=MARL  TAL:(HEDTAL +.ELM)
  =/  INNER
    ?~  SNIP
      (CRIP (EN-XML:HTML ELM))
    (CRIP (EN-XML:HTML I.SNIP))    :: INNER HTML
  ::
  =/  PARENT-SPUR  (SLAG 1 (FLOP PAX))
  =/  BEK=BEAK     BYK(R [%DA NOW])
  =/  PARENT-PATH  (EN-BEAM:FORMAT [BEK PARENT-SPUR])
  =/  PARENT-DIR   .^(ARCH %CY PARENT-PATH)
  ::
  =/  PARENT-CONF=JSON
    ?:  (~(HAS IN DIR.PARENT-DIR) ~.UDON ~)
      %-  META-TO-JSON
      %-  UDON-TO-FRONT
      .^(@T %CX (WELD PARENT-PATH /UDON))
    ?:  (~(HAS IN DIR.PARENT-DIR) ~.COLLECTIONS-CONFIG ~)
      %-  CONFIG-TO-JSON
      .^(CONFIG %CX (WELD PARENT-PATH /COLLECTIONS-CONFIG))
    ~
  ::
  %-  PAIRS:ENJS:FORMAT
  :~  ['AUTHOR' [%S AUTHOR]]
      ['HOST' [%S HOST]]
      ['PATH' [%A (TURN PAX |=(A=@TA `JSON`[%S A]))]]
      ['NAME' [%S NOM]]
      ['DATE' [%S DAT]]
      ['TYPE' [%S TYP]]
      ['CONTENT' [%S DATA.RAW]]
      ['SNIP' [%S INNER]]
      ['PARENT-CONFIG' PARENT-CONF]
  ==
::
::  +FRONT-TO-WAIN: XX
::
++  FRONT-TO-WAIN
  ~/  %COLL-FRONT-TO-WAIN
  |=  A=(MAP KNOT CORD)
  ^-  WAIN
  =/  ENTRIES=WAIN
    %+  TURN  ~(TAP BY A)
    |=  B=[KNOT CORD]
    =/  C=[TERM CORD]  ((HARD ,[TERM CORD]) B)
    (CRIP "  [{<-.C>} {<+.C>}]")
  ::
  ?~  ENTRIES  ~
  ;:  WELD
    [':-  :~' ~]
    ENTRIES
    ['    ==' ~]
  ==
::
::  +UPDATE-UDON-FRONT: XX
::
++  UPDATE-UDON-FRONT
  ~/  %COLL-UPDATE-UDON-FRONT
  |=  [FRO=(MAP KNOT CORD) UDON=@T]
  ^-  @T
  %-  OF-WAIN:FORMAT
  =/  TUM  (TRIP UDON)
  =/  ID  (FIND ";>" TUM)
  ?~  ID
    %+  WELD  (FRONT-TO-WAIN FRO)
    (TO-WAIN:FORMAT (CRIP (WELD ";>\0A" TUM)))
  %+  WELD  (FRONT-TO-WAIN FRO)
  (TO-WAIN:FORMAT (CRIP (SLAG U.ID TUM)))
::
::  _TA: MAIN EVENT CORE FOR COLLECTIONS
::
++  TA
  ~/  %COLL-TA
  |_  $:  MOVES=(LIST MOVE)
          BOL=BOWL:GALL
      ==
  ::
  ::  +TA-THIS: TA CORE SUBJECT
  ::
  ++  TA-THIS  .
  ::
  ::  +TA-DONE:
  ::
  ::    FLOP :MOVES FOR FINALIZATION, SINCE MOVES ARE PREPENDED TO THE LIST
  ::
  ++  TA-DONE  (FLOP MOVES)
  ::
  ::  +TA-EMIT: ADD A +MOVE TO :MOVES
  ::
  ++  TA-EMIT
    ~/  %COLL-TA-EMIT
    |=  MOV=MOVE
    %_  TA-THIS
      MOVES  [MOV MOVES]
    ==
  ::
  ::  +TA-EMIL: ADD A LIST OF +MOVE TO :MOVES
  ::
  ++  TA-EMIL
    ~/  %COLL-TA-EMIL
    |=  MOS=(LIST MOVE)
    %_  TA-THIS
      MOVES  (WELP (FLOP MOS) MOVES)
    ==
  ::
  ::  +TA-ACT: PROCESS COLLECTION-ACTION
  ::
  ++  TA-ACT
    ~/  %COLL-TA-ACT
    |=  ACT=ACTION
    ^+  TA-THIS
    ::
    ::  ITERATE THROUGH LIST OF +SUB-ACTION OF +ACTION
    ::
    |-
    ?~  ACTS.ACT  TA-THIS
    =*  A  I.ACTS.ACT
    ::
    =/  NOW-ID=@DA  (SUB NOW.BOL (DIV (DIS NOW.BOL ~S0..FFFE) 2))
    =/  DAT  (SCOT %DA NOW-ID)
    =/  BEK=BEAK  BYK.BOL(R [%DA NOW-ID])
    =/  SAP  (EN-BEAM:FORMAT [BEK (FLOP (PATH +<.A))])
    ::
    =.  TA-THIS
    ?-    -.A
        %WRITE
      =/  PERMS  .^([DICT:CLAY DICT:CLAY] %CP SAP)
      ?:  (ALLOWED-BY SRC.BOL +.PERMS OUR.BOL)
        ?-  -.FOR.A
          %UDON                (TA-WRITE PAX.A `CAGE`[-.FOR.A !>(+.FOR.A)])
          %COLLECTIONS-CONFIG  (TA-WRITE PAX.A `CAGE`[-.FOR.A !>(+.FOR.A)])
        ==
      TA-THIS
    ::
        %DELETE
      =/  PERMS  .^([DICT:CLAY DICT:CLAY] %CP SAP)
      ?:  (ALLOWED-BY SRC.BOL +.PERMS OUR.BOL)
        (TA-REMOVE PAX.A)
      TA-THIS
    ::
        %PERMS
      ?:  =(SRC.BOL OUR.BOL)  :: XX ADMIN PRIVILEGES FOR OTHER USERS?
        (TA-SET-PERMISSIONS PAX.A R.A W.A)
      TA-THIS
    ::
    ::
    ::  XX SOME OF THIS IS REDUNANT
    ::
        %COLLECTION
      =/  PERMS
        .^([DICT:CLAY DICT:CLAY] %CP (WELD SAP /[DAT]/COLLECTIONS-CONFIG))
      ?.  (ALLOWED-BY SRC.BOL +.PERMS OUR.BOL)
        TA-THIS
      =/  CONF=CONFIG
        :*  [BEK (FLOP (WELD PAX.A /[DAT]/COLLECTIONS-CONFIG))]
            NAME.A
            DESC.A
            OUR.BOL
            NOW-ID
            NOW-ID
            TYPE.A
            COMMENTS.A
            ~
            VISIBLE.A
        ==
      =.  TA-THIS
        %+  TA-WRITE  (WELD PAX.A /[DAT]/COLLECTIONS-CONFIG)
        [%COLLECTIONS-CONFIG !>(CONF)]
      ::  RESTRICT PERMISSIONS ON CONFIG FILE
      =.  TA-THIS
        %^  TA-SET-PERMISSIONS  (WELD PAX.A /[DAT]/COLLECTIONS-CONFIG)
        [%WHITE ((SET WHOM:CLAY) [[& SRC.BOL] ~ ~])]   ::  READ
        [%WHITE ((SET WHOM:CLAY) [[& SRC.BOL] ~ ~])]   ::  WRITE
      ::  OPEN PERMISSIONS ON COLLECTION ITEMS
      =.  TA-THIS
        %^  TA-SET-PERMISSIONS  (WELD PAX.A /[DAT])
        [%BLACK ((SET WHOM:CLAY) ~)]                   ::  READ
        [%BLACK ((SET WHOM:CLAY) ~)]                   ::  WRITE
      TA-THIS
    ::
        %POST
      =?  PAX.A  !EDIT.A
        (WELD PAX.A /[DAT])
      =?  SAP  !EDIT.A
        (EN-BEAM:FORMAT [BEK (FLOP PAX.A)])
      =/  PERMS  .^([DICT:CLAY DICT:CLAY] %CP (WELD SAP /UDON))
      ?.  (ALLOWED-BY SRC.BOL +.PERMS OUR.BOL)
        TA-THIS
      =.  CONTENT.A  (CRIP (WELD (TRIP CONTENT.A) "\0A"))
      =/  FRONT=(MAP KNOT CORD)
        %-  MY
        :~  [%NAME NAME.A]
            [%COMMENTS ?:(COMMENTS.A ~..Y ~..N)]
            [%AUTHOR (SCOT %P SRC.BOL)]
            [%HOST (SCOT %P OUR.BOL)]
            [%DATE-CREATED (SNAG 0 (FLOP PAX.A))]
            [%LAST-MODIFIED DAT]
            [%TYPE TYPE.A]
        ==
      =.  TA-THIS
        %+  TA-WRITE  (WELD PAX.A /UDON)
        [%UDON !>((UPDATE-UDON-FRONT FRONT CONTENT.A))]
      ::  RESTRICT PERMISSIONS ON UDON FILE
      =.  TA-THIS
        %^  TA-SET-PERMISSIONS  (WELD PAX.A /UDON)
        [%BLACK ((SET WHOM:CLAY) ~)]                   ::  READ
        [%WHITE ((SET WHOM:CLAY) [[& SRC.BOL] ~ ~])]   ::  WRITE
      ::  OPEN PERMISSIONS ON COMMENTS
      =.  TA-THIS
        %^  TA-SET-PERMISSIONS  PAX.A
        [%BLACK ((SET WHOM:CLAY) ~)]                   ::  READ
        [%BLACK ((SET WHOM:CLAY) ~)]                   ::  WRITE
      TA-THIS
    ::
        %COMMENT
      =/  PERMS  .^([DICT:CLAY DICT:CLAY] %CP (WELD SAP /[DAT]/UDON))
      ?.  (ALLOWED-BY SRC.BOL +.PERMS OUR.BOL)
        TA-THIS
      =.  CONTENT.A  (CRIP (WELD (TRIP CONTENT.A) "\0A"))
      =/  FRONT=(MAP KNOT CORD)
        %-  MY
        :~  [%AUTHOR (SCOT %P SRC.BOL)]
            [%HOST (SCOT %P OUR.BOL)]
            [%DATE-CREATED DAT]
            [%LAST-MODIFIED DAT]
            [%TYPE %COMMENTS]
        ==
      =.  TA-THIS
        %+  TA-WRITE  (WELD PAX.A /[DAT]/UDON)
        [%UDON !>((UPDATE-UDON-FRONT FRONT CONTENT.A))]
      ::  RESTRICT PERMISSIONS ON UDON FILE
      =.  TA-THIS
        %^  TA-SET-PERMISSIONS  (WELD PAX.A /[DAT]/UDON)
        [%BLACK ((SET WHOM:CLAY) ~)]                   ::  READ
        [%WHITE ((SET WHOM:CLAY) [[& SRC.BOL] ~ ~])]   ::  WRITE
      TA-THIS
    ::
    ==
    $(ACTS.ACT T.ACTS.ACT)
  ::
  ::  +TA-UPDATE:
  ::
  ::
  ::
  ++  TA-UPDATE
    ~/  %COLL-TA-UPDATE
    |=  [OLD=COLLECTION NEW=COLLECTION]
    ^+  TA-THIS
    ?:  =(OLD NEW)
      TA-THIS
    (TA-UPDATE-COLLECTION OLD NEW /WEB/COLLECTIONS)
  ::
  ++  TA-INSERT-ITEM
    ~/  %COLL-TA-INSERT-ITEM
    |=  [NEW=ITEM PAX=PATH]
    ^+  TA-THIS
    =/  PARENT-PATH  (SCAG (DEC (LENT PAX)) PAX)
    ::
    ?-    -.NEW
    ::
        %ERROR
      (TA-HALL-LIN PARENT-PATH 'ERROR')
    ::
        %COLLECTION
      =.  TA-THIS
        %^  TA-HALL-JSON  PARENT-PATH  'NEW COLLECTION'
        (COLLECTION-NOTIFY PAX META.COL.NEW)
      ::
      =.  TA-THIS  (TA-HALL-CREATE-CIRCLE PAX NAME.META.COL.NEW)
      =/  ITEMS=(LIST [NOM=@TA =ITEM])  ~(TAP BY DATA.COL.NEW)
      |-
      ?~  ITEMS  TA-THIS
      =.  TA-THIS  (TA-INSERT-ITEM ITEM.I.ITEMS (WELD PAX [NOM.I.ITEMS ~]))
      $(ITEMS T.ITEMS)
    ::
        %BOTH
      =.  TA-THIS  (TA-HALL-CREATE-CIRCLE PAX NAME.META.COL.NEW)
      =/  ITEMS=(LIST [NOM=@TA =ITEM])  ~(TAP BY DATA.COL.NEW)
      =.  TA-THIS
      |-
      ?~  ITEMS  TA-THIS
      =.  TA-THIS  (TA-INSERT-ITEM ITEM.I.ITEMS (WELD PAX [NOM.I.ITEMS ~]))
      $(ITEMS T.ITEMS)
      ::
      TA-THIS
    ::
        %RAW
      =.  TA-THIS
        %^  TA-HALL-JSON
          PARENT-PATH
          'NEW ITEM'
          (ITEM-NOTIFY PAX RAW.NEW NOW.BOL BYK.BOL)
      ?:  ?&  (~(HAS BY META.RAW.NEW) %COMMENTS)
              =('.Y' (~(GOT BY META.RAW.NEW) %COMMENTS))
          ==
        =/  AUTHOR=(UNIT @TA)  (~(GET BY META.RAW.NEW) %AUTHOR)
        =/  AUTHOR-P=@P
          ?~  AUTHOR  OUR.BOL
          (FALL (RUSH U.AUTHOR ;~(PFIX SIG FED:AG)) OUR.BOL)
        (TA-GENERATE-COMMENTS PAX AUTHOR-P)
      TA-THIS
    ::
    ==
  ::
  ++  TA-REMOVE-ITEM
    ~/  %COLL-TA-REMOVE-ITEM
    |=  [OLD=ITEM PAX=PATH]
    ^+  TA-THIS
    ::  FLUSH PERMISSIONS
    ::  NOTIFY PARENT OF DELETION
    =/  PARENT  (SCAG (DEC (LENT PAX)) PAX)
    ::  RECURSE FOR CHILDREN
    ?-    -.OLD
    ::
        %ERROR
      (TA-HALL-LIN PARENT 'ERROR')
    ::
        %COLLECTION
      =.  TA-THIS
        %^  TA-HALL-JSON  PARENT  'DELETED COLLECTION'
        (COLLECTION-NOTIFY PAX META.COL.OLD)
      =.  TA-THIS  (TA-FLUSH-PERMISSIONS (WELD PAX /COLLECTIONS-CONFIG))
      =/  ITEMS=(LIST [NOM=@TA =ITEM])  ~(TAP BY DATA.COL.OLD)
      |-
      ?~  ITEMS  TA-THIS
      =.  TA-THIS  (TA-REMOVE-ITEM ITEM.I.ITEMS (WELD PAX [NOM.I.ITEMS ~]))
      $(ITEMS T.ITEMS)
    ::
        %BOTH
      =.  TA-THIS  (TA-FLUSH-PERMISSIONS PAX)
      =.  TA-THIS  (TA-FLUSH-PERMISSIONS (WELD PAX /COLLECTIONS-CONFIG))
      =/  ITEMS=(LIST [NOM=@TA =ITEM])  ~(TAP BY DATA.COL.OLD)
      |-
      ?~  ITEMS  TA-THIS
      =.  TA-THIS  (TA-REMOVE-ITEM ITEM.I.ITEMS (WELD PAX [NOM.I.ITEMS ~]))
      $(ITEMS T.ITEMS)
    ::
        %RAW
      =.  TA-THIS  (TA-FLUSH-PERMISSIONS PAX)
      %^  TA-HALL-JSON
        PARENT
        'DELETED ITEM'
        (ITEM-NOTIFY PAX RAW.OLD NOW.BOL BYK.BOL)
    ::
    ==
  ::
  ::
  ::
  ++  TA-UPDATE-ITEM
    ::  ALWAYS MAKE SURE REMOVALS HAPPEN FIRST AND INSERTIONS HAPPEN LAST
    ::  BECAUSE REMOVALS FLUSH PERMISSIONS AND INSERTIONS SET THEM
    ::
    ~/  %COLL-TA-UPDATE-ITEM
    |=  [OLD=ITEM NEW=ITEM PAX=PATH]
    ^+  TA-THIS
    ?:  =(OLD NEW)
      TA-THIS
    ::
    ::  CHECK FOR CHANGES IN ITEM TYPE
    ?:  &(?=(%COLLECTION -.OLD) ?=(%COLLECTION -.NEW))
      (TA-UPDATE-COLLECTION COL.OLD COL.NEW PAX)
    ?:  &(?=(%RAW -.OLD) ?=(%RAW -.NEW))
      (TA-UPDATE-RAW-ITEM RAW.OLD RAW.NEW PAX)
    ?:  &(?=(%BOTH -.OLD) ?=(%BOTH -.NEW))
      ::  UPDATE RAW ITEM
      =.  TA-THIS  (TA-UPDATE-COLLECTION COL.OLD COL.NEW PAX)
      (TA-UPDATE-RAW-ITEM RAW.OLD RAW.NEW PAX)
    ::
    ?:  &(?=(%COLLECTION -.OLD) ?=(%RAW -.NEW))
      :: REMOVE COLLECTION
      :: INSERT RAW ITEM
      =.  TA-THIS  (TA-REMOVE-ITEM OLD PAX)
      (TA-INSERT-ITEM NEW PAX)
    ::
    ?:  &(?=(%COLLECTION -.OLD) ?=(%BOTH -.NEW))
      ::  INSERT RAW ITEM
      ::  UPDATE-COLLECTION
      =.  TA-THIS  (TA-UPDATE-COLLECTION COL.OLD COL.NEW PAX)
      (TA-INSERT-ITEM NEW PAX)
    ::
    ?:  &(?=(%RAW -.OLD) ?=(%COLLECTION -.NEW))
      :: REMOVE RAW ITEM
      :: INSERT COLLECTION
      =.  TA-THIS  (TA-REMOVE-ITEM OLD PAX)
      (TA-INSERT-ITEM NEW PAX)
    ::
    ?:  &(?=(%RAW -.OLD) ?=(%BOTH -.NEW))
      ::  INSERT COLLECTION
      ::  UPDATE RAW ITEM
      =.  TA-THIS  (TA-UPDATE-RAW-ITEM RAW.OLD RAW.NEW PAX)
      (TA-INSERT-ITEM NEW PAX)
    ::
    ?:  &(?=(%BOTH -.OLD) ?=(%RAW -.NEW))
      ::  REMOVE COLLECTION
      ::  UPDATE RAW ITEM
      =.  TA-THIS  (TA-REMOVE-ITEM [%COLLECTION COL.OLD] PAX)
      (TA-UPDATE-RAW-ITEM RAW.OLD RAW.NEW PAX)
    ::
    ?:  &(?=(%BOTH -.OLD) ?=(%COLLECTION -.NEW))
      ::  REMOVE RAW ITEM
      ::  UPDATE COLLECTION
      =.  TA-THIS  (TA-REMOVE-ITEM [%RAW RAW.OLD] PAX)
      (TA-UPDATE-COLLECTION COL.OLD COL.NEW PAX)
    ::
    ::
    ?:  &(?=(%ERROR -.OLD) ?=(%ERROR -.NEW))
      TA-THIS
    ?:  &(?=(%ERROR -.OLD) ?=(%COLLECTION -.NEW))
      (TA-INSERT-ITEM NEW PAX)
    ?:  &(?=(%ERROR -.OLD) ?=(%RAW -.NEW))
      (TA-INSERT-ITEM NEW PAX)
    ?:  &(?=(%ERROR -.OLD) ?=(%BOTH -.NEW))
      (TA-INSERT-ITEM NEW PAX)
    ?:  ?=(%ERROR -.NEW)
      (TA-HALL-LIN PAX 'ERROR')
    ::
    TA-THIS
  ::
  ++  TA-UPDATE-RAW-ITEM
    ~/  %COLL-TA-UPDATE-RAW-ITEM
    |=  [OLD=RAW-ITEM NEW=RAW-ITEM PAX=PATH]
    ^+  TA-THIS
    ?:  =(OLD NEW)
      TA-THIS
    ::
    =?  TA-THIS  !=(DATA.OLD DATA.NEW)
      =/  PARENT-PATH  (SCAG (DEC (LENT PAX)) PAX)
      %^  TA-HALL-JSON
        PARENT-PATH
        'EDITED ITEM'
        (ITEM-NOTIFY PAX NEW NOW.BOL BYK.BOL)
    ::
    =?  TA-THIS
      ?&  =('.Y' (FALL (~(GET BY META.NEW) %COMMENTS) '.N'))
          =('.N' (FALL (~(GET BY META.OLD) %COMMENTS) '.N'))
      ==
      =/  AUTHOR=(UNIT @TA)  (~(GET BY META.NEW) %AUTHOR)
      =/  AUTHOR-P=@P
        ?~  AUTHOR  OUR.BOL
        (FALL (RUSH U.AUTHOR ;~(PFIX SIG FED:AG)) OUR.BOL)
      (TA-GENERATE-COMMENTS PAX AUTHOR-P)
    ::
    =?  TA-THIS
      ?&  =('.N' (FALL (~(GET BY META.NEW) %COMMENTS) '.N'))
          =('.Y' (FALL (~(GET BY META.OLD) %COMMENTS) '.N'))
      ==
      ::  DELETE COMMENTS
      (TA-REMOVE (WELD PAX /COLLECTIONS-CONFIG))
    ::
    TA-THIS
  ::
  ++  TA-UPDATE-COLLECTION
    ~/  %COLL-TA-UPDATE-COLLECTION
    |=  $:  OLD=COLLECTION
            NEW=COLLECTION
            PAX=PATH
        ==
    ^+  TA-THIS
    ::
    =?  TA-THIS  !=(META.OLD META.NEW)
      =/  PARENT-PATH  (SCAG (DEC (LENT PAX)) PAX)
      %^  TA-HALL-JSON  PARENT-PATH  'EDITED COLLECTION'
      (COLLECTION-NOTIFY PAX META.NEW)
    ::
    ?:  =(DATA.OLD DATA.NEW)
      TA-THIS
    ::
    ::  NEW VALUES OF ALL CHANGED ITEMS
    =/  UPD-NEW  (~(DIF IN (~(INT BY DATA.OLD) DATA.NEW)) DATA.OLD)
    ::  OLD VALUES OF ALL CHANGED ITEMS
    =/  UPD-OLD  (~(DIF IN (~(INT BY DATA.NEW) DATA.OLD)) DATA.NEW)
    ::  ALL TOTALLY NEW ENTRIES
    =/  INS-NEW  (~(DIF BY DATA.NEW) DATA.OLD)
    ::  ALL DELETED ENTRIES
    =/  DEL-OLD  (~(DIF BY DATA.OLD) DATA.NEW)
    ::
    =/  UPD-NEW=(LIST [NOM=KNOT =ITEM])  ~(TAP BY UPD-NEW)
    =/  UPD-OLD=(LIST [NOM=KNOT =ITEM])  ~(TAP BY UPD-OLD)
    =/  INS-NEW=(LIST [NOM=KNOT =ITEM])  ~(TAP BY INS-NEW)
    =/  DEL-OLD=(LIST [NOM=KNOT =ITEM])  ~(TAP BY DEL-OLD)
    ::
    =/  LAM  |=([[A=KNOT ITEM] OUT=(LIST PATH)] [(WELD PAX [A ~]) OUT])
    ::
    =.  TA-THIS  |-
    ?~  UPD-NEW
      TA-THIS
    ?<  ?=(~ UPD-OLD)
    =*  NEW-ITEM  I.UPD-NEW
    =*  OLD-ITEM  I.UPD-OLD
    =/  NEW-PAX  (WELD PAX [NOM.NEW-ITEM ~])
    =.  TA-THIS  (TA-UPDATE-ITEM ITEM.OLD-ITEM ITEM.NEW-ITEM NEW-PAX)
    ::
    %=  $
      UPD-NEW  T.UPD-NEW
      UPD-OLD  T.UPD-OLD
    ==
    ::
    =.  TA-THIS  |-
    ?~  INS-NEW
      TA-THIS
    =*  NEW-ITEM  I.INS-NEW
    =/  NEW-PAX  (WELD PAX [NOM.NEW-ITEM ~])
    =.  TA-THIS  (TA-INSERT-ITEM +.NEW-ITEM (WELD PAX [-.NEW-ITEM ~]))
    $(INS-NEW T.INS-NEW)
    ::
    =.  TA-THIS  |-
    ?~  DEL-OLD
      TA-THIS
    =*  OLD-ITEM  I.DEL-OLD
    =/  OLD-PAX  (WELD PAX [NOM.OLD-ITEM ~])
    =.  TA-THIS  (TA-REMOVE-ITEM +.OLD-ITEM (WELD PAX [-.OLD-ITEM ~]))
    $(DEL-OLD T.DEL-OLD)
    ::
    TA-THIS
  ::
  ++  TA-GENERATE-COMMENTS
    ~/  %COLL-TA-GENERATE-COMMENTS
    |=  [PAX=PATH AUTHOR=SHIP]
    ^+  TA-THIS
    =/  SUP=PATH  [%COLLECTIONS-CONFIG (FLOP PAX)]
    =/  BEK  BYK.BOL(R [%DA NOW.BOL])
    =/  PAT  (EN-BEAM:FORMAT [BEK SUP])
    =/  DAT=@DA  (SLAV %DA (SNAG 0 (FLOP PAX)))
    =/  CAY=CONFIG
      :*  [BEK SUP]
          'COMMENTS'
          'COMMENTS'
          AUTHOR
          DAT
          DAT
          %COMMENTS
          |
          ~
          |
      ==
    (TA-WRITE (FLOP SUP) %COLLECTIONS-CONFIG !>(CAY))
  ::
  ::  WRITING FILES
  ::
  ++  TA-WRITE
    ~/  %COLL-TA-WRITE
    =,  SPACE:USERLIB
    |=  [PAX=PATH CAY=CAGE]
    ^+  TA-THIS
    =/  BEK  BYK.BOL(R [%DA NOW.BOL])
    =.  PAX  (EN-BEAM:FORMAT BEK (FLOP PAX))
    %+  TA-EMIT  OST.BOL
    [%INFO (WELD /TA-WRITE PAX) (FOAL PAX CAY)]
  ::
  ++  TA-REMOVE
    =,  SPACE:USERLIB
    ~/  %COLL-TA-REMOVE
    |=  PAX=PATH
    =/  BEK  BYK.BOL(R [%DA NOW.BOL])
    =.  PAX  (EN-BEAM:FORMAT BEK (FLOP PAX))
    ^+  TA-THIS
    %+  TA-EMIT  OST.BOL
    [%INFO (WELD /TA-REMOVE PAX) (FRAY PAX)]
  ::
  ::  PERMISSIONS
  ::
  ++  TA-SET-PERMISSIONS
    ~/  %COLL-TA-SET-PERMISSIONS
    |=  [PAX=PATH R=RULE:CLAY W=RULE:CLAY]
    ^+  TA-THIS
    %+  TA-EMIT  OST.BOL
    [%PERM (WELD /PERMS PAX) Q.BYK.BOL PAX [%RW `R `W]]
  ::
  ++  TA-FLUSH-PERMISSIONS
    ~/  %COLL-TA-FLUSH-PERMISSIONS
    |=  PAX=PATH
    ^+  TA-THIS
    %+  TA-EMIT  OST.BOL
    [%PERM (WELD /PERMS PAX) Q.BYK.BOL PAX [%RW ~ ~]]
  ::
  ::  HALL
  ::
  ++  TA-HALL-ACTION
    ~/  %COLL-TA-HALL-ACTION
    |=  ACT=ACTION:HALL
    ^+  TA-THIS
    %+  TA-EMIT  OST.BOL
    [%POKE /COL-HALL-ACTION [OUR.BOL %HALL] %HALL-ACTION ACT]
  ::
  ++  TA-HALL-ACTIONS
    ~/  %COLL-TA-HALL-ACTIONS
    |=  ACT=(LIST $?(~ ACTION:HALL))
    ^+  TA-THIS
    ?~  ACT  TA-THIS
    ?~  I.ACT  $(ACT T.ACT)
    %=  $
      TA-THIS  (TA-HALL-ACTION I.ACT)
      ACT  T.ACT
    ==
  ::
  ++  TA-HALL-CREATE-CIRCLE
    ~/  %COLL-TA-HALL-CREATE-CIRCLE
    |=  [PAX=PATH NAME=@T]
    ^+  TA-THIS
    =/  CIRC=CIRCLE:HALL  (PATH-TO-CIRCLE PAX OUR.BOL)
    =/  PARENT=CIRCLE:HALL
      ?:  =(NOM.CIRC %C)
        [OUR.BOL %INBOX]
      (PATH-TO-CIRCLE (SCAG (DEC (LENT PAX)) PAX) OUR.BOL)
    =/  ACTS=(LIST ACTION:HALL)
    :~  [%SOURCE NOM.PARENT & (SY `SOURCE:HALL`[CIRC ~] ~)]
        [%CREATE NOM.CIRC NAME %JOURNAL]
    ==
    ::  XX SHOULD WE ALSO SOURCE COMMENT CIRCLES?
    =?  ACTS  =(NOM.PARENT %C)
      [[%SOURCE %INBOX & (SY `SOURCE:HALL`[CIRC ~] ~)] ACTS]
    (TA-HALL-ACTIONS (FLOP ACTS))
  ::
  ++  TA-HALL-LIN
    ~/  %COLL-TA-HALL-LIN
    |=  [PAX=PATH MSG=CORD]
    ^+  TA-THIS
    =/  CIRC=CIRCLE:HALL  (PATH-TO-CIRCLE PAX OUR.BOL)
    %-  TA-HALL-ACTION
    [%PHRASE [CIRC ~ ~] [%LIN | MSG]~]
  ::
  ++  TA-HALL-JSON
    ~/  %COLL-TA-HALL-JSON
    |=  [PAX=PATH HEADER=@T JON=JSON]
    ^+  TA-THIS
    =/  CIRC=CIRCLE:HALL  (PATH-TO-CIRCLE PAX OUR.BOL)
    %-  TA-HALL-ACTION
    :+  %PHRASE   [CIRC ~ ~]
    [%FAT [%TEXT ~[HEADER]] [%LIN | (CRIP (EN-JSON:HTML JON))]]~
  ::
  --
--
