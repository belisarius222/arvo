/-  ASN1
::  |DER: DISTINGUISHED ENCODING RULES FOR ASN.1
::
::    DER IS A TAG-LENGTH-VALUE BINARY ENCODING FOR ASN.1, DESIGNED
::    SO THAT THERE IS ONLY ONE (DISTINGUISHED) VALID ENCODING FOR AN
::    INSTANCE OF A TYPE.
::
|%
::  +EN:DER: ENCODE +SPEC:ASN1 TO +OCTS (KINDOF)
::
++  EN
  =<  |=  A=SPEC:ASN1
      ^-  [LEN=@UD DAT=@UX]
      =/  B  ~(REN RAW A)
      [(LENT B) (REP 3 B)]
  |%
  ::  +RAW:EN:DER: DOOR FOR ENCODING +SPEC:ASN1 TO LIST OF BYTES
  ::
  ++  RAW
    |_  PEC=SPEC:ASN1
    ::  +REN:RAW:EN:DER: RENDER +SPEC:ASN1 TO TAG-LENGTH-VALUE BYTES
    ::
    ++  REN
      ^-  (LIST @D)
      =/  A  LEM
      [TAG (WELD (LEN A) A)]
    ::  +TAG:RAW:EN:DER: TAG BYTE
    ::
    ++  TAG
      ^-  @D
      ?-  PEC
        [%INT *]   2
        [%BIT *]   3
        [%OCT *]   4
        [%NUL *]   5
        [%OBJ *]   6
        [%SEQ *]  48              :: CONSTRUCTED: (CON 0X20 16)
        [%SET *]  49              :: CONSTRUCTED: (CON 0X20 17)
        [%CON *]  ;:  CON
                    0X80                    :: CONTEXT-SPECIFC
                    ?:(IMP.BES.PEC 0 0X20)  :: IMPLICIT?
                    (DIS 0X1F TAG.BES.PEC)  :: 5 BITS OF CUSTOM TAG
                  ==
      ==
    ::  +LEM:RAW:EN:DER: ELEMENT BYTES
    ::
    ++  LEM
      ^-  (LIST @D)
      ?-  PEC
        ::  UNSIGNED ONLY, INTERPRETED AS POSITIVE-SIGNED AND
        ::  RENDERED IN BIG-ENDIAN BYTE ORDER. NEGATIVE-SIGNED WOULD
        ::  BE TWO'S COMPLEMENT
        ::
        [%INT *]  =/  A  (FLOP (RIP 3 INT.PEC))
                  ?~  A  [0 ~]
                  ?:((LTE I.A 127) A [0 A])
        ::  PADDED TO BYTE-WIDTH, MUST BE ALREADY BYTE-ALIGNED
        ::
        [%BIT *]  =/  A  (RIP 3 BIT.PEC)
                  =/  B  ~|  %DER-INVALID-BIT
                      ?.  =(0 (MOD LEN.PEC 8))
                        ~|(%DER-INVALID-BIT-ALIGNMENT !!)
                      (SUB (DIV LEN.PEC 8) (LENT A))
                  [0 (WELD A (REAP B 0))]
        ::  PADDED TO BYTE-WIDTH
        ::
        [%OCT *]  =/  A  (RIP 3 OCT.PEC)
                  =/  B  ~|  %DER-INVALID-OCT
                      (SUB LEN.PEC (LENT A))
                  (WELD A (REAP B 0))
        ::
        [%NUL *]  ~
        [%OBJ *]  (RIP 3 OBJ.PEC)
        ::
        [%SEQ *]  %-  ZING
                  |-  ^-  (LIST (LIST @))
                  ?~  SEQ.PEC  ~
                  :-  REN(PEC I.SEQ.PEC)
                  $(SEQ.PEC T.SEQ.PEC)
        ::  PRESUMED TO BE ALREADY DEDUPLICATED AND SORTED
        ::
        [%SET *]  %-  ZING
                  |-  ^-  (LIST (LIST @))
                  ?~  SET.PEC  ~
                  :-  REN(PEC I.SET.PEC)
                  $(SET.PEC T.SET.PEC)
        ::  ALREADY CONSTRUCTED
        ::
        [%CON *]  CON.PEC
      ==
    ::  +LEN:RAW:EN:DER: LENGTH BYTES
    ::
    ++  LEN
      |=  A=(LIST @D)
      ^-  (LIST @D)
      =/  B  (LENT A)
      ?:  (LTE B 127)
        [B ~]                :: NOTE: BIG-ENDIAN
      [(CON 0X80 (MET 3 B)) (FLOP (RIP 3 B))]
    --
  --
::  +DE:DER: DECODE ATOM TO +SPEC:ASN1
::
++  DE
  |=  [LEN=@UD DAT=@UX]
  ^-  (UNIT SPEC:ASN1)
  :: XX REFACTOR INTO +PARSE
  =/  A  (RIP 3 DAT)
  =/  B  ~|  %DER-INVALID-LEN
      (SUB LEN (LENT A))
  (RUST `(LIST @D)`(WELD A (REAP B 0)) PARSE)
