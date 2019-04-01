::  OAUTH 1.0 %AUTHORIZATION HEADER
::
::::  /HOON/OAUTH1/LIB
  ::
/+    INTERPOLATE, HEP-TO-CAB
=,  MIMES:HTML
=,  EYRE
|%
++  KEYS  CORD:{KEY/@T SEC/@T}                          ::  APP KEY PAIR
++  TOKEN                                               ::  USER KEYS
  $@  ~                                                ::  NONE
  $%  {$REQUEST-TOKEN OAUTH-TOKEN/@T TOKEN-SECRET/@T}   ::  INTERMEDIATE
      {$ACCESS-TOKEN OAUTH-TOKEN/@T TOKEN-SECRET/@T}    ::  FULL
  ==
++  QUAY-ENC  (LIST TAPE)              ::  PARTIALLY RENDERED QUERY STRING
--
::
::::
  ::
|%
++  PARSE-URL  PARSE-URL:INTERPOLATE
++  JOIN
  |=  {A/CORD B/(LIST CORD)}
  ?~  B  ''
  (RAP 3 |-([I.B ?~(T.B ~ [A $(B T.B)])]))
::
++  JOINT                                              ::  BETWEEN EVERY PAIR
  |=  {A/TAPE B/WALL}  ^-  TAPE
  ?~  B  B
  |-  ^-  TAPE
  ?~  T.B  I.B
  :(WELD I.B A $(B T.B))
::
++  JOIN-EN-URLE  |=(A/(LIST TAPE) (JOINT "&" (TURN A EN-URLT:HTML)))
::   QUERY STRING IN OAUTH1 'K1="V1", K2="V2"' FORM
++  TO-HEADER
  |=  A/QUAY  ^-  TAPE
  %+  JOINT  ", "
  (TURN A |=({K/@T V/@T} `TAPE`~[K '="' V '"']))        ::  NORMALIZED LATER
::
::   PARTIAL TAIL:EN-PURL:HTML FOR SORTING
++  ENCODE-PAIRS
  |=  A/QUAY  ^-  QUAY-ENC
  %+  TURN  A
  |=  {K/@T V/@T}  ^-  TAPE
  :(WELD (EN-URLT:HTML (TRIP K)) "=" (EN-URLT:HTML (TRIP V)))
::
++  PARSE-PAIRS                                         ::  X-FORM-EN-URLT:HTMLNCODED
  |=  BOD/(UNIT OCTS)  ^-  QUAY-ENC
  ~|  %PARSING-BODY
  ?~  BOD  ~
  (RASH Q.U.BOD (MORE PAD (PLUS ;~(LESS PAD PRN))))
::
++  POST-QUAY
  |=  {A/PURL B/QUAY}  ^-  HISS
  =.  B  (QUAY:HEP-TO-CAB B)
  =-  [A %POST - ?~(B ~ (SOME (AS-OCTT +:(TAIL:EN-PURL:HTML B))))]
  (MY CONTENT-TYPE+['APPLICATION/X-WWW-FORM-URLENCODED']~ ~)
::
::
++  MEAN-WALL  !.
  |=  {A/TERM B/TAPE}  ^+  !!
  =-  (MEAN (FLOP `TANG`[>A< -]))
  (TURN (TO-WAIN:FORMAT (CRIP B)) |=(C/CORD LEAF+(TRIP C)))
::
++  BAD-RESPONSE  |=(A/@U ?:(=(2 (DIV A 100)) | ~&(BAD-HTTR+A &)))
++  QUAY-KEYS  |-($@(KNOT {$ $}))  :: IMPROPER TREE
++  GRAB-QUAY  :: ?=({@T @T @T} (GRAB-QUAY R:*HTTR %KEY1 %KEY2 %KEY3))
  |*  {A/(UNIT OCTS) B/QUAY-KEYS}
  =+  ~|  BAD-QUAY+A
      C=(RASH Q:(NEED `(UNIT OCTS)`A) YQUY:DE-PURL:HTML)
  ~|  GRAB-QUAY+[C B]
  =+  ALL=(MALT C)
  %.  B
  |*  B/QUAY-KEYS
  ?@  B  ~|(B (~(GOT BY ALL) B))
  [(..$ -.B) (..$ +.B)]
--
::
::::
  ::
|_  {(BALE KEYS) TOK/TOKEN}
++  CONSUMER-KEY     KEY:DECODE-KEYS
++  CONSUMER-SECRET  SEC:DECODE-KEYS
++  DECODE-KEYS                       :: XX FROM BALE W/ TYPED %JAEL
  ^-  {KEY/@T SEC/@T ~}
  ?.  =(~ `@`KEY)
    ~|  %OAUTH-BAD-KEYS
    ((HARD {KEY/@T SEC/@T ~}) (TO-WAIN:FORMAT KEY))
  %+  MEAN-WALL  %OAUTH-NO-KEYS
  """
  RUN |INIT-OAUTH1 {<`PATH`DOM>}
  IF NECESSARY, OBTAIN CONSUMER KEYS CONFIGURED FOR A OAUTH_CALLBACK OF
    {(TRIP OAUTH-CALLBACK)}
  """
