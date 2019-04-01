::  |RSA: PRIMITIVE, TEXTBOOK RSA
::
::    UNPADDED, UNSAFE, UNSUITABLE FOR ENCRYPTION!
::
|%
::  +KEY:RSA: RSA PUBLIC OR PRIVATE KEY
::
+=  KEY
  $:  ::  PUB:  PUBLIC PARAMETERS (N=MODULUS, E=PUB-EXPONENT)
      ::
      PUB=[N=@UX E=@UX]
      ::  SEK:  SECRET PARAMETERS (D=PRIVATE-EXPONENT, P/Q=PRIMES)
      ::
      SEK=(UNIT [D=@UX P=@UX Q=@UX])
  ==
::  +RAMP: MAKE RABIN-MILLER PROBABILISTIC PRIME
::
::    XX REPLACE +RAMP:NUMBER?
::    A: BITWIDTH
::    B: SNAGS (XX SMALL PRIMES TO CHECK DIVISIBILITY?)
::    C: ENTROPY
::
++  RAMP
  |=  [A=@ B=(LIST @) C=@]
  =.  C  (SHAS %RAMP C)
  :: XX WHAT IS THIS VALUE?
  ::
  =|  D=@
  |-  ^-  @UX
  :: XX WHAT IS THIS CONDITION?
  ::
  ?:  =((MUL 100 A) D)
    ~|(%AR-RAMP !!)
  :: E: PRIME CANDIDATE
  ::
  ::   SETS LOW BIT, AS PRIME MUST BE ODD.
  ::   SETS HIGH BIT, AS +RAW:OG ONLY GIVES UP TO :A BITS.
  ::
  =/  E  :(CON 1 (LSH 0 (DEC A) 1) (~(RAW OG C) A))
  :: XX WHAT ALGORITHM IS THIS MODULAR REMAINDER CHECK?
  ::
  ?:  ?&  (LEVY B |=(F/@ !=(1 (MOD E F))))
          (PRAM:NUMBER E)
      ==
    E
  $(C +(C), D (SHAX D))
::  +ELCM:RSA: CARMICHAEL TOTIENT
::
++  ELCM
  |=  [A=@ B=@]
  (DIV (MUL A B) D:(EGCD A B))
::  +NEW-KEY:RSA: WRITE SOMETHINGXXX
::
++  NEW-KEY
  =/  E  `@UX`65.537
  |=  [WID=@ ENY=@]
  ^-  KEY
  =/  DIW  (RSH 0 1 WID)
  =/  P=@UX  (RAMP DIW [3 5 ~] ENY)
  =/  Q=@UX  (RAMP DIW [3 5 ~] +(ENY))
  =/  N=@UX  (MUL P Q)
  =/  D=@UX  (~(INV FO (ELCM (DEC P) (DEC Q))) E)
  [[N E] `[D P Q]]
::  +EN:RSA: PRIMITIVE RSA ENCRYPTION
::
::    CIPHERTEXT = MESSAGE^E (MOD N)
::
++  EN
  |=  [M=@ K=KEY]
  ~|  %RSA-LEN
  ?>  (LTE (MET 0 M) (MET 0 N.PUB.K))
  (~(EXP FO N.PUB.K) E.PUB.K M)
::  +DE:RSA: PRIMITIVE RSA DECRYPTION
::
::    MESSAGE = CIPHERTEXT^D (MOD E)
::
++  DE
  |=  [M=@ K=KEY]
  :: XX ASSERT RSA-LEN HERE TOO?
  ~|  %RSA-NEED-RING
  ?>  ?=(^ SEK.K)
  =/  FU  (FU:NUMBER P.U.SEK.K Q.U.SEK.K)
  (OUT.FU (EXP.FU D.U.SEK.K (SIT.FU M)))
--