::  +PARSE:DER: DER PARSER COMBINATOR
::
++  PARSE
  =<  ^-  $-(NAIL (LIKE SPEC:ASN1))
      ;~  POSE
        (STAG %INT (BASS 256 (SEAR INT ;~(PFIX (TAG 2) TILL))))
        (STAG %BIT (SEAR BIT (BOSS 256 ;~(PFIX (TAG 3) TILL))))
        (STAG %OCT (BOSS 256 ;~(PFIX (TAG 4) TILL)))
        (STAG %NUL (COLD ~ ;~(PLUG (TAG 5) (TAG 0))))
        (STAG %OBJ (^BOSS 256 ;~(PFIX (TAG 6) TILL)))
        (STAG %SEQ (SEAR RECUR ;~(PFIX (TAG 48) TILL)))
        (STAG %SET (SEAR RECUR ;~(PFIX (TAG 49) TILL)))
        (STAG %CON ;~(PLUG (SEAR CONTEXT NEXT) TILL))
      ==
  |%
  ::  +TAG:PARSE:DER: PARSE TAG BYTE
  ::
  ++  TAG
    |=(A=@D (JUST A))
  ::  +INT:PARSE:DER: SEAR UNSIGNED BIG-ENDIAN BYTES
  ::
  ++  INT
    |=  A=(LIST @D)
    ^-  (UNIT (LIST @D))
    ?~  A  ~
    ?:  ?=([@ ~] A)  `A
    ?.  =(0 I.A)  `A
    ?.((GTH I.T.A 127) ~ `T.A)
  ::  +BIT:PARSE:DER: CONVERT BYTEWIDTH TO BITWIDTH
  ::
  ++  BIT
    |=  [LEN=@UD DAT=@UX]
    ^-  (UNIT [LEN=@UD DAT=@UX])
    ?.  =(0 (END 3 1 DAT))  ~
    :+  ~
      (MUL 8 (DEC LEN))
    (RSH 3 1 DAT)
  ::  +RECUR:PARSE:DER: PARSE BYTES FOR A LIST OF +SPEC:ASN1
  ::
  ++  RECUR
    |=(A=(LIST @) (RUST A (STAR PARSE)))
  ::  +CONTEXT:PARSE:DER: DECODE CONTEXT-SPECIFIC TAG BYTE
  ::
  ++  CONTEXT
    |=  A=@D
    ^-  (UNIT BESPOKE:ASN1)
    ?.  =(1 (CUT 0 [7 1] A))  ~
    :+  ~
      =(1 (CUT 0 [5 1] A))
    (DIS 0X1F A)
  ::  +BOSS:PARSE:DER: SHADOWED TO COUNT AS WELL
  ::
  ::    USE FOR PARSING +OCTS MORE BROADLY?
  ::
  ++  BOSS
    |*  [WUC=@ TYD=RULE]
    %+  COOK
      |=  WAQ=(LIST @)
      :-  (LENT WAQ)
      (REEL WAQ |=([P=@ Q=@] (ADD P (MUL WUC Q))))
    TYD
  ::  +TILL:PARSE:DER: PARSER COMBINATOR FOR LEN-PREFIXED BYTES
  ::
  ::  ADVANCE UNTIL
  ::
  ++  TILL
    |=  TUB/NAIL
    ^-  (LIKE (LIST @D))
    ?~  Q.TUB
      (FAIL TUB)
    ::  FUZ: FIRST BYTE - LENGTH, OR LENGTH OF THE LENGTH
    ::
    =*  FUZ  I.Q.TUB
    ::  NEX: OFFSET OF VALUE BYTES FROM FUZ
    ::  LEN: LENGTH OF VALUE BYTES
    ::
    =+  ^-  [NEX=@ LEN=@]
      ::  FAZ: MEANINGFUL BITS IN FUZ
      ::
      =/  FAZ  (END 0 7 FUZ)
      ?:  =(0 (CUT 0 [7 1] FUZ))
        [0 FAZ]
      [FAZ (REP 3 (FLOP (SCAG FAZ T.Q.TUB)))]
    ?:  ?&  !=(0 NEX)
            !=(NEX (MET 3 LEN))
        ==
      (FAIL TUB)
    ::  ZUF: VALUE BYTES
    ::
    =/  ZUF  (SWAG [NEX LEN] T.Q.TUB)
    ?.  =(LEN (LENT ZUF))
      (FAIL TUB)
    ::  ZAF:  PRODUCT NAIL
    ::
    =/  ZAF  [P.P.TUB (ADD +(NEX) Q.P.TUB)]
    [ZAF `[ZUF ZAF (SLAG (ADD NEX LEN) T.Q.TUB)]]
  --
--

