::
::::  /HOON/SOLE/SUR
  ::
^?
|%
++  SOLE-ACTION                                         ::  SOLE TO APP
  $%  ::  {$ABO ~}                                      ::  RESET INTERACTION
      {$DET SOLE-CHANGE}                                ::  COMMAND LINE EDIT
      {$RET ~}                                         ::  SUBMIT AND CLEAR
      {$CLR ~}                                         ::  EXIT CONTEXT
  ==                                                    ::
++  SOLE-BUFFER  (LIST @C)                              ::  COMMAND STATE
++  SOLE-CHANGE                                         ::  NETWORK CHANGE
  $:  LER/SOLE-CLOCK                                    ::  DESTINATION CLOCK
      HAW/@UVH                                          ::  SOURCE HASH
      TED/SOLE-EDIT                                     ::  STATE CHANGE
  ==                                                    ::
++  SOLE-CLOCK  {OWN/@UD HIS/@UD}                       ::  VECTOR CLOCK
++  SOLE-EDIT                                           ::  SHARED STATE CHANGE
  $%  {$DEL P/@UD}                                      ::  DELETE ONE AT
      {$INS P/@UD Q/@C}                                 ::  INSERT AT
      {$MOR P/(LIST SOLE-EDIT)}                         ::  COMBINATION
      {$NOP ~}                                         ::  NO-OP
      {$SET P/SOLE-BUFFER}                              ::  DISCONTINUITY
  ==                                                    ::
++  SOLE-EFFECT                                         ::  APP TO SOLE
  $%  {$BEL ~}                                         ::  BEEP
      {$BLK P/@UD Q/@C}                                 ::  BLINK+MATCH CHAR AT
      {$CLR ~}                                         ::  CLEAR SCREEN
      {$DET SOLE-CHANGE}                                ::  EDIT COMMAND
      {$ERR P/@UD}                                      ::  ERROR POINT
      {$KLR P/STYX}                                     ::  STYLED TEXT LINE
      {$MOR P/(LIST SOLE-EFFECT)}                       ::  MULTIPLE EFFECTS
      {$NEX ~}                                         ::  SAVE CLEAR COMMAND
      {$PRO SOLE-PROMPT}                                ::  SET PROMPT
      {$SAG P/PATH Q/*}                                 ::  SAVE TO JAMFILE
      {$SAV P/PATH Q/@}                                 ::  SAVE TO FILE
      {$TAN P/(LIST TANK)}                              ::  CLASSIC TANK
  ::  {$TAQ P/TANQ}                                     ::  MODERN TANK
      {$TXT P/TAPE}                                     ::  TEXT LINE
      {$URL P/@T}                                       ::  ACTIVATE URL
  ==                                                    ::
++  SOLE-COMMAND                                        ::  COMMAND STATE
  $:  POS/@UD                                           ::  CURSOR POSITION
      SAY/SOLE-SHARE                                    ::  CURSOR
  ==                                                    ::
++  SOLE-PROMPT                                         ::  PROMPT DEFINITION
  $:  VIS/?                                             ::  COMMAND VISIBLE
      TAG/TERM                                          ::  HISTORY MODE
      CAD/STYX                                          ::  CAPTION
  ==                                                    ::
++  SOLE-SHARE                                          ::  SYMMETRIC STATE
  $:  VEN/SOLE-CLOCK                                    ::  OUR VECTOR CLOCK
      LEG/(LIST SOLE-EDIT)                              ::  UNMERGED EDITS
      BUF/SOLE-BUFFER                                   ::  SOLE STATE
  ==                                                    ::
::                                                      ::
::                                                      ::
++  SOLE-DIALOG                                         ::  STANDARD DIALOG
  |*  OUT/$-(* *)                                       ::  OUTPUT STRUCTURE
  $-(SOLE-INPUT (SOLE-RESULT OUT))                      ::  OUTPUT FUNCTION
::                                                      ::
++  SOLE-INPUT  TAPE                                    ::  PROMPT INPUT
++  SOLE-RESULT                                         ::  CONDITIONAL RESULT
  |*  OUT/$-(* *)                                       ::  OUTPUT STRUCTURE
  $@(@UD (SOLE-PRODUCT OUT))                            ::  ERROR POSITION
::                                                      ::
++  SOLE-PRODUCT                                        ::  SUCCESS RESULT
  |*  OUT/$-(* *)                                       ::
  %+  PAIR  (LIST TANK)                                 ::
  %+  EACH  (UNIT OUT)                                  ::  ~ IS ABORT
  (PAIR SOLE-PROMPT (SOLE-DIALOG OUT))                  ::  ASK AND CONTINUE
::                                                      ::
++  SOLE-REQUEST                                         ::  SCRAPER RESULT
  |*  OUT/$-(* *)                                       ::  OUTPUT STRUCTURE
  %+  PAIR  (LIST TANK)                                 ::
  %+  EACH  (UNIT OUT)                                  ::  ~ IS ABORT
  %^    TREL                                            ::  FETCH AND CONTINUE
      (UNIT KNOT)
    HISS:EYRE
  $-(HTTR:EYRE (SOLE-REQUEST OUT))
::                                                      ::
++  SOLE-GEN                                            ::  XX VIRTUAL TYPE
  $%  {$SAY $-((SOLE-ARGS) (CASK))}                     ::  DIRECT NOUN
      {$ASK $-((SOLE-ARGS) (SOLE-PRODUCT (CASK)))}      ::  DIALOG
      {$GET $-((SOLE-ARGS) (SOLE-REQUEST (CASK)))}      ::  SCRAPER
  ==                                                    ::
++  SOLE-ARGS                                           ::  GENERATOR ARGUMENTS
  |*  _[* *]                                            ::
  {{NOW/@DA ENY/@UVJ BEK/BEAK} {,+<- ,+<+}}             ::
::                                                      ::
::                                                      ::
--
