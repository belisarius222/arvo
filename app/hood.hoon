::                                                      ::  ::
::::  /HOON/HOOD/APP                                    ::  ::
  ::                                                    ::  ::
/?    310                                               ::  ZUSE VERSION
/+  SOLE,                                               ::  LIBRARIES
    ::  XX THESE SHOULD REALLY BE SEPARATE APPS, AS
    ::     NONE OF THEM INTERACT WITH EACH OTHER IN
    ::     ANY FASHION; HOWEVER, TO REDUCE BOOT-TIME
    ::     COMPLEXITY AND WORK AROUND THE CURRENT
    ::     NON-FUNCTIONALITY OF END-TO-END ACKNOWLEDGMENTS,
    ::     THEY HAVE BEEN BUNDLED INTO :HOOD
    ::
    ::  |COMMAND HANDLERS
    HOOD-HELM, HOOD-KILN, HOOD-DRUM, HOOD-WRITE
::                                                      ::  ::
::::                                                    ::  ::
  ::                                                    ::  ::
|%
++  HOOD-MODULE
  ::  EACH HOOD MODULE FOLLOWS THIS GENERAL SHAPE
  =>  |%
      +$  PART  [%MODULE %0 PITH]
      +$  PITH  ~
      ::
      +$  MOVE  [BONE CARD]
      +$  CARD  $%  [%FAKE ~]
                ==
      --
  |=  [BOWL:GALL OWN=PART]
  |_  MOZ=(LIST MOVE)
  ++  ABET  [(FLOP MOZ) OWN]
  --
--
::                                                      ::  ::
::::                                                    ::  ::  STATE HANDLING
  ::                                                    ::  ::
!:
=>  |%                                                  ::
    ++  HOOD-OLD                                        ::  UNIFIED OLD-STATE
      {?($0 $1) LAC/(MAP @TAS HOOD-PART-OLD)}           ::
    ++  HOOD-1                                          ::  UNIFIED STATE
      {$1 LAC/(MAP @TAS HOOD-PART)}                     ::
    ++  HOOD-GOOD                                       ::  EXTRACT SPECIFIC
      =+  HED=$:HOOD-HEAD
      |@  ++  $
            |:  PAW=$:HOOD-PART
            ?-  HED
              $DRUM  ?>(?=($DRUM -.PAW) `PART:HOOD-DRUM`PAW)
              $HELM  ?>(?=($HELM -.PAW) `PART:HOOD-HELM`PAW)
              $KILN  ?>(?=($KILN -.PAW) `PART:HOOD-KILN`PAW)
              $WRITE  ?>(?=($WRITE -.PAW) `PART:HOOD-WRITE`PAW)
            ==
      --
    ++  HOOD-HEAD  _-:$:HOOD-PART                       ::  INITIALIZE STATE
    ++  HOOD-MAKE                                       ::
      =+  $:{OUR/@P HED/HOOD-HEAD}                      ::
      |@  ++  $
            ?-  HED
              $DRUM  (MAKE:HOOD-DRUM OUR)
              $HELM  *PART:HOOD-HELM
              $KILN  *PART:HOOD-KILN
              $WRITE  *PART:HOOD-WRITE
            ==
      --
    ++  HOOD-PART-OLD  HOOD-PART                        ::  OLD STATE FOR ++PREP
    ++  HOOD-PORT                                       ::  STATE TRANSITION
      |:  PAW=$:HOOD-PART-OLD  ^-  HOOD-PART            ::
      PAW                                               ::
    ::                                                  ::
    ++  HOOD-PART                                       ::  CURRENT MODULE STATE
      $%  {$DRUM $2 PITH-2:HOOD-DRUM}                   ::
          {$HELM $0 PITH:HOOD-HELM}                     ::
          {$KILN $0 PITH:HOOD-KILN}                     ::
          {$WRITE $0 PITH:HOOD-WRITE}                   ::
      ==                                                ::
    --                                                  ::
::                                                      ::  ::
::::                                                    ::  ::  APP PROPER
  ::                                                    ::  ::
=,  GALL
|_  $:  HID/BOWL                                        ::  GALL ENVIRONMENT
        HOOD-1                                          ::  MODULE STATES
    ==                                                  ::
++  ABLE                                                ::  FIND+MAKE PART
  =+  HED=$:HOOD-HEAD
  |@  ++  $
        =+  REP=(~(GET BY LAC) HED)
        =+  PAR=?^(REP U.REP `HOOD-PART`(HOOD-MAKE OUR.HID HED))
        ((HOOD-GOOD HED) PAR)
  --
::
++  ABLY                                                ::  SAVE PART
  =+  $:{(LIST) HOOD-PART}
  |@  ++  $
        [(FLOP +<-) %_(+> LAC (~(PUT BY LAC) +<+< +<+))]
  --
