/-  ASN1
/+  PRIMITIVE-RSA, DER, BASE64
=*  RSA  PRIMITIVE-RSA
::::  %/LIB/PKCS
|%
::  +JOIN: JOIN LIST OF CORDS WITH SEPARATOR
::
::   XX MOVE TO ZUSE?
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
::
::  +RS256: RSA SIGNATURES OVER A SHA-256 DIGEST
::
++  RS256
  |_  K=KEY:RSA
  ::  +EMSA:RS256: MESSAGE DIGEST
  ::
  ::    PADDED, DER ENCODED SHA-256 HASH (EMSA-PKCS1-V1_5).
  ::
  ++  EMSA
    |=  M=BYTS
    =/  EMLEN  (MET 3 N.PUB.K)
    =/  PEC=SPEC:ASN1
      :~  %SEQ
          [%SEQ [%OBJ SHA-256:OBJ:ASN1] [%NUL ~] ~]
          [%OCT 32 (SHAY WID.M DAT.M)]
      ==
    ::  NOTE: THIS ASN.1 DIGEST IS RENDERED RAW HERE, AS WE REQUIRE
    ::  BIG-ENDIAN BYTES, AND THE PRODUCT OF +EN:DER IS LITTLE-ENDIAN
    ::
    =/  T=(LIST @D)  ~(REN RAW:EN:DER PEC)
    =/  TLEN=@UD  (LENT T)
    ?:  (LTH EMLEN (ADD 11 TLEN))
      ~|(%EMSA-TOO-SHORT !!)
    =/  PS=(LIST @D)
      (REAP (SUB EMLEN (ADD 3 TLEN)) 0XFF)
    (REP 3 (FLOP (WELD [0X0 0X1 PS] [0X0 T])))
  ::  +SIGN:RS256: SIGN MESSAGE
  ::
  ::    AN RSA SIGNATURE IS THE PRIMITIVE DECRYPTION OF THE MESSAGE HASH.
  ::
  ++  SIGN
    |=(M=BYTS (DE:RSA (EMSA M) K))
  ::  +VERIFY:RS256: VERIFY SIGNATURE
  ::
  ::    RSA SIGNATURE VERIFICATION CONFIRMS THAT THE PRIMITIVE ENCRYPTION
  ::    OF THE SIGNATURE MATCHES THE MESSAGE HASH.
  ::
  ++  VERIFY
    |=  [S=@ M=BYTS]
    =((EMSA M) (EN:RSA S K))
  --
::  |PEM: GENERIC PEM IMPLEMENTATION (RFC7468)
::
::    PEM IS THE BASE64 ENCODING OF DER ENCODED DATA, WITH BEGIN AND
::    END LABELS INDICATING SOME TYPE.
::
++  PEM
  |%
  ::  +EN:PEM: PEM ENCODE
  ::
  ++  EN
    |=  [LAB=@T LEN=@UD DER=@UX]
    ^-  WAIN
    :: XX VALIDATE LABEL?
    :-  (RAP 3 ['-----BEGIN ' LAB '-----' ~])
    =/  A  (EN:BASE64 LEN `@`DER)
    |-  ^-  WAIN
    ?~  A
      [(RAP 3 ['-----END ' LAB '-----' ~]) ~]
    [(END 3 64 A) $(A (RSH 3 64 A))]
  ::  +DE:PEM: PEM DECODE
  ::
  ++  DE
    |=  [LAB=@T MEP=WAIN]
    ^-  (UNIT [LEN=@UD DER=@UX])
    =/  A  (SUB (LENT MEP) 2)
    ?~  MEP  ~
    :: XX VALIDATE LABEL?
    ?.  =((RAP 3 ['-----BEGIN ' LAB '-----' ~]) I.MEP)  ~
    ?.  =((RAP 3 ['-----END ' LAB '-----' ~]) (SNAG A T.MEP))  ~
    ^-  (UNIT [@ @])
    (DE:BASE64 (RAP 3 (SCAG A T.MEP)))
  --
