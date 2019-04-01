/+  BASE64, PRIMITIVE-RSA, *PKCS
=*  RSA  PRIMITIVE-RSA
|%
::  +EN-BASE64URL: URL-SAFE BASE64 ENCODING, WITHOUT PADDING
::
++  EN-BASE64URL
  ~(EN BASE64 | &)
::  +DE-BASE64URL: URL-SAFE BASE64 DECODING, WITHOUT PADDING
::
++  DE-BASE64URL
  ~(DE BASE64 | &)
::  |OCTN: ENCODE/DECODE UNSIGNED ATOMS AS BIG-ENDIAN OCTET STREAM
::
++  OCTN
  |%
  ++  EN  |=(A=@U `OCTS`[(MET 3 A) (SWP 3 A)])
  ++  DE  |=(A=OCTS `@U`(REV 3 P.A Q.A))
  --
::  +EOR: EXPLICIT SORT ORDER COMPARATOR
::
::    LOOKUP :A AND :B IN :LIT, AND PASS THEIR INDICES TO :COM.
::
++  EOR
  |=  [COM=$-([@ @] ?) LIT=(LIST)]
  |=  [A=* B=*]
  ^-  ?
  (FALL (BIND (BOTH (FIND ~[A] LIT) (FIND ~[B] LIT)) COM) |)
::  +EN-JSON-SORT: JSON ENCODING WITH SORTED OBJECT KEYS
::
::    XX MOVE %ZUSE WITH SORTING OPTIONAL?
::
++  EN-JSON-SORT                                 ::  XX RENAME
  |^  |=([SOR=$-(^ ?) VAL=JSON] (APEX VAL SOR ""))
  ::                                                  ::  ++APEX:EN-JSON:HTML
  ++  APEX
    =,  EN-JSON:HTML
    |=  {VAL/JSON SOR/$-(^ ?) REZ/TAPE}
    ^-  TAPE
    ?~  VAL  (WELD "NULL" REZ)
    ?-    -.VAL
        $A
      :-  '['
      =.  REZ  [']' REZ]
      !.
      ?~  P.VAL  REZ
      |-
      ?~  T.P.VAL  ^$(VAL I.P.VAL)
      ^$(VAL I.P.VAL, REZ [',' $(P.VAL T.P.VAL)])
   ::
        $B  (WELD ?:(P.VAL "TRUE" "FALSE") REZ)
        $N  (WELD (TRIP P.VAL) REZ)
        $S
      :-  '"'
      =.  REZ  ['"' REZ]
      =+  VIZ=(TRIP P.VAL)
      !.
      |-  ^-  TAPE
      ?~  VIZ  REZ
      =+  HED=(JESC I.VIZ)
      ?:  ?=({@ $~} HED)
        [I.HED $(VIZ T.VIZ)]
      (WELD HED $(VIZ T.VIZ))
   ::
        $O
      :-  '{'
      =.  REZ  ['}' REZ]
      =/  VIZ
        %+  SORT  ~(TAP BY P.VAL)
        |=((PAIR) (SOR (HEAD P) (HEAD Q)))
      ?~  VIZ  REZ
      !.
      |-  ^+  REZ
      ?~  T.VIZ  ^$(VAL [%S P.I.VIZ], REZ [':' ^$(VAL Q.I.VIZ)])
      =.  REZ  [',' $(VIZ T.VIZ)]
      ^$(VAL [%S P.I.VIZ], REZ [':' ^$(VAL Q.I.VIZ)])
    ==
  --
