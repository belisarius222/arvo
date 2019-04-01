/-  *DNS, HALL
!:
::
::  MOVES AND STATE
::
=>  |%
+$  MOVE  (PAIR BONE CARD)
+$  POKE
  $%  [%DNS-COMMAND COMMAND]
      [%HALL-ACTION %PHRASE AUDIENCE:HALL (LIST SPEECH:HALL)]
  ==
+$  CARD
  $%  [%HISS WIRE (UNIT ~) %HTTR %HISS HISS:EYRE]
      [%POKE WIRE DOCK POKE]
      [%RULE WIRE %TURF %PUT TURF]
      [%WAIT WIRE @DA]
  ==
::  +STATE: COMPLETE APP STATE
::
+$  STATE
  $:  :: DOM: THE SET OF OUR BINDINGS
      ::
      DOM=(SET TURF)
      :: PER: PER-DEPENDENT IPS &C
      ::
      PER=(MAP SHIP RELAY)
      :: NEM: AUTHORITATIVE STATE
      ::
      NEM=(UNIT NAMESERVER)
  ==
--
::
::  HELPERS
::
=>  |%
::  +JOIN: JOIN LIST OF CORDS WITH SEPARATOR
::
::    XX MOVE TO ZUSE?
::    XX DEDUP WITH LIB/PKCS
::
++  JOIN
  |=  [SEP=@T HOT=(LIST @T)]
  ^-  @T
  =|  OUT=(LIST @T)
  ?>  ?=(^ HOT)
  |-  ^-  @T
  ?~  T.HOT
    (RAP 3 [I.HOT OUT])
  $(OUT [SEP I.HOT OUT], HOT T.HOT)
::  +NAME: FULLY-QUALIFIED DOMAIN NAME FOR :SHIP
::
++  NAME
  |=  [=SHIP =TURF]
  (CAT 3 (JOIN '.' (WELD TURF /(CRIP +:(SCOW %P SHIP)))) '.')
::  +LAME: DOMAIN NAME FOR :SHIP (WITHOUT TRAILING '.')
::
++  LAME
  |=  [=SHIP =TURF]
  (JOIN '.' (WELD TURF /(CRIP +:(SCOW %P SHIP))))
::  +ENDPOINT: APPEND :PATH TO :PURL
::
++  ENDPOINT
  |=  [=PURL:EYRE =PATH]
  ^+  PURL
  PURL(Q.Q (WELD Q.Q.PURL PATH))
::  +PARAMS: APPEND :PARAMS TO :PURL
::
++  PARAMS
  |=  [=PURL:EYRE =QUAY:EYRE]
  ^+  PURL
  PURL(R (WELD R.PURL QUAY))
::  +PRINT-PATH: SERIALIZE A +PATH TO A +CORD
::
++  PRINT-PATH
  |=  =PATH
  (CRIP ~(RAM RE (SELL !>(PATH))))
::  +JSON-OCTS: DESERIALIZE JSON AND APPLY REPARSER
::
++  JSON-OCTS
  |*  [BOD=OCTS WIT=FIST:DEJS:FORMAT]
  =/  JON  (DE-JSON:HTML Q.BOD)
  ?~  JON  ~
  (WIT U.JON)
::  +SHIP-TURF: PARSE SHIP FROM FIRST SUBDOMAIN
::
++  SHIP-TURF
  |=  [NAM=@T AUT-DOM=TURF]
  ^-  (UNIT SHIP)
  =/  DOM=(UNIT HOST:EYRE)
    (RUSH NAM ;~(SFIX THOS:DE-PURL:HTML DOT))
  ?:  ?|  ?=(~ DOM)
          ?=(%| -.U.DOM)
          ?=(~ P.U.DOM)
      ==
    ~
  =/  WHO
    (RUSH (HEAD (FLOP P.U.DOM)) FED:AG)
  ?~  WHO  ~
  ?.  =(AUT-DOM (FLOP (TAIL (FLOP P.U.DOM))))
    ~
  ::  GALAXIES ALWAYS EXCLUDED
  ::
  ?:  ?=(%CZAR (CLAN:TITLE U.WHO))
    ~
  WHO
--
::
::  SERVICE PROVIDERS
::
=>  |%
::  +PROVIDER: INITIALIZE PROVIDER-SPECIFIC CORE
::
++  PROVIDER
  |=  AUT=AUTHORITY
  ?-  -.PRO.AUT
    %FCLOUD  ~(. FCLOUD AUT)
    %GCLOUD  ~(. GCLOUD AUT)
  ==
