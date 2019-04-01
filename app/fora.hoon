::
::  /APP/FORA/HOON
::
::TODO  MAYBE STOP RELYING ON %HOOD ONE DAY.
::
/-  HALL
/+  HALL, TIME-TO-ID
=,  FORMAT
=,  TITLE
::
|%
++  MOVE  (PAIR BONE CARD)
++  CARD
  $%  {$POKE WIRE DOCK POKE}
      {$INFO WIRE @P TORO:CLAY}
  ==
++  POKE
  $%  {$HALL-ACTION ACTION:HALL}
      {$WRITE-FORA-POST SPUR SHIP CORD CORD}
      {$WRITE-COMMENT SPUR SHIP CORD}
  ==
--
::
|_  {BOL/BOWL:GALL ~}
::
++  PREP
  |=  OLD/(UNIT ~)
  ^-  (QUIP MOVE _..PREP)
  ?^  OLD  [~ ..PREP(+<+ U.OLD)]
  :_  ..PREP
  :~  (ACT %CREATE %FORA-POSTS 'FORA POSTS' %JOURNAL)
      (ACT %CREATE %FORA-COMMENTS 'FORA COMMENTS' %JOURNAL)
  ==
::
++  ACT
  |=  A/ACTION:HALL
  ^-  MOVE
  [OST.BOL %POKE / [OUR.BOL %HALL] %HALL-ACTION A]
::
++  RA-BASE-HART  .^(HART:EYRE %E /(SCOT %P OUR.BOL)/HOST/(SCOT %DA NOW.BOL))
::
++  POKE-FORA-POST
  |=  {PAX/PATH SUP/SPUR HED/@T TXT/@T}
  ^-  (QUIP MOVE _+>)
  :_  +>
  ::
  ::  IF TXT IS BLANK THEN RETURN NO MOVES.
  ::
  ?:  ?=(^ (RUSH TXT SPAC:DE-JSON:HTML))  ~
  ::
  ::  OTHERWISE, POST THE CONTENT.
  ::
  :~  %-  ACT
      :+  %PHRASE  [[OUR.BOL %FORA-POSTS] ~ ~]
      :_  ~
      :+  %APP  DAP.BOL
      :+  %FAT
        :+  %NAME
          (CRIP "POST BY {(CITE SRC.BOL)}: {(TRIP HED)}")
        TEXT+(TO-WAIN TXT)
      =.  PAX  (WELP PAX /POSTS/(CRIP "{<NOW.BOL>}~"))
      [%URL [RA-BASE-HART `PAX ~] ~]
    ::
      :*  OST.BOL
          %POKE
          /FORA-POST
          [OUR.BOL %HOOD]
          [%WRITE-FORA-POST SUP SRC.BOL HED TXT]
      ==
  ==
::
++  POKE-FORA-COMMENT
  |=  {PAX/PATH SUP/SPUR TXT/@T}
  ^-  (QUIP MOVE _+>)
  :_  +>
  ::
  ::  IF TXT IS BLANK THEN RETURN NO MOVES.
  ::
  ?:  ?=(^ (RUSH TXT SPAC:DE-JSON:HTML))  ~
  ::
  ::  OTHERWISE, POST THE CONTENT.
  ::
  :~  ^-  MOVE
      %-  ACT
      :+  %PHRASE  [[OUR.BOL %FORA-COMMENTS] ~ ~]
      :_  ~
      :+  %APP  DAP.BOL
      ^-  SPEECH:HALL
      :+  %FAT
        :+  %NAME
          =+  NAM=?~(SUP "" (TRIP I.SUP))
          (CRIP "COMMENT BY {(CITE SRC.BOL)} ON /{NAM}")
        TEXT+(TO-WAIN TXT)
      =+  FRA=(CRIP (TIME-TO-ID NOW.BOL))
      [%URL [RA-BASE-HART `PAX ~] `FRA]
    ::
      :*  OST.BOL
          %POKE
          /FORA-COMMENT
          [OUR.BOL %HOOD]
          [%WRITE-COMMENT SUP SRC.BOL TXT]
      ==
  ==
--