::  %/LIB/JOSE
::
::  |JWK: JSON REPRESENTATIONS OF CRYPTOGRAPHIC KEYS (RFC7517)
::
::    URL-SAFE BASE64 ENCODING OF KEY PARAMETERS IN BIG-ENDIAN BYTE ORDER.
::    RSA-ONLY FOR NOW
::
++  JWK
  |%
  ::  |EN:JWK: ENCODING OF JSON CRYPTOGRAPHIC KEYS
  ::
  ++  EN
    =>  |%
        ::  +NUMB:EN:JWK: BASE64-URL ENCODE BIG-ENDIAN NUMBER
        ::
        ++  NUMB  (CORL EN-BASE64URL EN:OCTN)
        --
    |%
    ::  +PASS:EN:JWK: JSON ENCODE PUBLIC KEY
    ::
    ++  PASS
      |=  K=KEY:RSA
      ^-  JSON
      [%O (MY KTY+S+'RSA' N+S+(NUMB N.PUB.K) E+S+(NUMB E.PUB.K) ~)]
    ::  +RING:EN:JWK: JSON ENCODE PRIVATE KEY
    ::
    ++  RING
      |=  K=KEY:RSA
      ^-  JSON
      ~|  %RSA-NEED-RING
      ?>  ?=(^ SEK.K)
      :-  %O  %-  MY  :~
        KTY+S+'RSA'
        N+S+(NUMB N.PUB.K)
        E+S+(NUMB E.PUB.K)
        D+S+(NUMB D.U.SEK.K)
        P+S+(NUMB P.U.SEK.K)
        Q+S+(NUMB Q.U.SEK.K)
      ==
    --
  ::  |DE:JWK: DECODING OF JSON CRYPTOGRAPHIC KEYS
  ::
  ++  DE
    =,  DEJS-SOFT:FORMAT
    =>  |%
        ::  +NUMB:DE:JWK: PARSE BASE64-URL BIG-ENDIAN NUMBER
        ::
        ++  NUMB  (CU (CORK DE-BASE64URL (LIFT DE:OCTN)) SO)
        --
    |%
    ::  +PASS:DE:JWK: DECODE JSON PUBLIC KEY
    ::
    ++  PASS
      %+  CI
        =/  A  (UNIT @UX)
        |=  [KTY=@T N=A E=A]
        ^-  (UNIT KEY:RSA)
        =/  PUB  (BOTH N E)
        ?~(PUB ~ `[U.PUB ~])
      (OT KTY+(SU (JEST 'RSA')) N+NUMB E+NUMB ~)
    ::  +RING:DE:JWK: DECODE JSON PRIVATE KEY
    ::
    ++  RING
      %+  CI
        =/  A  (UNIT @UX)
        |=  [KTY=@T N=A E=A D=A P=A Q=A]
        ^-  (UNIT KEY:RSA)
        =/  PUB  (BOTH N E)
        =/  SEK  :(BOTH D P Q)
        ?:(|(?=(~ PUB) ?=(~ SEK)) ~ `[U.PUB SEK])
      (OT KTY+(SU (JEST 'RSA')) N+NUMB E+NUMB D+NUMB P+NUMB Q+NUMB ~)
    --
  ::  |THUMB:JWK: "THUMBPRINT" JSON-ENCODED KEY (RFC7638)
  ::
  ++  THUMB
    |%
    ::  +PASS:THUMB:JWK: THUMBPRINT JSON-ENCODED PUBLIC KEY
    ::
    ++  PASS
      |=  K=KEY:RSA
      (EN-BASE64URL 32 (SHAX (CRIP (EN-JSON-SORT AOR (PASS:EN K)))))
    ::  +RING:THUMB:JWK: THUMBPRINT JSON-ENCODED PRIVATE KEY
    ::
    ++  RING  !!
    --
  --
::  |JWS: JSON WEB SIGNATURES (RFC7515)
::
::    NOTE: FLATTENED SIGNATURE FORM ONLY.
::
++  JWS
  |%
  ::  +SIGN:JWS: SIGN JSON VALUE
  ::
  ++  SIGN
    |=  [K=KEY:RSA PRO=JSON LOD=JSON]
    |^  ^-  JSON
        =.  PRO  HEADER
        =/  PROTECT=CORD  (ENCODE PRO)
        =/  PAYLOAD=CORD  (ENCODE LOD)
        :-  %O  %-  MY  :~
          PROTECTED+S+PROTECT
          PAYLOAD+S+PAYLOAD
          SIGNATURE+S+(SIGN PROTECT PAYLOAD)
        ==
    ::  +HEADER:SIGN:JWS: SET SIGNATURE ALGORITHM IN HEADER
    ::
    ++  HEADER
      ?>  ?=([%O *] PRO)
      ^-  JSON
      [%O (~(PUT BY P.PRO) %ALG S+'RS256')]
    ::  +ENCODE:SIGN:JWS: ENCODE JSON FOR SIGNING
    ::
    ::    ALPHABETICALLY SORT OBJECT KEYS, URL-SAFE BASE64 ENCODE
    ::    THE SERIALIZED JSON.
    ::
    ++  ENCODE
      |=  JON=JSON
      %-  EN-BASE64URL
      %-  AS-OCTT:MIMES:HTML
      (EN-JSON-SORT AOR JON)
    ::  +SIGN:SIGN:JWS: COMPUTE SIGNATURE
    ::
    ::    URL-SAFE BASE64 ENCODE IN BIG-ENDIAN BYTE ORDER.
    ::
    ++  SIGN
      |=  [PROTECT=CORD PAYLOAD=CORD]
      =/  MSG=@T   (RAP 3 ~[PROTECT '.' PAYLOAD])
      =/  SIG=@UD  (~(SIGN RS256 K) (MET 3 MSG) MSG)
      =/  LEN=@UD  (MET 3 N.PUB.K)
      (EN-BASE64URL LEN (REV 3 LEN SIG))
    --
  ::  +VERIFY:JWS: VERIFY SIGNATURE
  ::
  ++  VERIFY  !!
  --
--
