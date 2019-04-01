:: THREE WAYS WE INTERACT WITH THIS APP
:: 1. .^(%GX /=GH=/ENDPOINT)
:: 2. [%PEER [OUR %GH] /ENDPOINT]
:: 3. :GH &GH-POKE %POST /GISTS JSON-DATA


::  THIS IS A DRIVER FOR THE GITHUB API V3.
::
::  YOU CAN INTERACT WITH THIS IN A FEW DIFFERENT WAYS:
::
::    - .^(%GX /=GH=/READ{/ENDPOINT}) OR SUBSCRIBE TO
::      /SCRY/X/READ{/ENDPOINT} FOR AUTHENTICATED READS.
::
::    - SUBSCRIBE TO /SCRY/X/LISTEN/{OWNER}/{REPO}/{EVENTS...}
::      FOR WEBHOOK-POWERED EVENT NOTIFICATIONS.  FOR EVENT LIST,
::      SEE HTTPS://DEVELOPER.GITHUB.COM/WEBHOOKS/.
::
::  SEE THE%GITHUB APP FOR EXAMPLE USAGE.
::
/?  314
/-  RFC, GMAIL-LABEL, GMAIL-MESSAGE
/+  HTTP
::::
::
|%
::  SPLITS A PATH INTO THE ENDPOINT PREFIX AND THE REMAINDER,
::  WHICH IS ASSUMED TO BE A PATH WITHIN THE JSON OBJECT.  WE
::  CHOOSE THE LONGEST LEGAL ENDPOINT PREFIX.
::
++  SPLIT
  |=  PAX/PATH
  ::  =-  ~&  [%PAX PAX - (VALID-ENDPOINT PAX)]  -
  =+  L=(LENT PAX)
  |-  ^-  {PATH PATH}
  ?:  ?=(VALID-GET-ENDPOINT (SCAG L PAX))
    [(SCAG L PAX) (SLAG L PAX)]
  ?~  L
    ~&  %BAD-ENDPOINT
    ~|(%BAD-ENDPOINT !!)
  $(L (DEC L))
::
::  THESE ARE ALL THE GITHUB GET ENDPOINTS, SORTED WITH
::  `ENV LC_ALL=C SORT`
::
::  END-POINTS INCLUDE REQUIRED QUERY PARAMETERS
++  VALID-GET-ENDPOINT
  $?  {$DRAFTS ID/@T $~}
      {$DRAFTS $~}
      {$HISTORY $~}
      {$LABELS ID/@T $~}
      {$LABELS $~}
      {$MESSAGES ID/@T $ATTACHMENTS ID/@T $~}
      {$MESSAGES ID/@T $~}
      {$MESSAGES $~}
      {$PROFILE $~}
      {$THREADS ID/@T $~}
      {$THREADS $~}
  ==

++  VAILD-POST-ENDPOINT
  $?  {$DRAFTS $SEND $~}
      {$DRAFTS $~}
      {$MESSAGES ID/@T $MODIFY $~}
      {$MESSAGES ID/@T $TRASH $~}
      {$MESSAGES ID/@T $UNTRASH $~}
      {$MESSAGES $IMPORT $~}
      {$MESSAGES $SEND $~}
      {$MESSAGES $~}
      {$LABELS $~}
      {$THREADS ID/@T $TRASH $~}
      {$THREADS ID/@T $UNTRASH $~}
      {$THREADS ID/@T $MODIFY}
      {$STOP $~}
      {$WATCH $~}
  ==

++  VALID-DELETE-ENDPOINT
  $?  {$DRAFTS ID/@T $~}
      {$LABELS ID/@T $~}
      {$MESSAGES ID/@T $~}
      {$THREAD ID/@T $~}
  ==
++  VALID-PUT-ENDPOINT
  $?  {$DRAFTS ID/@T $~}
      {$LABELS ID/@T $~}
  ==
++  VALID-PATCH-ENDPOINT
  $?  {$LABELS ID/@T $~}
  ==