::
++  EXCHANGE-TOKEN
  |=  A/$@(@T PURL)  ^-  HISS
  (POST-QUAY (PARSE-URL A) ~)
::
++  REQUEST-TOKEN
  |=  A/$@(@T PURL)  ^-  HISS
  (POST-QUAY (PARSE-URL A) OAUTH-CALLBACK+OAUTH-CALLBACK ~)
::
++  OUR-HOST  .^(HART %E /(SCOT %P OUR)/HOST/REAL)
++  OAUTH-CALLBACK
  ~&  [%OAUTH-WARNING "MAKE SURE THIS URBIT ".
                      "IS RUNNING ON {(EN-PURL:HTML OUR-HOST `~ ~)}"]
  %-    CRIP    %-  EN-PURL:HTML
  %^  INTO-URL:INTERPOLATE  'HTTPS://OUR-HOST/~/AC/:DOMAIN/:USER/IN'
    `OUR-HOST
  :~  DOMAIN+(JOIN '.' (FLOP DOM))
      USER+(SCOT %TA USR)
  ==
::
++  AUTH-URL
  |=  URL/$@(@T PURL)  ^-  PURL
  %+  ADD-QUERY:INTERPOLATE  URL
  %-  QUAY:HEP-TO-CAB
  ?.  ?=({$REQUEST-TOKEN ^} TOK)
    ~|(%NO-TOKEN-FOR-DIALOG !!)
  :-  OAUTH-TOKEN+OAUTH-TOKEN.TOK
  ?~(USR ~ [SCREEN-NAME+USR]~)
::
++  GRAB-TOKEN-RESPONSE
  |=  A/HTTR  ^-  {TOK/@T SEC/@T}
  (GRAB-QUAY R.A 'OAUTH_TOKEN' 'OAUTH_TOKEN_SECRET')
::
++  IDENTITY
  %+  WELD
    ?~(USR "DEFAULT IDENTITY FOR " "{(TRIP USR)}@")
  (TRIP (JOIN '.' (FLOP DOM)))
::
++  CHECK-SCREEN-NAME
  |=  A/HTTR  ^-  ?
  =+  NAM=(GRAB-QUAY R.A 'SCREEN_NAME')
  ?~  USR  &
  ?:  =(USR NAM)  &
  =<  |
  %-  %*(. SLOG PRI 1)
  ::  XX CGYARVIN SHOULD FIGURE OUT WHY WE NEED TO CAST TO ~
  (FLOP P:(MULE |.(~|(WRONG-USER+[REQ=USR GOT=NAM] `~`!!))))
::
++  CHECK-TOKEN-QUAY
  |=  A/QUAY  ^+  %&
  =.  A  (SORT A AOR)
  ?.  ?=({{$'OAUTH_TOKEN' OAUTH-TOKEN/@T} {$'OAUTH_VERIFIER' @T} ~} A)
    ~|(NO-TOKEN+A !!)
  ?~  TOK
    %+  MEAN-WALL  %NO-SECRET-FOR-TOKEN
    """
    ATTEMPTING TO AUTHORIZE {IDENTITY}
    """
  ?.  =(OAUTH-TOKEN.TOK OAUTH-TOKEN.Q.I.A)
    ~|  WRONG-TOKEN+[ID=USR Q.I.A]
    ~|(%MULTIPLE-TOKENS-UNSUPPORTED !!)
  %&
::
++  AUTH
  |%
  ++  HEADER
    |=  {AUQ/QUAY URL/PURL MED/METH MATH BOD/(UNIT OCTS)}
    ^-  CORD
    =^  QUY  URL  [R.URL URL(R ~)]      :: QUERY STRING HANDLED SEPARATELY
    =.  AUQ  (QUAY:HEP-TO-CAB (WELD AUQ COMPUTED-QUERY))
    =+  ^-  QEN/QUAY-ENC                 :: SEMI-ENCODED FOR SORTING
        %+  WELD  (PARSE-PAIRS BOD)
        (ENCODE-PAIRS (WELD AUQ QUY))
    =+  BAY=(BASE-STRING MED URL QEN)
    =+  SIG=(SIGN SIGNING-KEY BAY)
    =.  AUQ  ['OAUTH_SIGNATURE'^(CRIP (EN-URLT:HTML SIG)) AUQ]
    (CRIP "OAUTH {(TO-HEADER AUQ)}")
  ::
  ++  COMPUTED-QUERY
    ^-  QUAY
    :~  OAUTH-CONSUMER-KEY+CONSUMER-KEY
        OAUTH-NONCE+(SCOT %UW (SHAF %NON ENY))
        OAUTH-SIGNATURE-METHOD+'HMAC-SHA1'
        OAUTH-TIMESTAMP+(RSH 3 2 (SCOT %UI (UNT:CHRONO:USERLIB NOW)))
        OAUTH-VERSION+'1.0'
    ==
  ++  BASE-STRING
    |=  {MED/METH URL/PURL QEN/QUAY-ENC}  ^-  TAPE
    =.  QEN  (SORT QEN AOR)
    %-  JOIN-EN-URLE
    :~  (CUSS (TRIP `@T`MED))
        (EN-PURL:HTML URL)
        (JOINT "&" QEN)
    ==
  ++  SIGN
    |=  {KEY/CORD BAY/TAPE}  ^-  TAPE
    %-  EN-BASE64:MIMES:HTML
    %+  SWP  3
    (HMAC-SHA1T:HMAC:CRYPTO KEY (CRIP BAY))
  ::
  ++  SIGNING-KEY
    %-  CRIP
    %-  JOIN-EN-URLE  :~
      (TRIP CONSUMER-SECRET)
      (TRIP ?^(TOK TOKEN-SECRET.TOK ''))
    ==
  --
::
++  ADD-AUTH-HEADER
  |=  {EXTRA/QUAY REQUEST/{URL/PURL METH HED/MATH (UNIT OCTS)}}
  ^-  HISS
  ::  =.  URL.REQUEST  [| `6.000 [%& /LOCALHOST]]       ::  FOR USE WITH UNIX NC
  ~&  ADD-AUTH-HEADER+(EN-PURL:HTML URL.REQUEST)
  %_    REQUEST
      HED
    (~(ADD JA HED.REQUEST) %AUTHORIZATION (HEADER:AUTH EXTRA REQUEST))
  ==
