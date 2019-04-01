::  USAGE:
::    :ETH-MANAGE %LOOK
::      KICK POLLING FROM ETH MAINNET NODE
::    :ETH-MANAGE [%WIND 1.000.000]
::      REWIND TO BLOCK 1.000.000
=>  $~  |%
    ++  MOVE  (PAIR BONE CARD)
    ++  CARD
      $%  [%TURF WIRE ~]
          [%VEIN WIRE]
          [%LOOK WIRE SRC=(EACH SHIP PURL:EYRE)]
          [%WIND WIRE P=@UD]
          [%SNAP WIRE SNAPSHOT=SNAPSHOT:JAEL KICK=?]
      ==
    ++  STATE
      $:  A/@
      ==
    --
=,  GALL
|_  $:  HID/BOWL
        STATE
    ==
++  POKE
  |=  [MAR=@TAS VAL=*]
  ^-  (QUIP MOVE _+>)
  :_  +>.$
  ?+  VAL  ~&(%OOPS ~)
      %TURF         [OST.HID %TURF /HI ~]~
      %VEIN         [OST.HID %VEIN /HI]~
      [%WIND @UD]   [OST.HID %WIND /HI +.VAL]~
      [%SNAP * ?]
    [OST.HID %SNAP /HI (SNAPSHOT:JAEL +<.VAL) +>.VAL]~
  ::
      %LOOK-ETHNODE
    :_  ~
    =/  PUL
      (NEED (DE-PURL:HTML 'HTTP://ETH-MAINNET.URBIT.ORG:8545'))
    [OST.HID %LOOK /HI |+PUL]
  ::
      [%LOOK-KICK WHO=@P]
    :_  ~
    [OST.HID %LOOK /HI %& WHO.VAL]
  ==
::
++  VEIN
  |=  [WIR/WIRE =LIFE VEN=(MAP LIFE RING)]
  ^-  (QUIP MOVE _+>)
  ~&  [%PIERC LIFE VEN]
  `+>.$
::
++  TURF
  |=  [WIR/WIRE PAX=(LIST PATH)]
  ^-  (QUIP MOVE _+>)
  ~&  [%SLURP PAX]
  `+>.$
::
++  PREP
  |=  OLD/(UNIT NOUN)
  ^-  [(LIST MOVE) _+>.$]
  ?~  OLD
    `+>.$
  =+  NEW=((SOFT STATE) U.OLD)
  ?~  NEW
    `+>.$
  `+>.$(+<+ U.NEW)
--