--
::/-  GMAIL
::  /APE/GH/SPLIT.HOON DEFINES ++SPLIT, WHICH SPLITS A REQUEST
::  AT THE END OF THE LONGEST POSSIBLE ENDPOINT.
::
=,  MIMES:HTML
=,  HTML
=>  |%                              :: => ONLY USED FOR INDENTATION
    ++  MOVE  (PAIR BONE CARD)
    ++  SUBSCRIPTION-RESULT
      $%  {$ARCH ARCH}
          {$JSON JSON}
          {$NULL ~}
          {$INBOX (LIST {MESSAGE-ID/@T THREAD-ID/@T})}
          {$MESSAGE FROM/@T SUBJECT/@T}
      ==
    ++  CARD
      $%  {$DIFF SUBSCRIPTION-RESULT}
          {$HISS WIRE {~ ~} $HTTR {$HISS HISS:EYRE}}
      ==
    ++  EASY-OT
      =,  DEJS-SOFT:FORMAT
      |*  {KEY/@T PARSER/FIST}
      (OT [KEY PARSER] ~)
    ++  SIFO-GOOGLE
      |=  A/CORD  ^-  CORD
      =;  FEL  (CRIP (SCAN (EN-BASE64 A) FEL))
      (STAR ;~(POSE (COLD '-' (JUST '+')) (COLD '_' (JUST '/')) NEXT))
    ++  OFIS-GOOGLE
      |=  A/CORD  ^-  CORD
      =;  FEL  (DE-BASE64 (CRIP (RASH A FEL)))
      (STAR ;~(POSE (COLD '+' (JUST '-')) (COLD '/' (JUST '_')) NEXT))
    --
::
=,  GALL
|_  $:  HID/BOWL  COUNT/@
        WEB-HOOKS/(MAP @T {ID/@T LISTENERS/(SET BONE)})
        RECEIVED-IDS/(LIST @T)
    ==

::  WE CAN'T ACTUALLY GIVE THE RESPONSE TO PRETTY MUCH ANYTHING
::  WITHOUT BLOCKING, SO WE JUST BLOCK UNCONDITIONALLY.
::
++  PREP  ~&  'PREP'  _`.  ::
::
++  PEEK
  |=  {REN/@TAS PAX/PATH}
  ^-  (UNIT (UNIT (PAIR MARK *)))
  ~
::
++  PEER-SCRY
  |=  PAX/PATH
  ^-  {(LIST MOVE) _+>.$}
  ?>  ?=({CARE:CLAY ^} PAX)                             ::  ASSERT %U
  =>  (HELP I.PAX I.T.PAX T.T.PAX)
  =>  SCRY
  %=  MAKE-MOVE
    COUNT  +(COUNT)
  ==
::
++  POKE-EMAIL
  |=  {ADR/@TA TYL/TAPE MEZ/WALL}  ^-  (QUIP MOVE _+>)
  ?>  =(OUR.HID SRC.HID)
  %-  POKE-GMAIL-REQ  :*
    %POST
    /MESSAGES/SEND
    ~['UPLOADTYPE'^%SIMPLE]
    ['URBIT' 'URBIT.ORG'] :: [(CRIP "URBIT+{<OUR.HID>}") 'URBIT.ORG']
  ::
    =-  (RASH ADR -)
    [;~((GLUE VAT) . .)]:(COOK CRIP (PLUS ;~(LESS VAT NEXT)))  :: /[^@]+@[^@]+/
  ::
    (CRIP TYL)
    (OF-WAIN:FORMAT (TURN MEZ CRIP))
  ==
::
++  POKE-GMAIL-REQ
  |=  $:  METHOD/METH:EYRE  ENDPOINT/PATH  QUY/QUAY:EYRE
          MES/MESSAGE:RFC
          :: LABEL-REQ:GMAIL-LABEL
      ==
  ^-  {(LIST MOVE) _+>.$}
  ?>  ?=(VALID-GET-ENDPOINT ENDPOINT)
  ?>  =(OUR.HID SRC.HID)
  :_  +>.$  :_  ~
  ^-  MOVE
  :*  OST.HID  %HISS  /POKE/[METHOD]  `~  %HTTR  %HISS
      ^-  PURL:EYRE
      :+  [& ~ [%& /COM/GOOGLEAPIS/WWW]]
        [~ GMAIL+V1+USERS+ME+`VALID-GET-ENDPOINT`ENDPOINT]
      `QUAY:EYRE`[[%ALT %JSON] ~]
  ::
      :+  METHOD  `MATH:EYRE`(MALT ~[CONTENT-TYPE+['APPLICATION/JSON']~])
      =/  HOON-JSON-OBJECT
        (FROND:ENJS:FORMAT %RAW S+(SIFO-GOOGLE (MESSAGE-TO-RFC822:RFC MES)))
      =+  REQUEST-BODY=(AS-OCTT (EN-JSON HOON-JSON-OBJECT))
      (SOME REQUEST-BODY)
      ::(SOME (EN-JSON LABEL-REQ-TO-JSON:GMAIL-LABEL LABEL-REQ:GMAIL-LABEL ~)) XX
  ==
::
::  HTTP RESPONSE.  WE MAKE SURE THE RESPONSE IS GOOD, THEN
::  PRODUCE THE RESULT (AS JSON) TO WHOEVER SENT THE REQUEST.
::