::  EXPECTED SEMANTICS, TO BE COPIED AND MODIFIED IF ANYTHING DOESN'T WORK
++  STANDARD
  |*  {DONE/* SAVE/$-(TOKEN *)}                         ::  SAVE/$-(TOKEN _DONE)
  |%
  ++  SAVE  ^-($-(TOKEN _DONE) ^SAVE)                   ::  SHADOW(TYPE CANARY)
  ++  CORE-MOVE  $^({SEC-MOVE _DONE} SEC-MOVE)          ::  STATEFUL
  ::
  ::  USE TOKEN TO SIGN AUTHORIZATION HEADER. EXPECTS:
  ::    ++  RES  RES-HANDLE-REQUEST-TOKEN               ::  SAVE REQUEST TOKEN
  ::    ++  IN   (IN-TOKEN-EXHANGE 'HTTP://...')        ::  HANDLE CALLBACK
  ++  OUT-ADD-HEADER
    |=  {REQUEST-URL/$@(@T PURL) DIALOG-URL/$@(@T PURL)}
    ::
    |=  A/HISS  ^-  $%({$SEND HISS} {$SHOW PURL})
    ?-    TOK
        ~
      [%SEND (ADD-AUTH-HEADER ~ (REQUEST-TOKEN REQUEST-URL))]
    ::
        {$ACCESS-TOKEN ^}
      [%SEND (ADD-AUTH-HEADER [OAUTH-TOKEN+OAUTH-TOKEN.TOK]~ A)]
    ::
        {$REQUEST-TOKEN ^}
      [%SHOW (AUTH-URL DIALOG-URL)]
    ==
  ::
  ::  IF NO TOKEN IS SAVED, THE HTTP RESPONSE WE JUST GOT HAS A REQUEST TOKEN
  ++  RES-HANDLE-REQUEST-TOKEN
    |=  A/HTTR  ^-  CORE-MOVE
    ?^  TOK  [%GIVE A]
    ?.  =(%TRUE (GRAB-QUAY R.A 'OAUTH_CALLBACK_CONFIRMED'))
      ~|(%CALLBACK-REJECTED !!)
    =+  REQUEST-TOKEN=(GRAB-TOKEN-RESPONSE A)
    [[%REDO ~] (SAVE `TOKEN`[%REQUEST-TOKEN REQUEST-TOKEN])]
  ::
  ::  EXCHANGE OAUTH_TOKEN IN QUERY STRING FOR ACCESS TOKEN. EXPECTS:
  ::    ++  BAK  BAK-SAVE-TOKEN                         :: SAVE ACCESS TOKEN
  ++  IN-EXCHANGE-TOKEN
    |=  EXCHANGE-URL/$@(@T PURL)
    ::
    |=  A/QUAY  ^-  SEC-MOVE
    ?>  (CHECK-TOKEN-QUAY A)
    [%SEND (ADD-AUTH-HEADER A (EXCHANGE-TOKEN EXCHANGE-URL))]
  ::
  ::  IF A VALID ACCESS TOKEN HAS BEEN RETURNED, SAVE IT
  ++  BAK-SAVE-TOKEN
    |=  A/HTTR  ^-  CORE-MOVE
    ?:  (BAD-RESPONSE P.A)
      [%GIVE A]  :: [%REDO ~]  ::  HANDLE 4XX?
    ?.  (CHECK-SCREEN-NAME A)
      [[%REDO ~] (SAVE `TOKEN`~)]
    =+  ACCESS-TOKEN=(GRAB-TOKEN-RESPONSE A)
    [[%REDO ~] (SAVE `TOKEN`[%ACCESS-TOKEN ACCESS-TOKEN])]
  --
--
::
::::  EXAMPLE "STANDARD" SEC/ CORE:
  ::
::
::  ::
::  ::::  /HOON/MY-API/COM/SEC
::    ::
::  /+    OAUTH1
::  ::
::  ::::
::    ::
::  |_  {BAL/(BALE KEYS:OAUTH1) TOK/TOKEN:OAUTH1}
::  ++  AUT  (~(STANDARD OAUTH1 BAL TOK) . |=(TOK/TOKEN:OAUTH1 +>(TOK TOK)))
::  ++  OUT
::    %+  OUT-ADD-HEADER:AUT
::      REQUEST-TOKEN='HTTPS://MY-API.COM/REQUEST_TOKEN'
::    OAUTH-DIALOG='HTTPS://MY-API.COM/AUTHORIZE'
::  ::
::  ++  RES  RES-HANDLE-REQUEST-TOKEN:AUT
::  ++  IN
::    %-  IN-EXCHAGNE-TOKEN:AUT
::    EXCHANGE-URL='HTTPS://MY-API.COM/ACCESS_TOKEN'
::  ::
::  ++  BAK  BAK-SAVE-TOKEN:AUT
::  --
::
::
::::  EQUIVALENT IMPERATIVE CODE:
  ::
::
::  ::
::  ::::  /HOON/MY-API/COM/SEC
::    ::
::  /+    OAUTH1
::  ::
::  ::::
::    ::
::  |_  {BAL/(BALE KEYS:OAUTH1) TOK/TOKEN:OAUTH1}
::  ++  AUT  ~(. OAUTH1 BAL TOK)
::  ++  OUT  ::  ADD HEADER
::    =+  AUT
::    |=  REQ/HISS  ^-  $%({$SEND HISS} {$SHOW PURL})
::    ?~  TOK
::      [%SEND (ADD-AUTH-HEADER ~ (REQUEST-TOKEN 'HTTPS://MY-API.COM/REQUEST_TOKEN'))]
::    ?:  ?=($REQUEST-TOKEN -.TOK)
::      [%SHOW (AUTH-URL 'HTTPS://MY-API.COM/AUTHORIZE')]
::    [%SEND (ADD-AUTH-HEADER [OAUTH-TOKEN+OUATH-TOKEN.TOK]~ REQ)]
::  ::
::  ++  RES  :: HANDLE REQUEST TOKEN
::    =+  AUT
::    |=  RES/HTTR  ^-  $%({{$REDO ~} _..RES} {$GIVE HTTR})
::    ?^  TOK  [%GIVE A]
::    ?>  =(%TRUE (GRAB R.RES 'OAUTH_CALLBACK_CONFIRMED'))
::    =.  TOK  [%REQUEST-TOKEN (GRAB-TOKEN-RESPONSE RES)]
::    [[%REDO ~] ..RES]
::  ::
::  ++  IN  ::  EXCHANGE TOKEN
::    =+  AUT
::    |=  INP/QUAY  ^-  {$SEND HISS}
::    ?>  (CHECK-TOKEN-QUAY INP)
::    :-  %SEND
::    (ADD-AUTH-HEADER INP (EXCHANGE-TOKEN 'HTTPS://MY-API.COM/ACCESS_TOKEN'))
::  ::
::  ++  BAK  ::  SAVE TOKEN
::    =+  AUT
::    |=  BAK/HTTR  ^-  $%({{$REDO ~} _..BAK} {$GIVE HTTR})
::    ?:  (BAD-RESPONSE BAK)  [%GIVE BAK]
::    =.  TOK  [%ACCESS-TOKEN (GRAB-TOKEN-RESPONSE RES)]
::    [[%REDO ~] ..BAK]
::  --
::