::  |FCLOUD: CLOUDFLARE PROVIDER
::
++  FCLOUD
  =>  |%
      ++  HEADERS
        |=  AUT=AUTHORITY
        ?>  ?=(%FCLOUD -.PRO.AUT)
        %-  ~(GAS BY *MATH:EYRE)
        :~  ['CONTENT-TYPE' ['APPLICATION/JSON' ~]]
            ['X-AUTH-EMAIL' [EMAIL.AUTH.PRO.AUT ~]]
            ['X-AUTH-KEY' [KEY.AUTH.PRO.AUT ~]]
        ==
      ::
      ++  PARSE-RAW-RECORD
        |=  AUT-DOM=TURF
        ^-  $-  JSON
            (UNIT [=SHIP ID=@TA TAR=TARGET])
        =,  DEJS:FORMAT
        %+  CU
          |=  [ID=@T TYP=@T NAM=@T DAT=@T]
          ^-  (UNIT [=SHIP ID=@TA TAR=TARGET])
          ::  XX FIX THIS
          ::
          =/  HIM  (SHIP-TURF (CAT 3 NAM '.') AUT-DOM)
          ?:  ?=(~ HIM)
            ~
          ?+  TYP
            ~
          ::
              %'A'
            =/  ADR  (RUSH DAT LIP:AG)
            ?~  ADR  ~
            `[U.HIM `@TA`ID %DIRECT %IF U.ADR]
          ::
              %'CNAME'
            ::  XX FIX THIS
            ::
            =/  FOR  (SHIP-TURF (CAT 3 DAT '.') AUT-DOM)
            ?~  FOR  ~
            `[U.HIM `@TA`ID %INDIRECT U.FOR]
          ==
        ::  XX PARSE DATES, PROXIED, TTL?
        ::
        %-  OT  :~
          'ID'^SO
          'TYPE'^SO
          'NAME'^SO
          'CONTENT'^SO
        ==
      --
  ::
  |_  AUT=AUTHORITY
  ::  +BASE: PROVIDER SERVICE ENDPOINT
  ::
  ++  BASE
    ^-  PURL:EYRE
    (NEED (DE-PURL:HTML 'HTTPS://API.CLOUDFLARE.COM/CLIENT/V4'))
  ::  +ZONE: PROVIDER-SPECIFIC ZONE INFO REQUEST
  ::
  ++  ZONE
    ^-  HISS:EYRE
    ?>  ?=(%FCLOUD -.PRO.AUT)
    [(ENDPOINT BASE /ZONES/[ZONE.PRO.AUT]) %GET (HEADERS AUT) ~]
  ::  +RECORD: JSON-FORMATTED PROVIDER-SPECIFIC DNS RECORD
  ::
  ++  RECORD
    |=  [HIM=SHIP TAR=TARGET]
    ^-  JSON
    ?>  ?=(%FCLOUD -.PRO.AUT)
    =/  TYPE
      ?:(?=(%DIRECT -.TAR) 'A' 'CNAME')
    =/  DATA
      ?:  ?=(%DIRECT -.TAR)
        (CRIP +:(SCOW %IF P.TAR))
      (LAME P.TAR DOM.AUT)
    :-  %O
    %-  ~(GAS BY *(MAP @T JSON))
    :~  ['NAME' %S (LAME HIM DOM.AUT)]
        ['TYPE' %S TYPE]
        ['CONTENT' %S DATA]
        ::  XX MAKE CONFIGUREABLE?
        ::
        ['TTL' %N ~.1]
        ['PROXIED' %B %.N]
    ==
  ::  +CREATE: PROVIDER-SPECIFIC RECORD-CREATION REQUEST
  ::
  ++  CREATE
    |=  [HIM=SHIP TAR=TARGET PRE=(UNIT [ID=@TA TAR=TARGET])]
    ^-  HISS:EYRE
    ?>  ?=(%FCLOUD -.PRO.AUT)
    =/  BOD=OCTS
      %-  AS-OCTT:MIMES:HTML
      %-  EN-JSON:HTML
      (RECORD HIM TAR)
    ?~  PRE
      :-  (ENDPOINT BASE /ZONES/[ZONE.PRO.AUT]/['DNS_RECORDS'])
      [%POST (HEADERS AUT) `BOD]
    :-  (ENDPOINT BASE /ZONES/[ZONE.PRO.AUT]/['DNS_RECORDS']/[ID.U.PRE])
    [%PUT (HEADERS AUT) `BOD]
  ::  +EXISTING: LIST EXISTING RECORDS STORED BY PROVIDER
  ::
  ++  EXISTING
    |=  PAGE=(UNIT @T)
    ^-  HISS:EYRE
    ?>  ?=(%FCLOUD -.PRO.AUT)
    ::  XX MORE URL PARAMS:
    ::  ?TYPE ?PER-PAGE ?ORDER ?DIRECTION
    ::
    :-  %+  PARAMS
          (ENDPOINT BASE /ZONES/[ZONE.PRO.AUT]/['DNS_RECORDS'])
        ?~(PAGE ~ ['PAGE' U.PAGE]~)
    [%GET (HEADERS AUT) ~]
  ::  +PARSE-LIST: EXISTING RECORDS STORED BY PROVIDER
  ::
  ++  PARSE-LIST
    ^-  $-  JSON
        (PAIR (LIST [=SHIP ID=@TA TAR=TARGET]) (UNIT @T))
    ?>  ?=(%FCLOUD -.PRO.AUT)
    =,  DEJS:FORMAT
    %+  CU
      |=  $:  SUCCESS=?
              RESPONSE=(LIST (UNIT [=SHIP ID=@TA TAR=TARGET]))
              PAGINATE=[PAGE=@UD PER-PAGE=@UD COUNT=@UD TOTAL-COUNT=@UD]
          ==
      ^-  (PAIR (LIST [=SHIP ID=@TA TAR=TARGET]) (UNIT @T))
      ?.  SUCCESS  [~ ~]
      :-  (MURN RESPONSE SAME)
      ::  XX CALCULATE NEXT PAGE NUMBER IF APPLICABLE
      ::
      ~
    ::  XX PARSE ERRORS AND MESSAGES?
    ::
    %-  OT  :~
      'SUCCESS'^BO
      'RESULT'^(AR (PARSE-RAW-RECORD DOM.AUT))
      :-  'RESULT_INFO'
      %-  OT  :~
        'PAGE'^NI
        'PER_PAGE'^NI
        'COUNT'^NI
        'TOTAL_COUNT'^NI
      ==
    ==
  ::  +PARSE-RECORD: SINGLE RECORD STORED BY PROVIDER
  ::
  ++  PARSE-RECORD
    ^-  $-  JSON
        (UNIT [=SHIP ID=@TA TAR=TARGET])
    ?>  ?=(%FCLOUD -.PRO.AUT)
    =,  DEJS:FORMAT
    %+  CU
      |=  [SUCCESS=? RESPONSE=(UNIT [=SHIP ID=@TA TAR=TARGET])]
      ^-  (UNIT [=SHIP ID=@TA TAR=TARGET])
      ?.  SUCCESS  ~
      RESPONSE
    ::  XX PARSE ERRORS AND MESSAGES?
    ::
    %-  OT  :~
      'SUCCESS'^BO
      'RESULT'^(PARSE-RAW-RECORD DOM.AUT)
    ==
  --