::                                                      ::  ::
::::                                                    ::  ::  GENERIC HANDLING
  ::                                                    ::  ::
++  PREP
  |=  OLD/(UNIT HOOD-OLD)  ^-  (QUIP _!! _+>)
  :-  ~
  ?~  OLD  +>
  +>(LAC (~(RUN BY LAC.U.OLD) HOOD-PORT))
::
++  POKE-HOOD-LOAD                                      ::  RECOVER LOST BRAIN
  |=  DAT/HOOD-PART
  ?>  =(OUR.HID SRC.HID)
  ~&  LOADED+-.DAT
  [~ %_(+> LAC (~(PUT BY LAC) -.DAT DAT))]
::
::
++  FROM-MODULE                                         ::  CREATE WRAPPER
  |*  _[IDENTITY=%MODULE START=..$ FINISH=_ABET]:(HOOD-MODULE)
  =-  [WRAP=- *START]                 ::  USAGE (WRAP HANDLE-ARM):FROM-FOO
  |*  HANDLE/_FINISH
  |=  A=_+<.HANDLE
  =.  +>.HANDLE  (START HID (ABLE IDENTITY))
  (ABLY (HANDLE A))
::
::  PER-MODULE INTERFACE WRAPPERS
++  FROM-DRUM  (FROM-MODULE %DRUM [..$ _SE-ABET]:(HOOD-DRUM))
++  FROM-HELM  (FROM-MODULE %HELM [..$ _ABET]:(HOOD-HELM))
++  FROM-KILN  (FROM-MODULE %KILN [..$ _ABET]:(HOOD-KILN))
++  FROM-WRITE  (FROM-MODULE %WRITE [..$ _ABET]:(HOOD-WRITE))
::
::                                                      ::  ::
::::                                                    ::  ::  SWITCHBOARD
  ::                                                    ::  ::