++  SIGH-HTTR
  |=  {WIR/WIRE RES/HTTR:EYRE}
  ^-  {(LIST MOVE) _+>.$}
  :: ~&  WIR+WIR
  ?.  ?=({CARE:CLAY @ @ @ *} WIR)
    ::  POKES DON'T RETURN ANYTHING
    ~&  SIGH-POKE+P.RES
    [~ +>.$]
  =+  ARG=(PATH (CUE (SLAV %UV I.T.T.WIR)))
  :: ~&  ITTWIR+I.T.T.WIR
  :_  +>.$  :_  ~
  :+  OST.HID  %DIFF
  ?+  I.WIR  NULL+~
      $X
    =,  ENJS:FORMAT
    ?~  R.RES
      JSON+(PAIRS ERR+S+%EMPTY-RESPONSE CODE+(NUMB P.RES) ~)
    =+  JON=(RUSH Q.U.R.RES APEX:DE-JSON)
    ?~  JON
      JSON+(PAIRS ERR+S+%BAD-JSON CODE+(NUMB P.RES) BODY+S+Q.U.R.RES ~)
    ?.  =(2 (DIV P.RES 100))
      JSON+(PAIRS ERR+S+%REQUEST-REJECTED CODE+(NUMB P.RES) MSG+U.JON ~)
    ::
    ::  ONCE WE KNOW WE HAVE GOOD DATA, WE DRILL INTO THE JSON
    ::  TO FIND THE SPECIFIC PIECE OF DATA REFERRED TO BY 'ARG'
    ::
  |-  ^-  SUBSCRIPTION-RESULT
  ?~  ARG
    =+  SWITCH=T.T.T.T.WIR
    ?+  SWITCH  [%JSON `JSON`U.JON]
      {$MESSAGES ~}
    =/  NEW-MEZES
      ((OT MESSAGES+(AR (OT ID+SO 'THREADID'^SO ~)) ~):DEJS-SOFT:FORMAT U.JON)
    ::%+  TURN  NEW-MEZES
    ::|=  ID
    ::?<  ?=(~ NEW-MEZES)
    ::=.  RECEIVED-IDS  [NEW-MEZES RECEIVED-IDS]
    ::~&  RECEIVED-IDS
    ::=.  RECEIVED
    [%INBOX (NEED NEW-MEZES)]
      ::
      {$MESSAGES @T ~}
      ::
    :: =+  BODY-PARSER==+(JO (OT BODY+(OT DATA+(CU OFIS-GOOGLE SO) ~) ~)) :: (OK /BODY/DATA SO):JO
    :: ~&  %.(U.JON (OM (OM |=(A/JSON (SOME -.A))):JO))
    :: ~&  %.(U.JON (OT HEADERS+(CU MILT (AR (OT NAME+SO VALUE+SO ~))) ~))
    =+  ^-  $:  HEADERS/{FROM/@T SUBJECT/@T}
                ::BODY-TEXT/WAIN
            ==
        ~|  U.JON
        =-  (NEED (REPARSE U.JON))
        ^=  REPARSE
        =,  DEJS-SOFT:FORMAT
        =+  ^=  FROM-AND-SUBJECT
            |=  A/(MAP @T @T)  ^-  {@T @T}
            [(~(GOT BY A) 'FROM') (~(GOT BY A) 'SUBJECT')]
        =+  ^=  TEXT-BODY
            |=  A/(LIST {@T @T})  ^-  WAIN
            %-  TO-WAIN
            %-  OFIS-GOOGLE
            (~(GOT BY (~(GAS BY *(MAP @T @T)) A)) 'TEXT/PLAIN')
        %+  EASY-OT  %PAYLOAD
        %-  OT  :~
          HEADERS+(CU FROM-AND-SUBJECT (CU ~(GAS BY *(MAP @T @T)) (AR (OT NAME+SO VALUE+SO ~))))
          :: PARTS+(CU TEXT-BODY (AR (OT 'MIMETYPE'^SO BODY+(OT DATA+SO ~) ~)))
        ==
    :: =+  PARSED-HEADERS==+(JO ((OT PAYLOAD+(EASY-OT 'HEADERS' (AR SOME)) ~) U.JON)) ::
    :: =+  PARSED-MESSAGE==+(JO ((OT PAYLOAD+(EASY-OT 'PARTS' (AR BODY-PARSER)) ~) U.JON)) ::
    ::~&  [HEADERS BODY-TEXT]
    ::=+  BODY==+(JO ((OT BODY+(EASY-OT 'BODY' (EASY-OT 'DATA' SO))) PARSED-MESSAGE))
    [%MESSAGE HEADERS]
    ==
  ::
  =+  DIR=((OM:DEJS-SOFT:FORMAT SOME) U.JON)
  ?~  DIR  JSON+(PAIRS:ENJS:FORMAT ERR+S+%NO-CHILDREN ~)
  =+  NEW-JON=(~(GET BY U.DIR) I.ARG)
  `SUBSCRIPTION-RESULT`$(ARG T.ARG, U.JON ?~(NEW-JON ~ U.NEW-JON))
           ::  REDO WITH NEXT ARGUMENT
  ::
    $Y
  ?~  R.RES
    ~&  [ERR+S+%EMPTY-RESPONSE CODE+(NUMB:ENJS:FORMAT P.RES)]
      ARCH+*ARCH
  =+  JON=(RUSH Q.U.R.RES APEX:DE-JSON)
  ?~  JON
    ~&  [ERR+S+%BAD-JSON CODE+(NUMB:ENJS:FORMAT P.RES) BODY+S+Q.U.R.RES]
    ARCH+*ARCH
  ?.  =(2 (DIV P.RES 100))
    ~&  [ERR+S+%REQUEST-REJECTED CODE+(NUMB:ENJS:FORMAT P.RES) MSG+U.JON]
    ARCH+*ARCH
    ::
    ::  ONCE WE KNOW WE HAVE GOOD DATA, WE DRILL INTO THE JSON
    ::  TO FIND THE SPECIFIC PIECE OF DATA REFERRED TO BY 'ARG'
    ::
    |-  ^-  SUBSCRIPTION-RESULT
    =+  DIR=((OM:DEJS-SOFT:FORMAT SOME) U.JON)
    ?~  DIR
      [%ARCH `(SHAX (JAM U.JON)) ~]
    ?~  ARG
      [%ARCH `(SHAX (JAM U.JON)) (~(RUN BY U.DIR) ,~)]
    =+  NEW-JON=(~(GET BY U.DIR) I.ARG)
    $(ARG T.ARG, U.JON ?~(NEW-JON ~ U.NEW-JON))
  ==