::  |GCLOUD: GCP PROVIDER
::
++  GCLOUD
  |_  AUT=AUTHORITY
  ::  +BASE: PROVIDER SERVICE ENDPOINT
  ::
  ++  BASE
    ^-  PURL:EYRE
    (NEED (DE-PURL:HTML 'HTTPS://WWW.GOOGLEAPIS.COM/DNS/V1/PROJECTS'))
  ::  +ZONE: PROVIDER-SPECIFIC ZONE INFO REQUEST
  ::
  ++  ZONE
    ^-  HISS:EYRE
    ?>  ?=(%GCLOUD -.PRO.AUT)
    :-  (ENDPOINT BASE /[PROJECT.PRO.AUT]/['MANAGEDZONES']/[ZONE.PRO.AUT])
    [%GET ~ ~]
  ::  +RECORD: JSON-FORMATTED PROVIDER-SPECIFIC DNS RECORD
  ::
  ++  RECORD
    |=  [HIM=SHIP TAR=TARGET]
    ^-  JSON
    ?>  ?=(%GCLOUD -.PRO.AUT)
    =/  TYPE
      ?:(?=(%DIRECT -.TAR) 'A' 'CNAME')
    =/  DATA
      ?:  ?=(%DIRECT -.TAR)
        [%S (CRIP +:(SCOW %IF P.TAR))]
      [%S (NAME P.TAR DOM.AUT)]
    :-  %O
    %-  ~(GAS BY *(MAP @T JSON))
    :~  ['NAME' %S (NAME HIM DOM.AUT)]
        ['TYPE' %S TYPE]
        ::  XX MAKE CONFIGUREABLE?
        ::
        ['TTL' %N ~.300]
        ['RRDATAS' %A DATA ~]
    ==
  ::  +CREATE: PROVIDER-SPECIFIC RECORD-CREATION REQUEST
  ::
  ++  CREATE
    =,  EYRE
    |=  [HIM=SHIP TAR=TARGET PRE=(UNIT [ID=@TA TAR=TARGET])]
    ^-  HISS
    ?>  ?=(%GCLOUD -.PRO.AUT)
    =/  URL=PURL
      %+  ENDPOINT  BASE
      /[PROJECT.PRO.AUT]/['MANAGEDZONES']/[ZONE.PRO.AUT]/CHANGES
    =/  HED=MATH
      (MY CONTENT-TYPE+['APPLICATION/JSON' ~] ~)
    =/  BOD=OCTS
      %-  AS-OCTT:MIMES:HTML
      %-  EN-JSON:HTML
      :-  %O
      %-  ~(GAS BY *(MAP @T JSON))
      :-  ['ADDITIONS' %A (RECORD HIM TAR) ~]
      ?~  PRE  ~
      [['DELETIONS' %A (RECORD HIM TAR.U.PRE) ~] ~]
    [URL %POST HED `BOD]
  ::  +EXISTING: LIST EXISTING RECORDS STORED BY PROVIDER
  ::
  ++  EXISTING
    =,  EYRE
    |=  PAGE=(UNIT @T)
    ^-  HISS
    ?>  ?=(%GCLOUD -.PRO.AUT)
    =/  URL=PURL
      %+  ENDPOINT  BASE
      /[PROJECT.PRO.AUT]/['MANAGEDZONES']/[ZONE.PRO.AUT]/RRSETS
    =/  HED=MATH
      ?~  PAGE  ~
      (~(PUT BY *MATH) 'PAGETOKEN' [U.PAGE]~)
    [URL %GET HED ~]
  ::  +PARSE-LIST: EXISTING RECORDS STORED BY PROVIDER
  ::
  ++  PARSE-LIST
    ^-  $-  JSON
        (PAIR (LIST [=SHIP ID=@TA TAR=TARGET]) (UNIT @T))
    ?>  ?=(%GCLOUD -.PRO.AUT)
    =,  DEJS:FORMAT
    =>  |%
        ++  PAGE  (UF ~ (MU SO))
        ++  RECORDS
          %+  UF  ~
          %+  CU
            |*(A=(LIST (UNIT)) (MURN A SAME))
          (AR PARSE-RECORD)
        --
    ::  XX PARSE BUT DON'T PRODUCE
    ::  'KIND'^(SU (JEST "DNS#RESOURCERECORDSETSLISTRESPONSE'))
    ::
    (OU 'RRSETS'^RECORDS 'NEXTPAGETOKEN'^PAGE ~)
  ::  +PARSE-RECORD: SINGLE RECORD STORED BY PROVIDER
  ::
  ++  PARSE-RECORD
    ^-  $-  JSON
        (UNIT [=SHIP ID=@TA TAR=TARGET])
    ?>  ?=(%GCLOUD -.PRO.AUT)
    =,  DEJS:FORMAT
    %+  CU
      |=  [TYP=@T NAM=@T DAT=(LIST @T)]
      ^-  (UNIT [=SHIP ID=@TA TAR=TARGET])
      ::  GCLOUD DOESN'T EXPOSE UUIDS FOR BINDINGS
      ::
      =/  ID  %$
      =/  HIM  (SHIP-TURF NAM DOM.AUT)
      ?:  |(?=(~ HIM) ?=(~ DAT) ?=(^ T.DAT))
        ~
      ?+  TYP
        ~
      ::
          %'A'
        =/  ADR  (RUSH I.DAT LIP:AG)
        ?~  ADR  ~
        `[U.HIM ID %DIRECT %IF U.ADR]
      ::
          %'CNAME'
        =/  FOR  (SHIP-TURF I.DAT DOM.AUT)
        ?~  FOR  ~
        `[U.HIM ID %INDIRECT U.FOR]
      ==
    ::
    %-  OT  :~
      ::  'KIND'^(SU (JEST "DNS#RESOURCERECORDSET'))
      ::
      'TYPE'^SO
      'NAME'^SO
      'RRDATAS'^(AR SO)
    ==
  --
--
::
::  THE APP ITSELF
::
|_  [BOW=BOWL:GALL STATE]
::  +THIS: IS SPARTA
::
++  THIS  .
::  +NOTIFY: SEND :HALL NOTIFICATION
::
++  NOTIFY
  |=  [=SHIP =CORD =TANG]
  ^-  CARD
  =/  MSG=SPEECH:HALL
    :+  %APP  DAP.BOW
    =/  LINE  [%LIN & CORD]
    ?~(TANG LINE [%FAT [%TANK TANG] LINE])
  =/  ACT
    [%PHRASE (SY [SHIP %INBOX] ~) [MSG ~]]
  [%POKE / [OUR.BOW %HALL] %HALL-ACTION ACT]
::  +WAIT: SET A TIMER
::
++  WAIT
  |=  [=WIRE LULL=@DR]
  ^-  CARD
  [%WAIT WIRE (ADD NOW.BOW LULL)]
::  +BACKOFF: CALCULATE EXPONENTIAL BACKOFF
::
++  BACKOFF
  |=  TRY=@UD
  ^-  @DR
  ?:  =(0 TRY)  ~S0
  %+  ADD
    (MUL ~S1 (BEX (DEC TRY)))
  (MUL ~S0..0001 (~(RAD OG ENY.BOW) 1.000))
::  +POKE-NOUN: DEBUGGING
::
++  POKE-NOUN
  |=  A=*
  ^-  (QUIP MOVE _THIS)
  ~&  +<+:THIS
  [~ THIS]
::  +SIGH-HTTR: ACCEPT HTTP RESPONSE
::
++  SIGH-HTTR
  |=  [=WIRE REP=HTTR:EYRE]
  ^-  (QUIP MOVE _THIS)
  ?+  WIRE
    ~&  [%STRANGE-HTTP-RESPONSE WIRE REP]
    [~ THIS]
  ::
      [%AUTHORITY *]
    ?~  NEM
      ~&  [%NOT-AN-AUTHORITY %HTTP-RESPONSE WIRE REP]
      [~ THIS]
    ABET:(~(HTTP-RESPONSE BIND U.NEM) T.WIRE REP)
  ::
      [%RELAY %HIM @ *]
    =/  HIM=SHIP  (SLAV %P I.T.T.WIRE)
    ABET:(HTTP-RESPONSE:(TELL HIM) T.T.T.WIRE REP)
  ==
::  +SIGH-TANG: FAILED TO MAKE HTTP REQUEST
::
++  SIGH-TANG
  |=  [=WIRE =TANG]
  ^-  (QUIP MOVE _THIS)
  ?+  WIRE
    ~&  [%STRANGE-SIGH-TANG WIRE]
    [((SLOG TANG) ~) THIS]
  ::
      [%AUTHORITY *]
    ?~  NEM
      ~&  [%NOT-AN-AUTHORITY %HTTP-CRASH WIRE]
      [((SLOG TANG) ~) THIS]
    ABET:(~(HTTP-CRASH BIND U.NEM) T.WIRE TANG)
  ::
      [%RELAY %HIM @ *]
    =/  HIM=SHIP  (SLAV %P I.T.T.WIRE)
    ABET:(HTTP-CRASH:(TELL HIM) T.T.T.WIRE TANG)
  ==
::  +WAKE: TIMER CALLBACK
::
++  WAKE
  |=  [=WIRE ~]
  ^-  (QUIP MOVE _THIS)
  ?+    WIRE
      ~&  [%STRANGE-WAKE WIRE]
      [~ THIS]
  ::
      [%AUTHORITY *]
    ?~  NEM
      ~&  [%NOT-AN-AUTHORITY %WAKE WIRE]
      [~ THIS]
    ABET:(~(RETRY BIND U.NEM) T.WIRE)
  ::
      [%RELAY %HIM @ *]
    =/  HIM=SHIP  (SLAV %P I.T.T.WIRE)
    ABET:(RETRY:(TELL HIM) T.T.T.WIRE)
  ==
::  +POKE-DNS-COMMAND: ACT ON COMMAND
::
++  POKE-DNS-COMMAND
  |=  COM=COMMAND
  ^-  (QUIP MOVE _THIS)
  ?-  -.COM
  ::  CONFIGURE SELF AS AN AUTHORITY
  ::
  ::    [%AUTHORITY AUTHORITY]
  ::
      %AUTHORITY
    ~|  %AUTHORITY-RESET-WAT-DO
    ?<  ?=(^ NEM)
    ABET:(INIT:BIND AUT.COM 1)
  ::  CREATE BINDING (IF AUTHORITY) AND FORWARD REQUEST
  ::
  ::    [%BIND FOR=SHIP HIM=SHIP TARGET]
  ::
      %BIND
    =/  RAC  (CLAN:TITLE HIM.COM)
    ?:  ?=(%CZAR RAC)
      ~|(%BIND-GALAZY !!)
    ?:  ?&  ?=(%KING RAC)
            ?=(%INDIRECT -.TAR.COM)
        ==
      ~|(%BIND-INDIRECT-STAR !!)
    ::  ALWAYS FORWARD, THERE MAY BE MULTIPLE AUTHORITIES
    ::
    =^  ZOM=(LIST MOVE)  ..THIS
      ABET:(FORWARD:(TELL HIM.COM) [FOR TAR]:COM)
    =^  ZAM=(LIST MOVE)  ..THIS
      ?~  NEM  [~ THIS]
      ABET:(~(CREATE BIND U.NEM) [FOR HIM TAR]:COM)
    [(WELD ZOM ZAM) THIS]
  ::  PROCESS ESTABLISHED DNS BINDING
  ::
  ::    [%BOND FOR=SHIP HIM=SHIP TURF]
  ::
      %BOND
    ?:  ?&  =(OUR.BOW FOR.COM)
            !=(OUR.BOW SRC.BOW)
        ==
      ABET:(LEARN:(TELL HIM.COM) DOM.COM)
    ::
    ?:  =(OUR.BOW HIM.COM)
      =/  MSG
        (CAT 3 'DOMAIN NAME ESTABLISHED AT ' (JOIN '.' DOM.COM))
      :_  THIS(DOM (~(PUT IN DOM) DOM.COM))
      :~  [OST.BOW (NOTIFY OUR.BOW MSG ~)]
          [OST.BOW %RULE /BOUND %TURF %PUT DOM.COM]
      ==
    ::
    ~&  [%STRANGE-BOND COM]
    [~ THIS]
  ::  MANUALLY SET OUR IP, REQUEST DIRECT BINDING
  ::
  ::    [%IP %IF ADDR=@IF]
  ::
      %IP
    ?.  =(OUR.BOW SRC.BOW)
      ~&  %DNS-IP-NO-FOREIGN
      [~ THIS]
    ABET:(HEAR:(TELL OUR.BOW) `ADDR.COM)
  ::  MEET SPONSEE, REQUEST INDIRECT BINDING
  ::
  ::    [%MEET HIM=SHIP]
  ::
      %MEET
    ?.  =(OUR.BOW (SEIN:TITLE OUR.BOW NOW.BOW HIM.COM))
      ~&  [%DNS-MEET-NOT-SPONSORED HIM.COM]
      [~ THIS]
    ABET:(HEAR:(TELL HIM.COM) ~)
  ==
