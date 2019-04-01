::
::::  /HOON/FRONTMATTER/LIB
  ::
/?    310
::
=,  FORMAT
|%
++  ATR-LINES
  |=  ATR/(MAP CORD CORD)
  %+  TURN  (SORT ~(TAP BY ATR) |=({{A/@ @} {B/@ @}} (AOR A B)))
  |=  {K/CORD V/CORD}
  (RAP 3 K ': ' V ~)
::
++  ATR-KEY  ;~(SFIX (STAR ;~(LESS COL PRN)) COL ACE)
++  PRINT
  |=  {ATR/(MAP CORD CORD) SRC/WAIN}
  ?~  ATR  SRC
  ['---' (WELP (ATR-LINES ATR) '---' SRC)]
++  PARSE
  =|  ATR/(MAP CORD CORD)
  |=  WAN/WAIN  ^+  [ATR MUD='']
  ?~  WAN  [~ '']
  ?^  (RUSH I.WAN (STAR ACE))
    $(WAN T.WAN)
  ?.  =('---' I.WAN)  [~ (OF-WAIN WAN)]
  |-  ^+  [ATR MUD='']
  ?~  T.WAN  ~|(%UNCLOSED-METADATA !!)
  ?:  =('---' I.T.WAN)  [ATR (OF-WAIN T.T.WAN)]
  ?^  (RUSH I.T.WAN (STAR ACE))
    $(WAN T.WAN)
  =-  $(WAN T.WAN, ATR (~(PUT BY ATR) (CRIP KEY) (CRIP VAL)))
  ~|  MALFORMED-ATTRIBUTE+I.T.WAN
  ^-  {KEY/TAPE ^ VAL/TAPE}
  +>:(ATR-KEY 1^1 (TRIP I.T.WAN))
--
