::
::::  /HOON/TREE/LIB
  ::
/?    314
::
|%
++  GETALL                                              :: SEARCH IN MANX
  |=  TAG/(LIST MANE)
  |=  ELE/MANX  ^-  MARL
  ?:  (LIEN TAG |=(A/MANE =(A N.G.ELE)))
    ~[ELE]
  (ZING (TURN C.ELE ..$))
::
::  A.B_C.D => [[%A %B] [%C %D]]
::  A.B_C, A_B__C => [[%A %B] %C]
::  A_B_C, A__B_C => [%A [%B %C]]
++  READ-SCHEM                                          :: DECODE GAPPED NOUN
  =<  (COOK TO-NOUN (COOK BUILD-GROVE APEX))
  |%
  ++  NOUN  $@(TERM {NOUN NOUN})       ::  SHADOW
  ::  IMPROPER LIST OF POSSIBLE ENTRY POINTS
  ++  GROVE  $@(TERM {GAP/@ SEALED/NOUN PENDING/GROVE})
  ++  APEX  ;~(PLUG SYM (STAR ;~(PLUG DELIM SYM)))
  ++  DELIM  ;~(POSE (COLD 0 DOT) (COOK LENT (PLUS CAB)))
  ++  TO-NOUN  |=(A/GROVE ?@(A A [SEALED.A $(A PENDING.A)]))
  ++  BUILD-GROVE
    |=  {A/GROVE B/(LIST {P/@U Q/TERM})}  ^-  GROVE
    %+  ROLL  B  =<  .(ACC A)
    |=  {{GAP/@U V/TERM} ACC/GROVE}  ^-  GROVE
    ?@  ACC            [GAP ACC V]
    ?:  (GTH GAP GAP.ACC)  [GAP (TO-NOUN ACC) V]
    ACC(PENDING $(ACC PENDING.ACC))
  --
--