::  |PKCS1: RSA ASYMMETRIC CRYPTOGRAPHY (RFC3447)
::
++  PKCS1
  |%
  ::  |SPEC:PKCS1: ASN.1 SPECS FOR RSA KEYS
  ::
  ++  SPEC
    |%
    ::  |EN:SPEC:PKCS1: ASN.1 ENCODING FOR RSA KEYS
    ::
    ++  EN
      |%
      ::  +PASS:EN:SPEC:PKCS1: ENCODE PUBLIC KEY TO ASN.1
      ::
      ++  PASS
        |=  K=KEY:RSA
        ^-  SPEC:ASN1
        [%SEQ [%INT N.PUB.K] [%INT E.PUB.K] ~]
      ::  +RING:EN:SPEC:PKCS1: ENCODE PRIVATE KEY TO ASN.1
      ::
      ++  RING
        |=  K=KEY:RSA
        ^-  SPEC:ASN1
        ~|  %RSA-NEED-RING
        ?>  ?=(^ SEK.K)
        :~  %SEQ
            [%INT 0]
            [%INT N.PUB.K]
            [%INT E.PUB.K]
            [%INT D.U.SEK.K]
            [%INT P.U.SEK.K]
            [%INT Q.U.SEK.K]
            [%INT (MOD D.U.SEK.K (DEC P.U.SEK.K))]
            [%INT (MOD D.U.SEK.K (DEC Q.U.SEK.K))]
            [%INT (~(INV FO P.U.SEK.K) Q.U.SEK.K)]
        ==
      --
    ::  |DE:SPEC:PKCS1: ASN.1 DECODING FOR RSA KEYS
    ::
    ++  DE
      |%
      ::  +PASS:DE:SPEC:PKCS1: DECODE ASN.1 PUBLIC KEY
      ::
      ++  PASS
        |=  A=SPEC:ASN1
        ^-  (UNIT KEY:RSA)
        ?.  ?=([%SEQ [%INT *] [%INT *] ~] A)
          ~
        =*  N  INT.I.SEQ.A
        =*  E  INT.I.T.SEQ.A
        `[[N E] ~]
      ::  +RING:DE:SPEC:PKCS1: DECODE ASN.1 PRIVATE KEY
      ::
      ++  RING
        |=  A=SPEC:ASN1
        ^-  (UNIT KEY:RSA)
        ?.  ?=([%SEQ *] A)  ~
        ?.  ?=  $:  [%INT %0]
                    [%INT *]
                    [%INT *]
                    [%INT *]
                    [%INT *]
                    [%INT *]
                    *
                ==
            SEQ.A
          ~
        =*  N  INT.I.T.SEQ.A
        =*  E  INT.I.T.T.SEQ.A
        =*  D  INT.I.T.T.T.SEQ.A
        =*  P  INT.I.T.T.T.T.SEQ.A
        =*  Q  INT.I.T.T.T.T.T.SEQ.A
        `[[N E] `[D P Q]]
      --
    --
  ::  |DER:PKCS1: DER ENCODING FOR RSA KEYS
  ::
  ::    EN(CODING) AND DE(CODING) FOR PUBLIC (PASS) AND PRIVATE (RING) KEYS.
  ::
  ++  DER
    |%
    ++  EN
      |%
      ++  PASS  |=(K=KEY:RSA (EN:^DER (PASS:EN:SPEC K)))
      ++  RING  |=(K=KEY:RSA (EN:^DER (RING:EN:SPEC K)))
      --
    ++  DE
      |%
      ++  PASS  |=([LEN=@UD DAT=@UX] `(UNIT KEY:RSA)`(BIFF (DE:^DER LEN DAT) PASS:DE:SPEC))
      ++  RING  |=([LEN=@UD DAT=@UX] `(UNIT KEY:RSA)`(BIFF (DE:^DER LEN DAT) RING:DE:SPEC))
      --
    --
  ::  |PEM:PKCS1: PEM ENCODING FOR RSA KEYS
  ::
  ::    EN(CODING) AND DE(CODING) FOR PUBLIC (PASS) AND PRIVATE (RING) KEYS.
  ::
  ++  PEM
    |%
    ++  EN
      |%
      ++  PASS  |=(K=KEY:RSA (EN:^PEM 'RSA PUBLIC KEY' (PASS:EN:DER K)))
      ++  RING  |=(K=KEY:RSA (EN:^PEM 'RSA PRIVATE KEY' (RING:EN:DER K)))
      --
    ++  DE
      |%
      ++  PASS  |=(MEP=WAIN (BIFF (DE:^PEM 'RSA PUBLIC KEY' MEP) PASS:DE:DER))
      ++  RING  |=(MEP=WAIN (BIFF (DE:^PEM 'RSA PRIVATE KEY' MEP) RING:DE:DER))
      --
    --
  --
::  |PKCS8: ASYMMETRIC CRYPTOGRAPHY (RFC5208, RFC5958)
::
::    RSA-ONLY FOR NOW.
::
++  PKCS8
  |%
  ::  |SPEC:PKCS8: ASN.1 SPECS FOR ASYMMETRIC KEYS
  ::
  ++  SPEC
    |%
    ++  EN
      |%
      ::  +PASS:SPEC:PKCS8: PUBLIC KEY ASN.1
      ::
      ::    TECHNICALLY NOT PART OF PKCS8, BUT STANDARDIZED LATER IN
      ::    THE SUPERSEDING RFC. INCLUDED HERE FOR SYMMETRY.
      ::
      ++  PASS
        |=  K=KEY:RSA
        ^-  SPEC:ASN1
        :~  %SEQ
            [%SEQ [[%OBJ RSA:OBJ:ASN1] [%NUL ~] ~]]
            =/  A=[LEN=@UD DAT=@UX]
              (PASS:EN:DER:PKCS1 K)
            [%BIT (MUL 8 LEN.A) DAT.A]
        ==
      ::  +RING:SPEC:PKCS8: PRIVATE KEY ASN.1
      ::
      ++  RING
        |=  K=KEY:RSA
        ^-  SPEC:ASN1
        :~  %SEQ
            [%INT 0]
            [%SEQ [[%OBJ RSA:OBJ:ASN1] [%NUL ~] ~]]
            [%OCT (RING:EN:DER:PKCS1 K)]
        ==
      --
    ::  |DE:SPEC:PKCS8: ASN.1 DECODING FOR ASYMMETRIC KEYS
    ::
    ++  DE
      |%
      ::  +PASS:DE:SPEC:PKCS8: DECODE PUBLIC KEY ASN.1
      ::
      ++  PASS
        |=  A=SPEC:ASN1
        ^-  (UNIT KEY:RSA)
        ?.  ?=([%SEQ [%SEQ *] [%BIT *] ~] A)
          ~
        ?.  ?&  ?=([[%OBJ *] [%NUL ~] ~] SEQ.I.SEQ.A)
                =(RSA:OBJ:ASN1 OBJ.I.SEQ.I.SEQ.A)
            ==
          ~
        (PASS:DE:DER:PKCS1 (DIV LEN.I.T.SEQ.A 8) BIT.I.T.SEQ.A)
      ::  +RING:DE:SPEC:PKCS8: DECODE PRIVATE KEY ASN.1
      ::
      ++  RING
        |=  A=SPEC:ASN1
        ^-  (UNIT KEY:RSA)
        ?.  ?=([%SEQ [%INT %0] [%SEQ *] [%OCT *] ~] A)
          ~
        ?.  ?&  ?=([[%OBJ *] [%NUL ~] ~] SEQ.I.T.SEQ.A)
                =(RSA:OBJ:ASN1 OBJ.I.SEQ.I.T.SEQ.A)
            ==
          ~
        (RING:DE:DER:PKCS1 [LEN OCT]:I.T.T.SEQ.A)
      --
    --
  ::  |DER:PKCS8: DER ENCODING FOR ASYMMETRIC KEYS
  ::
  ::    EN(CODING) AND DE(CODING) FOR PUBLIC (PASS) AND PRIVATE (RING) KEYS.
  ::    RSA-ONLY FOR NOW.
  ::
  ++  DER
    |%
    ++  EN
      |%
      ++  PASS  |=(K=KEY:RSA `[LEN=@UD DAT=@UX]`(EN:^DER (PASS:EN:SPEC K)))
      ++  RING  |=(K=KEY:RSA `[LEN=@UD DAT=@UX]`(EN:^DER (RING:EN:SPEC K)))
      --
    ++  DE
      |%
      ++  PASS  |=([LEN=@UD DAT=@UX] `(UNIT KEY:RSA)`(BIFF (DE:^DER LEN DAT) PASS:DE:SPEC))
      ++  RING  |=([LEN=@UD DAT=@UX] `(UNIT KEY:RSA)`(BIFF (DE:^DER LEN DAT) RING:DE:SPEC))
      --
    --
  ::  |PEM:PKCS8: PEM ENCODING FOR ASYMMETRIC KEYS
  ::
  ::    EN(CODING) AND DE(CODING) FOR PUBLIC (PASS) AND PRIVATE (RING) KEYS.
  ::    RSA-ONLY FOR NOW.
  ::
  ++  PEM
    |%
    ++  EN
      |%
      ++  PASS  |=(K=KEY:RSA (EN:^PEM 'PUBLIC KEY' (PASS:EN:DER K)))
      ++  RING  |=(K=KEY:RSA (EN:^PEM 'PRIVATE KEY' (RING:EN:DER K)))
      --
    ++  DE
      |%
      ++  PASS  |=(MEP=WAIN (BIFF (DE:^PEM 'PUBLIC KEY' MEP) PASS:DE:DER))
      ++  RING  |=(MEP=WAIN (BIFF (DE:^PEM 'PRIVATE KEY' MEP) RING:DE:DER))
      --
    --
  --
::  |PKCS10: CERTIFICATE SIGNING REQUESTS (RFC2986)
::
::    ONLY IMPLEMENTED FOR RSA KEYS WITH SUBJECT-ALTERNATE NAMES.
::
++  PKCS10
  =>  |%
      ::  +CSR:PKCS10: CERTIFICATE REQUEST
      ::
      +=  CSR  [KEY=KEY:RSA HOT=(LIST (LIST @T))]
      --
  |%
  ::  |SPEC:PKCS10: ASN.1 SPECS FOR CERTIFICATE SIGNING REQUESTS
  ::
  ++  SPEC
    |%
    ::  +EN:SPEC:PKCS10: ASN.1 ENCODING FOR CERTIFICATE SIGNING REQUESTS
    ::
    ++  EN
      |=  CSR
      ^-  SPEC:ASN1
      |^  =/  DAT=SPEC:ASN1  (INFO KEY HOT)
          :~  %SEQ
              DAT
              [%SEQ [[%OBJ RSA-SHA-256:OBJ:ASN1] [%NUL ~] ~]]
              :: BIG-ENDIAN SIGNATURE BITS
              ::
              ::   THE SIGNATURE BITWIDTH IS DEFINITIONALLY THE KEY LENGTH
              ::
              :+  %BIT
                (MET 0 N.PUB.KEY)
              (SWP 3 (~(SIGN RS256 KEY) (EN:^DER DAT)))
          ==
      ::  +INFO:EN:SPEC:PKCS10: CERTIFICATE REQUEST INFO
      ::
      ++  INFO
        |=  CSR
        ^-  SPEC:ASN1
        :~  %SEQ
            [%INT 0]
            [%SEQ ~]
            (PASS:EN:SPEC:PKCS8 KEY)
            :: EXPLICIT, CONTEXT-SPECIFIC TAG #0 (EXTENSIONS)
            ::
            :+  %CON
              `BESPOKE:ASN1`[| 0]
            %~  REN
              RAW:EN:^DER
            :~  %SEQ
                [%OBJ CSR-EXT:OBJ:ASN1]
                :~  %SET
                    :~  %SEQ
                        :~  %SEQ
                            [%OBJ SUB-ALT:OBJ:ASN1]
                            [%OCT (EN:^DER (SAN HOT))]
        ==  ==  ==  ==  ==
      ::  +SAN:EN:SPEC:PKCS10: SUBJECT-ALTERNATE-NAMES
      ::
      ++  SAN
        |=  HOT=(LIST (LIST @T))
        ^-  SPEC:ASN1
        :-  %SEQ
        %+  TURN  HOT
        :: IMPLICIT, CONTEXT-SPECIFIC TAG #2 (IA5STRING)
        :: XX SANITIZE STRING?
        |=(H=(LIST @T) [%CON `BESPOKE:ASN1`[& 2] (RIP 3 (JOIN '.' H))])
      --
    ::  |DE:SPEC:PKCS10: ASN.1 DECODING FOR CERTIFICATE SIGNING REQUESTS
    ++  DE  !!
    --
  ::  |DER:PKCS10: DER ENCODING FOR CERTIFICATE SIGNING REQUESTS
  ::
  ++  DER
    |%
    ++  EN  |=(A=CSR `[LEN=@UD DER=@UX]`(EN:^DER (EN:SPEC A)))
    ++  DE  !! ::|=(A=@ `(UNIT CSR)`(BIFF (DE:^DER A) DE:SPEC))
    --
  ::  |PEM:PKCS10: PEM ENCODING FOR CERTIFICATE SIGNING REQUESTS
  ::
  ++  PEM
    |%
    ++  EN  |=(A=CSR (EN:^PEM 'CERTIFICATE REQUEST' (EN:DER A)))
    ++  DE  !! ::|=(MEP=WAIN (BIFF (DE:^PEM 'CERTIFICATE REQUEST' MEP) DE:DER))
    --
  --
--

