::  SIMPLE RSS TRANSFORMER
::
::::  /HOON/RSS-XML/REN
  ::
/?    310
/=  SUM  /&SNIP&ELEM&/|(/ELEM/ /~[;DIV;])
/=  KID  /^  (MAP KNOT {MARL MARL})
         /_  /&SNIP&/ELEM/
/$    |=({BEM/BEAM *} [OUR=P.BEM TUB=(SLAG 1 (FLOP S.BEM))])
::
::::  ~FYR, ~TASFYN-PARTYV
  ::
::~&  [SUM=SUM KID=KID]
::  LINK FROM RELATIVE PATH
=,  EYRE
=,  HTML
=+  HOK=.^(HART %E /(SCOT %P OUR)/HOST/REAL)
=+  REF=|=(A/PATH (EN-PURL HOK `(WELD TUB A) ~))
::  URB:FRONT ATTRS CONFUSE RSS VALIDATORS, READERS
=+  NO-META=|=(A/MARL ^+(A ?~(A ~ ?.(?=($META N.G.I.A) A $(A T.A)))))
::
%-  CRIP  %-  EN-XML
;RSS(VERSION "2.0")
  ;CHANNEL
    ;TITLE: *{HED.SUM}
    ;LINK: {(REF /)}
    ;DESCRIPTION: *{(NO-META TAL.SUM)}
    ;*  %+  TURN  ~(TAP BY KID)
        |=  {NOM/@T HED/MARL TAL/MARL}
        ;ITEM
          ;TITLE: *{HED}
          ;DESCRIPTION: *{(NO-META TAL)}
          ;LINK: {(REF /[NOM])}
        ==
  ==
==
