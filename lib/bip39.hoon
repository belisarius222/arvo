::  BIP39 IMPLEMENTATION IN HOON
::
/+  BIP39-ENGLISH
::
|%
++  FROM-ENTROPY
  |=  BYTS
  ^-  TAPE
  =.  WID  (MUL WID 8)
  ~|  [%UNSUPPORTED-ENTROPY-BIT-LENGTH WID]
  ?>  &((GTE WID 128) (LTE WID 256))
  ::
  =+  CS=(DIV WID 32)
  =/  CHECK=@
    %^  RSH  0  (SUB 256 CS)
    (SHA-256L:SHA (DIV WID 8) DAT)
  =/  BITS=BYTS
    :-  (ADD WID CS)
    %+  CAN  0
    :~  CS^CHECK
        WID^DAT
    ==
  ::
  =/  PIECES
    |-  ^-  (LIST @)
    :-  (END 0 11 DAT.BITS)
    ?:  (LTE WID.BITS 11)  ~
    $(BITS [(SUB WID.BITS 11) (RSH 0 11 DAT.BITS)])
  ::
  =/  WORDS=(LIST TAPE)
    %+  TURN  PIECES
    |=  IND=@UD
    (SNAG IND `(LIST TAPE)`BIP39-ENGLISH)
  ::
  %+  ROLL  (FLOP WORDS)
  |=  [NEX=TAPE ALL=TAPE]
  ?~  ALL  NEX
  :(WELD ALL " " NEX)
::
::NOTE  ALWAYS PRODUCES A 512-BIT RESULT
++  TO-SEED
  |=  [MNEM=TAPE PASS=TAPE]
  ^-  @
  %-  HMAC-SHA512T:PBKDF:CRYPTO
  [(CRIP MNEM) (CRIP (WELD "MNEMONIC" PASS)) 2.048 64]
--