++  COUP-DRUM-PHAT            (WRAP TAKE-COUP-PHAT):FROM-DRUM
++  COUP-HELM-HI              (WRAP COUP-HI):FROM-HELM
++  COUP-HELM-ASK             (WRAP COUP-ASK):FROM-HELM
++  COUP-KILN-FANCY           (WRAP TAKE-COUP-FANCY):FROM-KILN
++  COUP-KILN-RELOAD          (WRAP TAKE-COUP-RELOAD):FROM-KILN
++  COUP-KILN-SPAM            (WRAP TAKE-COUP-SPAM):FROM-KILN
++  DIFF-SOLE-EFFECT-DRUM-PHAT  (WRAP DIFF-SOLE-EFFECT-PHAT):FROM-DRUM
++  INIT-HELM                 |=({WAY/WIRE *} [~ +>])
++  MACK-KILN                 (WRAP MACK):FROM-KILN
++  MADE-WRITE                (WRAP MADE):FROM-WRITE
++  MADE-KILN                 (WRAP TAKE-MADE):FROM-KILN
++  MERE-KILN                 (WRAP TAKE-MERE):FROM-KILN
++  MERE-KILN-SYNC            (WRAP TAKE-MERE-SYNC):FROM-KILN
++  WAKE-KILN-OVERLOAD        (WRAP TAKE-WAKE-OVERLOAD):FROM-KILN
++  WAKE-HELM-AUTOMASS        (WRAP TAKE-WAKE-AUTOMASS):FROM-HELM
++  ONTO-DRUM                 (WRAP TAKE-ONTO):FROM-DRUM
++  PEER-DRUM                 (WRAP PEER):FROM-DRUM
++  POKE-ATOM                 (WRAP POKE-ATOM):FROM-HELM
++  POKE-DILL-BELT            (WRAP POKE-DILL-BELT):FROM-DRUM
++  POKE-DILL-BLIT            (WRAP POKE-DILL-BLIT):FROM-DRUM
++  POKE-DRUM-PUT             (WRAP POKE-PUT):FROM-DRUM
++  POKE-DRUM-LINK            (WRAP POKE-LINK):FROM-DRUM
++  POKE-DRUM-UNLINK          (WRAP POKE-UNLINK):FROM-DRUM
++  POKE-DRUM-EXIT            (WRAP POKE-EXIT):FROM-DRUM
++  POKE-DRUM-START           (WRAP POKE-START):FROM-DRUM
++  POKE-HELM-HI              (WRAP POKE-HI):FROM-HELM
::++  POKE-HELM-INVITE          (WRAP POKE-INVITE):FROM-HELM
++  POKE-HELM-MASS            (WRAP POKE-MASS):FROM-HELM
++  POKE-HELM-RELOAD          (WRAP POKE-RELOAD):FROM-HELM
++  POKE-HELM-RELOAD-DESK     (WRAP POKE-RELOAD-DESK):FROM-HELM
++  POKE-HELM-RESET           (WRAP POKE-RESET):FROM-HELM
++  POKE-HELM-SERVE           (WRAP POKE-SERVE):FROM-HELM
++  POKE-HELM-SEND-HI         (WRAP POKE-SEND-HI):FROM-HELM
++  POKE-HELM-SEND-ASK        (WRAP POKE-SEND-ASK):FROM-HELM
++  POKE-HELM-VERB            (WRAP POKE-VERB):FROM-HELM
++  POKE-HELM-REKEY           (WRAP POKE-REKEY):FROM-HELM
++  POKE-HELM-NUKE            (WRAP POKE-NUKE):FROM-HELM
++  POKE-HELM-TLON-ADD-FORA   (WRAP POKE-TLON-ADD-FORA):FROM-HELM
++  POKE-HELM-TLON-ADD-STREAM  (WRAP POKE-TLON-ADD-STREAM):FROM-HELM
++  POKE-HELM-TLON-INIT-STREAM  (WRAP POKE-TLON-INIT-STREAM):FROM-HELM
++  POKE-HELM-AUTOMASS        (WRAP POKE-AUTOMASS):FROM-HELM
++  POKE-HELM-CANCEL-AUTOMASS  (WRAP POKE-CANCEL-AUTOMASS):FROM-HELM
++  POKE-HELM-BONK            (WRAP POKE-BONK):FROM-HELM
++  POKE-HOOD-SYNC            (WRAP POKE-SYNC):FROM-KILN
++  POKE-KILN-COMMIT          (WRAP POKE-COMMIT):FROM-KILN
++  POKE-KILN-INFO            (WRAP POKE-INFO):FROM-KILN
++  POKE-KILN-LABEL           (WRAP POKE-LABEL):FROM-KILN
++  POKE-KILN-MERGE           (WRAP POKE-MERGE):FROM-KILN
++  POKE-KILN-CANCEL          (WRAP POKE-CANCEL):FROM-KILN
++  POKE-KILN-MOUNT           (WRAP POKE-MOUNT):FROM-KILN
++  POKE-KILN-RM              (WRAP POKE-RM):FROM-KILN
++  POKE-KILN-SCHEDULE        (WRAP POKE-SCHEDULE):FROM-KILN
++  POKE-KILN-TRACK           (WRAP POKE-TRACK):FROM-KILN
++  POKE-KILN-SYNC            (WRAP POKE-SYNC):FROM-KILN
++  POKE-KILN-SYNCS           (WRAP POKE-SYNCS):FROM-KILN
++  POKE-KILN-START-AUTOLOAD  (WRAP POKE-START-AUTOLOAD):FROM-KILN
++  POKE-KILN-WIPE-FORD       (WRAP POKE-WIPE-FORD):FROM-KILN
++  POKE-KILN-KEEP-FORD       (WRAP POKE-KEEP-FORD):FROM-KILN
++  POKE-KILN-AUTOLOAD        (WRAP POKE-AUTOLOAD):FROM-KILN
++  POKE-KILN-OVERLOAD        (WRAP POKE-OVERLOAD):FROM-KILN
++  POKE-KILN-UNMOUNT         (WRAP POKE-UNMOUNT):FROM-KILN
++  POKE-KILN-UNSYNC          (WRAP POKE-UNSYNC):FROM-KILN
++  POKE-KILN-PERMISSION      (WRAP POKE-PERMISSION):FROM-KILN
++  POKE-WRITE-SEC-ATOM       (WRAP POKE-SEC-ATOM):FROM-WRITE
++  POKE-WRITE-PASTE          (WRAP POKE-PASTE):FROM-WRITE
++  POKE-WRITE-COMMENT        (WRAP POKE-COMMENT):FROM-WRITE
++  POKE-WRITE-FORA-POST      (WRAP POKE-FORA-POST):FROM-WRITE
++  POKE-WRITE-PLAN-INFO      (WRAP POKE-PLAN-INFO):FROM-WRITE
++  POKE-WRITE-PLAN-ACCOUNT   (WRAP POKE-PLAN-ACCOUNT):FROM-WRITE
++  POKE-WRITE-TREE           (WRAP POKE-TREE):FROM-WRITE
++  POKE-WRITE-WIPE           (WRAP POKE-WIPE):FROM-WRITE
++  QUIT-DRUM-PHAT            (WRAP QUIT-PHAT):FROM-DRUM
++  REAP-DRUM-PHAT            (WRAP REAP-PHAT):FROM-DRUM
++  WOOT-HELM                 (WRAP TAKE-WOOT):FROM-HELM
++  WRIT-KILN-AUTOLOAD        (WRAP TAKE-WRIT-AUTOLOAD):FROM-KILN
++  WRIT-KILN-SYNC            (WRAP TAKE-WRIT-SYNC):FROM-KILN
--