::
++  SIGH-TANG  |=({A/WIRE B/TANG} (MEAN >GMAIL+A< B))
++  SIGH
  |=  A/*
  ~&  A+A
  :_  +>.$  ~
::
++  HELP
  |=  {REN/CARE:CLAY STYLE/@TAS PAX/PATH}
  =^  QUERY  PAX
    =+  XAP=(FLOP PAX)
    ?~  XAP  [~ ~]
    =+  QUERY=(RUSH I.XAP ;~(PFIX WUT YQUY:DE-PURL))
    ?~  QUERY  [~ PAX]
    [U.QUERY (FLOP T.XAP)]
  =^  ARG  PAX  ~|(PAX [+ -]:(SPLIT PAX))
  ~|  [PAX=PAX ARG=ARG QUERY=QUERY]
  =|  MOW/(LIST MOVE)
  |%
  ::  RESOLVE CORE
  ::
  ++  MAKE-MOVE
    ^-  {(LIST MOVE) _+>.$}
    [(FLOP MOW) +>.$]
    ::
  ++  ENDPOINT-TO-PURL
    |=  ENDPOINT/PATH
    ^-  PURL:EYRE
    %+  SCAN
      "HTTPS://WWW.GOOGLEAPIS.COM/GMAIL/V1/USERS/ME{<`PATH`ENDPOINT>}"
    AURI:DE-PURL
    ::  SEND AN HTTP REQ
  ++  SEND-HTTP
    |=  HIZ/HISS:EYRE
    ^+  +>
    =+  WIR=`WIRE`[REN (SCOT %UD COUNT) (SCOT %UV (JAM ARG)) STYLE PAX]
    =+  NEW-MOVE=[OST.HID %HISS WIR `~ %HTTR [%HISS HIZ]]
    +>.$(MOW [NEW-MOVE MOW])
  ::
  ++  SCRY
    ^+  .
    ?+  STYLE  ~|(%INVALID-STYLE !!)
      $READ   READ
::        $LISTEN LISTEN
    ==
  :: STANDARD GET REQUEST
  ++  READ  (SEND-HTTP (ENDPOINT-TO-PURL PAX) %GET ~ ~)

  ::  SUBSCRIPTION REQUEST
::    ++  LISTEN
::      ^+  .
::      =+  EVENTS=?>(?=([@ @ *] PAX) T.T.PAX)
::      |-  ^+  +>.$
::      ?~  EVENTS
::        +>.$
::      ?:  (~(HAS BY WEB-HOOKS) I.EVENTS)                ::  IF HOOK EXISTS
::        =.  +>.$  (UPDATE-HOOK I.EVENTS)
::        $(EVENTS T.EVENTS)
::      =.  +>.$  (CREATE-HOOK I.EVENTS)
::      $(EVENTS T.EVENTS)
    ::
  --
--
