::  URBIT-STYLE KEY GENERATION AND DERIVATION FUNCTIONS
::
/-  KEYGEN
::
/+  BIP32, BIP39
::
=,  KEYGEN
::
|%
++  ARGON2U
  |=  [WHO=SHIP TIC=BYTS]
  ^-  @
  ~|  [%WHO WHO (MET 3 WHO)]
  :: ?>  (LTE (MET 3 WHO) 4)
  %-  (ARGON2-URBIT:ARGON2:CRYPTO 32)
  :-  TIC
  =-  [(MET 3 -) (SWP 3 -)]
  %-  CRIP
  (WELD "URBITKEYGEN" (A-CO:CO WHO))
::
++  CHILD-NODE-FROM-SEED
  |=  [SEED=@ TYP=TAPE PASS=(UNIT @T)]
  ^-  NODE
  =+  SED=(SEED:DS 32^SEED TYP)
  =+  NOM=(FROM-ENTROPY:BIP39 32^SED)
  :+  TYP  NOM
  %-  WALLET:DS
  %+  TO-SEED:BIP39  NOM
  (TRIP (FALL PASS ''))
::
++  DERIVE-NETWORK-SEED
  |=  [MNGS=@ REV=@UD]
  ^-  @UX
  =+  (SEED:DS 64^MNGS (WELD "NETWORK" (A-CO:CO REV)))
  ?:  =(0 REV)  -
  ::  HASH AGAIN TO PREVENT LENGTH EXTENSION ATTACKS
  (SHA-256L:SHA 32 -)
::
++  FULL-WALLET-FROM-TICKET
  ::  WHO:    USERNAME
  ::  TICKET: PASSWORD
  ::  REV:    NETWORK KEY REVISION
  ::  PASS:   OPTIONAL PASSPHRASE
  ::
  |=  [WHO=SHIP TICKET=BYTS REV=@UD PASS=(UNIT @T)]
  ^-  VAULT
  =+  MASTER-SEED=(ARGON2U WHO TICKET)
  =/  CN  ::  CHILD NODE
    |=  TYP=NODETYPE
    (CHILD-NODE-FROM-SEED MASTER-SEED TYP PASS)
  ::
  :-  ^=  OWNERSHIP  ^-  NODE
      (CN "OWNERSHIP")
  ::
  :-  ^=  VOTING  ^-  NODE
      (CN "VOTING")
  ::
  =/  MANAGEMENT=NODE
    (CN "MANAGEMENT")
  :-  MANAGEMENT=MANAGEMENT
  ::
  :-  ^=  TRANSFER  ^-  NODE
      (CN "TRANSFER")
  ::
  :-  ^=  SPAWN  ^-  NODE
      (CN "SPAWN")
  ::
  ^=  NETWORK  ^-  UODE
  =/  MAD  ::  MANAGEMENT SEED
    %+  TO-SEED:BIP39
      SEED:MANAGEMENT
    (TRIP (FALL PASS ''))
  =+  SED=(DERIVE-NETWORK-SEED MAD REV)
  [REV SED (URBIT:DS SED)]
::
++  DS                                                  ::  DERIVE FROM RAW SEED
  |%
  ++  WALLET
    |=  SEED=@
    ^-  ^WALLET
    =+  =>  (FROM-SEED:BIP32 64^SEED)
        (DERIVE-PATH "M/44'/60'/0'/0/0")
    :+  [PUBLIC-KEY PRIVATE-KEY]
      (ADDRESS-FROM-PRV:KEY:ETHEREUM PRIVATE-KEY)
    CHAIN-CODE
  ::
  ++  URBIT
    |=  SEED=@
    ^-  EDKEYS
    =+  =<  [PUB=PUB:EX SEC=SEC:EX]
        (PIT:NU:CRUB:CRYPTO 256 SEED)
    :-  ^=  AUTH
        :-  (RSH 3 1 (END 3 33 PUB))
            (RSH 3 1 (END 3 33 SEC))
    ^=  CRYPT
    :-  (RSH 3 33 PUB)
        (RSH 3 33 SEC)
  ::
  ++  SEED
    |=  [SEED=BYTS SALT=TAPE]
    ^-  @UX
    %-  SHA-256L:SHA
    :-  (ADD WID.SEED (LENT SALT))
    (CAT 3 (CRIP (FLOP SALT)) DAT.SEED)
  --
--
