::  CLAY (4C), REVISION CONTROL
!:
::  THIS IS SPLIT IN THREE TOP-LEVEL SECTIONS:  STRUCTURE DEFINITIONS, MAIN
::  LOGIC, AND ARVO INTERFACE.
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::  HERE ARE THE STRUCTURES.  `++RAFT` IS THE FORMAL ARVO STATE.  IT'S ALSO
::  WORTH NOTING THAT MANY OF THE CLAY-RELATED STRUCTURES ARE DEFINED IN ZUSE.
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
|=  PIT/VASE
=,  CLAY
=>  |%
+$  AEON  @UD                                           ::  VERSION NUMBER
::
::  RECURSIVE STRUCTURE OF A DESK'S DATA.
::
::  WE KEEP AN ANKH ONLY FOR THE CURRENT VERSION OF LOCAL DESKS.  EVERYWHERE
::  ELSE WE STORE IT AS (MAP PATH LOBE).
::
+$  ANKH                                                ::  EXPANDED NODE
  $~  [~ ~]
  $:  FIL/(UNIT {P/LOBE Q/CAGE})                        ::  FILE
      DIR/(MAP @TA ANKH)                                ::  FOLDERS
  ==                                                    ::
::
::  PART OF ++MERY, REPRESENTING THE SET OF CHANGES BETWEEN THE MERGEBASE AND
::  ONE OF THE DESKS BEING MERGED.
::
::  --  `NEW` IS THE SET OF FILES IN THE NEW DESK AND NOT IN THE MERGEBASE.
::  --  `CAL` IS THE SET OF CHANGES IN THE NEW DESK FROM THE MERGEBASE EXCEPT
::      FOR ANY THAT ARE ALSO IN THE OTHER NEW DESK.
::  --  `CAN` IS THE SET OF CHANGES IN THE NEW DESK FROM THE MERGEBASE AND THAT
::      ARE ALSO IN THE OTHER NEW DESK (POTENTIAL CONFLICTS).
::  --  `OLD` IS THE SET OF FILES IN THE MERGEBASE AND NOT IN THE NEW DESK.
::
+$  CANE
  $:  NEW/(MAP PATH LOBE)
      CAL/(MAP PATH LOBE)
      CAN/(MAP PATH CAGE)
      OLD/(MAP PATH ~)
  ==
::
::  TYPE OF REQUEST.
::
::  %D PRODUCES A SET OF DESKS, %P GETS FILE PERMISSIONS, %U CHECKS FOR
::  EXISTENCE, %V PRODUCES A ++DOME OF ALL DESK DATA, %W GETS @UD AND @DA
::  VARIANTS FOR THE GIVEN CASE, %X GETS FILE CONTENTS, %Y GETS A DIRECTORY
::  LISTING, AND %Z GETS A RECURSIVE HASH OF THE FILE CONTENTS AND CHILDREN.
::
:: ++  CARE  ?($D $P $U $V $W $X $Y $Z)
::
::  KEEPS TRACK OF SUBSCRIBERS.
::
::  A MAP OF REQUESTS TO A SET OF ALL THE SUBSCRIBERS WHO SHOULD BE NOTIFIED
::  WHEN THE REQUEST IS FILLED/UPDATED.
::
+$  CULT  (JUG WOVE DUCT)
::
::  DOMESTIC DESK STATE.
::
::  INCLUDES SUBSCRIBER LIST, DOME (DESK CONTENT), POSSIBLE COMMIT STATE (FOR
::  LOCAL CHANGES), POSSIBLE MERGE STATE (FOR INCOMING MERGES), AND PERMISSIONS.
::
++  DOJO
  $:  QYX/CULT                                          ::  SUBSCRIBERS
      DOM/DOME                                          ::  DESK STATE
      DOK/(UNIT DORK)                                   ::  COMMIT STATE
      MER/(UNIT MERY)                                   ::  MERGE STATE
      PER/REGS                                          ::  READ PERMS PER PATH
      PEW/REGS                                          ::  WRITE PERMS PER PATH
  ==
::
::  DESK STATE.
::
::  INCLUDES A CHECKED-OUT ANKH WITH CURRENT CONTENT, MOST RECENT VERSION, MAP
::  OF ALL VERSION NUMBERS TO COMMIT HASHES (COMMITS ARE IN HUT.RANG), AND MAP
::  OF LABELS TO VERSION NUMBERS.
::
::  `MIM` IS A CACHE OF ALL NEW CONTENT THAT CAME WITH A MIME MARK.  OFTEN,
::  WE NEED TO CONVERT TO MIME ANYWAY TO SEND TO UNIX, SO WE JUST KEEP IT
::  AROUND. IF YOU TRY TO PERFORM MORE THAN ONE COMMIT AT A TIME ON A DESK,
::  THIS WILL BREAK, BUT SO WILL LOTS OF OTHER THINGS.
::
++  DOME
  $:  ANK/ANKH                                          ::  STATE
      LET/AEON                                          ::  TOP ID
      HIT/(MAP AEON TAKO)                               ::  VERSIONS BY ID
      LAB/(MAP @TAS AEON)                               ::  LABELS
      MIM/(MAP PATH MIME)                               ::  MIME CACHE
  ==                                                    ::
::
::  COMMIT STATE.
::
::  --  `DEL` IS THE PATHS WE'RE DELETING.
::  --  `INK` IS THE INSERTIONS OF HOON FILES (SHORT-CIRCUITED FOR
::      BOOTSTRAPPING).
::  --  `INS` IS ALL THE OTHER INSERTIONS.
::  --  `DIG` IS ALL THE %DIF CHANGES (I.E. WE WERE GIVEN A DIFF TO APPLY).
::  --  `DIF` IS THE DIFFS IN `DIG` APPLIED TO THEIR FILES.
::  --  `MUC` IS ALL THE %MUT CHANGES (I.E. WE WERE GIVE A NEW VERSION OF A
::      FILE).
::  --  `MUH` IS THE HASHES OF ALL THE NEW CONTENT IN `MUC`.
::  --  `MUT` IS THE DIFFS BETWEEN `MUC` AND THE ORIGINAL FILES.
::
++  DORK                                                ::  DIFF WORK
  $:  DEL/(LIST PATH)                                   ::  DELETES
      INK/(LIST (PAIR PATH CAGE))                       ::  HOON INSERTS
      INS/(UNIT (LIST (PAIR PATH CAGE)))                ::  INSERTS
      DIG/(MAP PATH CAGE)                               ::  STORE DIFFS
      DIF/(UNIT (LIST (TREL PATH LOBE CAGE)))           ::  CHANGES
      MUC/(MAP PATH CAGE)                               ::  STORE MUTATIONS
      MUH/(MAP PATH LOBE)                               ::  STORE HASHES
      MUT/(UNIT (LIST (TREL PATH LOBE CAGE)))           ::  MUTATIONS
  ==                                                    ::
::
::  HASH OF A BLOB, FOR LOOKUP IN THE OBJECT STORE (LAT.RAN)
::
++  LOBE  @UVI                                          ::  BLOB REF
::
::  MERGE STATE.
::
::  MERGES ARE SAID TO BE FROM 'ALI' TO 'BOB'.  SEE ++ME FOR MORE DETAILS.
::
::  --  `SOR` IS THE URBIT AND DESK OF ALI.
::  --  `HEN` IS THE DUCT THAT INSTIGATED THE MERGE.
::  --  `GEM` IS THE MERGE STRATEGY.  THESE ARE DESCRIBED IN `++FETCHED-ALI`.
::  --  `WAT` IS THE CURRENT STEP OF THE MERGE PROCESS.
::  --  `CAS` IS THE CASE IN ALI'S DESK THAT WE'RE MERGING FROM.
::  --  `ALI` IS THE COMMIT FROM ALI'S DESK.
::  --  `BOB` IS THE COMMIT FROM BOB'S DESK.
::  --  `BAS` IS THE COMMIT FROM THE MERGEBASE.
::  --  `DAL` IS THE SET OF CHANGES FROM THE MERGEBASE TO ALI'S DESK.
::  --  `DOB` IS THE SET OF CHANGES FROM THE MERGEBASE TO BOB'S DESK.
::      CHECK ++CANE FOR MORE DETAILS ON THESE TWO
::  --  `BOF` IS THE SET OF CHANGES TO THE SAME FILES IN ALI AND BOB.  NULL FOR
::      A FILE MEANS A CONFLICT WHILE A CAGE MEANS THE DIFFS HAVE BEEN MERGED.
::  --  `BOP` IS THE RESULT OF PATCHING THE ORIGINAL FILES WITH THE ABOVE MERGED
::      DIFFS.
::  --  `NEW` IS THE NEWLY-CREATED COMMIT.
::  --  `ANK` IS THE ANKH FOR THE NEW STATE.
::  --  `ERG` IS THE SETS OF FILES THAT SHOULD BE TOLD TO UNIX.  TRUE MEANS TO
::      WRITE THE FILE WHILE FALSE MEANS TO DELETE THE FILE.
::  --  `GON` IS THE RETURN VALUE OF THE MERGE.  ON SUCCESS WE PRODUCE A SET OF
::      THE PATHS THAT HAD CONFLICTING CHANGES.  ON FAILURE WE PRODUCE AN ERROR
::      CODE AND MESSAGE.
::
++  MERY                                                ::  MERGE STATE
  $:  SOR/(PAIR SHIP DESK)                              ::  MERGE SOURCE
      HEN/DUCT                                          ::  FORMAL SOURCE
      GEM/GERM                                          ::  STRATEGY
      WAT/WAIT                                          ::  WAITING ON
      CAS/CASE                                          ::  ALI'S CASE
      ALI/YAKI                                          ::  ALI'S COMMIT
      BOB/YAKI                                          ::  BOB'S COMMIT
      BAS/YAKI                                          ::  MERGEBASE
      DAL/CANE                                          ::  DIFF(BAS,ALI)
      DOB/CANE                                          ::  DIFF(BAS,BOB)
      BOF/(MAP PATH (UNIT CAGE))                        ::  CONFLICT DIFFS
      BOP/(MAP PATH CAGE)                               ::  CONFLICT PATCHES
      NEW/YAKI                                          ::  MERGE(DAL,DOB)
      ANK/ANKH                                          ::  NEW STATE
      ERG/(MAP PATH ?)                                  ::  ERGOABLE CHANGES
      GON/(EACH (SET PATH) (PAIR TERM (LIST TANK)))     ::  RETURN VALUE
  ==                                                    ::
::
::  NEW DESK DATA.
::
::  SENT TO OTHER SHIPS TO UPDATE THEM ABOUT A PARTICULAR DESK.  INCLUDES A MAP
::  OF ALL NEW AEONS TO HASHES OF THEIR COMMITS, THE MOST RECENT AEON, AND SETS
::  OF ALL NEW COMMITS AND DATA.
::
++  NAKO                                                ::  SUBSCRIPTION STATE
  $:  GAR/(MAP AEON TAKO)                               ::  NEW IDS
      LET/AEON                                          ::  NEXT ID
      LAR/(SET YAKI)                                    ::  NEW COMMITS
      BAR/(SET PLOP)                                    ::  NEW CONTENT
  ==                                                    ::
::
::  FORMAL VANE STATE.
::
::  --  `ROM` IS OUR DOMESTIC STATE.
::  --  `HOY` IS A COLLECTION OF FOREIGN SHIPS WHERE WE KNOW SOMETHING ABOUT
::      THEIR CLAY.
::  --  `RAN` IS THE OBJECT STORE.
::  --  `MON` IS A COLLECTION OF MOUNT POINTS (MOUNT POINT NAME TO URBIT
::      LOCATION).
::  --  `HEZ` IS THE UNIX DUCT THAT %ERGO'S SHOULD BE SENT TO.
::  --  `CEZ` IS A COLLECTION OF NAMED PERMISSION GROUPS.
::  --  `CUE` IS A QUEUE OF REQUESTS TO PERFORM IN LATER EVENTS.
::  --  `TIP` IS THE DATE OF THE LAST WRITE; IF NOW, ENQUEUE INCOMING REQUESTS.
::
++  RAFT                                                ::  FILESYSTEM
  $:  ROM/ROOM                                          ::  DOMESTIC
      HOY/(MAP SHIP RUNG)                               ::  FOREIGN
      RAN/RANG                                          ::  HASHES
      MON/(MAP TERM BEAM)                               ::  MOUNT POINTS
      HEZ/(UNIT DUCT)                                   ::  SYNC DUCT
      CEZ/(MAP @TA CREW)                                ::  PERMISSION GROUPS
      CUE/(QEU [DUCT TASK:ABLE])                        ::  QUEUED REQUESTS
      TIP/@DA                                           ::  LAST WRITE DATE
  ==                                                    ::
::
::  OBJECT STORE.
::
::  MAPS OF COMMIT HASHES TO COMMITS AND CONTENT HASHES TO CONTENT.
::
++  RANG                                                ::
  $:  HUT/(MAP TAKO YAKI)                               ::
      LAT/(MAP LOBE BLOB)                               ::
  ==                                                    ::
::
::  UNVALIDATED RESPONSE TO A REQUEST.
::
::  LIKE A ++RANT, BUT WITH A PAGE OF DATA RATHER THAN A CAGE OF IT.
::
++  RAND                                                ::  UNVALIDATED RANT
          $:  P/{P/CARE Q/CASE R/@TAS}                  ::  CLADE RELEASE BOOK
              Q/PATH                                    ::  SPUR
              R/PAGE                                    ::  DATA
          ==                                            ::
::
::  GENERIC DESK STATE.
::
::  --  `LIM` IS THE MOST RECENT DATE WE'RE CONFIDENT WE HAVE ALL THE
::      INFORMATION FOR.  FOR LOCAL DESKS, THIS IS ALWAYS `NOW`.  FOR FOREIGN
::      DESKS, THIS IS THE LAST TIME WE GOT A FULL UPDATE FROM THE FOREIGN
::      URBIT.
::  --  `REF` IS A POSSIBLE REQUEST MANAGER.  FOR LOCAL DESKS, THIS IS NULL.
::      FOR FOREIGN DESKS, THIS KEEPS TRACK OF ALL PENDING FOREIGN REQUESTS
::      PLUS A CACHE OF THE RESPONSES TO PREVIOUS REQUESTS.
::  --  `QYX` IS THE SET OF SUBSCRIPTIONS, WITH LISTENING DUCTS. THESE
::      SUBSCRIPTIONS EXIST ONLY UNTIL THEY'VE BEEN FILLED.
::  --  `DOM` IS THE ACTUAL STATE OF THE FILETREE.  SINCE THIS IS USED ALMOST
::      EXCLUSIVELY IN `++ZE`, WE DESCRIBE IT THERE.
::  --  `DOK` IS A POSSIBLE SET OF OUTSTANDING REQUESTS TO FORD TO PERFORM
::      VARIOUS TASKS ON COMMIT.  THIS IS NULL IFF WE'RE NOT IN THE MIDDLE OF
::      A COMMIT.
::  --  `MER` IS THE STATE OF A POSSIBLE PENDING MERGE.  THIS IS NULL IFF
::      WE'RE NOT IN THE MIDDLE OF A MERGE.  SINCE THIS IS USED ALMOST
::      EXCLUSIVELY IN `++ME`, WE DESCRIBE IT THERE.
::
++  REDE                                                ::  UNIVERSAL PROJECT
          $:  LIM/@DA                                   ::  COMPLETE TO
              REF/(UNIT RIND)                           ::  OUTGOING REQUESTS
              QYX/CULT                                  ::  SUBSCRIBERS
              DOM/DOME                                  ::  REVISION STATE
              DOK/(UNIT DORK)                           ::  OUTSTANDING DIFFS
              MER/(UNIT MERY)                           ::  OUTSTANDING MERGES
              PER/REGS                                  ::  READ PERMS PER PATH
              PEW/REGS                                  ::  WRITE PERMS PER PATH
          ==                                            ::
::
::  FOREIGN REQUEST MANAGER.
::
::  WHEN WE SEND A REQUEST TO A FOREIGN SHIP, WE KEEP TRACK OF IT IN HERE.  THIS
::  INCLUDES A REQUEST COUNTER, A MAP OF REQUEST NUMBERS TO REQUESTS, A REVERSE
::  MAP OF REQUESTERS TO REQUEST NUMBERS, A SIMPLE CACHE OF COMMON %SING
::  REQUESTS, AND A POSSIBLE NAKO IF WE'VE RECEIVED DATA FROM THE OTHER SHIP AND
::  ARE IN THE PROCESS OF VALIDATING IT.
::
++  RIND                                                ::  REQUEST MANAGER
          $:  NIX/@UD                                   ::  REQUEST INDEX
              BOM/(MAP @UD {P/DUCT Q/RAVE})             ::  OUTSTANDING
              FOD/(MAP DUCT @UD)                        ::  CURRENT REQUESTS
              HAW/(MAP MOOD (UNIT CAGE))                ::  SIMPLE CACHE
              NAK/(UNIT NAKO)                           ::  PENDING VALIDATION
          ==                                            ::
::
::  DOMESTIC SHIP.
::
::  `HUN` IS THE DUCT TO DILL, AND `DOS` IS A COLLECTION OF OUR DESKS.
::
++  ROOM                                                ::  FS PER SHIP
          $:  HUN/DUCT                                  ::  TERMINAL DUCT
              DOS/(MAP DESK DOJO)                       ::  NATIVE DESK
          ==                                            ::
::
::  STORED REQUEST.
::
::  LIKE A ++RAVE BUT WITH CACHES OF CURRENT VERSIONS FOR %NEXT AND %MANY.
::  GENERALLY USED WHEN WE STORE A REQUEST IN OUR STATE SOMEWHERE.
::
++  CACH  (UNIT (UNIT (EACH CAGE LOBE)))                ::  CACHED RESULT
++  WOVE  {P/(UNIT SHIP) Q/ROVE}                        ::  STORED SOURCE + REQ
++  ROVE                                                ::  STORED REQUEST
          $%  {$SING P/MOOD}                            ::  SINGLE REQUEST
              {$NEXT P/MOOD Q/(UNIT AEON) R/CACH}       ::  NEXT VERSION OF ONE
              $:  $MULT                                 ::  NEXT VERSION OF ANY
                  P/MOOL                                ::  ORIGINAL REQUEST
                  Q/(UNIT AEON)                         ::  CHECKING FOR CHANGE
                  R/(MAP (PAIR CARE PATH) CACH)         ::  OLD VERSION
                  S/(MAP (PAIR CARE PATH) CACH)         ::  NEW VERSION
              ==                                        ::
              {$MANY P/? Q/MOAT R/(MAP PATH LOBE)}      ::  CHANGE RANGE
          ==                                            ::
::
::  FOREIGN DESK DATA.
::
+=  RUNG  RUS/(MAP DESK REDE)                           ::  NEIGHBOR DESKS
::
::  HASH OF A COMMIT, FOR LOOKUP IN THE OBJECT STORE (HUT.RAN)
::
++  TAKO  @                                             ::  YAKI REF
::
::  MERGE STATE.
::
++  WAIT  $?  $NULL   $ALI    $DIFF-ALI   $DIFF-BOB     ::  WHAT ARE WE
              $MERGE  $BUILD  $CHECKOUT   $ERGO         ::  WAITING FOR?
          ==                                            ::
::
::  COMMIT.
::
::  LIST OF PARENTS, CONTENT, HASH OF SELF, AND TIME COMMITED.
::
++  YAKI                                                ::  SNAPSHOT
          $:  P/(LIST TAKO)                             ::  PARENTS
              Q/(MAP PATH LOBE)                         ::  FILESET
              R/TAKO                                    ::
          ::                                            ::  XX S?
              T/@DA                                     ::  DATE
          ==                                            ::