::  +COUP: GENERAL POKE ACKNOWLEDGEMENT OR ERROR
::
++  COUP
  |=  [=WIRE SAW=(UNIT TANG)]
  ?~  SAW  [~ THIS]
  ~&  [%COUP-FALLTHRU WIRE]
  [((SLOG U.SAW) ~) THIS]
::  +PREP: ADAPT STATE
::
::  ++  PREP  _[~ THIS]
++  PREP
  |=  OLD=(UNIT STATE)
  ^-  (QUIP MOVE _THIS)
  ?^  OLD
    [~ THIS(+<+ U.OLD)]
  ::  XX PRINT :DNS|IP CONFIG INSTRUCTIONS FOR STARS?
  ::
  [~ THIS]
::  |BIND: ACTING AS ZONE AUTHORITY
::
++  BIND
  =/  ABORT=?  |
  =|  MOZ=(LIST MOVE)
  |_  NAM=NAMESERVER
  ++  THIS  .
  ::  +ABET: FINALIZE STATE CHANGES, PRODUCE MOVES
  ::
  ++  ABET
    ^-  (QUIP MOVE _^THIS)
    :-  (FLOP MOZ)
    ?:  ABORT
      ~&  %CLEARING-AUTHORITY
      ^THIS(NEM ~)
    ^THIS(NEM `NAM)
  ::  +EMIT: EMIT A MOVE
  ::
  ++  EMIT
    |=  CAR=CARD
    ^+  THIS
    THIS(MOZ [[OST.BOW CAR] MOZ])
  :: +REQUEST: AUTHENTICATED HTTP REQUEST
  ::
  ++  REQUEST
    |=  [=WIRE =HISS:EYRE]
    ^-  CARD
    [%HISS WIRE [~ ~] %HTTR %HISS HISS]
  ::  +HTTP-WIRE: BUILD A WIRE FOR A |TELL REQUEST
  ::
  ++  HTTP-WIRE
    |=  [TRY=@UD =WIRE]
    ^-  ^WIRE
    (WELD /AUTHORITY/TRY/(SCOT %UD TRY) WIRE)
  ::  +HTTP-CRASH: HANDLE FAILED HTTP REQUEST
  ::
  ++  HTTP-CRASH
    |=  [=WIRE =TANG]
    ^+  THIS
    ?>  ?=([%TRY @ @ *] WIRE)
    =/  TRY  (SLAV %UD I.T.WIRE)
    ?+  T.T.WIRE
      ~&([%BIND %UNKNOWN-CRASH WIRE] THIS)
    ::
        [%CONFIRM ~]
      =.  TRY  +(TRY)
      (EMIT (WAIT (HTTP-WIRE TRY /CONFIRM) (MIN ~H1 (BACKOFF TRY))))
    ::
        [%CREATE @ %FOR @ ~]
      =.  TRY  +(TRY)
      (EMIT (WAIT (HTTP-WIRE TRY T.T.WIRE) (MIN ~H1 (BACKOFF TRY))))
    ::
        [%UPDATE @ ~]
      =.  TRY  +(TRY)
      (EMIT (WAIT (HTTP-WIRE TRY T.T.WIRE) (MIN ~H1 (BACKOFF TRY))))
    ==
  ::  +HTTP-RESPONSE: HANDLE HTTP RESPONSE
  ::
  ++  HTTP-RESPONSE
    |=  [=WIRE REP=HTTR:EYRE]
    ^+  THIS
    ?>  ?=([%TRY @ @ *] WIRE)
    =/  TRY  (SLAV %UD I.T.WIRE)
    ?+  T.T.WIRE
      ~&([%BIND %UNKNOWN-RESPONSE WIRE REP] THIS)
    ::  RESPONSE CONFIRMING A VALID NAMESERVER CONFIG
    ::
        [%CONFIRM ~]
      ?:  =(200 P.REP)
        (UPDATE ~ 1)
      %-  EMIT(ABORT &)
      ::  XX INCLUDE RESPONSE
      ::
      =/  =TANG  [(SELL !>(REP)) ~]
      (NOTIFY OUR.BOW 'AUTHORITY CONFIRMATION FAILED' TANG)
    ::  RESPONSE TO A BINDING CREATION REQUEST
    ::
        [%CREATE @ %FOR @ ~]
      ?.  =(200 P.REP)
        ::  XX ANY RETRY-ABLE ERRORS?
        ::
        =/  MSG
          (CAT 3 'FAILED TO CREATE BINDING: ' (PRINT-PATH T.T.WIRE))
        =/  =TANG  [(SELL !>(REP)) ~]
        (EMIT (NOTIFY OUR.BOW MSG TANG))
      ::
      =/  HIM=SHIP  (SLAV %P I.T.T.T.WIRE)
      =/  FOR=SHIP  (SLAV %P I.T.T.T.T.T.WIRE)
      =/  ID
        ?.  ?=(%FCLOUD -.PRO.AUT.NAM)  ~.
        ~|  [%AUTHORITY-CREATE-CONFIRM-ID REP]
        ?>  ?=(^ R.REP)
        =/  DAT=(UNIT [=SHIP ID=@TA TAR=TARGET])
          (JSON-OCTS U.R.REP PARSE-RECORD:(PROVIDER AUT.NAM))
        ID:(NEED DAT)
      (CONFIRM FOR HIM ID)
    ::  RESPONSE TO AN EXISTING-BINDING RETRIEVAL REQUEST
    ::
        [%UPDATE @ ~]
      ?.  =(200 P.REP)
        ?.  (GTH TRY 5)
          =/  =TANG  [(SELL !>(REP)) ~]
          (EMIT (NOTIFY OUR.BOW 'FAILED TO RETRIEVE BINDINGS' TANG))
        =.  TRY  +(TRY)
        (EMIT (WAIT (HTTP-WIRE TRY T.T.WIRE) (MIN ~H1 (BACKOFF TRY))))
      ?~  R.REP
        THIS
      (RESTORE U.R.REP)
    ==
  ::  +RETRY: RE-ATTEMPT HTTP REQUEST AFTER TIMER
  ::
  ++  RETRY
    |=  =WIRE
    ^+  THIS
    ?>  ?=([%TRY @ @ *] WIRE)
    =/  TRY  (SLAV %UD I.T.WIRE)
    ?+  T.T.WIRE
      ~&([%BIND %UNKNOWN-RETRY WIRE] THIS)
    ::
        [%CONFIRM ~]
      (INIT AUT.NAM TRY)
    ::
        [%CREATE @ %FOR @ ~]
      =/  HIM=SHIP  (SLAV %P I.T.T.T.WIRE)
      =/  FOR=SHIP  (SLAV %P I.T.T.T.T.T.WIRE)
      (DO-CREATE HIM FOR TRY)
    ::
        [%UPDATE @ ~]
      =*  PAGE  I.T.T.T.WIRE
      (UPDATE ?~(PAGE ~ `PAGE) TRY)
    ==
  ::  +INIT: ESTABLISH ZONE AUTHORITY (REQUEST CONFIRMATION)
  ::
  ++  INIT
    |=  [AUT=AUTHORITY TRY=@UD]
    %-  EMIT(NAM [AUT ~ ~ ~])
    (REQUEST (HTTP-WIRE TRY /CONFIRM) ZONE:(PROVIDER AUT))
  ::  +UPDATE: RETRIEVE EXISTING REMOTE NAMESERVER RECORDS
  ::
  ++  UPDATE
    |=  [PAGE=(UNIT @T) TRY=@UD]
    ^+  THIS
    =/  =HISS:EYRE
      (EXISTING:(PROVIDER AUT.NAM) PAGE)
    =/  =WIRE
      (HTTP-WIRE TRY /UPDATE/[?~(PAGE %$ U.PAGE)])
    (EMIT (REQUEST WIRE HISS))
  ::  +RESTORE: RESTORE EXISTING REMOTE NAMESERVER RECORDS
  ::
  ++  RESTORE
    |=  BOD=OCTS
    =+  ^-  [DAT=(LIST [=SHIP ID=@TA TAR=TARGET]) PAGE=(UNIT @T)]
      ::  XX GROSS
      ::
      =-  ?~(- [~ ~] -)
      (JSON-OCTS BOD PARSE-LIST:(PROVIDER AUT.NAM))
    |-  ^+  THIS
    ?~  DAT
      ?~(PAGE THIS (UPDATE PAGE 1))
    =/  NOB=BOUND  [NOW.BOW ID.I.DAT TAR.I.DAT ~]
    $(DAT T.DAT, BON.NAM (~(PUT BY BON.NAM) SHIP.I.DAT NOB))
  ::  +CREATE: BIND :HIM, ON BEHALF OF :FOR
  ::
  ++  CREATE
    |=  [FOR=SHIP HIM=SHIP TAR=TARGET]
    ?:  ?&  ?=(%INDIRECT -.TAR)
            !(~(HAS BY BON.NAM) P.TAR)
        ==
      ::  DEFER %INDIRECT WHERE TARGET ISN'T YET BOUND
      ::
      THIS(DEP.NAM (~(ADD JA DEP.NAM) P.TAR [HIM TAR]))
    ::  IGNORE IF BINDING IS PENDING
    ::
    =/  PENDING  (~(GET BY PEN.NAM) HIM)
    ?:  ?&  ?=(^ PENDING)
            =(TAR U.PENDING)
        ==
      THIS
    ::  RE-NOTIFY IF BINDING ALREADY EXISTS
    ::
    =/  EXISTING  (~(GET BY BON.NAM) HIM)
    ?:  ?&  ?=(^ EXISTING)
            =(TAR CUR.U.EXISTING)
      ==
      (BOND FOR HIM)
    ::  XX SAVE :FOR RELAY STATE?
    ::
    =.  PEN.NAM  (~(PUT BY PEN.NAM) HIM TAR)
    (DO-CREATE HIM FOR 1)
  ::  +DO-CREATE: CREATE NEW OR REPLACE EXISTING BINDING
  ::
  ++  DO-CREATE
    |=  [HIM=SHIP FOR=SHIP TRY=@UD]
    ^+  THIS
    =/  PENDING  (~(GET BY PEN.NAM) HIM)
    ?~  PENDING
      THIS
    =*  TAR  U.PENDING
    =/  =WIRE
      (HTTP-WIRE TRY /CREATE/(SCOT %P HIM)/FOR/(SCOT %P FOR))
    =/  PRE=(UNIT [ID=@TA TAR=TARGET])
      =/  BON=(UNIT BOUND)  (~(GET BY BON.NAM) HIM)
      ?~(BON ~ `[ID.U.BON CUR.U.BON])
    =/  REQ=HISS:EYRE
      (CREATE:(PROVIDER AUT.NAM) HIM TAR PRE)
    (EMIT (REQUEST WIRE REQ))
  ::  +DEPENDANTS: PROCESS DEFERRED DEPENDANT BINDINGS
  ::
  ++  DEPENDANTS
    |=  FOR=SHIP
    ^+  THIS
    =/  DEP=(LIST [HIM=SHIP TAR=TARGET])
      (~(GET JA DEP.NAM) FOR)
    =.  DEP.NAM  (~(DEL BY DEP.NAM) FOR)
    |-  ^+  ..THIS
    ?~  DEP   THIS
    $(DEP T.DEP, ..THIS (CREATE FOR HIM.I.DEP TAR.I.DEP))
  ::  +CONFIRM: SUCCESSFULLY BOUND
  ::
  ++  CONFIRM
    |=  [FOR=SHIP HIM=SHIP ID=@TA]
    =/  TAR=TARGET  (~(GOT BY PEN.NAM) HIM)
    =/  BON=(UNIT BOUND)
      (~(GET BY BON.NAM) HIM)
    =/  NOB=BOUND
      [NOW.BOW ID TAR ?~(BON ~ [[WEN.U.BON CUR.U.BON] HIT.U.BON])]
    =:  PEN.NAM  (~(DEL BY PEN.NAM) HIM)
        BON.NAM  (~(PUT BY BON.NAM) HIM NOB)
      ==
    (DEPENDANTS:(BOND FOR HIM) HIM)
  ::  +BOND: SEND BINDING CONFIRMATION
  ::
  ++  BOND
    |=  [FOR=SHIP HIM=SHIP]
    =/  WIR=WIRE
      /BOUND/(SCOT %P HIM)/FOR/(SCOT %P FOR)
    =/  DOM=TURF
      (WELD DOM.AUT.NAM /(CRIP +:(SCOW %P HIM)))
    =/  COM=COMMAND
      [%BOND FOR HIM DOM]
    (EMIT [%POKE WIR [FOR DAP.BOW] %DNS-COMMAND COM])
  --
::  |TELL: ACTING AS PLANET PARENT OR RELAY
::
++  TELL
  |=  HIM=SHIP
  =|  MOZ=(LIST MOVE)
  =/  REL=(UNIT RELAY)  (~(GET BY PER) HIM)
  |%
  ++  THIS  .
  ::  +ABET: FINALIZE STATE CHANGES, PRODUCE MOVES
  ::
  ++  ABET
    ^-  (QUIP MOVE _^THIS)
    :-  (FLOP MOZ)
    =?  PER  ?=(^ REL)
      (~(PUT BY PER) HIM U.REL)
    ^THIS
  ::  +EMIT: EMIT A MOVE
  ::
  ++  EMIT
    |=  CAR=CARD
    ^+  THIS
    THIS(MOZ [[OST.BOW CAR] MOZ])
  :: +REQUEST: UNAUTHENTICATED HTTP REQUEST
  ::
  ++  REQUEST
    |=  [=WIRE =HISS:EYRE]
    ^-  CARD
    [%HISS WIRE ~ %HTTR %HISS HISS]
  ::  +HTTP-WIRE: BUILD A WIRE FOR A |TELL REQUEST
  ::
  ++  HTTP-WIRE
    |=  [TRY=@UD ACT=@TAS]
    ^-  WIRE
    /RELAY/HIM/(SCOT %P HIM)/TRY/(SCOT %UD TRY)/[ACT]
  ::  +HTTP-CRASH: HANDLE FAILED HTTP REQUEST
  ::
  ++  HTTP-CRASH
    |=  [=WIRE =TANG]
    ^+  THIS
    ?>  ?=([%TRY @ @ ~] WIRE)
    =/  TRY  (SLAV %UD I.T.WIRE)
    =*  ACT  I.T.T.WIRE
    ?+  ACT
      ~&([%TELL %UNKNOWN-CRASH ACT] THIS)
    ::
        %CHECK-BEFORE
      =.  TRY  +(TRY)
      (EMIT (WAIT (HTTP-WIRE TRY %CHECK-BEFORE) (MIN ~H1 (BACKOFF TRY))))
    ::
        %CHECK-AFTER
      =.  TRY  +(TRY)
      (EMIT (WAIT (HTTP-WIRE TRY %CHECK-AFTER) (MIN ~H1 (BACKOFF TRY))))
    ==
  ::  +HTTP-RESPONSE: HANDLE HTTP RESPONSE
  ::
  ++  HTTP-RESPONSE
    |=  [=WIRE REP=HTTR:EYRE]
    ^+  THIS
    ?>  ?=([%TRY @ @ ~] WIRE)
    =/  TRY  (SLAV %UD I.T.WIRE)
    =*  ACT  I.T.T.WIRE
    ?+  ACT
      ~&([%TELL %UNKNOWN-RESPONSE ACT REP] THIS)
    ::  VALIDATING A BINDING TARGET
    ::
        %CHECK-BEFORE
      ?:  =(200 P.REP)
        BIND
      ?:  (GTH TRY 10)
        (FAIL %CHECK-BEFORE [(SELL !>(REP)) ~])
      =.  TRY  +(TRY)
      (EMIT (WAIT (HTTP-WIRE TRY %CHECK-BEFORE) (MIN ~H1 (BACKOFF TRY))))
    ::  VALIDATING AN ESTABLISHED BINDING
    ::
        %CHECK-AFTER
      ?:  =(200 P.REP)
        BAKE
      ::  NO MAX RETRIES, THE BINDING HAS BEEN CREATED
      ::  XX NOTIFY AFTER SOME NUMBER OF FAILURES
      ::
      =.  TRY  +(TRY)
      (EMIT (WAIT (HTTP-WIRE TRY %CHECK-AFTER) (MIN ~H1 (BACKOFF TRY))))
    ==
  ::  +RETRY: RE-ATTEMPT HTTP REQUEST AFTER TIMER
  ::
  ++  RETRY
    |=  =WIRE
    ^+  THIS
    ?>  ?=([%TRY @ @ ~] WIRE)
    =/  TRY  (SLAV %UD I.T.WIRE)
    =*  ACT  I.T.T.WIRE
    ?+    ACT
        ~&([%TELL %UNKNOWN-WAKE ACT] THIS)
      %CHECK-BEFORE  (CHECK-BEFORE TRY)
      %CHECK-AFTER   (CHECK-AFTER TRY)
    ==
  ::  +HEAR: HEAR IP ADDRESS, MAYBE EMIT BINDING REQUEST
  ::
  ++  HEAR
    |=  ADDR=(UNIT @IF)
    ^+  THIS
    =/  TAR=TARGET
      ?:  |(?=(~ ADDR) ?=(%DUKE (CLAN:TITLE HIM)))
        [%INDIRECT OUR.BOW]
      [%DIRECT %IF U.ADDR]
    ::  RE-NOTIFY IF BINDING ALREADY EXISTS
    ::
    ::    XX DEDUPLICATE WITH +BAKE:TELL AND +BOND:BIND
    ::
    ?:  ?&  ?=(^ REL)
            ?=(^ DOM.U.REL)
            =(TAR TAR.U.REL)
        ==
      =/  WIR=WIRE
        /BOUND/(SCOT %P HIM)/FOR/(SCOT %P OUR.BOW)
      =/  COM=COMMAND
        [%BOND OUR.BOW HIM U.DOM.U.REL]
      (EMIT [%POKE WIR [HIM DAP.BOW] %DNS-COMMAND COM])
    ::  CHECK BINDING TARGET VALIDITY, STORE AND FORWARD
    ::
    =.  REL  `[WEN=NOW.BOW ADDR DOM=~ TAR]
    ?:  ?=(%INDIRECT -.TAR)
      BIND
    (CHECK-BEFORE 1)
  ::  +CHECK-BEFORE: CONFIRM %DIRECT TARGET IS ACCESSIBLE
  ::
  ++  CHECK-BEFORE
    |=  TRY=@UD
    ^+  THIS
    ?>  ?=(^ REL)
    ?>  ?=(%DIRECT -.TAR.U.REL)
    ?:  (RESERVED:EYRE P.TAR.U.REL)
      (FAIL %RESERVED-IP ~)
    =/  =WIRE  (HTTP-WIRE TRY %CHECK-BEFORE)
    =/  URL=PURL:EYRE
      :-  [SEC=| POR=~ HOST=[%| `@IF`P.TAR.U.REL]]
      [[EXT=`~.UDON PATH=/STATIC] QUERY=~]
    (EMIT (REQUEST WIRE URL %GET ~ ~))
  ::  +FAIL: %DIRECT TARGET IS INVALID OR INACCESSIBLE
  ::
  ++  FAIL
    |=  [ERR=@TAS =TANG]
    ^+  THIS
    ?>  ?=(^ REL)
    ::  XX ADD FAILURE-SPECIFIC MESSAGES
    ::
    =/  MSG
      ?+  ERR
          'DNS BINDING FAILED'
      ::
          %CHECK-BEFORE
        ?>  ?=(%DIRECT -.TAR.U.REL)
        =/  ADDR  (SCOT %IF P.TAR.U.REL)
        %+  RAP  3
        :~  'DNS BINDING FAILED: '
            'UNABLE TO REACH YOU AT '  ADDR  ' ON PORT 80, '
            'PLEASE CONFIRM OR CORRECT YOUR IPV4 ADDRESS '
            'AND RE-ENTER IT WITH :DNS|IP'
        ==
      ::
          %RESERVED-IP
        ?>  ?=(%DIRECT -.TAR.U.REL)
        =/  ADDR  (SCOT %IF P.TAR.U.REL)
        (CAT 3 'UNABLE TO CREATE DNS BINDING FOR RESERVED IP ADDRESS' ADDR)
      ==
    ::  XX SAVE FAILED BINDINGS SOMEWHERE?
    ::
    %-  =<  EMIT(REL ~)
        (EMIT (NOTIFY HIM MSG ~))
    (NOTIFY OUR.BOW (RAP 3 (SCOT %P HIM) ' FAIL: ' ERR ~) TANG)
  ::  +BIND: REQUEST BINDING FOR TARGET
  ::
  ::    SINCE WE MAY BE AN AUTHORITY, WE POKE OURSELVES.
  ::
  ++  BIND
    ^+  THIS
    ?>  ?=(^ REL)
    ::  XX SAVE BINDING REQUEST STATE?
    ::
    =/  WIR=WIRE
      /BIND/(SCOT %P HIM)/FOR/(SCOT %P OUR.BOW)
    =/  COM=COMMAND
      [%BIND OUR.BOW HIM TAR.U.REL]
    (EMIT [%POKE WIR [OUR.BOW DAP.BOW] %DNS-COMMAND COM])
  ::  +LEARN: OF NEW BINDING
  ::
  ++  LEARN
    |=  DOM=TURF
    ^+  THIS
    ?>  ?=(^ REL)
    ::  XX TRACK BOUND-STATE PER-DOMAIN
    ::
    (CHECK-AFTER(DOM.U.REL `DOM) 1)
  ::  +CHECK-AFTER: CONFIRM BINDING PROPAGATION
  ::
  ++  CHECK-AFTER
    |=  TRY=@UD
    ^+  THIS
    ?>  ?&  ?=(^ REL)
            ?=(^ DOM.U.REL)
        ==
    =*  DOM  U.DOM.U.REL
    =/  =WIRE  (HTTP-WIRE TRY %CHECK-AFTER)
    =/  URL=PURL:EYRE
      :-  [SEC=| POR=~ HOST=[%& DOM]]
      [[EXT=`~.UDON PATH=/STATIC] QUERY=~]
    (EMIT (REQUEST WIRE URL %GET ~ ~))
  ::  +BAKE: SUCCESSFULLY BOUND
  ::
  ++  BAKE
    ^+  THIS
    ?>  ?=(^ REL)
    ?>  ?=(^ DOM.U.REL)
    =/  WIR=WIRE
      /FORWARD/BOUND/(SCOT %P HIM)/FOR/(SCOT %P OUR.BOW)
    =*  DOM  U.DOM.U.REL
    =/  COM=COMMAND
      [%BOND OUR.BOW HIM DOM]
    =/  MSG
      (CAT 3 'RELAYING NEW DNS BINDING: ' (JOIN '.' DOM))
    ::  XX SAVE NOTIFICATION STATE?
    ::
    %-  EMIT:(EMIT (NOTIFY OUR.BOW MSG ~))
    [%POKE WIR [HIM DAP.BOW] %DNS-COMMAND COM]
  ::  +FORWARD: SENDING BINDING REQUEST UP THE NETWORK
  ::
  ++  FORWARD
    |=  [FOR=SHIP TAR=TARGET]
    ^+  THIS
    ?:  ?=(%~ZOD OUR.BOW)
      THIS
    =/  WIR=WIRE
      /FORWARD/BIND/(SCOT %P HIM)/FOR/(SCOT %P FOR)
    =/  COM=COMMAND
      [%BIND FOR HIM TAR]
    =/  TO=SHIP
      ?:  ?=(%CZAR (CLAN:TITLE OUR.BOW))  ~ZOD
      (SEIN:TITLE [OUR NOW OUR]:BOW)
    (EMIT [%POKE WIR [TO DAP.BOW] %DNS-COMMAND COM])
  --
--