::
::  UNVALIDATED BLOB
::
++  PLOP  BLOB                                          ::  UNVALIDATED BLOB
--  =>
|%
++  MOVE  {P/DUCT Q/(WIND NOTE GIFT:ABLE)}              ::  LOCAL MOVE
++  NOTE                                                ::  OUT REQUEST $->
  $%  $:  $A                                            ::  TO %AMES
  $%  {$WANT P/SHIP Q/PATH R/*}                         ::
  ==  ==                                                ::
      $:  $C                                            ::  TO %CLAY
  $%  {$INFO Q/@TAS R/NORI}                             ::  INTERNAL EDIT
      {$MERG P/@TAS Q/@P R/@TAS S/CASE T/GERM:CLAY}     ::  MERGE DESKS
      {$WARP P/SHIP Q/RIFF}                             ::
      {$WERP P/SHIP Q/SHIP R/RIFF}                      ::
  ==  ==                                                ::
      $:  $D                                            ::
  $%  {$FLOG P/{$CRUD P/@TAS Q/(LIST TANK)}}            ::  TO %DILL
  ==  ==                                                ::
      $:  $F                                            ::
  $%  [%BUILD LIVE=? SCHEMATIC=SCHEMATIC:FORD]          ::
  ==  ==
      $:  $B                                            ::
  $%  {$WAIT P/@DA}                                     ::
      {$REST P/@DA}                                     ::
  ==  ==  ==                                            ::
++  RIOT  (UNIT RANT)                                   ::  RESPONSE+COMPLETE
++  SIGN                                                ::  IN RESULT $<-
          $%  $:  $A                                    ::  BY %AMES
          $%  {$WOOT P/SHIP Q/COOP}                     ::
              {$SEND P/LANE:AMES Q/@}                   ::  TRANSMIT PACKET
          ==  ==                                        ::
              $:  $C                                    ::  BY %CLAY
          $%  {$NOTE P/@TD Q/TANK}                      ::
              {$MERE P/(EACH (SET PATH) (PAIR TERM TANG))}
              {$WRIT P/RIOT}                            ::
          ==  ==                                        ::
              $:  $F                                    ::
          $%  [%MADE DATE=@DA RESULT=MADE-RESULT:FORD]  ::
          ==  ==                                        ::
              $:  $B                                    ::
          $%  {$WAKE ~}                                ::  TIMER ACTIVATE
          ==  ==                                        ::
              $:  @TAS                                  ::  BY ANY
          $%  {$CRUD P/@TAS Q/(LIST TANK)}              ::
          ==  ==  ==                                    ::
--  =>
::  %UTILITIES
::
|%
::  +SORT-BY-HEAD: SORTS ALPHABETICALLY USING THE HEAD OF EACH ELEMENT
::
++  SORT-BY-HEAD
  |=([A=(PAIR PATH *) B=(PAIR PATH *)] (AOR P.A P.B))
::
--  =>
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::  SECTION 4CA, FILESYSTEM LOGIC
::
::  THIS CORE CONTAINS THE MAIN LOGIC OF CLAY.  BESIDES `++ZE`, THIS DIRECTLY
::  CONTAINS THE LOGIC FOR COMMITING NEW REVISIONS (LOCAL URBITS), MANAGING
::  AND NOTIFYING SUBSCRIBERS (REACTIVITY), AND PULLING AND VALIDATING CONTENT
::  (REMOTE URBITS).
::
::  THE STATE INCLUDES:
::
::  --  LOCAL URBIT `OUR`
::  --  CURRENT TIME `NOW`
::  --  CURRENT DUCT `HEN`
::  --  ALL VANE STATE `++RAFT` (RARELY USED, EXCEPT FOR THE OBJECT STORE)
::  --  TARGET URBIT `HER`
::  --  TARGET DESK `SYD`
::
::  FOR LOCAL DESKS, `OUR` == `HER` IS ONE OF THE URBITS ON OUR PIER.  FOR
::  FOREIGN DESKS, `HER` IS THE URBIT THE DESK IS ON AND `OUR` IS THE LOCAL
::  URBIT THAT'S MANAGING THE RELATIONSHIP WITH THE FOREIGN URBIT.  DON'T MIX
::  UP THOSE TWO, OR THERE WILL BE WAILING AND GNASHING OF TEETH.
::
::  WHILE SETTING UP `++DE`, WE CHECK IF `OUR` == `HER`. IF SO, WE GET
::  THE DESK INFORMATION FROM `DOS.ROM`.  OTHERWISE, WE GET THE RUNG FROM
::  `HOY` AND GET THE DESK INFORMATION FROM `RUS` IN THERE.  IN EITHER CASE,
::  WE NORMALIZE THE DESK INFORMATION TO A `++REDE`, WHICH IS ALL THE
::  DESK-SPECIFIC DATA THAT WE UTILIZE IN `++DE`.  BECAUSE IT'S EFFECTIVELY
::  A PART OF THE `++DE` STATE, LET'S LOOK AT WHAT WE'VE GOT:
::
::  --  `LIM` IS THE MOST RECENT DATE WE'RE CONFIDENT WE HAVE ALL THE
::      INFORMATION FOR.  FOR LOCAL DESKS, THIS IS ALWAYS `NOW`.  FOR FOREIGN
::      DESKS, THIS IS THE LAST TIME WE GOT A FULL UPDATE FROM THE FOREIGN
::      URBIT.
::  --  `REF` IS A POSSIBLE REQUEST MANAGER.  FOR LOCAL DESKS, THIS IS NULL.
::      FOR FOREIGN DESKS, THIS KEEPS TRACK OF ALL PENDING FOREIGN REQUESTS
::      PLUS A CACHE OF THE RESPONSES TO PREVIOUS REQUESTS.
::  --  `QYX` IS THE SET OF SUBSCRIPTIONS, WITH LISTENING DUCTS. THESE
::      SUBSCRIPTIONS EXIST ONLY UNTIL THEY'VE BEEN FILLED.
::  --  `DOM` IS THE ACTUAL STATE OF THE FILETREE.  SINCE THIS IS USED ALMOST
::      EXCLUSIVELY IN `++ZE`, WE DESCRIBE IT THERE.
::  --  `DOK` IS A POSSIBLE SET OF OUTSTANDING REQUESTS TO FORD TO PERFORM
::      VARIOUS TASKS ON COMMIT.  THIS IS NULL IFF WE'RE NOT IN THE MIDDLE OF
::      A COMMIT.
::  --  `MER` IS THE STATE OF A POSSIBLE PENDING MERGE.  THIS IS NULL IFF
::      WE'RE NOT IN THE MIDDLE OF A MERGE.  SINCE THIS IS USED ALMOST
::      EXCLUSIVELY IN `++ME`, WE DESCRIBE IT THERE.
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
|%
++  DE                                                  ::  PER DESK
  |=  [OUR=SHIP NOW=@DA HEN=DUCT RAFT]
  |=  [HER=SHIP SYD=DESK]
  ::  XX RUF=RAFT CRASHES IN THE COMPILER
  ::
  =*  RUF  |3.+6.^$
  ::
  =+  ^-  [HUN=(UNIT DUCT) REDE]
      ?.  =(OUR HER)
        ::  NO DUCT, FOREIGN +REDE OR DEFAULT
        ::
        :-  ~
        =/  RUS  RUS:(FALL (~(GET BY HOY.RUF) HER) *RUNG)
        %+  FALL  (~(GET BY RUS) SYD)
        [LIM=~2000.1.1 REF=`*RIND QYX=~ DOM=*DOME DOK=~ MER=~ PER=~ PEW=~]
      ::  ADMINISTRATIVE DUCT, DOMESTIC +REDE
      ::
      :-  `HUN.ROM.RUF
      =/  JOD  (FALL (~(GET BY DOS.ROM.RUF) SYD) *DOJO)
      [LIM=NOW REF=~ [QYX DOM DOK MER PER PEW]:JOD]
  ::
  =*  RED=REDE  ->
  =|  MOW/(LIST MOVE)
  |%
  ++  ABET                                              ::  RESOLVE
    ^-  [(LIST MOVE) RAFT]
    :-  (FLOP MOW)
    ?.  =(OUR HER)
      ::  SAVE FOREIGN +REDE
      ::
      =/  RUS  RUS:(FALL (~(GET BY HOY.RUF) HER) *RUNG)
      =/  RUG  (~(PUT BY RUS) SYD RED)
      RUF(HOY (~(PUT BY HOY.RUF) HER RUG))
    ::  SAVE DOMESTIC +ROOM
    ::
    %=  RUF
      HUN.ROM  (NEED HUN)
      DOS.ROM  (~(PUT BY DOS.ROM.RUF) SYD [QYX DOM DOK MER PER PEW]:RED)
    ==
  ::
  ::  HANDLE `%SING` REQUESTS
  ::
  ++  AVER
    |=  {FOR/(UNIT SHIP) MUN/MOOD}
    ^-  (UNIT (UNIT (EACH CAGE LOBE)))
    =+  EZY=?~(REF ~ (~(GET BY HAW.U.REF) MUN))
    ?^  EZY
      `(BIND U.EZY |=(A/CAGE [%& A]))
    =+  NAO=(CASE-TO-AEON:ZE Q.MUN)
    ::  ~&  [%AVER-MUN NAO [%FROM SYD LIM Q.MUN]]
    ?~(NAO ~ (READ-AT-AEON:ZE FOR U.NAO MUN))
  ::
  ++  FORD-FAIL  |=(TAN/TANG ~|(%FORD-FAIL (MEAN TAN)))
  ::
  ::  TAKES EITHER A RESULT OR A STACK TRACE.  IF IT'S A STACK TRACE, WE CRASH;
  ::  ELSE, WE PRODUCE THE RESULT.
  ::
  ++  UNWRAP-TANG
    |*  RES/(EACH * TANG)
    ?:(?=(%& -.RES) P.RES (MEAN P.RES))
  ::
  ::  PARSE A GAGE TO A LIST OF PAIRS OF CAGES, CRASHING ON ERROR.
  ::
  ::  COMPOSITION OF ++GAGE-TO-CAGES-OR-ERROR AND ++UNWRAP-TANG.  MAYBE SAME AS
  ::  ++GAGE-TO-SUCCESS-CAGES?
  ::
  ++  MADE-RESULT-TO-CAGES
    |=  RESULT=MADE-RESULT:FORD
    ^-  (LIST (PAIR CAGE CAGE))
    (UNWRAP-TANG (MADE-RESULT-TO-CAGES-OR-ERROR RESULT))
  ::
  ::  SAME AS ++GAGE-TO-CAGES-OR-ERROR EXCEPT CRASHES ON ERROR.  MAYBE SAME AS
  ::  ++GAGE-TO-CAGES?
  ::
  ++  MADE-RESULT-TO-SUCCESS-CAGES
    |=  RESULT=MADE-RESULT:FORD
    ^-  (LIST (PAIR CAGE CAGE))
    ?.  ?=([%COMPLETE %SUCCESS %LIST *] RESULT)
      (FORD-FAIL >%STRANGE-FORD-RESULT< ~)
    ::  PROCESS EACH ROW IN THE LIST, FILTERING OUT ERRORS
    ::
    %+  MURN  RESULTS.BUILD-RESULT.RESULT
    |=  ROW=BUILD-RESULT:FORD
    ^-  (UNIT [CAGE CAGE])
    ::
    ?:  ?=([%ERROR *] ROW)
      ~&  [%CLAY-WHOLE-BUILD-FAILED MESSAGE.ROW]
      ~
    ?:  ?=([%SUCCESS [%ERROR *] *] ROW)
      ~&  [%CLAY-FIRST-FAILURE MESSAGE.HEAD.ROW]
      ~
    ?:  ?=([%SUCCESS [%SUCCESS *] [%ERROR *]] ROW)
      ~&  [%CLAY-SECOND-FAILURE MESSAGE.TAIL.ROW]
      ~
    ?.  ?=([%SUCCESS [%SUCCESS *] [%SUCCESS *]] ROW)
      ~
    `[(RESULT-TO-CAGE:FORD HEAD.ROW) (RESULT-TO-CAGE:FORD TAIL.ROW)]
  ::
  ::  EXPECTS A SINGLE-LEVEL GAGE (I.E. A LIST OF PAIRS OF CAGES).  IF THE
  ::  RESULT IS OF A DIFFERENT FORM, OR IF SOME OF THE COMPUTATIONS IN THE GAGE
  ::  FAILED, WE PRODUCE A STACK TRACE.  OTHERWISE, WE PRODUCE THE LIST OF PAIRS
  ::  OF CAGES.
  ::
  ++  MADE-RESULT-TO-CAGES-OR-ERROR
    |=  RESULT=MADE-RESULT:FORD
    ^-  (EACH (LIST (PAIR CAGE CAGE)) TANG)
    ::
    ?:  ?=([%INCOMPLETE *] RESULT)
      (MULE |.(`~`(FORD-FAIL TANG.RESULT)))
    ?.  ?=([%COMPLETE %SUCCESS %LIST *] RESULT)
      (MULE |.(`~`(FORD-FAIL >%STRANGE-FORD-RESULT -.BUILD-RESULT.RESULT< ~)))
    =/  RESULTS=(LIST BUILD-RESULT:FORD)
      RESULTS.BUILD-RESULT.RESULT
    =<  ?+(. [%& .] {@ *} .)
    |-
    ^-  ?((LIST [CAGE CAGE]) (EACH ~ TANG))
    ?~  RESULTS  ~
    ::
    ?.  ?=([%SUCCESS ^ *] I.RESULTS)
      (MULE |.(`~`(FORD-FAIL >%STRANGE-FORD-RESULT< ~)))
    ?:  ?=([%ERROR *] HEAD.I.RESULTS)
      (MULE |.(`~`(FORD-FAIL MESSAGE.HEAD.I.RESULTS)))
    ?:  ?=([%ERROR *] TAIL.I.RESULTS)
      (MULE |.(`~`(FORD-FAIL MESSAGE.TAIL.I.RESULTS)))
    ::
    =+  $(RESULTS T.RESULTS)
    ?:  ?=([@ *] -)  -
    :_  -
    [(RESULT-TO-CAGE:FORD HEAD.I.RESULTS) (RESULT-TO-CAGE:FORD TAIL.I.RESULTS)]
  ::
  ::  ASSUMES THE LIST OF PAIRS OF CAGES IS ACTUALLY A LISTIFIED MAP OF PATHS
  ::  TO CAGES, AND CONVERTS IT TO (MAP PATH CAGE) OR A STACK TRACE ON ERROR.
  ::
  ++  CAGES-TO-MAP
    |=  TAY/(LIST (PAIR CAGE CAGE))
    =|  CAN/(MAP PATH CAGE)
    |-  ^-  (EACH (MAP PATH CAGE) TANG)
    ?~  TAY   [%& CAN]
    =*  PAX  P.I.TAY
    ?.  ?=($PATH P.PAX)
      (MULE |.(`~`~|([%EXPECTED-PATH GOT=P.PAX] !!)))
    $(TAY T.TAY, CAN (~(PUT BY CAN) ((HARD PATH) Q.Q.PAX) Q.I.TAY))
  ::
  ::  QUEUE A MOVE.
  ::
  ++  EMIT
    |=  MOF/MOVE
    %_(+> MOW [MOF MOW])
  ::
  ::  QUEUE A LIST OF MOVES
  ::
  ++  EMIL
    |=  MOF/(LIST MOVE)
    %_(+> MOW (WELD MOF MOW))
  ::
  ::  PRODUCE EITHER NULL OR A RESULT ALONG A SUBSCRIPTION.
  ::
  ::  PRODUCING NULL MEANS SUBSCRIPTION HAS BEEN COMPLETED OR CANCELLED.
  ::
  ++  BALK
    |=  {HEN/DUCT CAY/(UNIT (EACH CAGE LOBE)) MUN/MOOD}
    ^+  +>
    ?~  CAY  (BLUB HEN)
    (BLAB HEN MUN U.CAY)
  ::
  ::  SET TIMER.
  ::
  ++  BAIT
    |=  {HEN/DUCT TYM/@DA}
    (EMIT HEN %PASS /TYME %B %WAIT TYM)
  ::
  ::  CANCEL TIMER.
  ::
  ++  BEST
    |=  {HEN/DUCT TYM/@DA}
    (EMIT HEN %PASS /TYME %B %REST TYM)
  ::
  ::  GIVE SUBSCRIPTION RESULT.
  ::
  ::  RESULT CAN BE EITHER A DIRECT RESULT (CAGE) OR A LOBE OF A RESULT.  IN
  ::  THE LATTER CASE WE FETCH THE DATA AT THE LOBE AND PRODUCE THAT.
  ::
  ++  BLAB
    |=  {HEN/DUCT MUN/MOOD DAT/(EACH CAGE LOBE)}
    ^+  +>
    ?:  ?=(%& -.DAT)
      (EMIT HEN %GIVE %WRIT ~ [P.MUN Q.MUN SYD] R.MUN P.DAT)
    %-  EMIT
    :*  HEN  %PASS  [%BLAB P.MUN (SCOT Q.MUN) SYD R.MUN]
        %F  %BUILD  LIVE=%.N  %PIN
        (CASE-TO-DATE Q.MUN)
        (LOBE-TO-SCHEMATIC:ZE [HER SYD] R.MUN P.DAT)
    ==
  ::
  ++  CASE-TO-DATE
    |=  =CASE
    ^-  @DA
    ::  IF THE CASE IS ALREADY A DATE, USE IT.
    ::
    ?:  ?=([%DA *] CASE)
      P.CASE
    ::  TRANSLATE OTHER CASES TO DATES
    ::
    =/  AEY  (CASE-TO-AEON:ZE CASE)
    ::  ~&  [%CASE-TO-DATE AEY LET.DOM OUR HER SYD CASE]
    ?~  AEY  `@DA`0
    ?:  =(0 U.AEY)  `@DA`0
    T:(AEON-TO-YAKI:ZE U.AEY)
  ::
  ++  BLAS
    |=  {HEN/DUCT DAS/(SET MOOD)}
    ^+  +>
    ?>  ?=(^ DAS)
    ::  TRANSLATE THE CASE TO A DATE
    ::
    =/  CAS  [%DA (CASE-TO-DATE Q.N.DAS)]
    =-  (EMIT HEN %GIVE %WRIS CAS -)
    (~(RUN IN `(SET MOOD)`DAS) |=(M/MOOD [P.M R.M]))
  ::
  ::  GIVE NEXT STEP IN A SUBSCRIPTION.
  ::
  ++  BLEB
    |=  {HEN/DUCT INS/@UD HIP/(UNIT (PAIR AEON AEON))}
    ^+  +>
    %^  BLAB  HEN  [%W [%UD INS] ~]
    :-  %&
    ?~  HIP
      [%NULL [%ATOM %N ~] ~]
    [%NAKO !>((MAKE-NAKO:ZE U.HIP))]
  ::
  ::  TELL SUBSCRIBER THAT SUBSCRIPTION IS DONE.
  ::
  ++  BLUB
    |=  HEN/DUCT
    (EMIT HEN %GIVE %WRIT ~)
  ::
  ::  LIFTS A FUNCTION SO THAT A SINGLE RESULT CAN BE FANNED OUT OVER A SET OF
  ::  SUBSCRIBER DUCTS.
  ::
  ::  THUS, `((DUCT-LIFT FUNC) SUBS ARG)` RUNS `(FUNC SUB ARG)` FOR EACH `SUB`
  ::  IN `SUBS`.
  ::
  ++  DUCT-LIFT
    |*  SEND/_|=({DUCT *} ..DUCT-LIFT)
    |=  {A/(SET DUCT) ARG/_+<+.SEND}  ^+  ..DUCT-LIFT
    =+  ALL=~(TAP BY A)
    |-  ^+  ..DUCT-LIFT
    ?~  ALL  ..DUCT-LIFT
    =.  +>.SEND  ..DUCT-LIFT
    $(ALL T.ALL, DUCT-LIFT (SEND I.ALL ARG))
  ::
  ++  BLUB-ALL  (DUCT-LIFT |=({A/DUCT ~} (BLUB A)))    ::  LIFTED ++BLUB
  ++  BLAB-ALL  (DUCT-LIFT BLAB)                        ::  LIFTED ++BLAB
  ++  BLAS-ALL  (DUCT-LIFT BLAS)                        ::  LIFTED ++BLAS
  ++  BALK-ALL  (DUCT-LIFT BALK)                        ::  LIFTED ++BALK
  ++  BLEB-ALL  (DUCT-LIFT BLEB)                        ::  LIFTED ++BLEB
  ::
  ::  SENDS A TANK STRAIGHT TO DILL FOR PRINTING.
  ::
  ++  PRINT-TO-DILL
    |=  {CAR/@TD TAN/TANK}
    =+  BAR=EMIT
    =+  FOO=+26.BAR
    =+  MOO=,.+26.BAR
    (EMIT (NEED HUN) %GIVE %NOTE CAR TAN)
  ::
  ::  TRANSFER A REQUEST TO ANOTHER SHIP'S CLAY.
  ::
  ++  SEND-OVER-AMES
    |=  {A/DUCT B/PATH C/SHIP D/{P/@UD Q/RIFF}}
    (EMIT A %PASS B %A %WANT C [%C %QUESTION P.Q.D (SCOT %UD P.D) ~] Q.D)
  ::
  ::  CREATE A REQUEST THAT CANNOT BE FILLED IMMEDIATELY.
  ::
  ::  IF IT'S A LOCAL REQUEST, WE JUST PUT IN IN `QYX`, SETTING A TIMER IF IT'S
  ::  WAITING FOR A PARTICULAR TIME.  IF IT'S A FOREIGN REQUEST, WE ADD IT TO
  ::  OUR REQUEST MANAGER (REF, WHICH IS A ++RIND) AND MAKE THE REQUEST TO THE
  ::  FOREIGN SHIP.
  ::
  ++  DUCE                                              ::  PRODUCE REQUEST
    |=  WOV/WOVE
    ^+  +>
    =.  WOV  (DEDUPE WOV)
    =.  QYX  (~(PUT JU QYX) WOV HEN)
    ?~  REF
      (MABE Q.WOV |=(@DA (BAIT HEN +<)))
    |-  ^+  +>+.$
    =+  RAV=(REVE Q.WOV)
    =+  ^=  VAW  ^-  RAVE
      ?.  ?=({$SING $V *} RAV)  RAV
      [%MANY %| [%UD LET.DOM] `CASE`Q.P.RAV R.P.RAV]
    =+  INX=NIX.U.REF
    =.  +>+.$
      =<  ?>(?=(^ REF) .)
      (SEND-OVER-AMES HEN [(SCOT %UD INX) ~] HER INX SYD ~ VAW)
    %=  +>+.$
      NIX.U.REF  +(NIX.U.REF)
      BOM.U.REF  (~(PUT BY BOM.U.REF) INX [HEN VAW])
      FOD.U.REF  (~(PUT BY FOD.U.REF) HEN INX)
    ==
  ::
  ::  IF A SIMILAR REQUEST EXISTS, SWITCH TO THE EXISTING REQUEST.
  ::
  ::  "SIMILAR" REQUESTS ARE THOSE %NEXT AND %MANY REQUESTS WHICH ARE THE SAME
  ::  UP TO STARTING CASE, BUT WE'RE ALREADY AFTER THE STARTING CASE.  THIS
  ::  STACKS LATER REQUESTS FOR SOMETHING ONTO THE SAME REQUEST SO THAT THEY
  ::  ALL GET FILLED AT ONCE.
  ::
  ++  DEDUPE                                            ::  FIND EXISTING ALIAS
    |=  WOV/WOVE
    ^-  WOVE
    =;  WON/(UNIT WOVE)  (FALL WON WOV)
    =*  ROV  Q.WOV
    ?-    -.ROV
        $SING  ~
        $NEXT
      =+  AEY=(CASE-TO-AEON:ZE Q.P.ROV)
      ?~  AEY  ~
      %-  ~(REP IN ~(KEY BY QYX))
      |=  {HAW/WOVE RES/(UNIT WOVE)}
      ?^  RES  RES
      ?.  =(P.WOV P.HAW)  ~
      =*  HAV  Q.HAW
      =-  ?:(- `HAW ~)
      ?&  ?=($NEXT -.HAV)
          =(P.HAV P.ROV(Q Q.P.HAV))
        ::
          ::  ONLY A MATCH IF THIS REQUEST IS BEFORE
          ::  OR AT OUR STARTING CASE.
          =+  HAY=(CASE-TO-AEON:ZE Q.P.HAV)
          ?~(HAY | (LTE U.HAY U.AEY))
      ==
    ::
        $MULT
      =+  AEY=(CASE-TO-AEON:ZE P.P.ROV)
      ?~  AEY  ~
      %-  ~(REP IN ~(KEY BY QYX))
      |=  {HAW/WOVE RES/(UNIT WOVE)}
      ?^  RES  RES
      ?.  =(P.WOV P.HAW)  ~
      =*  HAV  Q.HAW
      =-  ?:(- `HAW ~)
      ?&  ?=($MULT -.HAV)
          =(P.HAV P.ROV(P P.P.HAV))
        ::
          ::  ONLY A MATCH IF THIS REQUEST IS BEFORE
          ::  OR AT OUR STARTING CASE, AND IT HAS BEEN
          ::  TESTED AT LEAST THAT FAR.
          =+  HAY=(CASE-TO-AEON:ZE P.P.HAV)
          ?&  ?=(^ HAY)
              (LTE U.HAY U.AEY)
              ?=(^ Q.HAV)
              (GTE U.Q.HAV U.AEY)
          ==
      ==
    ::
        $MANY
      =+  AEY=(CASE-TO-AEON:ZE P.Q.ROV)
      ?~  AEY  ~
      %-  ~(REP IN ~(KEY BY QYX))
      |=  {HAW/WOVE RES/(UNIT WOVE)}
      ?^  RES  RES
      ?.  =(P.WOV P.HAW)  ~
      =*  HAV  Q.HAW
      =-  ?:(- `HAW ~)
      ?&  ?=($MANY -.HAV)
          =(HAV ROV(P.Q P.Q.HAV))
        ::
          ::  ONLY A MATCH IF THIS REQUEST IS BEFORE
          ::  OR AT OUR STARTING CASE.
          =+  HAY=(CASE-TO-AEON:ZE P.Q.HAV)
          ?~(HAY | (LTE U.HAY U.AEY))
      ==
    ==
  ::
  ::  TAKES A LIST OF CHANGED PATHS AND FINDS THOSE PATHS THAT ARE INSIDE A
  ::  MOUNT POINT (LISTED IN `MON`).
  ::
  ::  OUTPUT IS A MAP OF MOUNT POINTS TO {LENGTH-OF-MOUNTED-PATH SET-OF-PATHS}.
  ::
  ++  MUST-ERGO
    |=  CAN/(LIST PATH)
    ^-  (MAP TERM (PAIR @UD (SET PATH)))
    %-  MALT  ^-  (LIST (TREL TERM @UD (SET PATH)))
    %+  MURN  ~(TAP BY MON)
    |=  {NAM/TERM BEM/BEAM}
    ^-  (UNIT (TREL TERM @UD (SET PATH)))
    =-  ?~(- ~ `[NAM (LENT S.BEM) (SILT `(LIST PATH)`-)])
    %+  SKIM  CAN
    |=  PAX/PATH
    &(=(P.BEM HER) =(Q.BEM SYD) =((FLOP S.BEM) (SCAG (LENT S.BEM) PAX)))
  ::
  ::  INITIALIZES A NEW MOUNT POINT.
  ::
  ++  MONT
    |=  {POT/TERM BEM/BEAM}
    ^+  +>
    =+  PAX=S.BEM
    =+  CAS=(NEED (CASE-TO-AEON:ZE R.BEM))
    =+  CAN=(TURN ~(TAP BY Q:(AEON-TO-YAKI:ZE CAS)) HEAD)
    =+  MUS=(SKIM CAN |=(PAF/PATH =(PAX (SCAG (LENT PAX) PAF))))
    ?~  MUS
      +>.$
    %-  EMIT
    ^-  MOVE
    :*  HEN  %PASS  [%ERGOING (SCOT %P HER) SYD ~]  %F
        %BUILD  LIVE=%.N  %LIST
        ^-  (LIST SCHEMATIC:FORD)
        %+  TURN  `(LIST PATH)`MUS
        |=  A/PATH
        :-  [%$ %PATH !>(A)]
        :^  %CAST  [OUR %HOME]  %MIME
        =+  (NEED (NEED (READ-X:ZE CAS A)))
        ?:  ?=(%& -<)
          [%$ P.-]
        (LOBE-TO-SCHEMATIC:ZE [HER SYD] A P.-)
    ==
  ::
  ::  SET PERMISSIONS FOR A NODE.
  ::
  ++  PERM
    |=  {PAX/PATH RIT/RITE}
    ^+  +>
    =/  MIS/(SET @TA)
      %+  ROLL
        =-  ~(TAP IN -)
        ?-  -.RIT
          $R    WHO:(FALL RED.RIT *RULE)
          $W    WHO:(FALL WIT.RIT *RULE)
          $RW   (~(UNI IN WHO:(FALL RED.RIT *RULE)) WHO:(FALL WIT.RIT *RULE))
        ==
      |=  {W/WHOM S/(SET @TA)}
      ?:  |(?=(%& -.W) (~(HAS BY CEZ) P.W))  S
      (~(PUT IN S) P.W)
    ?^  MIS
      =-  (EMIT HEN %GIVE %MACK `[%LEAF "NO SUCH GROUP(S): {-}"]~)
      %+  ROLL  ~(TAP IN `(SET @TA)`MIS)
      |=  {G/@TA T/TAPE}
      ?~  T  (TRIP G)
      :(WELD T ", " (TRIP G))
    =<  (EMIT HEN %GIVE %MACK ~)
    ?-  -.RIT
      $R    WAKE(PER (PUT-PERM PER PAX RED.RIT))
      $W    WAKE(PEW (PUT-PERM PEW PAX WIT.RIT))
      $RW   WAKE(PER (PUT-PERM PER PAX RED.RIT), PEW (PUT-PERM PEW PAX WIT.RIT))
    ==
  ::
  ++  PUT-PERM
    |=  {PES/REGS PAX/PATH NEW/(UNIT RULE)}
    ?~  NEW  (~(DEL BY PES) PAX)
    (~(PUT BY PES) PAX U.NEW)
  ::
  ::  REMOVE A GROUP FROM ALL RULES.
  ::
  ++  FORGET-CREW
    |=  NOM/@TA
    %=  +>
      PER  (FORGET-CREW-IN NOM PER)
      PEW  (FORGET-CREW-IN NOM PEW)
    ==
  ::
  ++  FORGET-CREW-IN
    |=  {NOM/@TA PES/REGS}
    %-  ~(RUN BY PES)
    |=  R/RULE
    R(WHO (~(DEL IN WHO.R) |+NOM))
  ::
  ::  CANCEL A REQUEST.
  ::
  ::  FOR LOCAL REQUESTS, WE JUST REMOVE IT FROM `QYX`.  FOR FOREIGN REQUESTS,
  ::  WE REMOVE IT FROM `REF` AND TELL THE FOREIGN SHIP TO CANCEL AS WELL.
  ::
  ++  CANCEL-REQUEST                                    ::  RELEASE REQUEST
    ^+  .
    =^  WOS/(LIST WOVE)  QYX
      :_  (~(RUN BY QYX) |=(A/(SET DUCT) (~(DEL IN A) HEN)))
      %-  ~(REP BY QYX)
      |=  {{A/WOVE B/(SET DUCT)} C/(LIST WOVE)}
      ?.((~(HAS IN B) HEN) C [A C])
    ?~  REF
      =>  .(REF `(UNIT RIND)`REF)     ::  XX TMI
      ?:  =(~ WOS)  +                                        ::  XX HANDLE?
      |-  ^+  +>
      ?~  WOS  +>
      $(WOS T.WOS, +> (MABE Q.I.WOS |=(@DA (BEST HEN +<))))
    ^+  ..CANCEL-REQUEST
    =+  NUX=(~(GET BY FOD.U.REF) HEN)
    ?~  NUX  ..CANCEL-REQUEST
    =:  FOD.U.REF  (~(DEL BY FOD.U.REF) HEN)
        BOM.U.REF  (~(DEL BY BOM.U.REF) U.NUX)
      ==
    (SEND-OVER-AMES HEN [(SCOT %UD U.NUX) ~] HER U.NUX SYD ~)
  ::
  ::  HANDLES A REQUEST.
  ::
  ::  `%SING` REQUESTS ARE HANDLED BY ++AVER.  `%NEXT` REQUESTS ARE HANDLED BY
  ::  RUNNING ++AVER AT THE GIVEN CASE, AND THEN SUBSEQUENT CASES UNTIL WE FIND
  ::  A CASE WHERE THE TWO RESULTS AREN'T EQUIVALENT.  IF IT HASN'T HAPPENED
  ::  YET, WE WAIT.  `%MANY` REQUESTS ARE HANDLED BY PRODUCING AS MUCH AS WE CAN
  ::  AND THEN WAITING IF THE SUBSCRIPTION RANGE EXTENDS INTO THE FUTURE.
  ::
  ++  START-REQUEST
    |=  {FOR/(UNIT SHIP) RAV/RAVE}
    ^+  +>
    ?-    -.RAV
        $SING
      =+  VER=(AVER FOR P.RAV)
      ?~  VER
        (DUCE FOR RAV)
      ?~  U.VER
        (BLUB HEN)
      (BLAB HEN P.RAV U.U.VER)
    ::
    ::  FOR %MULT AND %NEXT, GET THE DATA AT THE SPECIFIED CASE, THEN GO FORWARD
    ::  IN TIME UNTIL WE FIND A CHANGE (AS LONG AS WE HAVE NO UNKNOWNS).
    ::  IF WE FIND NO CHANGE, STORE REQUEST FOR LATER.
    ::  %NEXT IS JUST %MULT WITH ONE PATH, SO WE PRETEND %NEXT = %MULT HERE.
        ?($NEXT $MULT)
      |^
      =+  CAS=?:(?=($NEXT -.RAV) Q.P.RAV P.P.RAV)
      =+  AEY=(CASE-TO-AEON:ZE CAS)
      ::  IF THE REQUESTED CASE IS IN THE FUTURE, WE CAN'T KNOW ANYTHING YET.
      ?~  AEY  (STORE ~ ~ ~)
      =+  OLD=(READ-ALL-AT CAS)
      =+  YON=+(U.AEY)
      |-  ^+  ..START-REQUEST
      ::  IF WE NEED FUTURE REVISIONS TO LOOK FOR CHANGE, WAIT.
      ?:  (GTH YON LET.DOM)
        (STORE `YON OLD ~)
      =+  NEW=(READ-ALL-AT [%UD YON])
      ::  IF WE DON'T KNOW EVERYTHING NOW, STORE THE REQUEST FOR LATER.
      ?.  &((LEVY ~(TAP BY OLD) KNOW) (LEVY ~(TAP BY NEW) KNOW))
        (STORE `YON OLD NEW)
      ::  IF WE DO KNOW EVERYTHING NOW, COMPARE OLD AND NEW.
      ::  IF THERE ARE DIFFERENCES, SEND RESPONSE. IF NOT, TRY NEXT AEON.
      =;  RES
        ?~  RES  $(YON +(YON))
        (RESPOND RES)
      %+  ROLL  ~(TAP BY OLD)
      |=  $:  {{CAR/CARE PAX/PATH} OLE/CACH}
              RES/(MAP MOOD (EACH CAGE LOBE))
          ==
      =+  NEU=(~(GOT BY NEW) CAR PAX)
      ?<  |(?=(~ OLE) ?=(~ NEU))
      =-  ?~(- RES (~(PUT BY RES) U.-))
      ^-  (UNIT (PAIR MOOD (EACH CAGE LOBE)))
      =+  MOD=[CAR [%UD YON] PAX]
      ?~  U.OLE
       ?~  U.NEU  ~                                     ::  NOT ADDED
       `[MOD U.U.NEU]                                   ::  ADDED
      ?~  U.NEU
        `[MOD [%& %NULL [%ATOM %N ~] ~]]                ::  DELETED
      ?:  (EQUIVALENT-DATA:ZE U.U.NEU U.U.OLE)  ~       ::  UNCHANGED
      `[MOD U.U.NEU]                                    ::  CHANGED
      ::
      ++  STORE                                         ::  CHECK AGAIN LATER
        |=  $:  NEX/(UNIT AEON)
                OLD/(MAP (PAIR CARE PATH) CACH)
                NEW/(MAP (PAIR CARE PATH) CACH)
            ==
        ^+  ..START-REQUEST
        %+  DUCE  FOR
        ^-  ROVE
        ?:  ?=($MULT -.RAV)
          [-.RAV P.RAV NEX OLD NEW]
        :^  -.RAV  P.RAV  NEX
        =+  OLE=~(TAP BY OLD)
        ?>  (LTE (LENT OLE) 1)
        ?~  OLE  ~
        Q:(SNAG 0 `(LIST (PAIR (PAIR CARE PATH) CACH))`OLE)
      ::
      ++  RESPOND                                       ::  SEND CHANGES
        |=  RES/(MAP MOOD (EACH CAGE LOBE))
        ^+  ..START-REQUEST
        ?:  ?=($MULT -.RAV)  (BLAS HEN ~(KEY BY RES))
        ?>  ?=({* ~ ~} RES)
        (BLAB HEN N.RES)
      ::
      ++  KNOW  |=({(PAIR CARE PATH) C/CACH} ?=(^ C))   ::  KNOW ABOUT FILE
      ::
      ++  READ-ALL-AT                                   ::  FILES AT CASE, MAYBE
        |=  CAS/CASE
        %-  ~(GAS BY *(MAP (PAIR CARE PATH) CACH))
        =/  REQ/(SET (PAIR CARE PATH))
          ?:  ?=($MULT -.RAV)  Q.P.RAV
          [[P.P.RAV R.P.RAV] ~ ~]
        %+  TURN  ~(TAP BY REQ)
        |=  {C/CARE P/PATH}
        ^-  (PAIR (PAIR CARE PATH) CACH)
        [[C P] (AVER FOR C CAS P)]
      --
    ::
        $MANY
      =+  NAB=(CASE-TO-AEON:ZE P.Q.RAV)
      ?~  NAB
        ?>  =(~ (CASE-TO-AEON:ZE Q.Q.RAV))
        (DUCE FOR [- P Q ~]:RAV)
      =+  HUY=(CASE-TO-AEON:ZE Q.Q.RAV)
      ?:  &(?=(^ HUY) |((LTH U.HUY U.NAB) &(=(0 U.HUY) =(0 U.NAB))))
        (BLUB HEN)
      =+  TOP=?~(HUY LET.DOM U.HUY)
      =+  EAR=(LOBES-AT-PATH:ZE FOR TOP R.Q.RAV)
      =.  +>.$
        (BLEB HEN U.NAB ?:(P.RAV ~ `[U.NAB TOP]))
      ?^  HUY
        (BLUB HEN)
      =+  ^=  PTR  ^-  CASE
          [%UD +(LET.DOM)]
      (DUCE FOR `ROVE`[%MANY P.RAV [PTR Q.Q.RAV R.Q.RAV] EAR])
    ==
  ::
  ::  PRINT A SUMMARY OF CHANGES TO DILL.
  ::
  ++  PRINT-CHANGES
    |=  {WEN/@DA LEM/NURI}
    ^+  +>
    =+  PRE=`PATH`~[(SCOT %P HER) SYD (SCOT %UD LET.DOM)]
    ?-  -.LEM
      %|  (PRINT-TO-DILL '=' %LEAF :(WELD (TRIP P.LEM) " " (SPUD PRE)))
      %&  |-  ^+  +>.^$
          ?~  P.LEM  +>.^$
          =.  +>.^$
            %+  PRINT-TO-DILL
              ?-(-.Q.I.P.LEM $DEL '-', $INS '+', $DIF ':')
            :+  %ROSE  ["/" "/" ~]
            %+  TURN  (WELD PRE P.I.P.LEM)
            |=  A/CORD
            ?:  ((SANE %TA) A)
              [%LEAF (TRIP A)]
            [%LEAF (DASH:US (TRIP A) '\'' ~)]
          $(P.LEM T.P.LEM)
    ==
  ::
  ::  THIS IS THE ENTRY POINT TO THE COMMIT FLOW.  IT DESERVES SOME
  ::  EXPLAINING, SINCE IT'S RATHER LONG AND CONVOLUTED.
  ::
  ::  IN SHORT, ++EDIT TAKES A ++NORI AND TURNS IT INTO A ++NURI, WHICH IS THE
  ::  SAME THING EXCEPT THAT EVERY CHANGE IS A MISU INSTEAD OF A MISO.  THUS,
  ::  INSERTIONS ARE CONVERTED TO THE CORRECT MARK, DIFFS ARE APPLIED, AND
  ::  MUTATIONS (CHANGE CONTENT BY REPLACEMENT) ARE DIFFED.  IT ALSO FILLS OUT
  ::  THE OTHER FIELDS IN `++DORK`.  WE RUN `++APPLY-EDIT` TO CREATE THE FINAL
  ::  NURI AND EXECUTE THE CHANGES.
  ::
  ::  WE TAKE A `++NORI`, WHICH IS EITHER A LABEL-ADD REQUEST OR A `++SOBA`,
  ::  WHICH IS A LIST OF CHANGES.  IF IT'S A LABEL, IT'S EASY AND WE JUST PASS
  ::  IT TO `++EXECUTE-CHANGES:ZE`.
  ::
  ::  IF THE GIVEN `++NORI` IS A LIST OF FILE CHANGES, THEN WE OUR GOAL IS TO
  ::  CONVERT THE LIST OF `++MISO` CHANGES TO `++MISU` CHANGES.  IN OTHER
  ::  WORDS, TURN THE `++NORI` INTO A `++NURI`.  THEN, WE PASS IT TO
  ::  `++EXECUTE-CHANGES:ZE`, WHICH APPLIES THE CHANGES TO OUR STATE, AND THEN
  ::  WE CHECK OUT THE NEW REVISION.  XX  REWORD
  ::
  ::  ANYHOW, ENOUGH OF HIGH-LEVEL TALK.  IT'S TIME TO GET DOWN TO THE
  ::  NITTY-GRITTY.
  ::
  ::  WHEN WE GET A LIST OF `++MISO` CHANGES, WE SPLIT THEM INTO FOUR TYPES:
  ::  DELETIONS, INSERTIONS, DIFFS (I.E. CHANGE FROM DIFF), AND MUTATIONS
  ::  (I.E. CHANGE FROM NEW DATA).  WE DO FOUR DIFFERENT THINGS WITH THEM.
  ::
  ::  FOR DELETIONS, WE JUST FILL IN `DEL` IN `++DORK` WITH A LIST OF THE
  ::  DELETED FILES.
  ::
  ::  FOR INSERTIONS, WE DISTINGUISH BEWTWEEN `%HOON` FILES AND ALL OTHER
  ::  FILES.  FOR `%HOON` FILES, WE JUST STORE THEM TO `INK` IN `++DORK` SO
  ::  THAT WE ADD DIFF THEM DIRECTLY.  `%HOON` FILES HAVE TO BE TREATED
  ::  SPECIALLY TO MAKE THE BOOTSTRAPPING SEQUENCE WORK, SINCE THE MARK
  ::  DEFINITIONS ARE THEMSELVES `%HOON` FILES.
  ::
  ::  FOR THE OTHER FILES, WE MAKE A `%TABL` COMPOUND FORD REQUEST TO CONVERT
  ::  THE DATA FOR THE NEW FILE TO THE THE MARK INDICATED BY THE LAST KNOT IN
  ::  THE PATH.
  ::
  ::  FOR DIFFS, WE MAKE A `%TABL` COMPOUND FORD REQUEST TO APPLY THE DIFF TO
  ::  THE EXISTING CONTENT.  WE ALSO STORE THE DIFFS IN `DIG` IN `++DORK`.
  ::
  ::  FOR MUTATIONS, WE MAKE A `%TABL` COMPOUND FORD REQUEST TO CONVERT THE
  ::  GIVEN NEW DATA TO THE MARK OF THE ALREADY-EXISTING FILE.  LATER ON IN
  ::  `++TAKE-CASTIFY` WE'LL CREATE THE FORD REQUEST TO ACTUALLY PERFORM THE
  ::  DIFF.  WE ALSO STORE THE MUTATIONS IN `MUC` IN `++DORK`.  I'M PRETTY
  ::  SURE THAT'S USELESS BECAUSE WHO CARES ABOUT THE ORIGINAL DATA.
  ::  XX DELETE `MUC`.
  ::
  ::  FINALLY, FOR PERFORMANCE REASONS WE CACHE ANY OF THE DATA THAT CAME IN
  ::  AS A `%MIME` CAGE.  WE DO THIS BECAUSE MANY COMMITS COME FROM UNIX,
  ::  WHERE THEY'RE PASSED IN AS `%MIME` AND NEED TO BE TURNED BACK INTO IT
  ::  FOR THE ERGO.  WE CACHE BOTH `%HOON` AND NON-`%HOON` INSERTS AND
  ::  MUTATIONS.
  ::
  ::  AT THIS POINT, THE FLOW OF CONTROL GOES THROUGH THE THREE FORD REQUESTS
  ::  BACK TO `++TAKE-INSERTING`, `++TAKE-DIFFING`, AND `++TAKE-CASTIFYING`,
  ::  WHICH ITSELF LEADS TO `++TAKE-MUTATING`.  ONCE EACH OF THOSE HAS
  ::  COMPLETED, WE END UP AT `++APPLY-EDIT`, WHERE OUR UNIFIED STORY PICKS UP
  ::  AGAIN.
  ::
  ++  EDIT                                              ::  APPLY CHANGES
    |=  {WEN/@DA LEM/NORI}
    ^+  +>
    ?:  ?=(%| -.LEM)
      =^  HAT  +>.$
        (EXECUTE-CHANGES:ZE WEN LEM)
      ?~  HAT
        +>.$
      WAKE:(PRINT-CHANGES:(CHECKOUT-ANKH U.HAT) WEN LEM)
    ?.  =(~ DOK)
      ~&  %ALREADY-APPLYING-CHANGES  +>
    ::
    =|  $=  NUZ
        $:  DEL=(LIST (PAIR PATH MISO))
            INS=(LIST (PAIR PATH MISO))
            DIF=(LIST (PAIR PATH MISO))
            MUT=(LIST (PAIR PATH MISO))
            INK=(LIST (PAIR PATH MISO))
        ==
    ::
    =.  NUZ
      |-  ^+  NUZ
      ?~  P.LEM  NUZ
      ::
      ?-    -.Q.I.P.LEM
          %DEL  $(P.LEM T.P.LEM, DEL.NUZ [I.P.LEM DEL.NUZ])
          %DIF  $(P.LEM T.P.LEM, DIF.NUZ [I.P.LEM DIF.NUZ])
          %INS
        =/  PAX=PATH  P.I.P.LEM
        =/  MAR=MARK  P.P.Q.I.P.LEM
        ::
        ?:  ?&  ?=([%HOON *] (FLOP PAX))
                ?=(%MIME MAR)
            ==
          $(P.LEM T.P.LEM, INK.NUZ [I.P.LEM INK.NUZ])
        $(P.LEM T.P.LEM, INS.NUZ [I.P.LEM INS.NUZ])
      ::
          %MUT
        =/  PAX=PATH  P.I.P.LEM
        =/  MIS=MISO  Q.I.P.LEM
        ?>  ?=(%MUT -.MIS)
        =/  CAG=CAGE  P.MIS
        ::  IF :MIS HAS THE %MIME MARK AND IT'S THE SAME AS CACHED, NO-OP
        ::
        ?:  ?.  =(%MIME P.CAG)
              %.N
            ?~  CACHED=(~(GET BY MIM.DOM) PAX)
              %.N
            =(((HARD MIME) Q.Q.CAG) U.CACHED)
          ::
          $(P.LEM T.P.LEM)
        ::  IF THE :MIS MARK IS THE TARGET MARK AND THE VALUE IS THE SAME, NO-OP
        ::
        ?:  =/  TARGET-MARK=MARK  =+(SPUR=(FLOP PAX) ?~(SPUR !! I.SPUR))
            ?.  =(TARGET-MARK P.CAG)
              %.N
            ::
            =/  STORED            (NEED (NEED (READ-X:ZE LET.DOM PAX)))
            =/  STORED-CAGE=CAGE  ?>(?=(%& -.STORED) P.STORED)
            ::
            =(Q.Q.STORED-CAGE Q.Q.CAG)
          ::
          $(P.LEM T.P.LEM)
        ::  THE VALUE DIFFERS FROM WHAT'S STORED, SO REGISTER MUTATION
        ::
        $(P.LEM T.P.LEM, MUT.NUZ [I.P.LEM MUT.NUZ])
      ==
    ::  SORT EACH SECTION ALPHABETICALLY FOR DETERMINISM
    ::
    =.  NUZ  :*
      (SORT DEL.NUZ SORT-BY-HEAD)
      (SORT INS.NUZ SORT-BY-HEAD)
      (SORT DIF.NUZ SORT-BY-HEAD)
      (SORT MUT.NUZ SORT-BY-HEAD)
      (SORT INK.NUZ SORT-BY-HEAD)
    ==
    ::
    =.  +>.$
      %-  EMIL
      ^-  (LIST MOVE)
      :~  :*  HEN  %PASS
              [%INSERTING (SCOT %P HER) SYD (SCOT %DA WEN) ~]
              %F  %BUILD  LIVE=%.N  %PIN  WEN  %LIST
              ^-  (LIST SCHEMATIC:FORD)
              %+  TURN  INS.NUZ
              |=  {PAX/PATH MIS/MISO}
              ?>  ?=($INS -.MIS)
              :-  [%$ %PATH -:!>(*PATH) PAX]
              =+  =>((FLOP PAX) ?~(. %$ I))
              [%CAST [OUR %HOME] - [%$ P.MIS]]
          ==
          :*  HEN  %PASS
              [%DIFFING (SCOT %P HER) SYD (SCOT %DA WEN) ~]
              %F  %BUILD  LIVE=%.N  %PIN  WEN  %LIST
              ^-  (LIST SCHEMATIC:FORD)
              %+  TURN  DIF.NUZ
              |=  {PAX/PATH MIS/MISO}
              ?>  ?=($DIF -.MIS)
              =+  (NEED (NEED (READ-X:ZE LET.DOM PAX)))
              ?>  ?=(%& -<)
              :-  [%$ %PATH -:!>(*PATH) PAX]
              [%PACT [OUR %HOME] [%$ P.-] [%$ P.MIS]]
          ==
          :*  HEN  %PASS
              [%CASTIFYING (SCOT %P HER) SYD (SCOT %DA WEN) ~]
              %F  %BUILD  LIVE=%.N  %PIN  WEN  %LIST
              ::~  [HER SYD %DA WEN]  %TABL
              ^-  (LIST SCHEMATIC:FORD)
              %+  TURN  MUT.NUZ
              |=  {PAX/PATH MIS/MISO}
              ?>  ?=($MUT -.MIS)
              :-  [%$ %PATH -:!>(*PATH) PAX]
              =+  (LOBE-TO-MARK:ZE (~(GOT BY Q:(AEON-TO-YAKI:ZE LET.DOM)) PAX))
              [%CAST [OUR %HOME] - [%$ P.MIS]]
          ==
      ==
    %_    +>.$
        DOK
      ::
      :-  ~
      ^-  DORK
      :*  (TURN DEL.NUZ |=({PAX/PATH MIS/MISO} ?>(?=($DEL -.MIS) PAX)))
      ::
          %+  TURN  INK.NUZ
          |=  {PAX/PATH MIS/MISO}
          ^-  (PAIR PATH CAGE)
          ?>  ?=($INS -.MIS)
          =+  =>((FLOP PAX) ?~(. %$ I))
          [PAX - [%ATOM %T ~] ((HARD @T) +>.Q.Q.P.MIS)]
      ::
          ~
      ::
          %-  MALT
          (TURN DIF.NUZ |=({PAX/PATH MIS/MISO} ?>(?=($DIF -.MIS) [PAX P.MIS])))
      ::
          ~
      ::
          %-  MALT
          (TURN MUT.NUZ |=({PAX/PATH MIS/MISO} ?>(?=($MUT -.MIS) [PAX P.MIS])))
      ::
          ~
      ::
          ~
      ==
    ::
        MIM.DOM
      ::  REMOVE ALL DELETED FILES FROM THE NEW MIME CACHE
      ::
      =.  MIM.DOM
        |-  ^+  MIM.DOM
        ?~  DEL.NUZ  MIM.DOM
        ::
        =.  MIM.DOM  (~(DEL BY MIM.DOM) `PATH`P.I.DEL.NUZ)
        ::
        $(DEL.NUZ T.DEL.NUZ)
      ::  ADD OR OVERWRITE THE NEW FILES TO THE NEW MIME CACHE
      ::
      %-  ~(GAS BY MIM.DOM)
      ^-  (LIST (PAIR PATH MIME))
      ;:  WELD
        ^-  (LIST (PAIR PATH MIME))
        %+  MURN  INS.NUZ
        |=  {PAX/PATH MIS/MISO}
        ^-  (UNIT (PAIR PATH MIME))
        ?>  ?=($INS -.MIS)
        ?.  ?=($MIME P.P.MIS)
          ~
        `[PAX ((HARD MIME) Q.Q.P.MIS)]
      ::
        ^-  (LIST (PAIR PATH MIME))
        %+  MURN  INK.NUZ
        |=  {PAX/PATH MIS/MISO}
        ^-  (UNIT (PAIR PATH MIME))
        ?>  ?=($INS -.MIS)
        ?>  ?=($MIME P.P.MIS)
        `[PAX ((HARD MIME) Q.Q.P.MIS)]
      ::
        ^-  (LIST (PAIR PATH MIME))
        %+  MURN  MUT.NUZ
        |=  {PAX/PATH MIS/MISO}
        ^-  (UNIT (PAIR PATH MIME))
        ?>  ?=($MUT -.MIS)
        ?.  ?=($MIME P.P.MIS)
          ~
        `[PAX ((HARD MIME) Q.Q.P.MIS)]
      ==
    ==
  ::
  ::  HANDLE RESULT OF INSERTION.
  ::
  ::  FOR COMMIT FLOW OVERVIEW, SEE ++EDIT.
  ::
  ::  INSERTIONS ARE CAST TO THE CORRECT MARK, AND HERE WE PUT THE RESULT IN
  ::  INS.DOK.  IF DIF AND MUT ARE FULL IN DOK (I.E. WE'VE ALREADY PROCESSED
  ::  DIFFS AND MUTATIONS), THEN WE GO AHEAD AND RUN ++APPLY-EDIT.
  ::
  ++  TAKE-INSERTING
    |=  {WEN/@DA RES/MADE-RESULT:FORD}
    ^+  +>
    ?~  DOK
      ~&  %CLAY-TAKE-INSERTING-UNEXPECTED-MADE  +>.$
    ?.  =(~ INS.U.DOK)
      ~&  %CLAY-TAKE-INSERTING-REDUNDANT-MADE  +>.$
    =-  =.  INS.U.DOK  `-
        ?:  ?&  ?=(^ DIF.U.DOK)
                ?=(^ MUT.U.DOK)
            ==
          (APPLY-EDIT WEN)
        +>.$
    ^-  (LIST (PAIR PATH CAGE))
    %+  TURN  (MADE-RESULT-TO-SUCCESS-CAGES RES)
    |=  {PAX/CAGE CAY/CAGE}
    ?.  ?=($PATH P.PAX)
      ~|(%CLAY-TAKE-INSERTING-STRANGE-PATH-MARK !!)
    [((HARD PATH) Q.Q.PAX) CAY]
  ::
  ::  HANDLE RESULT OF DIFFING.
  ::
  ::  FOR COMMIT FLOW OVERVIEW, SEE ++EDIT.
  ::
  ::  DIFFS ARE APPLIED TO THE ORIGINAL DATA, AND HERE WE PUT THE RESULT IN
  ::  DIF.DOK.  IF INS AND MUT ARE FULL IN DOK (I.E. WE'VE ALREADY PROCESSED
  ::  INSERTIONS AND MUTATIONS), THEN WE GO AHEAD AND RUN ++APPLY-EDIT.
  ::
  ++  TAKE-DIFFING
    |=  {WEN/@DA RES/MADE-RESULT:FORD}
    ^+  +>
    ?~  DOK
      ~&  %CLAY-TAKE-DIFFING-UNEXPECTED-MADE  +>.$
    ?.  =(~ DIF.U.DOK)
      ~&  %CLAY-TAKE-DIFFING-REDUNDANT-MADE  +>.$
    =-  =.  DIF.U.DOK  `-
        ?:  ?&  ?=(^ INS.U.DOK)
                ?=(^ MUT.U.DOK)
            ==
          (APPLY-EDIT WEN)
        +>.$
    ^-  (LIST (TREL PATH LOBE CAGE))
    %+  TURN  (MADE-RESULT-TO-CAGES RES)
    |=  {PAX/CAGE CAY/CAGE}
    ^-  (PAIR PATH (PAIR LOBE CAGE))
    ?.  ?=($PATH P.PAX)
      ~|(%CLAY-TAKE-DIFFING-STRANGE-PATH-MARK !!)
    =+  PAF=((HARD PATH) Q.Q.PAX)
    [PAF (PAGE-TO-LOBE:ZE [P Q.Q]:CAY) (~(GOT BY DIG.U.DOK) PAF)]
  ::
  ::  HANDLE RESULT OF CASTING MUTATIONS.
  ::
  ::  FOR COMMIT FLOW OVERVIEW, SEE ++EDIT.
  ::
  ::  THE NEW CONTENT FROM A MUTATION IS FIRST CASTED TO THE CORRECT MARK, AND
  ::  HERE WE HASH THE CORRECTLY-MARKED CONTENT AND PUT THE RESULT IN MUH.DOK.
  ::  THEN WE DIFF THE NEW CONTENT AGAINST THE ORIGINAL CONTENT.  THE RESULT OF
  ::  THIS IS HANDLED IN ++TAKE-MUTATING.
  ::
  ++  TAKE-CASTIFY
    |=  {WEN/@DA RES/MADE-RESULT:FORD}
    ^+  +>
    ?~  DOK
      ~&  %CLAY-TAKE-CASTIFYING-UNEXPECTED-MADE  +>.$
    ?.  =(~ MUH.U.DOK)
      ~&  %CLAY-TAKE-CASTIFYING-REDUNDANT-MADE  +>.$
    =+  ^-  CAT/(LIST (PAIR PATH CAGE))
        %+  TURN  (MADE-RESULT-TO-CAGES RES)
        |=  {PAX/CAGE CAY/CAGE}
        ?.  ?=($PATH P.PAX)
          ~|(%CASTIFY-BAD-PATH-MARK !!)
        [((HARD PATH) Q.Q.PAX) CAY]
    =.  MUH.U.DOK
          %-  MALT
          %+  TURN  CAT
          |=  {PAX/PATH CAY/CAGE}
          [PAX (PAGE-TO-LOBE:ZE [P Q.Q]:CAY)]
    %-  EMIT
    :*  HEN  %PASS
        [%MUTATING (SCOT %P HER) SYD (SCOT %DA WEN) ~]
        %F  %BUILD  LIVE=%.N  %PIN  WEN  %LIST
        ^-  (LIST SCHEMATIC:FORD)
        %+  TURN  CAT
        |=  {PAX/PATH CAY/CAGE}
        :-  [%$ %PATH -:!>(*PATH) PAX]
        =+  (LOBE-TO-SCHEMATIC:ZE [HER SYD] PAX (~(GOT BY Q:(AEON-TO-YAKI:ZE LET.DOM)) PAX))
        [%DIFF [OUR %HOME] - [%$ CAY]]
    ==
  ::
  ::  HANDLE RESULT OF DIFFING MUTATIONS.
  ::
  ::  FOR COMMIT FLOW OVERVIEW, SEE ++EDIT.
  ::
  ::  WE PUT THE CALCULATED DIFFS OF THE NEW CONTENT VS THE OLD CONTENT (FROM
  ::  ++TAKE-CASTIFY) IN MUT.DOK.  IF INS AND MUT ARE FULL IN DOK (I.E. WE'VE
  ::  ALREADY PROCESSED INSERTIONS AND DIFFS), THEN WE GO AHEAD AND RUN
  ::  ++APPLY-EDIT.
  ::
  ++  TAKE-MUTATING
    |=  {WEN/@DA RES/MADE-RESULT:FORD}
    ^+  +>
    ?~  DOK
      ~&  %CLAY-TAKE-MUTATING-UNEXPECTED-MADE  +>.$
    ?.  =(~ MUT.U.DOK)
      ~&  %CLAY-TAKE-MUTATING-REDUNDANT-MADE  +>.$
    =-  =.  MUT.U.DOK  `-
        ?:  ?&  ?=(^ INS.U.DOK)
                ?=(^ DIF.U.DOK)
            ==
          (APPLY-EDIT WEN)
        +>.$
    ^-  (LIST (TREL PATH LOBE CAGE))
    %+  MURN  (MADE-RESULT-TO-CAGES RES)
    |=  {PAX/CAGE CAY/CAGE}
    ^-  (UNIT (PAIR PATH (PAIR LOBE CAGE)))
    ?.  ?=($PATH P.PAX)
      ~|(%CLAY-TAKE-MUTATING-STRANGE-PATH-MARK !!)
    ?:  ?=($NULL P.CAY)
      ~
    =+  PAF=((HARD PATH) Q.Q.PAX)
    `[PAF (~(GOT BY MUH.U.DOK) PAF) CAY]
  ::
  ::  NOW THAT DOK IS COMPLETELY FILLED, WE CAN APPLY THE CHANGES IN THE COMMIT.
  ::
  ::  WE COLLECT THE RELEVANT DATA FROM DOK AND RUN ++EXECUTE-CHANGES TO APPLY
  ::  THEM TO OUR STATE.  THEN WE RUN ++CHECKOUT-ANKH TO UPDATE OUR ANKH (CACHE
  ::  OF THE CONTENT AT THE CURRENT AEON).
  ::
  ++  APPLY-EDIT
    |=  WEN/@DA
    ^+  +>
    ::  XX WE DO THE SAME IN ++TAKE-PATCH, WHICH IS CONFUSING AND SMELLS FOUL.
    ::  HERE WE RUN ++EXECUTE-CHANGES, BUT WE THROW AWAY THE STATE CHANGES.  THE
    ::  CALL IN ++TAKE-PATCH IS THE ONE THAT MATTERS, BUT WE PRINT OUT CHANGES
    ::  HERE, AND WE ALSO USE THAT INFO TO CALL ++CHECKOUT-ANKH (WHICH IS WHAT
    ::  LEADS TO THE ++TAKE-PATCH CALL).
    ::
    ::  I'M GUESSING THIS SHOULDN'T CALL ++EXECUTE-CHANGES AT ALL BUT RATHER
    ::  GENERATE THE INFORMATION IT NEEDS DIRECTLY.
    =+  ^-  SIM/(LIST (PAIR PATH MISU))
        ?~  DOK
          ~|(%NO-CHANGES !!)
        ?>  ?=(^ INS.U.DOK)
        ?>  ?=(^ DIF.U.DOK)
        ?>  ?=(^ MUT.U.DOK)
        ;:  WELD
          ^-  (LIST (PAIR PATH MISU))
          (TURN DEL.U.DOK |=(PAX/PATH [PAX %DEL ~]))
        ::
          ^-  (LIST (PAIR PATH MISU))
          (TURN INK.U.DOK |=({PAX/PATH CAY/CAGE} [PAX %INS CAY]))
        ::
          ^-  (LIST (PAIR PATH MISU))
          (TURN U.INS.U.DOK |=({PAX/PATH CAY/CAGE} [PAX %INS CAY]))
        ::
          ^-  (LIST (PAIR PATH MISU))
          (TURN U.DIF.U.DOK |=({PAX/PATH CAL/{LOBE CAGE}} [PAX %DIF CAL]))
        ::
          ^-  (LIST (PAIR PATH MISU))
          (TURN U.MUT.U.DOK |=({PAX/PATH CAL/{LOBE CAGE}} [PAX %DIF CAL]))
        ==
    =+  HAT=(EXECUTE-CHANGES:ZE WEN %& SIM)
    ?~  DOK  ~&  %NO-CHANGES  !!
    ?~  -.HAT
      ([PRINT-CHANGES(DOK ~)]:.(+>.$ +.HAT) WEN %& SIM)
    (CHECKOUT-ANKH(LAT.RAN LAT.RAN.+.HAT) U.-.HAT)
  ::
  ::  TAKES A MAP OF PATHS TO LOBES AND TELLS FORD TO CONVERT TO AN ANKH.
  ::
  ::  SPECIFICALLY, WE TELL FORD TO CONVERT EACH LOBE INTO A BLOB, THEN WE CALL
  ::  ++TAKE-PATCH TO APPLY THE RESULT TO OUR CURRENT ANKH AND UPDATE UNIX.
  ::
  ++  CHECKOUT-ANKH
    |=  HAT/(MAP PATH LOBE)
    ^+  +>
    %-  EMIT
    :*  HEN  %PASS  [%PATCHING (SCOT %P HER) SYD ~]  %F
        %BUILD  LIVE=%.N  %LIST
        ^-  (LIST SCHEMATIC:FORD)
        %+  TURN  (SORT ~(TAP BY HAT) SORT-BY-HEAD)
        |=  {A/PATH B/LOBE}
        ^-  SCHEMATIC:FORD
        :-  [%$ %PATH-HASH !>([A B])]
        (LOBE-TO-SCHEMATIC:ZE [HER SYD] A B)
    ==
  ::
  ::  HANDLE THE RESULT OF THE FORD CALL IN ++CHECKOUT-ANKH.
  ::
  ::  WE APPLY THE CHANGES BY CALLING ++EXECUTE-CHANGES, THEN WE CONVERT THE
  ::  RESULT OF THE FORD CALL FROM ++CHECKOUT-ANKH INTO A MAP OF PATHS TO DATA
  ::  FOR THE CURRENT AEON OF THIS DESK.  WE TURN THIS INTO AN ANKH AND STORE
  ::  IT TO OUR STATE.  FINALLY, WE CHOOSE WHICH PATHS NEED TO BE SYNCED TO
  ::  UNIX, AND CONVERT THE DATA AT THOSE PATHS TO MIME (EXCEPT THOSE PATHS
  ::  WHICH WERE ADDED ORIGINALLY AS MIME, BECAUSE WE STILL HAVE THAT STORED IN
  ::  MIM IN DOK).  THE RESULT IS HANDLED IN ++TAKE-ERGO.
  ::
  ++  TAKE-PATCH
    |=  RES/MADE-RESULT:FORD
    ^+  +>
    ::  ~&  %TAKING-PATCH
    ?.  ?=([%COMPLETE %SUCCESS *] RES)
      =.  DOK  ~
      =*  MESSAGE  (MADE-RESULT-AS-ERROR:FORD RES)
      (PRINT-TO-DILL '!' %ROSE [" " "" ""] LEAF+"CLAY PATCH FAILED" MESSAGE)
    ::  ~&  %EDITING
    =+  ^-  SIM/(LIST (PAIR PATH MISU))
        ?~  DOK
          ~|(%NO-CHANGES !!)
        ?>  ?=(^ INS.U.DOK)
        ?>  ?=(^ DIF.U.DOK)
        ?>  ?=(^ MUT.U.DOK)
        ;:  WELD
          ^-  (LIST (PAIR PATH MISU))
          (TURN DEL.U.DOK |=(PAX/PATH [PAX %DEL ~]))
        ::
          ^-  (LIST (PAIR PATH MISU))
          (TURN INK.U.DOK |=({PAX/PATH CAY/CAGE} [PAX %INS CAY]))
        ::
          ^-  (LIST (PAIR PATH MISU))
          (TURN U.INS.U.DOK |=({PAX/PATH CAY/CAGE} [PAX %INS CAY]))
        ::
          ^-  (LIST (PAIR PATH MISU))
          (TURN U.DIF.U.DOK |=({PAX/PATH CAL/{LOBE CAGE}} [PAX %DIF CAL]))
        ::
          ^-  (LIST (PAIR PATH MISU))
          (TURN U.MUT.U.DOK |=({PAX/PATH CAL/{LOBE CAGE}} [PAX %DIF CAL]))
        ==
    =^  HAT  +>.$  (EXECUTE-CHANGES:ZE NOW %& SIM)
                                      ::  XX  DO SAME IN ++APPLY-EDIT
    ?~  DOK  ~&  %NO-DOK  +>.$
    =>
      %=    .
          +>.$
        ?<  ?=(~ HAT)                                   ::  XX  WHUT?
        (PRINT-CHANGES NOW %& SIM)
      ==
    ?~  DOK  ~&  %NO-DOK  +>.$
    =+  ^-  CAT/(LIST (TREL PATH LOBE CAGE))
        %+  TURN  (MADE-RESULT-TO-CAGES RES)
        |=  {PAX/CAGE CAY/CAGE}
        ?.  ?=($PATH-HASH P.PAX)
          ~|(%PATCH-BAD-PATH-MARK !!)
        [-< -> +]:[((HARD {PATH LOBE}) Q.Q.PAX) CAY]
    ::  ~&  %CANNED
    ::  ~&  %CHECKING-OUT
    =.  ANK.DOM  (MAP-TO-ANKH:ZE (MALT CAT))
    ::  ~&  %CHECKED-OUT
    ::  ~&  %WAKING
    =.  +>.$  =>(WAKE ?>(?=(^ DOK) .))
    ::  ~&  %WAKED
    ?~  HEZ  +>.$(DOK ~)
    =+  MUS=(MUST-ERGO (TURN SIM HEAD))
    ?:  =(~ MUS)
      +>.$(DOK ~)
    =+  ^-  SUM/(SET PATH)
        =+  (TURN ~(TAP BY MUS) (CORL TAIL TAIL))
        %+  ROLL  -
        |=  {PAK/(SET PATH) ACC/(SET PATH)}
        (~(UNI IN ACC) PAK)
    =+  CAN=(MALT SIM)
    ::  ~&  %FORMING-ERGO
    ::  =-  ~&  %FORMED-ERGO  -
    %-  EMIT(DOK ~)
    :*  HEN  %PASS  [%ERGOING (SCOT %P HER) SYD ~]  %F
        %BUILD  LIVE=%.N  %LIST
        ^-  (LIST SCHEMATIC:FORD)
        %+  TURN  ~(TAP IN SUM)
        |=  A/PATH
        ^-  SCHEMATIC:FORD
        :-  [%$ %PATH !>(A)]
        =+  B=(~(GOT BY CAN) A)
        ?:  ?=($DEL -.B)
          [%$ %NULL !>(~)]
        =+  (~(GET BY MIM.DOM) A)
        ?^  -  [%$ %MIME !>(U.-)]
        :^  %CAST  [OUR %HOME]  %MIME
        =+  (NEED (NEED (READ-X:ZE LET.DOM A)))
        ?:  ?=(%& -<)
          [%$ P.-]
        (LOBE-TO-SCHEMATIC:ZE [HER SYD] A P.-)
    ==
  ::
  ::  SEND NEW DATA TO UNIX.
  ::
  ::  COMBINE THE PATHS IN MIM IN DOK AND THE RESULT OF THE FORD CALL IN
  ::  ++TAKE-PATCH TO CREATE A LIST OF NODES THAT NEED TO BE SENT TO UNIX (IN
  ::  AN %ERGO CARD) TO KEEP UNIX UP-TO-DATE.  SEND THIS TO UNIX.
  ::
  ++  TAKE-ERGO
    |=  RES/MADE-RESULT:FORD
    ^+  +>
    ?:  ?=([%INCOMPLETE *] RES)
      (PRINT-TO-DILL '!' %ROSE [" " "" ""] LEAF+"CLAY ERGO FAILED" TANG.RES)
    ?.  ?=([%COMPLETE %SUCCESS *] RES)
      =*  MESSAGE  MESSAGE.BUILD-RESULT.RES
      (PRINT-TO-DILL '!' %ROSE [" " "" ""] LEAF+"CLAY ERGO FAILED" MESSAGE)
    ?~  HEZ  ~|(%NO-SYNC-DUCT !!)
    =+  ^-  CAN/(MAP PATH (UNIT MIME))
        %-  MALT  ^-  MODE
        %+  TURN  (MADE-RESULT-TO-CAGES RES)
        |=  {PAX/CAGE MIM/CAGE}
        ?.  ?=($PATH P.PAX)
          ~|(%ERGO-BAD-PATH-MARK !!)
        :-  ((HARD PATH) Q.Q.PAX)
        ?.  ?=($MIME P.MIM)
          ~
        `((HARD MIME) Q.Q.MIM)
    =+  MUS=(MUST-ERGO (TURN ~(TAP BY CAN) HEAD))
    %-  EMIL
    %+  TURN  ~(TAP BY MUS)
    |=  {POT/TERM LEN/@UD PAK/(SET PATH)}
    :*  U.HEZ  %GIVE  %ERGO  POT
        %+  TURN  ~(TAP IN PAK)
        |=  PAX/PATH
        [(SLAG LEN PAX) (~(GOT BY CAN) PAX)]
    ==
  ::
  ::  CALLED WHEN A FOREIGN SHIP ANSWERS ONE OF OUR REQUESTS.
  ::
  ::  AFTER UPDATING REF (OUR REQUEST MANAGER), WE HANDLE %X, %W, AND %Y
  ::  RESPONSES.  FOR %X, WE CALL ++VALIDATE-X TO VALIDATE THE TYPE OF THE
  ::  RESPONSE.  FOR %Y, WE COERCE THE RESULT TO AN ARCH.
  ::
  ::  FOR %W, WE CHECK TO SEE IF IT'S A @UD RESPONSE (E.G. FOR
  ::  CW+//~SAMPEL-SIPNYM/DESK/~TIME-OR-LABEL).  IF SO, IT'S EASY.  OTHERWISE,
  ::  WE LOOK UP OUR SUBSCRIPTION REQUEST, THEN ASSERT THE RESPONSE WAS A NAKO.
  ::  IF THIS IS THE FIRST UPDATE FOR A DESK, WE ASSUME EVERYTHING'S WELL-TYPED
  ::  AND CALL ++APPLY-FOREIGN-UPDATE DIRECTLY.  OTHERWISE, WE CALL
  ::  ++VALIDATE-PLOPS TO VERIFY THAT THE DATA WE'RE GETTING IS WELL TYPED.
  ::
  ::  BE CAREFUL TO CALL ++WAKE IF/WHEN NECESSARY (I.E. WHEN THE STATE CHANGES
  ::  ENOUGH THAT A SUBSCRIPTION COULD BE FILLED).  EVERY CASE MUST CALL IT
  ::  INDIVIDUALLY.
  ::
  ++  TAKE-FOREIGN-UPDATE                              ::  EXTERNAL CHANGE
    |=  {INX/@UD RUT/(UNIT RAND)}
    ^+  +>
    ?>  ?=(^ REF)
    |-  ^+  +>+.$
    =+  RUV=(~(GET BY BOM.U.REF) INX)
    ?~  RUV  +>+.$
    =>  ?.  |(?=(~ RUT) ?=($SING -.Q.U.RUV))  .
        %_  .
          BOM.U.REF  (~(DEL BY BOM.U.REF) INX)
          FOD.U.REF  (~(DEL BY FOD.U.REF) P.U.RUV)
        ==
    ?~  RUT
      =+  RAV=`RAVE`Q.U.RUV
      =<  ?>(?=(^ REF) .)
      %_    WAKE
          LIM
        ?.(&(?=($MANY -.RAV) ?=($DA -.Q.Q.RAV)) LIM `@DA`P.Q.Q.RAV)
      ::
          HAW.U.REF
        ?.  ?=($SING -.RAV)  HAW.U.REF
        (~(PUT BY HAW.U.REF) P.RAV ~)
      ==
    ?-    P.P.U.RUT
        $D
      ~|  %TOTALLY-TEMPORARY-ERROR-PLEASE-REPLACE-ME
      !!
        $P
      ~|  %REQUESTING-FOREIGN-PERMISSIONS-IS-INVALID
      !!
        $T
      ~|  %REQUESTING-FOREIGN-DIRECTORY-IS-VAPORWARE
      !!
        $U
      ~|  %IM-THINKIN-ITS-PROLLY-A-BAD-IDEA-TO-REQUEST-RANG-OVER-THE-NETWORK
      !!
    ::
        $V
      ~|  %WEIRD-WE-SHOULDNT-GET-A-DOME-REQUEST-OVER-THE-NETWORK
      !!
    ::
        $X
      =<  ?>(?=(^ REF) .)
      (VALIDATE-X P.P.U.RUT Q.P.U.RUT Q.U.RUT R.U.RUT)
    ::
        $W
      =.  HAW.U.REF
        %+  ~(PUT BY HAW.U.REF)
          [P.P.U.RUT Q.P.U.RUT Q.U.RUT]
        :+  ~
          P.R.U.RUT
        ?+  P.R.U.RUT  ~|  %STRANGE-W-OVER-NEXTWORK  !!
          $CASS  !>(((HARD CASS) Q.R.U.RUT))
          $NULL  [[%ATOM %N ~] ~]
          $NAKO  !>(~|([%HARDING [&1 &2 &3]:Q.R.U.RUT] ((HARD NAKO) Q.R.U.RUT)))
        ==
      ?.  ?=($NAKO P.R.U.RUT)  [?>(?=(^ REF) .)]:WAKE
      =+  RAV=`RAVE`Q.U.RUV
      ?>  ?=($MANY -.RAV)
      |-  ^+  +>+.^$
      =+  NEZ=[%W [%UD LET.DOM] ~]
      =+  NEX=(~(GET BY HAW.U.REF) NEZ)
      ?~  NEX  +>+.^$
      ?~  U.NEX  +>+.^$  ::  SHOULD NEVER HAPPEN
      =.  NAK.U.REF  `((HARD NAKO) Q.Q.U.U.NEX)
      =.  +>+.^$
        ?:  =(0 LET.DOM)
          =<  ?>(?=(^ REF) .)
          %+  APPLY-FOREIGN-UPDATE
            ?.(?=($DA -.Q.Q.RAV) ~ `P.Q.Q.RAV)
          (NEED NAK.U.REF)
        =<  ?>(?=(^ REF) .)
        %^    VALIDATE-PLOPS
            [%UD LET.DOM]
          ?.(?=($DA -.Q.Q.RAV) ~ `P.Q.Q.RAV)
        BAR:(NEED NAK.U.REF)
      %=  $
        HAW.U.REF  (~(DEL BY HAW.U.REF) NEZ)
      ==
    ::
        $Y
      =<  ?>(?=(^ REF) .)
      %_    WAKE
          HAW.U.REF
        %+  ~(PUT BY HAW.U.REF)
          [P.P.U.RUT Q.P.U.RUT Q.U.RUT]
        `[P.R.U.RUT !>(((HARD ARCH) Q.R.U.RUT))]
      ==
    ::
        $Z
      ~|  %ITS-PROLLY-NOT-REASONABLE-TO-REQUEST-ANKH-OVER-THE-NETWORK-SORRY
      !!
    ==
  ::
  ::  CHECK THAT GIVEN DATA IS ACTUALLY OF THE MARK IT CLAIMS TO BE.
  ::
  ::  RESULT IS HANDLED IN ++TAKE-FOREIGN-X
  ::
  ++  VALIDATE-X
    |=  {CAR/CARE CAS/CASE PAX/PATH PEG/PAGE}
    ^+  +>
    %-  EMIT
    :*  HEN  %PASS
        [%FOREIGN-X (SCOT %P OUR) (SCOT %P HER) SYD CAR (SCOT CAS) PAX]
        %F  %BUILD  LIVE=%.N  %PIN
        ::  SEE ++VALIDATE-PLOPS TO EXPLAIN WHY IT'S NOT (CASE-TO-DATE CAS)
        ::
        NOW
        (VALE-PAGE [HER SYD] PEG)
    ==
  ::
  ::  CREATE A SCHEMATIC TO VALIDATE A PAGE.
  ::
  ::  IF THE MARK IS %HOON, WE SHORT-CIRCUIT THE VALIDATION FOR BOOTSTRAPPING
  ::  PURPOSES.
  ::
  ++  VALE-PAGE
    |=  [DISC=DISC:FORD A=PAGE]
    ^-  SCHEMATIC:FORD
    ?.  ?=($HOON P.A)  [%VALE [OUR %HOME] A]
    ?.  ?=(@T Q.A)  [%DUDE >%WEIRD-HOON< %RIDE [%ZPZP ~] %$ *CAGE]
    [%$ P.A [%ATOM %T ~] Q.A]
  ::
  ::  VERIFY THE FOREIGN DATA IS OF THE THE MARK IT CLAIMS TO BE.
  ::
  ::  THIS COMPLETES THE RECEIVING OF %X FOREIGN DATA.
  ::
  ++  TAKE-FOREIGN-X
    |=  {CAR/CARE CAS/CASE PAX/PATH RES/MADE-RESULT:FORD}
    ^+  +>
    ?>  ?=(^ REF)
    ?.  ?=([%COMPLETE %SUCCESS *] RES)
      ~|  "VALIDATE FOREIGN X FAILED"
      =+  WHY=(MADE-RESULT-AS-ERROR:FORD RES)
      ~>  %MEAN.|.(%*(. >[%PLOP-FAIL %WHY]< |1.+> WHY))
      !!
    =*  AS-CAGE  `(RESULT-TO-CAGE:FORD BUILD-RESULT.RES)
    WAKE(HAW.U.REF (~(PUT BY HAW.U.REF) [CAR CAS PAX] AS-CAGE))
  ::
  ::  WHEN WE GET A %W FOREIGN UPDATE, STORE THIS IN OUR STATE.
  ::
  ::  WE GET THE COMMITS AND BLOBS FROM THE NAKO AND ADD THEM TO OUR OBJECT
  ::  STORE, THEN WE UPDATE THE MAP OF AEONS TO COMMITS AND THE LATEST AEON.
  ::
  ::  WE CALL ++WAKE AT THE END TO UPDATE ANYONE WHOSE SUBSCRIPTION IS FULFILLED
  ::  BY THIS STATE CHANGE.
  ::
  ++  APPLY-FOREIGN-UPDATE                              ::  APPLY SUBSCRIPTION
    |=  $:  LEM/(UNIT @DA)                              ::  COMPLETE UP TO
            GAR/(MAP AEON TAKO)                         ::  NEW IDS
            LET/AEON                                    ::  NEXT ID
            LAR/(SET YAKI)                              ::  NEW COMMITS
            BAR/(SET BLOB)                              ::  NEW CONTENT
        ==
    ^+  +>
    =<  WAKE
    ::  HIT: UPDATED COMMIT-HASHES BY @UD CASE
    ::
    =/  HIT  (~(UNI BY HIT.DOM) GAR)
    ::  NUT: NEW COMMIT-HASH/COMMIT PAIRS
    ::
    =/  NUT
      (TURN ~(TAP IN LAR) |=(=YAKI [R.YAKI YAKI]))
    ::  HUT: UPDATED COMMITS BY HASH
    ::
    =/  HUT  (~(GAS BY HUT.RAN) NUT)
    ::  NAT: NEW BLOB-HASH/BLOB PAIRS
    ::
    =/  NAT
      (TURN ~(TAP IN BAR) |=(=BLOB [P.BLOB BLOB]))
    ::  LAT: UPDATED BLOBS BY HASH
    ::
    =/  LAT  (~(GAS BY LAT.RAN) NAT)
    ::  TRAVERSE UPDATED STATE AND SANITY CHECK
    ::
    =+  ~|  :*  %BAD-FOREIGN-UPDATE
                [GAR=GAR LET=LET NUT=(TURN NUT HEAD) NAT=(TURN NAT HEAD)]
                [HITDOM=HIT.DOM LETDOM=LET.DOM]
            ==
      ?:  =(0 LET)
        ~
      =/  =AEON  1
      |-  ^-  ~
      =/  =TAKO
        ~|  [%MISSING-AEON AEON]  (~(GOT BY HIT) AEON)
      =/  =YAKI
        ~|  [%MISSING-TAKO TAKO]  (~(GOT BY HUT) TAKO)
      =+  %+  TURN
            ~(TAP BY Q.YAKI)
          |=  [=PATH =LOBE]
          ~|  [%MISSING-BLOB PATH LOBE]
          ?>  (~(HAS BY LAT) LOBE)
          ~
      ?:  =(LET AEON)
        ~
      $(AEON +(AEON))
    ::  PERSIST UPDATED STATE
    ::
    %=  +>.$
      LET.DOM   (MAX LET LET.DOM)
      LIM       (MAX (FALL LEM LIM) LIM)
      HIT.DOM   HIT
      HUT.RAN   HUT
      LAT.RAN   LAT
    ==
  ::
  ::  MAKE SURE THAT INCOMING DATA IS OF THE CORRECT TYPE.
  ::
  ::  THIS IS A FORD CALL TO MAKE SURE THAT INCOMING DATA IS OF THE MARK IT
  ::  CLAIMS TO BE.  THE RESULT IS HANDLED IN ++TAKE-FOREIGN-PLOPS.
  ::
  ++  VALIDATE-PLOPS
    |=  {CAS/CASE LEM/(UNIT @DA) POP/(SET PLOP)}
    ^+  +>
    =+  LUM=(SCOT %DA (FALL LEM *@DA))
    %-  EMIT
    :*  HEN  %PASS
        [%FOREIGN-PLOPS (SCOT %P OUR) (SCOT %P HER) SYD LUM ~]
        %F  %BUILD  LIVE=%.N  %PIN
        ::  THIS CORRESPONDS TO ALL THE CHANGES FROM [HER SYD]
        ::  TO [OUR %HOME].  THIS SHOULD BE (CASE-TO-DATE CAS)
        ::  IN THE CONTEXT OF THE FOREIGN DESK, BUT SINCE WE'RE
        ::  GETTING EVERYTHING FROM OUR OWN DESK NOW WE WANT TO
        ::  USE OUR MOST RECENT COMMIT.
        ::
        NOW
        %LIST
        ^-  (LIST SCHEMATIC:FORD)
        %+  TURN  ~(TAP IN POP)
        |=  A/PLOP
        ?-  -.A
          $DIRECT  [[%$ %BLOB !>([%DIRECT P.A *PAGE])] (VALE-PAGE [HER SYD] P.Q.A Q.Q.A)]
          $DELTA
            [[%$ %BLOB !>([%DELTA P.A Q.A *PAGE])] (VALE-PAGE [HER SYD] P.R.A Q.R.A)]
        ==
    ==
  ::
  ::  VERIFY THAT FOREIGN PLOPS VALIDATED CORRECTLY.  IF SO, APPLY THEM TO OUR
  ::  STATE.
  ::
  ++  TAKE-FOREIGN-PLOPS
    |=  {LEM/(UNIT @DA) RES/MADE-RESULT:FORD}
    ^+  +>
    ?>  ?=(^ REF)
    ?>  ?=(^ NAK.U.REF)
    =+  ^-  LAT/(LIST BLOB)
        %+  TURN  ~|("VALIDATE FOREIGN PLOPS FAILED" (MADE-RESULT-TO-CAGES RES))
        |=  {BOB/CAGE CAY/CAGE}
        ?.  ?=($BLOB P.BOB)
          ~|  %PLOP-NOT-BLOB
          !!
        =+  BOL=((HARD BLOB) Q.Q.BOB)
        ?-  -.BOL
          $DELTA      [-.BOL P.BOL Q.BOL P.CAY Q.Q.CAY]
          $DIRECT     [-.BOL P.BOL P.CAY Q.Q.CAY]
        ==
    %^    APPLY-FOREIGN-UPDATE
        LEM
      GAR.U.NAK.U.REF
    :+  LET.U.NAK.U.REF
      LAR.U.NAK.U.REF
    (SILT LAT)
  ::
  ++  MABE                                            ::  MAYBE FIRE FUNCTION
    |=  {ROV/ROVE FUN/$-(@DA _.)}
    ^+  +>.$
    %+  FALL
      %+  BIND
        ^-  (UNIT @DA)
        ?-    -.ROV
            $SING
          ?.  ?=($DA -.Q.P.ROV)  ~
          `P.Q.P.ROV
        ::
            $NEXT  ~
        ::
            $MULT  ~
        ::
            $MANY
          %^  HUNT  LTH
            ?.  ?=($DA -.P.Q.ROV)  ~
            ?.((LTH NOW P.P.Q.ROV) ~ [~ P.P.Q.ROV])
          ?.  ?=($DA -.Q.Q.ROV)  ~
          (HUNT GTH [~ NOW] [~ P.Q.Q.ROV])
        ==
      FUN
    +>.$
  ::
  ++  REVE
    |=  ROV/ROVE
    ^-  RAVE
    ?-  -.ROV
      $SING  ROV
      $NEXT  [- P]:ROV
      $MULT  [- P]:ROV
      $MANY  [- P Q]:ROV
    ==
  ::
  ::  LOOP THROUGH OPEN SUBSCRIPTIONS AND CHECK IF WE CAN FILL ANY OF THEM.
  ::
  ++  WAKE                                            ::  UPDATE SUBSCRIBERS
    ^+  .
    =+  XIQ=~(TAP BY QYX)
    =|  XAQ/(LIST {P/WOVE Q/(SET DUCT)})
    |-  ^+  ..WAKE
    ?~  XIQ
      ..WAKE(QYX (~(GAS BY *CULT) XAQ))
    ?:  =(~ Q.I.XIQ)  $(XIQ T.XIQ, XAQ XAQ)           :: DROP FORGOTTEN
    =*  FOR  P.P.I.XIQ
    =*  ROV  Q.P.I.XIQ
    ?-    -.ROV
        $SING
      =+  CAS=?~(REF ~ (~(GET BY HAW.U.REF) `MOOD`P.ROV))
      ?^  CAS
        %=    $
            XIQ  T.XIQ
            ..WAKE  ?~  U.CAS  (BLUB-ALL Q.I.XIQ ~)
                    (BLAB-ALL Q.I.XIQ P.ROV %& U.U.CAS)
        ==
      =+  NAO=(CASE-TO-AEON:ZE Q.P.ROV)
      ?~  NAO  $(XIQ T.XIQ, XAQ [I.XIQ XAQ])
      ::  ~&  %READING-AT-AEON
      =+  VID=(READ-AT-AEON:ZE FOR U.NAO P.ROV)
      ::  ~&  %RED-AT-AEON
      ?~  VID
        ::  ?:  =(0 U.NAO)
        ::    ~&  [%OH-POOR `PATH`[SYD '0' R.P.ROV]]
        ::    $(XIQ T.XIQ)
        ::  ~&  [%OH-WELL DESK=SYD MOOD=P.ROV AEON=U.NAO]
        $(XIQ T.XIQ, XAQ [I.XIQ XAQ])
      $(XIQ T.XIQ, ..WAKE (BALK-ALL Q.I.XIQ U.VID P.ROV))
    ::
    ::  %NEXT IS JUST %MULT WITH ONE PATH, SO WE PRETEND %NEXT = %MULT HERE.
        ?($NEXT $MULT)
      ::  BECAUSE %MULT REQUESTS NEED TO WAIT ON MULTIPLE FILES FOR EACH
      ::  REVISION THAT NEEDS TO BE CHECKED FOR CHANGES, WE KEEP TWO CACHE MAPS.
      ::  {OLD} IS THE REVISION AT {(DEC YON)}, {NEW} IS THE REVISION AT {YON}.
      ::  IF WE HAVE NO {YON} YET, THAT MEANS IT WAS STILL UNKNOWN LAST TIME
      ::  WE CHECKED.
      =*  VOR  ROV
      |^
      =/  ROV/ROVE
        ?:  ?=($MULT -.VOR)  VOR
        =*  MOD  P.VOR
        :*  %MULT
            [Q.MOD [[P.MOD R.MOD] ~ ~]]
            Q.VOR
            [[[P.MOD R.MOD] R.VOR] ~ ~]
            ~
        ==
      ?>  ?=($MULT -.ROV)
      =*  MOL  P.ROV
      =*  YON  Q.ROV
      =*  OLD  R.ROV
      =*  NEW  S.ROV
      ::  WE WILL EITHER RESPOND, OR STORE THE MAYBE UPDATED REQUEST.
      =;  RES/(EACH (MAP MOOD (EACH CAGE LOBE)) ROVE)
          ?:  ?=(%& -.RES)
            (RESPOND P.RES)
          (STORE P.RES)
      |-  ::  SO THAT WE CAN RETRY FOR THE NEXT AEON IF POSSIBLE/NEEDED.
      ::  IF WE DON'T HAVE AN AEON YET, SEE IF WE HAVE ONE NOW.
      ?~  YON
        =+  AEY=(CASE-TO-AEON:ZE P.MOL)
        ::  IF WE STILL DON'T, WAIT.
        ?~  AEY  |+ROV
        ::  IF WE DO, UPDATE THE REQUEST AND RETRY.
        $(ROV [-.ROV MOL `+(U.AEY) ~ ~])
      ::  IF OLD ISN'T COMPLETE, TRY FILLING IN THE GAPS.
      =?  OLD  !(COMPLETE OLD)
        (READ-UNKNOWN MOL(P [%UD (DEC U.YON)]) OLD)
      ::  IF THE NEXT AEON WE WANT TO COMPARE IS IN THE FUTURE, WAIT AGAIN.
      =+  AEY=(CASE-TO-AEON:ZE [%UD U.YON])
      ?~  AEY  |+ROV
      ::  IF NEW ISN'T COMPLETE, TRY FILLING IN THE GAPS.
      =?  NEW  !(COMPLETE NEW)
        (READ-UNKNOWN MOL(P [%UD U.YON]) NEW)
      ::  IF THEY'RE STILL NOT BOTH COMPLETE, WAIT AGAIN.
      ?.  ?&  (COMPLETE OLD)
              (COMPLETE NEW)
          ==
        |+ROV
      ::  IF THERE ARE ANY CHANGES, SEND RESPONSE. IF NONE, MOVE ONTO NEXT AEON.
      =;  RES
        ?^  RES  &+RES
        $(ROV [-.ROV MOL `+(U.YON) OLD ~])
      %+  ROLL  ~(TAP BY OLD)
      |=  $:  {{CAR/CARE PAX/PATH} OLE/CACH}
              RES/(MAP MOOD (EACH CAGE LOBE))
          ==
      =+  NEU=(~(GOT BY NEW) CAR PAX)
      ?<  |(?=(~ OLE) ?=(~ NEU))
      =-  ?~(- RES (~(PUT BY RES) U.-))
      ^-  (UNIT (PAIR MOOD (EACH CAGE LOBE)))
      =+  MOD=[CAR [%UD U.YON] PAX]
      ?~  U.OLE
       ?~  U.NEU  ~                                     ::  NOT ADDED
       `[MOD U.U.NEU]                                   ::  ADDED
      ?~  U.NEU
        `[MOD [%& %NULL [%ATOM %N ~] ~]]                ::  DELETED
      ?:  (EQUIVALENT-DATA:ZE U.U.NEU U.U.OLE)  ~       ::  UNCHANGED
      `[MOD U.U.NEU]                                    ::  CHANGED
      ::
      ++  STORE                                         ::  CHECK AGAIN LATER
        |=  ROV/ROVE
        ^+  ..WAKE
        =-  ^^$(XIQ T.XIQ, XAQ [I.XIQ(P [FOR -]) XAQ])
        ?>  ?=($MULT -.ROV)
        ?:  ?=($MULT -.VOR)  ROV
        ?>  ?=({* ~ ~} R.ROV)
        =*  ONE  N.R.ROV
        [%NEXT [P.P.ONE P.P.ROV Q.P.ONE] Q.ROV Q.ONE]
      ::
      ++  RESPOND                                       ::  SEND CHANGES
        |=  RES/(MAP MOOD (EACH CAGE LOBE))
        ^+  ..WAKE
        ::NOTE  WANT TO USE =-, BUT COMPILER BUG?
        ?:  ?=($MULT -.VOR)
          ^^$(XIQ T.XIQ, ..WAKE (BLAS-ALL Q.I.XIQ ~(KEY BY RES)))
        ?>  ?=({* ~ ~} RES)
        ^^$(XIQ T.XIQ, ..WAKE (BLAB-ALL Q.I.XIQ N.RES))
      ::
      ++  COMPLETE                                      ::  NO UNKNOWNS
        |=  HAV/(MAP (PAIR CARE PATH) CACH)
        ?&  ?=(^ HAV)
            (LEVY ~(TAP BY `(MAP (PAIR CARE PATH) CACH)`HAV) KNOW)
        ==
      ::
      ++  KNOW  |=({(PAIR CARE PATH) C/CACH} ?=(^ C))   ::  KNOW ABOUT FILE
      ::
      ++  READ-UNKNOWN                                  ::  FILL IN THE BLANKS
        |=  {MOL/MOOL HAV/(MAP (PAIR CARE PATH) CACH)}
        %.  |=  {{C/CARE P/PATH} O/CACH}
            ?^(O O (AVER FOR C P.MOL P))
        =-  ~(URN BY -)
        ?^  HAV  HAV
        %-  ~(GAS BY *(MAP (PAIR CARE PATH) CACH))
        (TURN ~(TAP IN Q.MOL) |=({C/CARE P/PATH} [[C P] ~]))
      --
    ::
        $MANY
      =+  MOT=`MOAT`Q.ROV
      =*  SAV  R.ROV
      =+  NAB=(CASE-TO-AEON:ZE P.MOT)
      ?~  NAB
        $(XIQ T.XIQ, XAQ [I.XIQ XAQ])
      =+  HUY=(CASE-TO-AEON:ZE Q.MOT)
      ?~  HUY
        =.  P.MOT  [%UD +(LET.DOM)]
        %=  $
          XIQ     T.XIQ
          XAQ     [I.XIQ(Q.Q.P MOT) XAQ]
          ..WAKE  =+  ^=  EAR
                      (LOBES-AT-PATH:ZE FOR LET.DOM R.MOT)
                  ?:  =(SAV EAR)  ..WAKE
                  (BLEB-ALL Q.I.XIQ LET.DOM ?:(P.ROV ~ `[U.NAB LET.DOM]))
        ==
      %=  $
        XIQ     T.XIQ
        ..WAKE  =-  (BLUB-ALL:- Q.I.XIQ ~)
                =+  ^=  EAR
                    (LOBES-AT-PATH:ZE FOR U.HUY R.MOT)
                ?:  =(SAV EAR)  (BLUB-ALL Q.I.XIQ ~)
                (BLEB-ALL Q.I.XIQ +(U.NAB) ?:(P.ROV ~ `[U.NAB U.HUY]))
      ==
    ==
  ++  DROP-ME
    ^+  .
    ?~  MER
      .
    %-  EMIT(MER ~)  ^-  MOVE  :*
      HEN.U.MER  %GIVE  %MERE  %|  %USER-INTERRUPT
      >SOR.U.MER<  >OUR<  >CAS.U.MER<  >GEM.U.MER<  ~
    ==
  ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ::
  ::  THIS CORE HAS NO ADDITIONAL STATE, AND THE DISTINCTION EXISTS PURELY FOR
  ::  DOCUMENTATION.  THE OVERARCHING THEME IS THAT `++DE` DIRECTLY CONTAINS
  ::  LOGIC FOR METADATA ABOUT THE DESK, WHILE `++ZE` IS COMPOSED PRIMARILY
  ::  OF HELPER FUNCTIONS FOR MANIPULATING THE DESK STATE (`++DOME`) ITSELF.
  ::  FUNCTIONS INCLUDE:
  ::
  ::  --  CONVERTING BETWEEN CASES, COMMIT HASHES, COMMITS, CONTENT HASHES,
  ::      AND CONTENT
  ::  --  CREATING COMMITS AND CONTENT AND ADDING THEM TO THE TREE
  ::  --  FINDING WHICH DATA NEEDS TO BE SENT OVER THE NETWORK TO KEEP THE
  ::      OTHER URBIT UP-TO-DATE
  ::  --  READING FROM THE FILE TREE THROUGH DIFFERENT `++CARE` OPTIONS
  ::  --  THE `++ME` CORE FOR MERGING.
  ::
  ::  THE DOME IS COMPOSED OF THE FOLLOWING:
  ::
  ::  --  `ANK` IS THE ANKH, WHICH IS THE FILE DATA ITSELF.  AN ANKH IS BOTH
  ::      A POSSIBLE FILE AND A POSSIBLE DIRECTORY.  AN ANKH HAS BOTH:
  ::      --  `FIL`, A POSSIBLE FILE, STORED AS BOTH A CAGE AND ITS HASH
  ::      --  `DIR`, A MAP OF @TA TO MORE ANKHS.
  ::  --  `LET` IS THE NUMBER OF THE MOST RECENT REVISION.
  ::  --  `HIT` IS A MAP OF REVISION NUMBERS TO COMMIT HASHES.
  ::  --  `LAB` IS A MAP OF LABELS TO REVISION NUMBERS.
  ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  ++  ZE
    |%
    ::  THESE CONVERT BETWEEN AEON (VERSION NUMBER), TAKO (COMMIT HASH), YAKI
    ::  (COMMIT DATA STRUCTURE), LOBE (CONTENT HASH), AND BLOB (CONTENT).
    ++  AEON-TO-TAKO  ~(GOT BY HIT.DOM)
    ++  AEON-TO-YAKI  (CORK AEON-TO-TAKO TAKO-TO-YAKI)
    ++  LOBE-TO-BLOB  ~(GOT BY LAT.RAN)
    ++  TAKO-TO-YAKI  ~(GOT BY HUT.RAN)
    ++  LOBE-TO-MARK
      |=  A/LOBE
      =>  (LOBE-TO-BLOB A)
      ?-  -
        $DELTA      P.Q
        $DIRECT     P.Q
      ==
    ::
    ::  CREATES A SCHEMATIC OUT OF A PAGE (WHICH IS A [MARK NOUN]).
    ::
    ++  PAGE-TO-SCHEMATIC
      |=  [DISC=DISC:FORD A=PAGE]
      ^-  SCHEMATIC:FORD
      ::
      ?.  ?=($HOON P.A)  [%VOLT [OUR %HOME] A]
      ::  %HOON BOOTSTRAPPING
      [%$ P.A [%ATOM %T ~] Q.A]
    ::
    ::  CREATES A SCHEMATIC OUT OF A LOBE (CONTENT HASH).
    ::
    ++  LOBE-TO-SCHEMATIC
      |=  [DISC=DISC:FORD PAX=PATH LOB=LOBE]
      ^-  SCHEMATIC:FORD
      ::
      =+  ^-  HAT/(MAP PATH LOBE)
          ?:  =(LET.DOM 0)
            ~
          Q:(AEON-TO-YAKI LET.DOM)
      =+  LOL=`(UNIT LOBE)`?.(=(~ REF) `0VSEN.TINEL (~(GET BY HAT) PAX))
      |-  ^-  SCHEMATIC:FORD
      ?:  =([~ LOB] LOL)
        =+  (NEED (NEED (READ-X LET.DOM PAX)))
        ?>  ?=(%& -<)
        [%$ P.-]
      =+  BOL=(~(GOT BY LAT.RAN) LOB)
      ?-  -.BOL
        $DIRECT     (PAGE-TO-SCHEMATIC DISC Q.BOL)
        $DELTA      ~|  DELTA+Q.Q.BOL
                    [%PACT [OUR %HOME] $(LOB Q.Q.BOL) (PAGE-TO-SCHEMATIC DISC R.BOL)]
      ==
    ::
    ::  HASHES A PAGE TO GET A LOBE.
    ::
    ++  PAGE-TO-LOBE  |=(PAGE (SHAX (JAM +<)))
    ::
    ::  CHECKS WHETHER TWO PIECES OF DATA (EITHER CAGES OR LOBES) ARE THE SAME.
    ::
    ++  EQUIVALENT-DATA
      |=  {ONE/(EACH CAGE LOBE) TWO/(EACH CAGE LOBE)}
      ^-  ?
      ?:  ?=(%& -.ONE)
        ?:  ?=(%& -.TWO)
          =([P Q.Q]:P.ONE [P Q.Q]:P.TWO)
        =(P.TWO (PAGE-TO-LOBE [P Q.Q]:P.ONE))
      ?:  ?=(%& -.TWO)
        =(P.ONE (PAGE-TO-LOBE [P Q.Q]:P.TWO))
      =(P.ONE P.TWO)
    ::
    ::  MAKE A DIRECT BLOB OUT OF A PAGE.
    ::
    ++  MAKE-DIRECT-BLOB
      |=  P/PAGE
      ^-  BLOB
      [%DIRECT (PAGE-TO-LOBE P) P]
    ::
    ::  MAKE A DELTA BLOB OUT OF A LOBE, MARK, LOBE OF PARENT, AND PAGE OF DIFF.
    ::
    ++  MAKE-DELTA-BLOB
      |=  {P/LOBE Q/{P/MARK Q/LOBE} R/PAGE}
      ^-  BLOB
      [%DELTA P Q R]
    ::
    ::  MAKE A COMMIT OUT OF A LIST OF PARENTS, CONTENT, AND DATE.
    ::
    ++  MAKE-YAKI
      |=  {P/(LIST TAKO) Q/(MAP PATH LOBE) T/@DA}
      ^-  YAKI
      =+  ^=  HAS
          %^  CAT  7  (SHAM [%YAKI (ROLL P ADD) Q T])
          (SHAM [%TAKO (ROLL P ADD) Q T])
      [P Q HAS T]
    ::
    ::  REDUCE A CASE TO AN AEON (VERSION NUMBER)
    ::
    ::  WE PRODUCE NULL IF WE CAN'T YET REDUCE THE CASE FOR WHATEVER RESAON
    ::  (USUALLY EITHER THE TIME OR AEON HASN'T HAPPENED YET OR THE LABEL HASN'T
    ::  BEEN CREATED), WE PRODUCE NULL.
    ::
    ++  CASE-TO-AEON
      |=  LOK/CASE                                      ::  ACT COUNT THROUGH
      ^-  (UNIT AEON)
      ?-    -.LOK
          $DA
        ?:  (GTH P.LOK LIM)  ~
        |-  ^-  (UNIT AEON)
        ?:  =(0 LET.DOM)  [~ 0]                         ::  AVOID UNDERFLOW
        ?:  %+  GTE  P.LOK
            =<  T
            ~|  [%LETDOM LET=LET.DOM HIT=HIT.DOM HUT=(~(RUN BY HUT.RAN) ,~)]
            ~|  [%GETDOM (~(GET BY HIT.DOM) LET.DOM)]
            %-  AEON-TO-YAKI
            LET.DOM
          [~ LET.DOM]
        $(LET.DOM (DEC LET.DOM))
      ::
          $TAS  (~(GET BY LAB.DOM) P.LOK)
          $UD   ?:((GTH P.LOK LET.DOM) ~ [~ P.LOK])
      ==
    ::
    ::  CONVERT A MAP OF PATHS TO DATA INTO AN ANKH.
    ::
    ++  MAP-TO-ANKH
      |=  HAT/(MAP PATH (PAIR LOBE CAGE))
      ^-  ANKH
      ::  %-  COSH
      %+  ROLL  ~(TAP BY HAT)
      |=  {{PAT/PATH LOB/LOBE ZAR/CAGE} ANK/ANKH}
      ^-  ANKH
      ::  %-  COSH
      ?~  PAT
        ANK(FIL [~ LOB ZAR])
      =+  NAK=(~(GET BY DIR.ANK) I.PAT)
      %=  ANK
        DIR  %+  ~(PUT BY DIR.ANK)  I.PAT
             $(PAT T.PAT, ANK (FALL NAK *ANKH))
      ==
    ::
    ::  APPLIES A CHANGE LIST, CREATING THE COMMIT AND APPLYING IT TO THE
    ::  CURRENT STATE.
    ::
    ::  ALSO PRODUCES THE NEW DATA FROM THE COMMIT FOR CONVENIENCE.
    ::
    ++  EXECUTE-CHANGES
      |=  {WEN/@DA LEM/NURI}
      ^-  {(UNIT (MAP PATH LOBE)) _..ZE}
      ?-  -.LEM
        %&
           =^  YAK  LAT.RAN  (FORGE-YAKI WEN P.LEM)     ::  CREATE NEW COMMIT
           ?.  ?|  =(0 LET.DOM)
                   !=((LENT P.YAK) 1)
                   !=(Q.YAK Q:(AEON-TO-YAKI LET.DOM))
               ==
             `..ZE                                      ::  SILENTLY IGNORE
           =:  LET.DOM  +(LET.DOM)
               HIT.DOM  (~(PUT BY HIT.DOM) +(LET.DOM) R.YAK)
               HUT.RAN  (~(PUT BY HUT.RAN) R.YAK YAK)
           ==
           [`Q.YAK ..ZE]
           ::  +>.$(ANK (MAP-TO-ANKH Q.YAK))
        %|
           ?<  (~(HAS BY LAB.DOM) P.LEM)
           [~ ..ZE(LAB.DOM (~(PUT BY LAB.DOM) P.LEM LET.DOM))]
      ==
    ::
    ::  CREATE A COMMIT OUT OF A LIST OF CHANGES AGAINST THE CURRENT STATE.
    ::
    ::  FIRST CALL ++APPLY-CHANGES TO APPLY THE LIST OF CHANGES AND GET THE NEW
    ::  STATE OF THE CONTENT.  THEN, CALL ++UPDATE-LAT TO ADD ANY NEW CONTENT TO
    ::  THE BLOB STORE.  FINALLY, CREATE THE NEW YAKI (COMMIT) AND PRODUCE BOTH
    ::  IT AND THE NEW LAT (BLOB STORE).
    ::
    ++  FORGE-YAKI
      |=  {WEN/@DA LEM/SUBA}
      =+  PAR=?:(=(0 LET.DOM) ~ [(AEON-TO-TAKO LET.DOM) ~])
      =+  NEW=(APPLY-CHANGES LEM)
      =+  GAR=(UPDATE-LAT NEW LAT.RAN)
      :-  (MAKE-YAKI PAR +.GAR WEN)                     ::  FROM EXISTING DIFF
      -.GAR                                             ::  FIX LAT
    ::
    ::  APPLY A LIST OF CHANGES AGAINST THE CURRENT STATE AND PRODUCE THE NEW
    ::  STATE.
    ::
    ++  APPLY-CHANGES                                   ::   APPLY-CHANGES:ZE
      |=  LAR/(LIST {P/PATH Q/MISU})                    ::  STORE CHANGES
      ^-  (MAP PATH BLOB)
      =+  ^=  HAT                                       ::  CURRENT STATE
          ?:  =(LET.DOM 0)                              ::  INITIAL COMMIT
            ~                                           ::  HAS NOTHING
          =<  Q
          %-  AEON-TO-YAKI
          LET.DOM
      =-  =+  SAR=(SILT (TURN LAR |=({P/PATH *} P)))    ::  CHANGED PATHS
          %+  ROLL  ~(TAP BY HAT)                       ::  FIND UNCHANGED
          =<  .(BAT BAR)
          |=  {{PAX/PATH GAR/LOBE} BAT/(MAP PATH BLOB)}
          ?:  (~(HAS IN SAR) PAX)                       ::  HAS UPDATE
            BAT
          %+  ~(PUT BY BAT)  PAX
          ~|  [PAX GAR (LENT ~(TAP BY LAT.RAN))]
          (LOBE-TO-BLOB GAR)                            ::  USE ORIGINAL
      ^=  BAR  ^-  (MAP PATH BLOB)
      %+  ROLL  LAR
      |=  {{PAX/PATH MYS/MISU} BAR/(MAP PATH BLOB)}
      ^+  BAR
      ?-    -.MYS
          $INS                                          ::  INSERT IF NOT EXIST
        ?:  (~(HAS BY BAR) PAX)  !!                     ::
        ?:  (~(HAS BY HAT) PAX)  !!                     ::
        %+  ~(PUT BY BAR)  PAX
        %-  MAKE-DIRECT-BLOB
        ?:  &(?=($MIME -.P.MYS) =([%HOON ~] (SLAG (DEC (LENT PAX)) PAX)))
          `PAGE`[%HOON +.+.Q.Q.P.MYS]
        [P Q.Q]:P.MYS
      ::
          $DEL                                          ::  DELETE IF EXISTS
        ?.  |((~(HAS BY HAT) PAX) (~(HAS BY BAR) PAX))  !!
        (~(DEL BY BAR) PAX)
      ::
          $DIF                                          ::  MUTATE, MUST EXIST
        =+  BER=(~(GET BY BAR) PAX)                     ::  XX  TYPED
        =+  HER==>((FLOP PAX) ?~(. %$ I))
        ?~  BER
          =+  HAR=(~(GET BY HAT) PAX)
          ?~  HAR  !!
          %+  ~(PUT BY BAR)  PAX
          (MAKE-DELTA-BLOB P.MYS [(LOBE-TO-MARK U.HAR) U.HAR] [P Q.Q]:Q.MYS)
                                                        :: XX CHECK VASE !EVIL
        ::  XX OF COURSE THAT'S A PROBLEM, P.U.BER ISN'T IN RANG SINCE IT
        ::     WAS JUST CREATED.  WE SHOULDN'T BE SENDING MULTIPLE
        ::     DIFFS
        ::  %+  ~(PUT BY BAR)  PAX
        ::  %^  MAKE-DELTA-BLOB  P.MYS
        ::    [(LOBE-TO-MARK P.U.BER) P.U.BER]
        ::  [P Q.Q]:Q.MYS
        ::                                              :: XX CHECK VASE !EVIL
        ~|([%TWO-DIFFS-FOR-SAME-FILE SYD PAX] !!)
      ==
    ::
    ::  UPDATE THE OBJECT STORE WITH NEW BLOBS.
    ::
    ::  BESIDES NEW OBJECT STORE, CONVERTS THE GIVEN (MAP PATH BLOB) TO
    ::  (MAP PATH LOBE).
    ::
    ++  UPDATE-LAT                                      ::   UPDATE-LAT:ZE
      |=  {LAG/(MAP PATH BLOB) STA/(MAP LOBE BLOB)}     ::  FIX LAT
      ^-  {(MAP LOBE BLOB) (MAP PATH LOBE)}
      %+  ROLL  ~(TAP BY LAG)
      =<  .(LUT STA)
      |=  {{PAT/PATH BAR/BLOB} {LUT/(MAP LOBE BLOB) GAR/(MAP PATH LOBE)}}
      ?~  (~(HAS BY LUT) P.BAR)
        [LUT (~(PUT BY GAR) PAT P.BAR)]
      :-  (~(PUT BY LUT) P.BAR BAR)
      (~(PUT BY GAR) PAT P.BAR)
    ::
    ::  GETS A MAP OF THE DATA AT THE GIVEN PATH AND ALL CHILDREN OF IT.
    ::
    ++  LOBES-AT-PATH
      |=  {FOR/(UNIT SHIP) YON/AEON PAX/PATH}
      ^-  (MAP PATH LOBE)
      ?:  =(0 YON)  ~
      ::  WE USE %Z FOR THE CHECK BECAUSE IT LOOKS AT ALL CHILD PATHS.
      ?:  |(?=(~ FOR) (MAY-READ U.FOR %Z YON PAX))  ~
      %-  MALT
      %+  SKIM
        %~  TAP  BY
        =<  Q
        %-  AEON-TO-YAKI
        YON
      |=  {P/PATH Q/LOBE}
      ?|  ?=(~ PAX)
          ?&  !?=(~ P)
              =(-.PAX -.P)
              $(P +.P, PAX +.PAX)
      ==  ==
    ::
    ::  CREATES A NAKO OF ALL THE CHANGES BETWEEN A AND B.
    ::
    ++  MAKE-NAKO
      |=  {A/AEON B/AEON}
      ^-  NAKO
      :+  ?>  (LTE B LET.DOM)
          |-
          ?:  =(B LET.DOM)
            HIT.DOM
          $(HIT.DOM (~(DEL BY HIT.DOM) LET.DOM), LET.DOM (DEC LET.DOM))
        B
      ?:  =(0 B)
        [~ ~]
      (DATA-TWIXT-TAKOS (~(GET BY HIT.DOM) A) (AEON-TO-TAKO B))
    ::
    ::  GETS THE DATA BETWEEN TWO COMMIT HASHES, ASSUMING THE FIRST IS AN
    ::  ANCESTOR OF THE SECOND.
    ::
    ::  GET ALL THE TAKOS BEFORE `A`, THEN GET ALL TAKOS BEFORE `B` EXCEPT THE
    ::  ONES WE FOUND BEFORE `A`.  THEN CONVERT THE TAKOS TO YAKIS AND ALSO GET
    ::  ALL THE DATA IN ALL THE YAKIS.
    ::
    ++  DATA-TWIXT-TAKOS
      |=  {A/(UNIT TAKO) B/TAKO}
      ^-  {(SET YAKI) (SET PLOP)}
      =+  OLD=?~(A ~ (REACHABLE-TAKOS U.A))
      =+  ^-  YAL/(SET TAKO)
          %-  SILT
          %+  SKIP
            ~(TAP IN (REACHABLE-TAKOS B))
          |=(TAK/TAKO (~(HAS IN OLD) TAK))
      :-  (SILT (TURN ~(TAP IN YAL) TAKO-TO-YAKI))
      (SILT (TURN ~(TAP IN (NEW-LOBES (NEW-LOBES ~ OLD) YAL)) LOBE-TO-BLOB))
    ::
    ::  TRAVERSES PARENTAGE AND FINDS ALL ANCESTOR HASHES
    ::
    ++  REACHABLE-TAKOS                                 ::  REACHABLE
      |=  P/TAKO
      ^-  (SET TAKO)
      =+  Y=(TAKO-TO-YAKI P)
      %+  ROLL  P.Y
      =<  .(S (~(PUT IN *(SET TAKO)) P))
      |=  {Q/TAKO S/(SET TAKO)}
      ?:  (~(HAS IN S) Q)                               ::  ALREADY DONE
        S                                               ::  HENCE SKIP
      (~(UNI IN S) ^$(P Q))                             ::  OTHERWISE TRAVERSE
    ::
    ::  GET ALL THE LOBES THAT ARE REFERENCED IN `A` EXCEPT THOSE THAT ARE
    ::  ALREADY IN `B`.
    ::
    ++  NEW-LOBES                                       ::  OBJECT HASH SET
      |=  {B/(SET LOBE) A/(SET TAKO)}                   ::  THAT AREN'T IN B
      ^-  (SET LOBE)
      %+  ROLL  ~(TAP IN A)
      |=  {TAK/TAKO BAR/(SET LOBE)}
      ^-  (SET LOBE)
      =+  YAK=(TAKO-TO-YAKI TAK)
      %+  ROLL  ~(TAP BY Q.YAK)
      =<  .(FAR BAR)
      |=  {{PATH LOB/LOBE} FAR/(SET LOBE)}
      ^-  (SET LOBE)
      ?~  (~(HAS IN B) LOB)                             ::  DON'T NEED
        FAR
      =+  GAR=(LOBE-TO-BLOB LOB)
      ?-  -.GAR
        $DIRECT    (~(PUT IN FAR) LOB)
        $DELTA     (~(PUT IN $(LOB Q.Q.GAR)) LOB)
      ==
    ::
    ::  GETS THE PERMISSIONS THAT APPLY TO A PARTICULAR NODE.
    ::
    ::  IF THE NODE HAS NO PERMISSIONS OF ITS OWN, WE USE ITS PARENT'S.
    ::  IF NO PERMISSIONS HAVE BEEN SET FOR THE ENTIRE TREE ABOVE THE NODE,
    ::  WE DEFAULT TO FULLY PRIVATE (EMPTY WHITELIST).
    ::
    ++  READ-P
      |=  PAX/PATH
      ^-  (UNIT (UNIT (EACH CAGE LOBE)))
      =-  [~ ~ %& %NOUN !>(-)]
      :-  (READ-P-IN PAX PER.RED)
      (READ-P-IN PAX PEW.RED)
    ::
    ++  READ-P-IN
      |=  {PAX/PATH PES/REGS}
      ^-  DICT
      =/  RUL/(UNIT RULE)  (~(GET BY PES) PAX)
      ?^  RUL
        :+  PAX  MOD.U.RUL
        %-  ~(REP IN WHO.U.RUL)
        |=  {W/WHOM OUT/(PAIR (SET SHIP) (MAP @TA CREW))}
        ?:  ?=({%& @P} W)
          [(~(PUT IN P.OUT) +.W) Q.OUT]
        =/  CRU/(UNIT CREW)  (~(GET BY CEZ.RUF) +.W)
        ?~  CRU  OUT
        [P.OUT (~(PUT BY Q.OUT) +.W U.CRU)]
      ?~  PAX  [/ %WHITE ~ ~]
      $(PAX (SCAG (DEC (LENT PAX)) `PATH`PAX))
    ::
    ++  MAY-READ
      |=  {WHO/SHIP CAR/CARE YON/AEON PAX/PATH}
      ^-  ?
      ?+  CAR
        (ALLOWED-BY WHO PAX PER.RED)
      ::
          $P
        =(WHO OUR)
      ::
          ?($Y $Z)
        =+  TAK=(~(GET BY HIT.DOM) YON)
        ?~  TAK  |
        =+  YAK=(TAKO-TO-YAKI U.TAK)
        =+  LEN=(LENT PAX)
        =-  (LEVY ~(TAP IN -) |=(P/PATH (ALLOWED-BY WHO P PER.RED)))
        %+  ROLL  ~(TAP IN (~(DEL IN ~(KEY BY Q.YAK)) PAX))
        |=  {P/PATH S/(SET PATH)}
        ?.  =(PAX (SCAG LEN P))  S
        %-  ~(PUT IN S)
        ?:  ?=($Z CAR)  P
        (SCAG +(LEN) P)
      ==
    ::
    ++  MAY-WRITE
      |=  {W/SHIP P/PATH}
      (ALLOWED-BY W P PEW.RED)
    ::
    ++  ALLOWED-BY
      |=  {WHO/SHIP PAX/PATH PES/REGS}
      ^-  ?
      =/  RUL/REAL  RUL:(READ-P-IN PAX PES)
      =/  IN-LIST/?
        ?|  (~(HAS IN P.WHO.RUL) WHO)
          ::
            %-  ~(REP BY Q.WHO.RUL)
            |=  {{@TA CRU/CREW} OUT/_|}
            ?:  OUT  &
            (~(HAS IN CRU) WHO)
        ==
      ?:  =(%BLACK MOD.RUL)
        !IN-LIST
      IN-LIST
    ::  +READ-T: PRODUCE THE LIST OF PATHS WITHIN A YAKI WITH :PAX AS PREFIX
    ::
    ++  READ-T
      |=  [YON=AEON PAX=PATH]
      ^-  (UNIT (UNIT [%FILE-LIST (HYPO (LIST PATH))]))
      ::  IF ASKED FOR VERSION 0, PRODUCE AN EMPTY LIST OF FILES
      ::
      ?:  =(0 YON)
        ``[%FILE-LIST -:!>(*(LIST PATH)) *(LIST PATH)]
      ::  IF ASKED FOR A FUTURE VERSION, WE DON'T HAVE AN ANSWER
      ::
      ?~  TAK=(~(GET BY HIT.DOM) YON)
        ~
      ::  LOOK UP THE YAKI SNAPSHOT BASED ON THE VERSION
      ::
      =/  YAK=YAKI  (TAKO-TO-YAKI U.TAK)
      ::  CALCULATE THE PATH LENGTH ONCE OUTSIDE THE LOOP
      ::
      =/  PATH-LENGTH  (LENT PAX)
      ::
      :^  ~  ~  %FILE-LIST
      :-  -:!>(*(LIST PATH))
      ^-  (LIST PATH)
      ::  SORT THE MATCHING PATHS ALPHABETICALLY
      ::
      =-  (SORT - AOR)
      ::  TRAVERSE THE FILESYSTEM, FILTERING FOR PATHS WITH :PAX AS PREFIX
      ::
      %+  SKIM  ~(TAP IN ~(KEY BY Q.YAK))
      |=(PAF=PATH =(PAX (SCAG PATH-LENGTH PAF)))
    ::
    ::  CHECKS FOR EXISTENCE OF A NODE AT AN AEON.
    ::
    ::  THIS CHECKS FOR EXISTENCE OF CONTENT AT THE NODE, AND DOES *NOT* LOOK
    ::  AT ANY OF ITS CHILDREN.
    ::
    ++  READ-U
      |=  {YON/AEON PAX/PATH}
      ^-  (UNIT (UNIT (EACH {$NULL (HYPO ~)} LOBE)))
      =+  TAK=(~(GET BY HIT.DOM) YON)
      ?~  TAK
        ~
      ``[%& %NULL [%ATOM %N ~] ~]
    ::
    ::  GETS THE DOME (DESK STATE) AT A PARTICULAR AEON.
    ::
    ::  FOR PAST AEONS, WE DON'T GIVE AN ACTUAL ANKH IN THE DOME, BUT THE REST
    ::  OF THE DATA IS LEGIT. WE ALSO NEVER SEND THE MIME CACHE OVER THE WIRE.
    ::
    ++  READ-V
      |=  {YON/AEON PAX/PATH}
      ^-  (UNIT (UNIT {$DOME (HYPO DOME:CLAY)}))
      ?:  (LTH YON LET.DOM)
        :*  ~  ~  %DOME  -:!>(%DOME)
            ^-  DOME:CLAY
            :*  ANK=`[[%ANK-IN-OLD-V-NOT-IMPLEMENTED *ANKH] ~ ~]
                LET=YON
                HIT=(MOLT (SKIM ~(TAP BY HIT.DOM) |=({P/@UD *} (LTE P YON))))
                LAB=(MOLT (SKIM ~(TAP BY LAB.DOM) |=({* P/@UD} (LTE P YON))))
        ==  ==
      ?:  (GTH YON LET.DOM)
        ~
      ``[%DOME -:!>(*DOME:CLAY) [ANK LET HIT LAB]:DOM]
    ::
    ::  GETS ALL CASES REFERING TO THE SAME REVISION AS THE GIVEN CASE.
    ::
    ::  FOR THE %DA CASE, WE GIVE JUST THE CANONICAL TIMESTAMP OF THE REVISION.
    ::
    ++  READ-W
      |=  CAS/CASE
      ^-  (UNIT (UNIT (EACH CAGE LOBE)))
      =+  AEY=(CASE-TO-AEON CAS)
      ?~  AEY  ~
      =-  [~ ~ %& %CASS !>(-)]
      ^-  CASS
      :-  U.AEY
      ?:  =(0 U.AEY)  `@DA`0
      T:(AEON-TO-YAKI U.AEY)
    ::
    ::  GETS THE DATA AT A NODE.
    ::
    ::  IF IT'S IN OUR ANKH (CURRENT STATE CACHE), WE CAN JUST PRODUCE THE
    ::  RESULT.  OTHERWISE, WE'VE GOT TO LOOK UP THE NODE AT THE AEON TO GET THE
    ::  CONTENT HASH, USE THAT TO FIND THE BLOB, AND USE THE BLOB TO GET THE
    ::  DATA.  WE ALSO SPECIAL-CASE THE HOON MARK FOR BOOTSTRAPPING PURPOSES.
    ::
    ++  READ-X
      |=  {YON/AEON PAX/PATH}
      ^-  (UNIT (UNIT (EACH CAGE LOBE)))
      ?:  =(0 YON)
        [~ ~]
      =+  TAK=(~(GET BY HIT.DOM) YON)
      ?~  TAK
        ~
      ?:  &(?=(~ REF) =(YON LET.DOM))
        :-  ~
        %+  BIND
          FIL.ANK:(DESCEND-PATH:(ZU ANK.DOM) PAX)
        |=(A/{P/LOBE Q/CAGE} [%& Q.A])
      =+  YAK=(TAKO-TO-YAKI U.TAK)
      =+  LOB=(~(GET BY Q.YAK) PAX)
      ?~  LOB
        [~ ~]
      =+  MAR=(LOBE-TO-MARK U.LOB)
      ?.  ?=($HOON MAR)
        [~ ~ %| U.LOB]
      :^  ~  ~  %&
      :+  MAR  [%ATOM %T ~]
      |-  ^-  @T                      ::  (URGE CORD) WOULD BE FASTER
      =+  BOL=(LOBE-TO-BLOB U.LOB)
      ?:  ?=($DIRECT -.BOL)
        ((HARD @T) Q.Q.BOL)
      ?>  ?=($DELTA -.BOL)
      =+  TXT=$(U.LOB Q.Q.BOL)
      ?>  ?=($TXT-DIFF P.R.BOL)
      =+  DIF=((HARD (URGE CORD)) Q.R.BOL)
      =,  FORMAT
      =+  PAC=(OF-WAIN (LURK:DIFFER (TO-WAIN (CAT 3 TXT '\0A')) DIF))
      (END 3 (DEC (MET 3 PAC)) PAC)
    ::
    ::  GETS AN ARCH (DIRECTORY LISTING) AT A NODE.
    ::
    ++  READ-Y
      |=  {YON/AEON PAX/PATH}
      ^-  (UNIT (UNIT {$ARCH (HYPO ARCH)}))
      ?:  =(0 YON)
        ``[%ARCH -:!>(*ARCH) *ARCH]
      =+  TAK=(~(GET BY HIT.DOM) YON)
      ?~  TAK
        ~
      =+  YAK=(TAKO-TO-YAKI U.TAK)
      =+  LEN=(LENT PAX)
      :^  ~  ~  %ARCH
      ::  ~&  CY+PAX
      :-  -:!>(*ARCH)
      ^-  ARCH
      :-  (~(GET BY Q.YAK) PAX)
      ^-  (MAP KNOT ~)
      %-  MOLT  ^-  (LIST (PAIR KNOT ~))
      %+  TURN
        ^-  (LIST (PAIR PATH LOBE))
        %+  SKIM  ~(TAP BY (~(DEL BY Q.YAK) PAX))
        |=  {PAF/PATH LOB/LOBE}
        =(PAX (SCAG LEN PAF))
      |=  {PAF/PATH LOB/LOBE}
      =+  PAT=(SLAG LEN PAF)
      [?>(?=(^ PAT) I.PAT) ~]
    ::
    ::  GETS A RECURSIVE HASH OF A NODE AND ALL ITS CHILDREN.
    ::
    ++  READ-Z
      |=  {YON/AEON PAX/PATH}
      ^-  (UNIT (UNIT {$UVI (HYPO @UVI)}))
      ?:  =(0 YON)
        ``UVI+[-:!>(*@UVI) *@UVI]
      =+  TAK=(~(GET BY HIT.DOM) YON)
      ?~  TAK
        ~
      =+  YAK=(TAKO-TO-YAKI U.TAK)
      =+  LEN=(LENT PAX)
      :: ~&  READ-Z+[YON=YON QYT=~(WYT BY Q.YAK) PAX=PAX]
      =+  ^-  DESCENDANTS/(LIST (PAIR PATH LOBE))
          ::  ~&  %TURNING
          ::  =-  ~&  %TURNED  -
          %+  TURN
            ::  ~&  %SKIMMING
            ::  =-  ~&  %SKIMMED  -
            %+  SKIM  ~(TAP BY (~(DEL BY Q.YAK) PAX))
            |=  {PAF/PATH LOB/LOBE}
            =(PAX (SCAG LEN PAF))
          |=  {PAF/PATH LOB/LOBE}
          [(SLAG LEN PAF) LOB]
      =+  US=(~(GET BY Q.YAK) PAX)
      ^-  (UNIT (UNIT {$UVI (HYPO @UVI)}))
      :^  ~  ~  %UVI
      :-  -:!>(*@UVI)
      ?:  &(?=(~ DESCENDANTS) ?=(~ US))
        *@UVI
      %+  ROLL
        ^-  (LIST (PAIR PATH LOBE))
        [[~ ?~(US *LOBE U.US)] DESCENDANTS]
      |=({{PATH LOBE} @UVI} (SHAX (JAM +<)))
    ::
    ::  GET A VALUE AT AN AEON.
    ::
    ::  VALUE CAN BE EITHER NULL, MEANING WE DON'T HAVE IT YET, {NULL NULL},
    ::  MEANING WE KNOW IT DOESN'T EXIST, OR {NULL NULL (EACH CAGE LOBE)},
    ::  MEANING WE EITHER HAVE THE VALUE DIRECTLY OR A CONTENT HASH OF THE
    ::  VALUE.
    ::
    ++  READ-AT-AEON                                    ::    READ-AT-AEON:ZE
      |=  {FOR/(UNIT SHIP) YON/AEON MUN/MOOD}           ::  SEEK AND READ
      ^-  (UNIT (UNIT (EACH CAGE LOBE)))
      ?.  |(?=(~ FOR) (MAY-READ U.FOR P.MUN YON R.MUN))
        ~
      ?-  P.MUN
          $D
        ::  XX THIS SHOULD ONLY ALLOW READS AT THE CURREBT DATE
        ::
        ?:  !=(OUR HER)
          [~ ~]
        ?^  R.MUN
          ~&(%NO-CD-PATH [~ ~])
        [~ ~ %& %NOUN !>(~(KEY BY DOS.ROM.RUF))]
      ::
        $P  (READ-P R.MUN)
        $T  (BIND (READ-T YON R.MUN) (LIFT |=(A=CAGE [%& A])))
        $U  (READ-U YON R.MUN)
        $V  (BIND (READ-V YON R.MUN) (LIFT |=(A/CAGE [%& A])))
        $W  (READ-W Q.MUN)
        $X  (READ-X YON R.MUN)
        $Y  (BIND (READ-Y YON R.MUN) (LIFT |=(A/CAGE [%& A])))
        $Z  (BIND (READ-Z YON R.MUN) (LIFT |=(A/CAGE [%& A])))
      ==
    ::
    ::  TRAVERSE AN ANKH.
    ::
    ++  ZU                                              ::  FILESYSTEM
      |=  ANK/ANKH                                      ::  FILESYSTEM STATE
      =|  RAM/PATH                                      ::  REVERSE PATH INTO
      |%
      ++  DESCEND                                       ::  DESCEND
        |=  LOL/@TA
        ^+  +>
        =+  YOU=(~(GET BY DIR.ANK) LOL)
        +>.$(RAM [LOL RAM], ANK ?~(YOU [~ ~] U.YOU))
      ::
      ++  DESCEND-PATH                                  ::  DESCEND RECURSIVELY
        |=  WAY/PATH
        ^+  +>
        ?~(WAY +> $(WAY T.WAY, +> (DESCEND I.WAY)))
      --
    ::
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ::
    ::  THIS CORE IS SPECIFIC TO ANY CURRENTLY RUNNING MERGE.  THIS IS
    ::  BASICALLY A SIMPLE (DAG-SHAPED) STATE MACHINE.  WE ALWAYS SAY WE'RE
    ::  MERGING FROM 'ALI' TO 'BOB'.  THE BASIC STEPS, NOT ALL OF WHICH ARE
    ::  ALWAYS NEEDED, ARE:
    ::
    ::  --  FETCH ALI'S DESK
    ::  --  DIFF ALI'S DESK AGAINST THE MERGEBASE
    ::  --  DIFF BOB'S DESK AGAINST THE MERGEBASE
    ::  --  MERGE THE DIFFS
    ::  --  BUILD THE NEW STATE
    ::  --  "CHECKOUT" (APPLY TO ACTUAL `++DOME`) THE NEW STATE
    ::  --  "ERGO" (TELL UNIX ABOUT) ANY CHANGES
    ::
    ::  THE STATE FILLED IN ORDER THROUGH EACH STEP.  SEE ++MERY FOR A
    ::  DESCRIPTION OF THE STATE.
    ::
    ::
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    ++  ME                                              ::  MERGE ALI INTO BOB
      |=  {ALI/(PAIR SHIP DESK) ALH/(UNIT DOME) NEW/?}  ::  FROM
      =+  BOB=`(PAIR SHIP DESK)`[OUR SYD]               ::  TO
      =+  ^-  DAT/(EACH MERY TERM)
          ?~  MER
            ?:  NEW
              =+  *MERY
              [%& -(SOR ALI:+, HEN HEN:+, WAT %NULL)]
            [%| %NOT-ACTUALLY-MERGING]
          ?.  NEW
            ?:  =(ALI SOR.U.MER)
              [%& U.MER]
            ~&  :*  %ALREADY-MERGING-FROM-SOMEWHERE-ELSE
                    ALI=ALI
                    SOR=SOR.U.MER
                    GEM=GEM.U.MER
                    WAT=WAT.U.MER
                    CAS=CAS.U.MER
                    HEN=HEN
                    HENMER=HEN.U.MER
                ==
            [%| %ALREADY-MERGING-FROM-SOMEWHERE-ELSE]
          ~&  :*  %ALREADY-MERGING-FROM-SOMEWHERE
                  ALI=ALI
                  SOR=SOR.U.MER
                  GEM=GEM.U.MER
                  WAT=WAT.U.MER
                  CAS=CAS.U.MER
                  HEN=HEN
                  HENMER=HEN.U.MER
              ==
          [%| %ALREADY-MERGING-FROM-SOMEWHERE]
      ?:  ?=(%| -.DAT)
        ~|(P.DAT !!)
      =+  DAT=P.DAT
      =|  DON/?                                         ::  KEEP GOING
      |%
      ::
      ::  RESOLVE.  IF WE'RE DONE, PRODUCE A RESULT.
      ::
      ++  ABET
        ^+  ..ME
        ?:  DON
          ..ME(MER `DAT)
        =.  MER  ~
        =>  (EMIT HEN.DAT %GIVE %MERE GON.DAT)
        ..ME
      ::
      ::  SEND A MOVE.
      ::
      ++  EMIT
        |=  MOVE
        %_(+> ..ZE (^EMIT +<))
      ::
      ::  SEND A LIST OF MOVES.
      ::
      ++  EMIL
        |=  (LIST MOVE)
        %_(+> ..ZE (^EMIL +<))
      ::
      ::  ROUTE RESPONSES FROM CLAY OR FORD.
      ::
      ::  CHECK THAT THE STAGE OF THE RESPONSE IS THE SAME AS THE STAGE WE THINK
      ::  WE'RE IN, AND CALL THE APPROPRIATE FUNCTION FOR THAT STAGE.
      ::
      ++  ROUTE
        |=  {SAT/TERM RES/(EACH RIOT MADE-RESULT:FORD)}
        ^+  +>.$
        ?.  =(SAT WAT.DAT)
          ~|  :*  %HOLD-YOUR-HORSES-MERGE-OUT-OF-ORDER
                  SAT=SAT
                  WAT=WAT.DAT
                  ALI=ALI
                  BOB=BOB
                  HEPRES=-.RES
              ==
           !!
        ?+  +<  ~|((CRIP <[%BAD-STAGE SAT ?~(-.RES %RIOT %GAGE)]>) !!)
          {$ALI %& *}       %.(P.RES FETCHED-ALI)
          {$DIFF-ALI %| *}  %.(P.RES DIFFED-ALI)
          {$DIFF-BOB %| *}  %.(P.RES DIFFED-BOB)
          {$MERGE %| *}     %.(P.RES MERGED)
          {$BUILD %| *}     %.(P.RES BUILT)
          {$CHECKOUT %| *}  %.(P.RES CHECKED-OUT)
          {$ERGO %| *}      %.(P.RES ERGOED)
        ==
      ::
      ::  START A MERGE.
      ::
      ::  SETS CAS.DAT, GEM.DAT, AND BOB.DAT.  UNLESS THERE'S AN ERROR, LEADS
      ::  TO ++FETCH-ALI.
      ::
      ++  START
        |=  {CAS/CASE GEM/GERM}
        ^+  +>
        ?:  &(=(0 LET.DOM) !?=(?($INIT $THAT) GEM))
          (ERROR:HE %NO-BOB-DESK ~)
        =.  CAS.DAT  CAS
        =.  GEM.DAT  GEM
        ?:  =(0 LET.DOM)
          FETCH-ALI(GEM.DAT %INIT)
        =+  (~(GET BY HIT.DOM) LET.DOM)
        ?~  -
          (ERROR:HE %NO-BOB--VERSION ~)
        =+  (~(GET BY HUT.RAN) U.-)
        ?~  -
          (ERROR:HE %NO-BOB-COMMIT ~)
        FETCH-ALI(BOB.DAT U.-)
      ::
      ::  TELL CLAY TO GET THE STATE AT THE REQUESTED CASE FOR ALI'S DESK.
      ::
      ++  FETCH-ALI
        ^+  .
        %-  EMIT(WAT.DAT %ALI)
        :*  HEN  %PASS
            [%MERGE (SCOT %P P.BOB) Q.BOB (SCOT %P P.ALI) Q.ALI %ALI ~]
            [%C %WARP P.ALI Q.ALI `[%SING %V CAS.DAT /]]
        ==
      ::
      ::  PARSE THE STATE OF ALI'S DESK, AND GET THE MOST RECENT COMMIT.
      ::
      ::  SETS ALI.DAT.
      ::
      ++  FETCHED-ALI
        |=  ROT/RIOT
        ^+  +>
        ?~  ROT
          (ERROR:HE %BAD-FETCH-ALI ~)
        =+  ^=  DUM
            ::  CONSTRUCT AN EMPTY MIME CACHE
            ::
            :_  MIM=*(MAP PATH MIME)
            %.  Q.Q.R.U.ROT
            %-  HARD
            $:  ANK=*
                LET=@UD
                HIT=(MAP @UD TAKO)
                LAB=(MAP @TAS @UD)
            ==
        ?:  =(0 LET.DUM)
          (ERROR:HE %NO-ALI-DESK ~)
        =+  (~(GET BY HIT.DUM) LET.DUM)
        ?~  -
          (ERROR:HE %NO-ALI-VERSION ~)
        =+  (~(GET BY HUT.RAN) U.-)
        ?~  -
          (ERROR:HE %NO-ALI-COMMIT ~)
        =.  ALI.DAT  U.-
        |-
        ?-    GEM.DAT
        ::
        ::  IF THIS IS AN %INIT MERGE, WE SET THE ALI'S COMMIT TO BE BOB'S, AND
        ::  WE CHECKOUT THE NEW STATE.
        ::
            $INIT
          =.  NEW.DAT  ALI.DAT
          =.  HUT.RAN  (~(PUT BY HUT.RAN) R.NEW.DAT NEW.DAT)
          =.  ERG.DAT  (~(RUN BY Q.ALI.DAT) |=(LOBE %&))
          CHECKOUT
        ::
        ::  IF THIS IS A %THIS MERGE, WE CHECK TO SEE IF ALI'S AND BOB'S COMMITS
        ::  ARE THE SAME, IN WHICH CASE WE'RE DONE.  OTHERWISE, WE CHECK TO SEE
        ::  IF ALI'S COMMIT IS IN THE ANCESTRY OF BOB'S, IN WHICH CASE WE'RE
        ::  DONE.  OTHERWISE, WE CREATE A NEW COMMIT WITH BOB'S DATA PLUS ALI
        ::  AND BOB AS PARENTS.  THEN WE CHECKOUT THE NEW STATE.
        ::
            $THIS
          ?:  =(R.ALI.DAT R.BOB.DAT)  DONE:HE
          ?:  (~(HAS IN (REACHABLE-TAKOS R.BOB.DAT)) R.ALI.DAT)  DONE:HE
          =.  NEW.DAT  (MAKE-YAKI [R.ALI.DAT R.BOB.DAT ~] Q.BOB.DAT NOW)
          =.  HUT.RAN  (~(PUT BY HUT.RAN) R.NEW.DAT NEW.DAT)
          =.  ERG.DAT  ~
          CHECKOUT
        ::
        ::  IF THIS IS A %THAT MERGE, WE CHECK TO SEE IF ALI'S AND BOB'S COMMITS
        ::  ARE THE SAME, IN WHICH CASE WE'RE DONE.  OTHERWISE, WE CREATE A NEW
        ::  COMMIT WITH ALI'S DATA PLUS ALI AND BOB AS PARENTS.  THEN WE
        ::  CHECKOUT THE NEW STATE.
        ::
            $THAT
          ?:  =(R.ALI.DAT R.BOB.DAT)  DONE:HE
          =.  NEW.DAT  (MAKE-YAKI [R.ALI.DAT R.BOB.DAT ~] Q.ALI.DAT NOW)
          =.  HUT.RAN  (~(PUT BY HUT.RAN) R.NEW.DAT NEW.DAT)
          =.  ERG.DAT
            %-  MALT  ^-  (LIST {PATH ?})
            %+  MURN  ~(TAP BY (~(UNI BY Q.BOB.DAT) Q.ALI.DAT))
            |=  {PAX/PATH LOB/LOBE}
            ^-  (UNIT {PATH ?})
            =+  A=(~(GET BY Q.ALI.DAT) PAX)
            =+  B=(~(GET BY Q.BOB.DAT) PAX)
            ?:  =(A B)
              ~
            `[PAX !=(~ A)]
          CHECKOUT
        ::
        ::  IF THIS IS A %FINE MERGE, WE CHECK TO SEE IF ALI'S AND BOB'S COMMITS
        ::  ARE THE SAME, IN WHICH CASE WE'RE DONE.  OTHERWISE, WE CHECK TO SEE
        ::  IF ALI'S COMMIT IS IN THE ANCESTRY OF BOB'S, IN WHICH CASE WE'RE
        ::  DONE.  OTHERWISE, WE CHECK TO SEE IF BOB'S COMMIT IS IN THE ANCESTRY
        ::  OF ALI'S.  IF NOT, THIS IS NOT A FAST-FORWARD MERGE, SO WE ERROR
        ::  OUT.  IF IT IS, WE ADD ALI'S COMMIT TO BOB'S DESK AND CHECKOUT.
        ::
            $FINE
          ?:  =(R.ALI.DAT R.BOB.DAT)
            ::  ~&  [%FINE-TRIVIAL ALI=<ALI> BOB=<BOB> R.ALI.DAT R.BOB.DAT]
            DONE:HE
          ?:  (~(HAS IN (REACHABLE-TAKOS R.BOB.DAT)) R.ALI.DAT)
            ::  ~&  [%FINE-MOSTLY-TRIVIAL ALI=<ALI> BOB=<BOB>]
            DONE:HE
          ?.  (~(HAS IN (REACHABLE-TAKOS R.ALI.DAT)) R.BOB.DAT)
            ::  ~&  [%FINE-NOT-SO-TRIVIAL ALI=<ALI> BOB=<BOB>]
            (ERROR:HE %BAD-FINE-MERGE ~)
          ::  ~&  [%FINE-LETS-GO ALI=<ALI> BOB=<BOB>]
          =.  NEW.DAT  ALI.DAT
          =.  ERG.DAT
            %-  MALT  ^-  (LIST {PATH ?})
            %+  MURN  ~(TAP BY (~(UNI BY Q.BOB.DAT) Q.ALI.DAT))
            |=  {PAX/PATH LOB/LOBE}
            ^-  (UNIT {PATH ?})
            =+  A=(~(GET BY Q.ALI.DAT) PAX)
            =+  B=(~(GET BY Q.BOB.DAT) PAX)
            ?:  =(A B)
              ~
            `[PAX !=(~ A)]
          CHECKOUT
        ::
        ::  IF THIS IS A %MEET, %MATE, OR %MELD MERGE, WE MAY NEED TO FETCH
        ::  MORE DATA.  IF THIS MERGE IS EITHER TRIVIAL OR A FAST-FORWARD, WE
        ::  SHORT-CIRCUIT TO EITHER ++DONE OR THE %FINE CASE.
        ::
        ::  OTHERWISE, WE FIND THE BEST COMMON ANCESTOR(S) WITH
        ::  ++FIND-MERGE-POINTS.  IF THERE'S NO COMMON ANCESTOR, WE ERROR OUT.
        ::  ADDITIONALLY, IF THERE'S MORE THAN ONE COMMON ANCESTOR (I.E. THIS
        ::  IS A CRISS-CROSS MERGE), WE ERROR OUT.  SOMETHING AKIN TO GIT'S
        ::  RECURSIVE MERGE SHOULD PROBABLY BE USED HERE, BUT IT ISN'T.
        ::
        ::  ONCE WE HAVE OUR SINGLE BEST COMMON ANCESTOR (MERGE BASE), WE STORE
        ::  IT IN BAS.DAT.  IF THIS IS A %MATE OR %MELD MERGE, WE NEED TO DIFF
        ::  ALI'S COMMIT AGAINST THE MERGE BASE, SO WE PASS CONTROL OVER TO
        ::  ++DIFF-ALI.
        ::
        ::  OTHERWISE (I.E. THIS IS A %MEET MERGE), WE CREATE A LIST OF ALL THE
        ::  CHANGES BETWEEN THE MEGE BASE AND ALI'S COMMIT AND STORE IT IN
        ::  DAL.DAT, AND WE PUT A SIMILAR LIST FOR BOB'S COMMIT IN DOB.DAT.
        ::  THEN WE CREATE BOF, WHICH IS THE A SET OF CHANGES IN BOTH ALI AND
        ::  BOB'S COMMITS.  IF THIS HAS ANY MEMBERS, WE HAVE CONFLICTS, WHICH IS
        ::  AN ERROR IN A %MEET MERGE, SO WE ERROR OUT.
        ::
        ::  OTHERWISE, WE MERGE THE MERGE BASE DATA WITH ALI'S DATA AND BOB'S
        ::  DATA, WHICH PRODUCES THE DATA FOR THE NEW COMMIT, WHICH WE PUT IN
        ::  NEW.DAT.  THEN WE CHECKOUT THE NEW DATA.
        ::
            ?($MEET $MATE $MELD)
          ?:  =(R.ALI.DAT R.BOB.DAT)
            DONE:HE
          ?.  (~(HAS BY HUT.RAN) R.BOB.DAT)
            (ERROR:HE %BAD-BOB-TAKO >R.BOB.DAT< ~)
          ?:  (~(HAS IN (REACHABLE-TAKOS R.BOB.DAT)) R.ALI.DAT)
            DONE:HE
          ?:  (~(HAS IN (REACHABLE-TAKOS R.ALI.DAT)) R.BOB.DAT)
            $(GEM.DAT %FINE)
          =+  R=(FIND-MERGE-POINTS:HE ALI.DAT BOB.DAT)
          ?~  R
            (ERROR:HE %MERGE-NO-MERGE-BASE ~)
          ?.  ?=({* ~ ~} R)
            =+  (LENT ~(TAP IN `(SET YAKI)`R))
            (ERROR:HE %MERGE-CRISS-CROSS >[-]< ~)
          =.  BAS.DAT  N.R
          ?:  ?=(?($MATE $MELD) GEM.DAT)
            DIFF-ALI
          =.  NEW.DAL.DAT
            %-  MOLT
            %+  SKIP  ~(TAP BY Q.ALI.DAT)
            |=  {PAX/PATH LOB/LOBE}
            (~(HAS BY Q.BAS.DAT) PAX)
          =.  CAL.DAL.DAT
            %-  MOLT
            %+  SKIP  ~(TAP BY Q.ALI.DAT)
            |=  {PAX/PATH LOB/LOBE}
            =+  (~(GET BY Q.BAS.DAT) PAX)
            |(=(~ -) =([~ LOB] -))
          =.  CAN.DAL.DAT
            ~
          =.  OLD.DAL.DAT
            %-  MALT  ^-  (LIST {PATH ~})
            %+  MURN  ~(TAP BY Q.BAS.DAT)
            |=  {PAX/PATH LOB/LOBE}
            ^-  (UNIT (PAIR PATH ~))
            ?.  =(~ (~(GET BY Q.ALI.DAT) PAX))
              ~
            `[PAX ~]
          =.  NEW.DOB.DAT
            %-  MOLT
            %+  SKIP  ~(TAP BY Q.BOB.DAT)
            |=  {PAX/PATH LOB/LOBE}
            (~(HAS BY Q.BAS.DAT) PAX)
          =.  CAL.DOB.DAT
            %-  MOLT
            %+  SKIP  ~(TAP BY Q.BOB.DAT)
            |=  {PAX/PATH LOB/LOBE}
            =+  (~(GET BY Q.BAS.DAT) PAX)
            |(=(~ -) =([~ LOB] -))
          =.  CAN.DOB.DAT
            ~
          =.  OLD.DOB.DAT
            %-  MALT  ^-  (LIST {PATH ~})
            %+  MURN  ~(TAP BY Q.BAS.DAT)
            |=  {PAX/PATH LOB/LOBE}
            ^-  (UNIT (PAIR PATH ~))
            ?.  =(~ (~(GET BY Q.BOB.DAT) PAX))
              ~
            `[PAX ~]
          =+  ^=  BOF
              %-  %~  INT  BY
                  %-  ~(UNI BY `(MAP PATH *)`NEW.DAL.DAT)
                  %-  ~(UNI BY `(MAP PATH *)`CAL.DAL.DAT)
                  %-  ~(UNI BY `(MAP PATH *)`CAN.DAL.DAT)
                  `(MAP PATH *)`OLD.DAL.DAT
              %-  ~(UNI BY `(MAP PATH *)`NEW.DOB.DAT)
              %-  ~(UNI BY `(MAP PATH *)`CAL.DOB.DAT)
              %-  ~(UNI BY `(MAP PATH *)`CAN.DOB.DAT)
              `(MAP PATH *)`OLD.DOB.DAT
          ?^  BOF
            (ERROR:HE %MEET-CONFLICT >(~(RUN BY `(MAP PATH *)`BOF) ,~)< ~)
          =+  ^-  OLD/(MAP PATH LOBE)
              %+  ROLL  ~(TAP BY (~(UNI BY OLD.DAL.DAT) OLD.DOB.DAT))
              =<  .(OLD Q.BAS.DAT)
              |=  {{PAX/PATH ~} OLD/(MAP PATH LOBE)}
              (~(DEL BY OLD) PAX)
          =+  ^=  HAT
              %-  ~(UNI BY OLD)
              %-  ~(UNI BY NEW.DAL.DAT)
              %-  ~(UNI BY NEW.DOB.DAT)
              %-  ~(UNI BY CAL.DAL.DAT)
              CAL.DOB.DAT
          =+  ^-  DEL/(MAP PATH ?)
              (~(RUN BY (~(UNI BY OLD.DAL.DAT) OLD.DOB.DAT)) |=(~ %|))
          =.  NEW.DAT
            (MAKE-YAKI [R.ALI.DAT R.BOB.DAT ~] HAT NOW)
          =.  HUT.RAN  (~(PUT BY HUT.RAN) R.NEW.DAT NEW.DAT)
          =.  ERG.DAT  %-  ~(UNI BY DEL)
                       ^-  (MAP PATH ?)
                       %.  |=(LOBE %&)
                       ~(RUN BY (~(UNI BY NEW.DAL.DAT) CAL.DAL.DAT))
          CHECKOUT
        ==
      ::
      ::  COMMON CODE FOR ++DIFF-ALI AND ++DIFF-BOB.
      ::
      ::  DIFFS A COMMIT AGAINST A THE MERGEBASE.  RESULT COMES BACK IN EITHER
      ::  ++DIFFED-ALI OR ++DIFFED-ALI.
      ::
      ++  DIFF-BAS
        |=  {NAM/TERM YAK/YAKI OTH/(TREL SHIP DESK CASE) YUK/YAKI}
        ^+  +>
        %-  EMIT
        ^-  MOVE
        :*  HEN  %PASS
            =+  (CAT 3 %DIFF- NAM)
            [%MERGE (SCOT %P P.BOB) Q.BOB (SCOT %P P.ALI) Q.ALI - ~]
            %F  %BUILD  LIVE=%.N  %PIN
            (CASE-TO-DATE:((DE OUR NOW HEN RUF) P.OTH Q.OTH) R.OTH)
            %LIST
            ^-  (LIST SCHEMATIC:FORD)
            %+  MURN  ~(TAP BY Q.BAS.DAT)
            |=  {PAX/PATH LOB/LOBE}
            ^-  (UNIT SCHEMATIC:FORD)
            =+  A=(~(GET BY Q.YAK) PAX)
            ?~  A
              ~
            ?:  =(LOB U.A)
              ~
            =+  (~(GET BY Q.YUK) PAX)
            ?~  -
              ~
            ?:  =(U.A U.-)
              ~
            :-  ~
            =/  DISC  [P.OTH Q.OTH]
            :-  [%$ %PATH !>(PAX)]
            :^  %DIFF  [OUR %HOME]
              (LOBE-TO-SCHEMATIC DISC PAX LOB)
            (LOBE-TO-SCHEMATIC DISC PAX U.A)
        ==
      ::
      ::  DIFF ALI'S COMMIT AGAINST THE MERGEBASE.
      ::
      ++  DIFF-ALI
        ^+  .
        (DIFF-BAS(WAT.DAT %DIFF-ALI) %ALI ALI.DAT [P.ALI Q.ALI CAS.DAT] BOB.DAT)
      ::
      ::  STORE THE DIFF OF ALI'S COMMIT VERSUS THE MERGEBASE IN DAL.DAT AND
      ::  CALL ++DIFF-BOB.
      ::
      ++  DIFFED-ALI
        |=  RES/MADE-RESULT:FORD
        ^+  +>
        =+  TAY=(MADE-RESULT-TO-CAGES-OR-ERROR RES)
        ?:  ?=(%| -.TAY)
          (ERROR:HE %DIFF-ALI-BAD-MADE LEAF+"MERGE DIFF ALI FAILED" P.TAY)
        =+  CAN=(CAGES-TO-MAP P.TAY)
        ?:  ?=(%| -.CAN)
          (ERROR:HE %DIFF-ALI P.CAN)
        ?:  ?=(%| -.GON.DAT)
          +>.$
        =.  NEW.DAL.DAT
          %-  MOLT
          %+  SKIP  ~(TAP BY Q.ALI.DAT)
          |=  {PAX/PATH LOB/LOBE}
          (~(HAS BY Q.BAS.DAT) PAX)
        =.  CAL.DAL.DAT
          %-  MOLT  ^-  (LIST (PAIR PATH LOBE))
          %+  MURN  ~(TAP BY Q.BAS.DAT)
          |=  {PAX/PATH LOB/LOBE}
          ^-  (UNIT (PAIR PATH LOBE))
          =+  A=(~(GET BY Q.ALI.DAT) PAX)
          =+  B=(~(GET BY Q.BOB.DAT) PAX)
          ?.  ?&  ?=(^ A)
                  !=([~ LOB] A)
                  =([~ LOB] B)
              ==
            ~
          `[PAX +.A]
        =.  CAN.DAL.DAT  P.CAN
        =.  OLD.DAL.DAT
          %-  MALT  ^-  (LIST {PATH ~})
          %+  MURN  ~(TAP BY Q.BAS.DAT)
          |=  {PAX/PATH LOB/LOBE}
          ?.  =(~ (~(GET BY Q.ALI.DAT) PAX))
            ~
          (SOME PAX ~)
        DIFF-BOB
      ::
      ::  DIFF BOB'S COMMIT AGAINST THE MERGEBASE.
      ::
      ++  DIFF-BOB
        ^+  .
        (DIFF-BAS(WAT.DAT %DIFF-BOB) %BOB BOB.DAT [P.BOB Q.BOB DA+NOW] ALI.DAT)
      ::
      ::  STORE THE DIFF OF BOB'S COMMIT VERSUS THE MERGEBASE IN DOB.DAT AND
      ::  CALL ++MERGE.
      ::
      ++  DIFFED-BOB
        |=  RES/MADE-RESULT:FORD
        ^+  +>
        =+  TAY=(MADE-RESULT-TO-CAGES-OR-ERROR RES)
        ?:  ?=(%| -.TAY)
          (ERROR:HE %DIFF-BOB-BAD-MADE LEAF+"MERGE DIFF BOB FAILED" P.TAY)
        =+  CAN=(CAGES-TO-MAP P.TAY)
        ?:  ?=(%| -.CAN)
          (ERROR:HE %DIFF-BOB P.CAN)
        ?:  ?=(%| -.GON.DAT)
          +>.$
        =.  NEW.DOB.DAT
          %-  MOLT
          %+  SKIP  ~(TAP BY Q.BOB.DAT)
          |=  {PAX/PATH LOB/LOBE}
          (~(HAS BY Q.BAS.DAT) PAX)
        =.  CAL.DOB.DAT
          %-  MOLT  ^-  (LIST (PAIR PATH LOBE))
          %+  MURN  ~(TAP BY Q.BAS.DAT)
          |=  {PAX/PATH LOB/LOBE}
          ^-  (UNIT (PAIR PATH LOBE))
          =+  A=(~(GET BY Q.ALI.DAT) PAX)
          =+  B=(~(GET BY Q.BOB.DAT) PAX)
          ?.  ?&  ?=(^ B)
                  !=([~ LOB] B)
                  =([~ LOB] A)
              ==
            ~
          `[PAX +.B]
        =.  CAN.DOB.DAT  P.CAN
        =.  OLD.DOB.DAT
          %-  MALT  ^-  (LIST {PATH ~})
          %+  MURN  ~(TAP BY Q.BAS.DAT)
          |=  {PAX/PATH LOB/LOBE}
          ?.  =(~ (~(GET BY Q.BOB.DAT) PAX))
            ~
          (SOME PAX ~)
        MERGE
      ::
      ::  MERGE THE CONFLICTING DIFFS IN CAN.DAT.DAT AND CAN.DOB.DAT.
      ::
      ::  RESULT IS HANDLED IN ++MERGED.
      ::
      ++  MERGE
        ^+  .
        |-  ^+  +.$
        ?+    GEM.DAT  ~|  [%MERGE-WEIRD-GEM GEM.DAT]  !!
            ?($MATE $MELD)
          %-  EMIT(WAT.DAT %MERGE)
          :*  HEN  %PASS
              [%MERGE (SCOT %P P.BOB) Q.BOB (SCOT %P P.ALI) Q.ALI %MERGE ~]
              %F  %BUILD  LIVE=%.N  %LIST
              ^-  (LIST SCHEMATIC:FORD)
              %+  TURN  ~(TAP BY (~(INT BY CAN.DAL.DAT) CAN.DOB.DAT))
              |=  {PAX/PATH *}
              ^-  SCHEMATIC:FORD
              =+  CAL=(~(GOT BY CAN.DAL.DAT) PAX)
              =+  COB=(~(GOT BY CAN.DOB.DAT) PAX)
              =+  ^=  HER
                  =+  (SLAG (DEC (LENT PAX)) PAX)
                  ?~(- %$ I.-)
              :-  [%$ %PATH !>(PAX)]
              [%JOIN [P.BOB Q.BOB] HER [%$ CAL] [%$ COB]]
          ==
        ==
      ::
      ::  PUT MERGED CHANGES IN BOF.DAT AND CALL ++BUILD.
      ::
      ++  MERGED
        |=  RES/MADE-RESULT:FORD
        =+  TAY=(MADE-RESULT-TO-CAGES-OR-ERROR RES)
        ?:  ?=(%| -.TAY)
          (ERROR:HE %MERGE-BAD-MADE LEAF+"MERGING FAILED" P.TAY)
        =+  CAN=(CAGES-TO-MAP P.TAY)
        ?:  ?=(%| -.CAN)
          (ERROR:HE %MERGE P.CAN)
        =+  BOF=(~(RUN BY P.CAN) (FLIT |=({A/MARK ^} !?=($NULL A))))
        ?:  ?=(%| -.GON.DAT)
          +>.$
        =.  BOF.DAT  BOF
        BUILD
      ::
      ::  APPLY THE PATCHES IN BOF.DAT TO GET THE NEW MERGED CONTENT.
      ::
      ::  RESULT IS HANDLED IN ++BUILT
      ::
      ++  BUILD
        ^+  .
        %-  EMIT(WAT.DAT %BUILD)
        :*  HEN  %PASS
            [%MERGE (SCOT %P P.BOB) Q.BOB (SCOT %P P.ALI) Q.ALI %BUILD ~]
            %F  %BUILD  LIVE=%.N  %LIST
            ^-  (LIST SCHEMATIC:FORD)
            %+  MURN  ~(TAP BY BOF.DAT)
            |=  {PAX/PATH CAY/(UNIT CAGE)}
            ^-  (UNIT SCHEMATIC:FORD)
            ?~  CAY
              ~
            :-  ~
            :-  [%$ %PATH !>(PAX)]
            =+  (~(GET BY Q.BAS.DAT) PAX)
            ?~  -
              ~|  %MATE-STRANGE-DIFF-NO-BASE
              !!
            [%PACT [P.BOB Q.BOB] (LOBE-TO-SCHEMATIC [P.BOB Q.BOB] PAX U.-) [%$ U.CAY]]
        ==
      ::
      ::  CREATE NEW COMMIT.
      ::
      ::  GATHER ALL THE CHANGES BETWEEN ALI'S AND BOB'S COMMITS AND THE
      ::  MERGEBASE.  THIS IS SIMILAR TO THE %MEET OF ++FETCHED-ALI, EXCEPT
      ::  WHERE THEY TOUCH THE SAME FILE, WE USE THE MERGED VERSIONS WE CREATED
      ::  EARLIER (BOP.DAT).
      ::
      ::  SUM ALL THE CHANGES INTO A NEW COMMIT (NEW.DAT), AND CHECKOUT.
      ::
      ++  BUILT
        |=  RES/MADE-RESULT:FORD
        ^+  +>
        =+  TAY=(MADE-RESULT-TO-CAGES-OR-ERROR RES)
        ?:  ?=(%| -.TAY)
          (ERROR:HE %BUILD-BAD-MADE LEAF+"DELTA BUILDING FAILED" P.TAY)
        =+  BOP=(CAGES-TO-MAP P.TAY)
        ?:  ?=(%| -.BOP)
          (ERROR:HE %BUILT P.BOP)
        ?:  ?=(%| -.GON.DAT)
          +>.$
        =.  BOP.DAT  P.BOP
        =+  ^-  CON/(MAP PATH *)                        ::  2-CHANGE CONFLICT
            %-  MOLT
            %+  SKIM  ~(TAP BY BOF.DAT)
            |=({PAX/PATH CAY/(UNIT CAGE)} ?=(~ CAY))
        =+  ^-  CAS/(MAP PATH LOBE)                     ::  CONFLICT BASE
            %-  ~(URN BY CON)
            |=  {PAX/PATH *}
            (~(GOT BY Q.BAS.DAT) PAX)
        =.  CON                                         ::  CHANGE+DEL CONFLICT
          %-  ~(UNI BY CON)
          %-  MALT  ^-  (LIST {PATH *})
          %+  SKIM  ~(TAP BY OLD.DAL.DAT)
          |=  {PAX/PATH ~}
          ?:  (~(HAS BY NEW.DOB.DAT) PAX)
            ~|  %STRANGE-ADD-AND-DEL
            !!
          (~(HAS BY CAN.DOB.DAT) PAX)
        =.  CON                                         ::  CHANGE+DEL CONFLICT
          %-  ~(UNI BY CON)
          %-  MALT  ^-  (LIST {PATH *})
          %+  SKIM  ~(TAP BY OLD.DOB.DAT)
          |=  {PAX/PATH ~}
          ?:  (~(HAS BY NEW.DAL.DAT) PAX)
            ~|  %STRANGE-DEL-AND-ADD
            !!
          (~(HAS BY CAN.DAL.DAT) PAX)
        =.  CON                                         ::  ADD+ADD CONFLICT
          %-  ~(UNI BY CON)
          %-  MALT  ^-  (LIST {PATH *})
          %+  SKIP  ~(TAP BY (~(INT BY NEW.DAL.DAT) NEW.DOB.DAT))
          |=  {PAX/PATH *}
          =((~(GOT BY NEW.DAL.DAT) PAX) (~(GOT BY NEW.DOB.DAT) PAX))
        ?:  &(?=($MATE GEM.DAT) ?=(^ CON))
          =+  (TURN ~(TAP BY `(MAP PATH *)`CON) |=({PATH *} >[+<-]<))
          (ERROR:HE %MATE-CONFLICT -)
        =+  ^-  OLD/(MAP PATH LOBE)                     ::  OLDIES BUT GOODIES
            %+  ROLL  ~(TAP BY (~(UNI BY OLD.DAL.DAT) OLD.DOB.DAT))
            =<  .(OLD Q.BAS.DAT)
            |=  {{PAX/PATH ~} OLD/(MAP PATH LOBE)}
            (~(DEL BY OLD) PAX)
        =+  ^-  CAN/(MAP PATH CAGE)                     ::  CONTENT CHANGES
            %-  MOLT
            ^-  (LIST (PAIR PATH CAGE))
            %+  MURN  ~(TAP BY BOF.DAT)
            |=  {PAX/PATH CAY/(UNIT CAGE)}
            ^-  (UNIT (PAIR PATH CAGE))
            ?~  CAY
              ~
            `[PAX U.CAY]
        =^  HOT  LAT.RAN                                ::  NEW CONTENT
          ^-  {(MAP PATH LOBE) (MAP LOBE BLOB)}
          %+  ROLL  ~(TAP BY CAN)
          =<  .(LAT LAT.RAN)
          |=  {{PAX/PATH CAY/CAGE} HAT/(MAP PATH LOBE) LAT/(MAP LOBE BLOB)}
          =+  ^=  BOL
              =+  (~(GET BY Q.BAS.DAT) PAX)
              ?~  -
                ~|  %MATE-STRANGE-DIFF-NO-BASE
                !!
              %^    MAKE-DELTA-BLOB
                  (PAGE-TO-LOBE [P Q.Q]:(~(GOT BY BOP.DAT) PAX))
                [(LOBE-TO-MARK U.-) U.-]
              [P Q.Q]:CAY
          [(~(PUT BY HAT) PAX P.BOL) (~(PUT BY LAT) P.BOL BOL)]
        ::  ~&  OLD=(~(RUN BY OLD) MUG)
        ::  ~&  NEWDAL=(~(RUN BY NEW.DAL.DAT) MUG)
        ::  ~&  NEWDOB=(~(RUN BY NEW.DOB.DAT) MUG)
        ::  ~&  CALDAL=(~(RUN BY CAL.DAL.DAT) MUG)
        ::  ~&  CALDOB=(~(RUN BY CAL.DOB.DAT) MUG)
        ::  ~&  HOT=(~(RUN BY HOT) MUG)
        ::  ~&  CAS=(~(RUN BY CAS) MUG)
        =+  ^-  HAT/(MAP PATH LOBE)                     ::  ALL THE CONTENT
          %-  ~(UNI BY OLD)
          %-  ~(UNI BY NEW.DAL.DAT)
          %-  ~(UNI BY NEW.DOB.DAT)
          %-  ~(UNI BY CAL.DAL.DAT)
          %-  ~(UNI BY CAL.DOB.DAT)
          %-  ~(UNI BY HOT)
          CAS
        ::  ~&  >  HAT=(~(RUN BY HAT) MUG)
        =+  ^-  DEL/(MAP PATH ?)
            (~(RUN BY (~(UNI BY OLD.DAL.DAT) OLD.DOB.DAT)) |=(~ %|))
        =.  GON.DAT  [%& (SILT (TURN ~(TAP BY CON) HEAD))]
        =.  NEW.DAT
          (MAKE-YAKI [R.ALI.DAT R.BOB.DAT ~] HAT NOW)
        =.  HUT.RAN  (~(PUT BY HUT.RAN) R.NEW.DAT NEW.DAT)
        =.  ERG.DAT  %-  ~(UNI BY DEL)
                     ^-  (MAP PATH ?)
                     %.  |=(LOBE %&)
                     %~  RUN  BY
                     %-  ~(UNI BY NEW.DAL.DAT)
                     %-  ~(UNI BY CAL.DAL.DAT)
                     %-  ~(UNI BY CAS)
                     HOT
        CHECKOUT
      ::
      ::  CONVERT NEW COMMIT INTO ACTUAL DATA (I.E. BLOBS RATHER THAN LOBES).
      ::
      ::  RESULT IS HANDLED IN ++CHECKED-OUT.
      ::
      ++  CHECKOUT
        ^+  .
        =+  ^-  VAL/BEAK
            ?:  ?=($INIT GEM.DAT)
              [P.ALI Q.ALI CAS.DAT]
            [P.BOB Q.BOB DA+NOW]
        %-  EMIT(WAT.DAT %CHECKOUT)
        :*  HEN  %PASS
            [%MERGE (SCOT %P P.BOB) Q.BOB (SCOT %P P.ALI) Q.ALI %CHECKOUT ~]
            %F  %BUILD  LIVE=%.N  %PIN  (CASE-TO-DATE R.VAL)  %LIST
::            ~  VAL  %TABL
            ^-  (LIST SCHEMATIC:FORD)
            %+  MURN  ~(TAP BY Q.NEW.DAT)
            |=  {PAX/PATH LOB/LOBE}
            ^-  (UNIT SCHEMATIC:FORD)
            ?:  (~(HAS BY BOP.DAT) PAX)
              ~
            `[[%$ %PATH !>(PAX)] (MERGE-LOBE-TO-SCHEMATIC:HE [P Q]:VAL PAX LOB)]
        ==
      ::
      ::  APPLY THE NEW COMMIT TO OUR STATE AND, IF WE NEED TO TELL UNIX ABOUT
      ::  SOME OF THE CHANGES, CALL ++ERGO.
      ::
      ++  CHECKED-OUT
        |=  RES/MADE-RESULT:FORD
        ^+  +>
        =+  TAY=(MADE-RESULT-TO-CAGES-OR-ERROR RES)
        ?:  ?=(%| -.TAY)
          (ERROR:HE %CHECKOUT-BAD-MADE LEAF+"MERGE CHECKOUT FAILED" P.TAY)
        =+  CAN=(CAGES-TO-MAP P.TAY)
        ?:  ?=(%| -.CAN)
          (ERROR:HE %CHECKOUT P.CAN)
        ?:  ?=(%| -.GON.DAT)
          +>.$
        =.  LET.DOM  +(LET.DOM)
        =.  HIT.DOM  (~(PUT BY HIT.DOM) LET.DOM R.NEW.DAT)
        =.  ANK.DAT
          %-  MAP-TO-ANKH:ZE
          %-  ~(RUN BY (~(UNI BY BOP.DAT) P.CAN))
          |=(CAGE [(PAGE-TO-LOBE P Q.Q) +<])
        =.  ANK.DOM  ANK.DAT
        =>  .(..WAKE WAKE)
        ?~  HEZ  DONE:HE
        =+  MUS=(MUST-ERGO (TURN ~(TAP BY ERG.DAT) HEAD))
        ?:  =(~ MUS)  DONE:HE
        ERGO
      ::
      ::  CAST ALL THE CONTENT THAT WE'RE GOING TO TELL UNIX ABOUT TO %MIME.
      ::
      ::  RESULT IS HANDLED IN ++ERGOED.
      ::
      ++  ERGO
        ^+  .
        =+  ^-  SUM/(SET PATH)
            =+  (MUST-ERGO (TURN ~(TAP BY ERG.DAT) HEAD))
            =+  (TURN ~(TAP BY -) (CORL TAIL TAIL))
            %+  ROLL  -
            |=  {PAK/(SET PATH) ACC/(SET PATH)}
            (~(UNI IN ACC) PAK)
        =+  ZEZ=ZE(ANK.DOM ANK.DAT)
        =+  ^-  VAL/BEAK
            ?:  ?=($INIT GEM.DAT)
              [P.ALI Q.ALI CAS.DAT]
            [P.BOB Q.BOB DA+NOW]
        %-  EMIT(WAT.DAT %ERGO)
        :*  HEN  %PASS
            [%MERGE (SCOT %P P.BOB) Q.BOB (SCOT %P P.ALI) Q.ALI %ERGO ~]
            %F  %BUILD  LIVE=%.N  %PIN  (CASE-TO-DATE R.VAL)  %LIST
            ^-  (LIST SCHEMATIC:FORD)
            %+  TURN  ~(TAP IN SUM)
            |=  A/PATH
            ^-  SCHEMATIC:FORD
            :-  [%$ %PATH !>(A)]
            =+  B=(~(GOT BY ERG.DAT) A)
            ?.  B
              [%$ %NULL !>(~)]
            =/  DISC  [P Q]:VAL
            :^  %CAST  [OUR %HOME]  %MIME
            (LOBE-TO-SCHEMATIC:ZEZ DISC A (~(GOT BY Q.NEW.DAT) A))
        ==
      ::
      ::  TELL UNIX ABOUT THE CHANGES MADE BY THE MERGE.
      ::
      ++  ERGOED
        |=  RES/MADE-RESULT:FORD
        ^+  +>
        =+  TAY=(MADE-RESULT-TO-CAGES-OR-ERROR RES)
        ?:  ?=(%| -.TAY)
          (ERROR:HE %ERGO-BAD-MADE LEAF+"MERGE ERGO FAILED" P.TAY)
        =+  =|  NAC/MODE
            |-  ^-  TAN/$^(MODE {P/TERM Q/TANG})
            ?~  P.TAY  NAC
            =*  PAX  P.I.P.TAY
            ?.  ?=($PATH P.PAX)
              [%ERGO >[%EXPECTED-PATH GOT=P.PAX]< ~]
            =*  MIM  Q.I.P.TAY
            =+  MIT=?.(?=($MIME P.MIM) ~ `((HARD MIME) Q.Q.MIM))
            $(P.TAY T.P.TAY, NAC :_(NAC [((HARD PATH) Q.Q.PAX) MIT]))
        ?:  ?=({@ *} TAN)  (ERROR:HE TAN)
        =+  `CAN/(MAP PATH (UNIT MIME))`(MALT TAN)
        ?~  HEZ
          (ERROR:HE %ERGO-NO-HEZ ~)
        ?:  ?=(%| -.GON.DAT)
          +>.$
        =+  MUS=(MUST-ERGO (TURN ~(TAP BY ERG.DAT) HEAD))
        =<  DONE:HE
        %-  EMIL
        %+  TURN  ~(TAP BY MUS)
        |=  {POT/TERM LEN/@UD PAK/(SET PATH)}
        :*  U.HEZ  %GIVE  %ERGO  POT
            %+  TURN  ~(TAP IN PAK)
            |=  PAX/PATH
            [(SLAG LEN PAX) (~(GOT BY CAN) PAX)]
        ==
      ::
      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      ::
      ::  THIS CORE IS A SMALL SET OF HELPER FUNCTIONS TO ASSIST IN MERGING.
      ::
      ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
      ++  HE
        |%
        ::
        ::  ASSERT THAT WE'RE GOIG TO BE RETURNING SOMETHING, AND SET DON TO
        ::  TRUE, SO THAT ++ABET KNOWS WE'RE DONE.
        ::
        ++  DONE
          ^+  ..HE
          ?<  ?=(%| -.GON.DAT)
          ..HE(DON |)
        ::
        ::  CANCEL THE MERGE GRACEFULLY AND PRODUCE AN ERROR.
        ::
        ++  ERROR
          |=  {ERR/TERM TAN/(LIST TANK)}
          ^+  ..HE
          ..HE(DON |, GON.DAT [%| ERR >ALI< >BOB< >CAS.DAT< >GEM.DAT< TAN])
        ::
        ::  CREATE A SCHEMATIC TO TURN A LOBE INTO A BLOB.
        ::
        ::  WE SHORT-CIRCUIT IF WE ALREADY HAVE THE CONTENT SOMEWHERE.
        ::
        ++  MERGE-LOBE-TO-SCHEMATIC
          |=  [DISC=DISC:FORD PAX=PATH LOB=LOBE]
          ^-  SCHEMATIC:FORD
          =+  HAT=Q.ALI.DAT
          =+  HOT=Q.BOB.DAT
          =+  ^=  LAL
              %+  BIFF  ALH
              |=  HAD/DOME
              (~(GET BY Q:(TAKO-TO-YAKI (~(GOT BY HIT.HAD) LET.HAD))) PAX)
          =+  LOL=(~(GET BY HOT) PAX)
          |-  ^-  SCHEMATIC:FORD
          ?:  =([~ LOB] LOL)
            =+  (NEED (NEED (READ-X LET.DOM PAX)))
            ?>  ?=(%& -<)
            [%$ P.-]
          ?:  =([~ LOB] LAL)
            [%$ +:(NEED FIL.ANK:(DESCEND-PATH:(ZU ANK:(NEED ALH)) PAX))]
          =+  BOL=(~(GOT BY LAT.RAN) LOB)
          ?-  -.BOL
            $DIRECT     (PAGE-TO-SCHEMATIC DISC Q.BOL)
            $DELTA      [%PACT [OUR %HOME] $(LOB Q.Q.BOL) (PAGE-TO-SCHEMATIC DISC R.BOL)]
          ==
        ::
        ::  FIND THE MOST RECENT COMMON ANCESTOR(S).
        ::
        ++  FIND-MERGE-POINTS
          |=  {P/YAKI Q/YAKI}                           ::  MAYBE NEED JET
          ^-  (SET YAKI)
          %-  REDUCE-MERGE-POINTS
          =+  R=(REACHABLE-TAKOS R.P)
          |-  ^-  (SET YAKI)
          ?:  (~(HAS IN R) R.Q)  (~(PUT IN *(SET YAKI)) Q)
          %+  ROLL  P.Q
          |=  {T/TAKO S/(SET YAKI)}
          ?:  (~(HAS IN R) T)
            (~(PUT IN S) (TAKO-TO-YAKI T))              ::  FOUND
          (~(UNI IN S) ^$(Q (TAKO-TO-YAKI T)))          ::  TRAVERSE
        ::
        ::  HELPER FOR ++FIND-MERGE-POINTS.
        ::
        ++  REDUCE-MERGE-POINTS
          |=  UNK/(SET YAKI)                            ::  MAYBE NEED JET
          =|  GUD/(SET YAKI)
          =+  ^=  ZAR
              ^-  (MAP TAKO (SET TAKO))
              %+  ROLL  ~(TAP IN UNK)
              |=  {YAK/YAKI QAR/(MAP TAKO (SET TAKO))}
              (~(PUT BY QAR) R.YAK (REACHABLE-TAKOS R.YAK))
          |-
          ^-  (SET YAKI)
          ?~  UNK  GUD
          =+  BUN=(~(DEL IN `(SET YAKI)`UNK) N.UNK)
          ?:  %+  LEVY  ~(TAP BY (~(UNI IN GUD) BUN))
              |=  YAK/YAKI
              !(~(HAS IN (~(GOT BY ZAR) R.YAK)) R.N.UNK)
            $(GUD (~(PUT IN GUD) N.UNK), UNK BUN)
          $(UNK BUN)
        --
      --
    --
  --
--
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::              SECTION 4CA, FILESYSTEM VANE
::
::  THIS IS THE ARVO INTERFACE VANE.  OUR FORMAL STATE IS A `++RAFT`, WHICH
::  HAS FIVE COMPONENTS:
::
::  --  `ROM` IS THE STATE FOR ALL LOCAL DESKS.
::  --  `HOY` IS THE STATE FOR ALL FOREIGN DESKS.
::  --  `RAN` IS THE GLOBAL, HASH-ADDRESSED OBJECT STORE.
::  --  `MON` IS THE SET OF MOUNT POINTS IN UNIX.
::  --  `HEZ` IS THE DUCT TO THE UNIX SYNC.
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
=|                                                    ::  INSTRUMENT STATE
    $:  $1                                            ::  VANE VERSION
        RUF/RAFT                                      ::  REVISION TREE
    ==                                                ::
|=  [OUR=SHIP NOW=@DA ENY=@UVJ SKI=SLEY]              ::  CURRENT INVOCATION
^?                                                    ::  OPAQUE CORE
|%                                                    ::
++  CALL                                              ::  HANDLE REQUEST
  |=  $:  HEN=DUCT
          TYPE=*
          WRAPPED-TASK=(HOBO TASK:ABLE)
      ==
  ::
  =/  REQ=TASK:ABLE
    ?.  ?=(%SOFT -.WRAPPED-TASK)
      WRAPPED-TASK
    ((HARD TASK:ABLE) P.WRAPPED-TASK)
  ::
  ^+  [*(LIST MOVE) ..^$]
  ?-    -.REQ
      $BOAT
    :_  ..^$
    [HEN %GIVE %HILL (TURN ~(TAP BY MON.RUF) HEAD)]~
  ::.
      $CRED
    =.  CEZ.RUF
      ?~  CEW.REQ  (~(DEL BY CEZ.RUF) NOM.REQ)
      (~(PUT BY CEZ.RUF) NOM.REQ CEW.REQ)
    ::  WAKE ALL DESKS, A REQUEST MAY HAVE BEEN AFFECTED.
    =|  MOS/(LIST MOVE)
    =/  DES  ~(TAP IN ~(KEY BY DOS.ROM.RUF))
    |-
    ?~  DES  [[[HEN %GIVE %MACK ~] MOS] ..^^$]
    =/  DEN  ((DE OUR NOW HEN RUF) OUR I.DES)
    =^  MOR  RUF
      =<  ABET:WAKE
      ?:  ?=(^ CEW.REQ)  DEN
      (FORGET-CREW:DEN NOM.REQ)
    $(DES T.DES, MOS (WELD MOS MOR))
  ::
      $CREW
    [[HEN %GIVE %CRUZ CEZ.RUF]~ ..^$]
  ::
      $CROW
    =/  DES  ~(TAP BY DOS.ROM.RUF)
    =|  RUS/(MAP DESK {R/REGS W/REGS})
    |^
      ?~  DES  [[HEN %GIVE %CROZ RUS]~ ..^^$]
      =+  PER=(FILTER-RULES PER.Q.I.DES)
      =+  PEW=(FILTER-RULES PEW.Q.I.DES)
      =?  RUS  |(?=(^ PER) ?=(^ PEW))
        (~(PUT BY RUS) P.I.DES PER PEW)
      $(DES T.DES)
    ::
    ++  FILTER-RULES
      |=  PES/REGS
      ^+  PES
      =-  (~(GAS IN *REGS) -)
      %+  SKIM  ~(TAP BY PES)
      |=  {P/PATH R/RULE}
      (~(HAS IN WHO.R) |+NOM.REQ)
    --
  ::
      $CRUD
    [[[HEN %SLIP %D %FLOG REQ] ~] ..^$]
  ::
      $DROP
    =^  MOS  RUF
      =/  DEN  ((DE OUR NOW HEN RUF) OUR DES.REQ)
      ABET:DROP-ME:DEN
    [MOS ..^$]
  ::
      $INFO
    ::  SECOND WRITE AT :NOW GETS ENQUEUED WITH A TIMER TO BE RUN IN NEXT EVENT
    ::
    ?:  =(NOW TIP.RUF)
      =.  CUE.RUF  (~(PUT TO CUE.RUF) [HEN REQ])
      =/  =MOVE  [HEN %PASS /QUEUED-REQUEST %B %WAIT NOW]
      ::
      [~[MOVE] ..^$]
    ::  SET THE LAST DATE TO NOW SO WE'LL KNOW TO ENQUEUE A SECOND WRITE
    ::
    =.  TIP.RUF  NOW
    ::
    ?:  =(%$ DES.REQ)
      [~ ..^$]
    =^  MOS  RUF
      =/  DEN  ((DE OUR NOW HEN RUF) OUR DES.REQ)
      ABET:(EDIT:DEN NOW DIT.REQ)
    [MOS ..^$]
  ::
      $INIT
    [~ ..^$(HUN.ROM.RUF HEN)]
  ::
      $INTO
    =.  HEZ.RUF  `HEN
    :_  ..^$
    =+  BEM=(~(GET BY MON.RUF) DES.REQ)
    ?:  &(?=(~ BEM) !=(%$ DES.REQ))
      ~|([%BAD-MOUNT-POINT-FROM-UNIX DES.REQ] !!)
    =+  ^-  BEM/BEAM
        ?^  BEM
          U.BEM
        [[OUR %BASE %UD 1] ~]
    =/  DOS  (~(GET BY DOS.ROM.RUF) Q.BEM)
    ?~  DOS
      ~
    ?:  =(0 LET.DOM.U.DOS)
      =+  COS=(MODE-TO-SOBA ~ S.BEM ALL.REQ FIS.REQ)
      =+  ^-  {ONE/(LIST {PATH MISO}) TWO/(LIST {PATH MISO})}
          %+  SKID  COS
          |=  {A/PATH B/MISO}
          ?&  ?=($INS -.B)
              ?=($MIME P.P.B)
              ?=({$HOON ~} (SLAG (DEC (LENT A)) A))
          ==
      :~  [HEN %PASS /ONE %C %INFO Q.BEM %& ONE]
          [HEN %PASS /TWO %C %INFO Q.BEM %& TWO]
      ==
    =+  YAK=(~(GOT BY HUT.RAN.RUF) (~(GOT BY HIT.DOM.U.DOS) LET.DOM.U.DOS))
    =+  COS=(MODE-TO-SOBA Q.YAK (FLOP S.BEM) ALL.REQ FIS.REQ)
    [HEN %PASS /BOTH %C %INFO Q.BEM %& COS]~
  ::
      $MERG                                               ::  DIRECT STATE UP
    ?:  =(%$ DES.REQ)
      [~ ..^$]
    =^  MOS  RUF
      =/  DEN  ((DE OUR NOW HEN RUF) OUR DES.REQ)
      ABET:ABET:(START:(ME:ZE:DEN [HER.REQ DEM.REQ] ~ &) CAS.REQ HOW.REQ)
    [MOS ..^$]
  ::
      $MONT
    =.  HEZ.RUF  ?^(HEZ.RUF HEZ.RUF `[[%$ %SYNC ~] ~])
    =+  POT=(~(GET BY MON.RUF) DES.REQ)
    ?^  POT
      ~&  [%ALREADY-MOUNTED POT]
      [~ ..^$]
    =*  BEM  BEM.REQ
    =.  MON.RUF
      (~(PUT BY MON.RUF) DES.REQ [P.BEM Q.BEM R.BEM] S.BEM)
    =/  DOS  (~(GET BY DOS.ROM.RUF) Q.BEM)
    ?~  DOS
      [~ ..^$]
    =^  MOS  RUF
      =/  DEN  ((DE OUR NOW HEN RUF) P.BEM Q.BEM)
      ABET:(MONT:DEN DES.REQ BEM)
    [MOS ..^$]
  ::
      $DIRK
    ?~  HEZ.RUF
      ~&  %NO-SYNC-DUCT
      [~ ..^$]
    ?.  (~(HAS BY MON.RUF) DES.REQ)
      ~&  [%NOT-MOUNTED DES.REQ]
      [~ ..^$]
    :-  ~[[U.HEZ.RUF %GIVE %DIRK DES.REQ]]
        ..^$
  ::
      $OGRE
    ?~  HEZ.RUF
      ~&  %NO-SYNC-DUCT
      [~ ..^$]
    =*  POT  POT.REQ
    ?@  POT
      ?.  (~(HAS BY MON.RUF) POT)
        ~&  [%NOT-MOUNTED POT]
        [~ ..^$]
      :_  ..^$(MON.RUF (~(DEL BY MON.RUF) POT))
      [U.HEZ.RUF %GIVE %OGRE POT]~
    :_  %_    ..^$
            MON.RUF
          %-  MOLT
          %+  SKIP  ~(TAP BY MON.RUF)
          (CORL (CURY TEST POT) TAIL)
        ==
    %+  TURN
      (SKIM ~(TAP BY MON.RUF) (CORL (CURY TEST POT) TAIL))
    |=  {PON/TERM BEM/BEAM}
    [U.HEZ.RUF %GIVE %OGRE PON]
  ::
      $PERM
    =^  MOS  RUF
      =/  DEN  ((DE OUR NOW HEN RUF) OUR DES.REQ)
      ABET:(PERM:DEN PAX.REQ RIT.REQ)
    [MOS ..^$]
  ::
      $SUNK  [~ ..^$]
  ::
      $VEGA  [~ ..^$]
  ::
      ?($WARP $WERP)
    ::  CAPTURE WHETHER THIS READ IS ON BEHALF OF ANOTHER SHIP
    ::  FOR PERMISSIONS ENFORCEMENT
    ::
    =^  FOR  REQ
      ?:  ?=($WARP -.REQ)
        [~ REQ]
      :-  ?:(=(OUR WHO.REQ) ~ `WHO.REQ)
      [%WARP WER.REQ RIF.REQ]
    ::
    ?>  ?=($WARP -.REQ)
    =*  RIF  RIF.REQ
    =^  MOS  RUF
      =/  DEN  ((DE OUR NOW HEN RUF) WER.REQ P.RIF)
      =<  ABET
      ?~  Q.RIF
        CANCEL-REQUEST:DEN
      (START-REQUEST:DEN FOR U.Q.RIF)
    [MOS ..^$]
  ::
      $WEST
    =*  WER  WER.REQ
    =*  PAX  PAX.REQ
    ?:  ?=({$QUESTION *} PAX)
      =+  RYF=((HARD RIFF) RES.REQ)
      :_  ..^$
      :~  [HEN %GIVE %MACK ~]
          =/  =WIRE
            [(SCOT %P OUR) (SCOT %P WER) T.PAX]
          [HEN %PASS WIRE %C %WERP WER OUR RYF]
      ==
    ?>  ?=({$ANSWER @ @ ~} PAX)
    =+  SYD=(SLAV %TAS I.T.PAX)
    =+  INX=(SLAV %UD I.T.T.PAX)
    =^  MOS  RUF
      =/  DEN  ((DE OUR NOW HEN RUF) WER SYD)
      ABET:(TAKE-FOREIGN-UPDATE:DEN INX ((HARD (UNIT RAND)) RES.REQ))
    [[[HEN %GIVE %MACK ~] MOS] ..^$]
  ::
      $WEGH
    :_  ..^$  :_  ~
    :^  HEN  %GIVE  %MASS
    :+  %CLAY  %|
    :~  DOMESTIC+&+ROM.RUF
        FOREIGN+&+HOY.RUF
        :+  %OBJECT-STORE  %|
        :~  COMMITS+&+HUT.RAN.RUF
            BLOBS+&+LAT.RAN.RUF
        ==
        DOT+&+RUF
    ==
  ==
::
++  LOAD
  =>  |%
      ++  AXLE  $%([%1 RUF=RAFT])
      --
  |=  OLD=AXLE
  ^+  ..^$
  ..^$(RUF RUF.OLD)
::
++  SCRY                                              ::  INSPECT
  |=  {FUR/(UNIT (SET MONK)) REN/@TAS WHY/SHOP SYD/DESK LOT/COIN TYL/PATH}
  ^-  (UNIT (UNIT CAGE))
  ?.  ?=(%& -.WHY)  ~
  =*  HIS  P.WHY
  ::  ~&  SCRY+[REN `PATH`[(SCOT %P HIS) SYD ~(RENT CO LOT) TYL]]
  ::  =-  ~&  %SCRY-DONE  -
  =+  LUK=?.(?=(%$ -.LOT) ~ ((SOFT CASE) P.LOT))
  ?~  LUK  [~ ~]
  ?:  =(%$ REN)
    [~ ~]
  =+  RUN=((SOFT CARE) REN)
  ?~  RUN  [~ ~]
  ::TODO  IF IT EVER GETS FILLED PROPERLY, PASS IN THE FULL FUR.
  =/  FOR/(UNIT SHIP)
    %-  ~(REP IN (FALL FUR ~))
    |=  {M/MONK S/(UNIT SHIP)}
    ?^  S  S
    ?:  ?=(%| -.M)  ~
    ?:  =(P.M HIS)  ~
    `P.M
  =/  DEN  ((DE OUR NOW [/SCRYDUCT ~] RUF) HIS SYD)
  =+  (AVER:DEN FOR U.RUN U.LUK TYL)
  ?~  -               -
  ?~  U.-             -
  ?:  ?=(%& -.U.U.-)  ``P.U.U.-
  ~
::
++  STAY  [%1 RUF]
++  TAKE                                              ::  ACCEPT RESPONSE
  |=  {TEA/WIRE HEN/DUCT HIN/(HYPO SIGN)}
  ^+  [*(LIST MOVE) ..^$]
  ?:  ?=({$MERGE @ @ @ @ @ ~} TEA)
    ?>  ?=(?($WRIT $MADE) +<.Q.HIN)
    =*  SYD  I.T.T.TEA
    =+  HER=(SLAV %P I.T.T.T.TEA)
    =*  SUD  I.T.T.T.T.TEA
    =*  SAT  I.T.T.T.T.T.TEA
    =+  DAT=?-(+<.Q.HIN $WRIT [%& P.Q.HIN], $MADE [%| RESULT.Q.HIN])
    =/  KAN=(UNIT DOME)
        %+  BIND  (~(GET BY DOS.ROM.RUF) SUD)
        |=(A=DOJO DOM.A)
    =^  MOS  RUF
      =/  DEN  ((DE OUR NOW HEN RUF) OUR SYD)
      ABET:ABET:(ROUTE:(ME:ZE:DEN [HER SUD] KAN |) SAT DAT)
    [MOS ..^$]
  ?:  ?=({$BLAB CARE @ @ *} TEA)
    ?>  ?=($MADE +<.Q.HIN)
    ?.  ?=([%COMPLETE %SUCCESS *] RESULT.Q.HIN)
      ~|  %BLAB-FAIL
      ~>  %MEAN.|.((MADE-RESULT-AS-ERROR:FORD RESULT.Q.HIN))
      !!                              ::  INTERPOLATE FORD FAIL INTO STACK TRACE
    :_  ..^$  :_  ~
    :*  HEN  %GIVE  %WRIT  ~
        ^-  {CARE CASE @TAS}
        [I.T.TEA ((HARD CASE) +>:(SLAY I.T.T.TEA)) I.T.T.T.TEA]
    ::
        `PATH`T.T.T.T.TEA
        `CAGE`(RESULT-TO-CAGE:FORD BUILD-RESULT.RESULT.Q.HIN)
    ==
  ?-    -.+.Q.HIN
  ::
      $CRUD
    [[[HEN %SLIP %D %FLOG +.Q.HIN] ~] ..^$]
  ::
      $MADE
    ?~  TEA  !!
    ?+    -.TEA  !!
        $INSERTING
      ?>  ?=({@ @ @ ~} T.TEA)
      =+  SYD=(SLAV %TAS I.T.T.TEA)
      =+  WEN=(SLAV %DA I.T.T.T.TEA)
      =^  MOS  RUF
        =/  DEN  ((DE OUR NOW HEN RUF) OUR SYD)
        ABET:(TAKE-INSERTING:DEN WEN RESULT.Q.HIN)
      [MOS ..^$]
    ::
        $DIFFING
      ?>  ?=({@ @ @ ~} T.TEA)
      =+  SYD=(SLAV %TAS I.T.T.TEA)
      =+  WEN=(SLAV %DA I.T.T.T.TEA)
      =^  MOS  RUF
        =/  DEN  ((DE OUR NOW HEN RUF) OUR SYD)
        ABET:(TAKE-DIFFING:DEN WEN RESULT.Q.HIN)
      [MOS ..^$]
    ::
        $CASTIFYING
      ?>  ?=({@ @ @ ~} T.TEA)
      =+  SYD=(SLAV %TAS I.T.T.TEA)
      =+  WEN=(SLAV %DA I.T.T.T.TEA)
      =^  MOS  RUF
        =/  DEN  ((DE OUR NOW HEN RUF) OUR SYD)
        ABET:(TAKE-CASTIFY:DEN WEN RESULT.Q.HIN)
      [MOS ..^$]
    ::
        $MUTATING
      ?>  ?=({@ @ @ ~} T.TEA)
      =+  SYD=(SLAV %TAS I.T.T.TEA)
      =+  WEN=(SLAV %DA I.T.T.T.TEA)
      =^  MOS  RUF
        =/  DEN  ((DE OUR NOW HEN RUF) OUR SYD)
        ABET:(TAKE-MUTATING:DEN WEN RESULT.Q.HIN)
      [MOS ..^$]
    ::
        $PATCHING
      ?>  ?=({@ @ ~} T.TEA)
      =+  SYD=(SLAV %TAS I.T.T.TEA)
      =^  MOS  RUF
        =/  DEN  ((DE OUR NOW HEN RUF) OUR SYD)
        ABET:(TAKE-PATCH:DEN RESULT.Q.HIN)
      [MOS ..^$]
    ::
        $ERGOING
      ?>  ?=({@ @ ~} T.TEA)
      =+  SYD=(SLAV %TAS I.T.T.TEA)
      =^  MOS  RUF
        =/  DEN  ((DE OUR NOW HEN RUF) OUR SYD)
        ABET:(TAKE-ERGO:DEN RESULT.Q.HIN)
      [MOS ..^$]
    ::
        $FOREIGN-PLOPS
      ?>  ?=({@ @ @ @ ~} T.TEA)
      =+  HER=(SLAV %P I.T.T.TEA)
      =*  SYD  I.T.T.T.TEA
      =+  LEM=(SLAV %DA I.T.T.T.T.TEA)
      =^  MOS  RUF
        =/  DEN  ((DE OUR NOW HEN RUF) HER SYD)
        ABET:(TAKE-FOREIGN-PLOPS:DEN ?~(LEM ~ `LEM) RESULT.Q.HIN)
      [MOS ..^$]
    ::
        $FOREIGN-X
      ?>  ?=({@ @ @ @ @ *} T.TEA)
      =+  HER=(SLAV %P I.T.T.TEA)
      =+  SYD=(SLAV %TAS I.T.T.T.TEA)
      =+  CAR=((HARD CARE) I.T.T.T.T.TEA)
      =+  ^-  CAS/CASE
          =+  (SLAY I.T.T.T.T.T.TEA)
          ?>  ?=({~ %$ CASE} -)
          ->+
      =*  PAX  T.T.T.T.T.T.TEA
      =^  MOS  RUF
        =/  DEN  ((DE OUR NOW HEN RUF) HER SYD)
        ABET:(TAKE-FOREIGN-X:DEN CAR CAS PAX RESULT.Q.HIN)
      [MOS ..^$]
    ==
  ::
      $MERE
    ?:  ?=(%& -.P.+.Q.HIN)
      ~&  'INITIAL MERGE SUCCEEDED'
      [~ ..^$]
    ~>  %SLOG.
        :^  0  %ROSE  [" " "[" "]"]
        :^    LEAF+"INITIAL MERGE FAILED"
            LEAF+"MY MOST SINCERE APOLOGIES"
          >P.P.P.+.Q.HIN<
        Q.P.P.+.Q.HIN
    [~ ..^$]
  ::
      $NOTE  [[HEN %GIVE +.Q.HIN]~ ..^$]
      $WAKE
    =^  QUEUED  CUE.RUF  ~(GET TO CUE.RUF)
    ::
    =/  QUEUED-DUCT=DUCT       -.QUEUED
    =/  QUEUED-TASK=TASK:ABLE  +.QUEUED
    ::
    ~|  [%MISMATCHED-DUCTS %QUEUED QUEUED-DUCT %TIMER HEN]
    ?>  =(HEN QUEUED-DUCT)
    ::
    (CALL HEN [-:!>(*TASK:ABLE) QUEUED-TASK])
    ::  =^  MOS=(LIST MOVE)  UNE
    ::    WAKE:(UN OUR NOW HEN RUF)
    ::  [MOS ..^^$]
  ::
      $WRIT
    ?>  ?=({@ @ *} TEA)
    ~|  I=I.TEA
    ~|  IT=I.T.TEA
    =+  HIM=(SLAV %P I.T.TEA)
    :_  ..^$
    :~  :*  HEN  %PASS  /WRIT-WANT  %A
            %WANT  HIM  [%C %ANSWER T.T.TEA]
            (BIND P.+.Q.HIN RANT-TO-RAND)
        ==
    ==
  ::
      $SEND
    [[[HEN %GIVE +.Q.HIN] ~] ..^$]
  ::
      $WOOT
    [~ ..^$]
    :: ?~  R.Q.HIN  [~ ..^$]
    :: ~&  [%CLAY-LOST P.Q.HIN R.Q.HIN TEA]
    :: [~ ..^$]
  ==
::
++  RANT-TO-RAND
  |=  RANT
  ^-  RAND
  [P Q [P Q.Q]:R]
::
++  MODE-TO-SOBA
  |=  {HAT/(MAP PATH LOBE) PAX/PATH ALL/? MOD/MODE}
  ^-  SOBA
  %+  WELD
    ^-  (LIST (PAIR PATH MISO))
    ?.  ALL
      ~
    =+  MAD=(MALT MOD)
    =+  LEN=(LENT PAX)
    =+  ^-  DESCENDANTS/(LIST PATH)
        %+  TURN
          %+  SKIM  ~(TAP BY HAT)
          |=  {PAF/PATH LOB/LOBE}
          =(PAX (SCAG LEN PAF))
        |=  {PAF/PATH LOB/LOBE}
        (SLAG LEN PAF)
    %+  MURN
      DESCENDANTS
    |=  PAT/PATH
    ^-  (UNIT (PAIR PATH {$DEL ~}))
    ?:  (~(HAS BY MAD) PAT)
      ~
    `[(WELD PAX PAT) %DEL ~]
  ^-  (LIST (PAIR PATH MISO))
  %+  MURN  MOD
  |=  {PAT/PATH MIM/(UNIT MIME)}
  ^-  (UNIT (PAIR PATH MISO))
  =+  PAF=(WELD PAX PAT)
  ?~  MIM
    =+  (~(GET BY HAT) PAF)
    ?~  -
      ~&  [%DELETING-ALREADY-GONE PAX PAT]
      ~
    `[PAF %DEL ~]
  =+  (~(GET BY HAT) PAF)
  ?~  -
    `[PAF %INS %MIME -:!>(*MIME) U.MIM]
  `[PAF %MUT %MIME -:!>(*MIME) U.MIM]
--
