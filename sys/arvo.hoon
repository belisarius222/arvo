::::::  ::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::  ::::::    POSTFACE                              ::::::
::::::  ::::::::::::::::::::::::::::::::::::::::::::::::::::::
~>  %SLOG.[0 LEAF+"%ARVO-ASSEMBLY"]
=-  ~>  %SLOG.[0 LEAF+"%ARVO-ASSEMBLED"]
    -
=<  ::
    ::  ARVO FORMAL INTERFACE
    ::
    ::    THIS LIFECYCLE WRAPPER MAKES THE ARVO DOOR (MULTI-ARMED CORE)
    ::    LOOK LIKE A GATE (FUNCTION OR SINGLE-ARMED CORE), TO FIT
    ::    URBIT'S FORMAL LIFECYCLE FUNCTION. A PRACTICAL INTERPRETER
    ::    CAN IGNORE IT.
    ::
    |=  [NOW=@DA OVO=*]
    ^-  *
    ~>  %SLOG.[0 LEAF+"ARVO-EVENT"]
    .(+> +:(POKE NOW OVO))
::::::  ::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::  ::::::    VOLUME 3, ARVO MODELS AND SKELETON    ::::::
::::::  ::::::::::::::::::::::::::::::::::::::::::::::::::::::
=>
|%
++  ARCH  {FIL/(UNIT @UVI) DIR/(MAP @TA $~)}            ::  FUNDAMENTAL NODE
++  ARVO  (WIND {P/TERM Q/MILL} MILL)                   ::  ARVO CARD
++  BEAM  {{P/SHIP Q/DESK R/CASE} S/PATH}               ::  GLOBAL NAME
++  BEAK  {P/SHIP Q/DESK R/CASE}                        ::  GARNISH WITH BEAK
++  BONE  @UD                                           ::  OPAQUE DUCT
++  CASE                                                ::  VERSION
          $%  {$DA P/@DA}                               ::  DATE
              {$TAS P/@TAS}                             ::  LABEL
              {$UD P/@UD}                               ::  SEQUENCE
          ==                                            ::
++  DESK  @TAS                                          ::  SHIP DESK CASE SPUR
++  DOCK  (PAIR @P TERM)                                ::  MESSAGE TARGET
++  CAGE  (CASK VASE)                                   ::  GLOBAL METADATA
++  CASK  |*(A/MOLD (PAIR MARK A))                      ::  GLOBAL DATA
++  CURD  {P/@TAS Q/*}                                  ::  TYPELESS CARD
++  DUCT  (LIST WIRE)                                   ::  CAUSAL HISTORY
++  HYPO  |*(A/MOLD (PAIR TYPE A))                      ::  TYPE ASSOCIATED
++  HOBO  |*  A/MOLD                                    ::  KISS WRAPPER
          $?  $%  {$SOFT P/*}                           ::
              ==                                        ::
              A                                         ::
          ==                                            ::
++  MARK  @TAS                                          ::  CONTENT TYPE
++  MASH  |=(* (MASS +<))                               ::  PRODUCING MASS
++  MASS  $~  [%$ [%& ~]]                               ::  MEMORY USAGE
          (PAIR CORD (EACH NOUN (LIST MASH)))           ::
++  MILL  (EACH VASE MILT)                              ::  VASE+METAVASE
++  MILT  {P/* Q/*}                                     ::  METAVASE
++  MONK  (EACH SHIP {P/@TAS Q/@TA})                    ::  GENERAL IDENTITY
++  MUSE  {P/@TAS Q/DUCT R/ARVO S/@UD}                  ::  SOURCED MOVE
++  MOVE  {P/DUCT Q/ARVO}                               ::  ARVO MOVE
++  OVUM  {P/WIRE Q/CURD}                               ::  TYPELESS OVUM
++  PANE  (LIST {P/@TAS Q/VASE})                        ::  KERNEL MODULES
++  PONE  (LIST {P/@TAS Q/VISE})                        ::  KERNEL MODULES OLD
+$  SCRY-SAMPLE
  [FUR=(UNIT (SET MONK)) REN=@TAS WHY=SHOP SYD=DESK LOT=COIN TYL=PATH]
+$  VANE-SAMPLE
  [OUR=SHIP NOW=@DA ENY=@UVJ SKI=SLYD]
++  SHIP  @P                                            ::  NETWORK IDENTITY
++  SINK  (TREL BONE SHIP PATH)                         ::  SUBSCRIPTION
++  SLEY  $-  {* (UNIT (SET MONK)) TERM BEAM}           ::  NAMESPACE FUNCTION
          (UNIT (UNIT CAGE))                            ::
++  SLYD  $-  {* (UNIT (SET MONK)) TERM BEAM}           ::  SUPER ADVANCED
          (UNIT (UNIT (CASK)))                          ::
++  SLYT  $-({* *} (UNIT (UNIT)))                       ::  OLD NAMESPACE
+$  VANE  [=VASE =WORM]
++  VILE                                                ::  REFLEXIVE CONSTANTS
          $:  TYP/TYPE                                  ::  -:!>(*TYPE)
              DUC/TYPE                                  ::  -:!>(*DUCT)
              PAH/TYPE                                  ::  -:!>(*PATH)
              MEV/TYPE                                  ::  -:!>([%META *VASE])
          ==                                            ::
++  WIND                                                ::  NEW KERNEL ACTION
          |*  {A/MOLD B/MOLD}                           ::  FORWARD+REVERSE
          $%  {$PASS P/PATH Q/A}                        ::  ADVANCE
              {$SLIP P/A}                               ::  LATERAL
              {$GIVE P/B}                               ::  RETREAT
          ==                                            ::
++  WIRE  PATH                                          ::  EVENT PRETEXT
--
=>
~%  %HEX  +>  ~
|%
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                SECTION 3BE, ARVO CORE                ::
::
++  SLOY
  ::  +SLOY: ADAPTER FROM OLD STYLE SCRYS TO NEW STYLE SCRYS
  ::
  ::    THIS DOES PATH PARSING WHICH SHOWS UP HOT, BUT REMOVING THE LAST +SLAY
  ::    HERE REQUIRES DEEPER INTERFACE CHANGES.
  ::
  !:
  ~/  %SLOY
  |=  SOD/SLYD
  ^-  SLYT
  |=  {REF/* RAW/*}
  =+  PUX=((SOFT PATH) RAW)
  ?~  PUX  ~
  ?.  ?=({@ @ @ @ *} U.PUX)  ~
  =+  :*  HYR=(SLAW %TAS I.U.PUX)
          FAL=(SLAW %P I.T.U.PUX)
          DYC=(SLAW %TAS I.T.T.U.PUX)
          VED=(SLAY I.T.T.T.U.PUX)
          TYL=T.T.T.T.U.PUX
      ==
  ?~  HYR  ~
  ?~  FAL  ~
  ?~  DYC  ~
  ?.  ?=(^ VED)  ~
  =/  RON=@TAS  U.HYR
  =+  BED=[[U.FAL U.DYC (CASE P.U.VED)] (FLOP TYL)]
  =+  BOP=(SOD REF ~ RON BED)
  ?~  BOP  ~
  ?~  U.BOP  [~ ~]
  [~ ~ +.Q.U.U.BOP]
::  +SLOY-LIGHT: MINIMAL PARSING VERSION OF SLOY
::
::    THERE ARE SEVERAL PLACES INSIDE VANES WHERE WE MANUALLY CALL THE SCRY
::    FUNCTION RAW, INSTEAD OF PASSING IT INTO +MINK. IN THOSE CASES, WE'RE
::    PAYING THE PRICE TO RENDER THE ARGUMENTS AS TEXT, AND THEN ARE
::    IMMEDIATELY PARSING THE PASSED IN DATA. WE CAN AVOID THAT.
::
::    TODO: THE ENTIRE SCRYING SYSTEM NEEDS TO BE CLEANED UP IN A MORE
::    PERMANENT WAY. THIS HACK FIXES UP SOME PRINT/PARSE COSTS, BUT DOESN'T
::    RECOVER THE PRINT/PARSE COSTS OF THE SCRY ITSELF, WHICH WE COULD PREVENT
::    IF WE DIDN'T SEND (LIST @TA), BUT INSTEAD SENT (LIST DIME).
::
++  SLOY-LIGHT
  ~/  %SLOY-LIGHT
  |=  SOD/SLYD
  |=  [REF=* RON=@TAS FAL=@P DYC=@TAS VED=CASE TYL=PATH]
  ::  WE DO NOT FLOP TYL BECAUSE TYL WOULDN'T HAVE BEEN FLOPPED BY +EN-BEAM
  ::
  =+  BED=[[FAL DYC VED] TYL]
  =+  BOP=(SOD REF ~ RON BED)
  ?~  BOP  ~
  ?~  U.BOP  [~ ~]
  [~ ~ +.Q.U.U.BOP]
::
++  SYMP                                                ::  SYMBOL OR EMPTY
  |=  A=*  ^-  @TAS
  ?.(&(?=(@ A) ((SANE %TAS) A)) %$ A)
::
++  VENT                                                ::  VANE CORE
  |=  [WHO=SHIP LAL=@TAS VIL=VILE BUD=VASE =VANE]
  ~%  %VENT  +>+  ~
  |%
  ++  RUCK                                              ::  UPDATE VASE
    |=  {PAX/PATH TXT/@TA}
    ^+  +>
    =-  ?:(?=(%| -.RES) ((SLOG P.RES) +>.$) P.RES)
    ^=  RES  %-  MULE  |.
    ::  XX SHOULD USE REAL ENTROPY AND THE REAL DATE
    ::
    =/  ARG=VANE-SAMPLE
      [WHO ~2000.1.1 *@UVJ =>(~ |~(* ~))]
    =+  RIG=(SLYM VASE.VANE ARG)
    =+  GEN=(RAIN PAX TXT)
    =+  REV=(SLYM (SLAP BUD GEN) BUD)
    =+  SYG=(SLYM REV ARG)
    ::  UPDATE THE VANE ITSELF
    ::
    ::    WE DON'T CACHE THE +SLAP/+SLAM TYPES BECAUSE THEY'RE ONLY USED ONCE
    ::    RIGHT HERE; THEY'LL NEVER BE USED AGAIN.
    ::
    =.  VASE.VANE
      ~|  %LOAD-LOST
      (SLAM (SLAP SYG [%LIMB %LOAD]) (SLAP RIG [%LIMB %STAY]))
    ::  PRIME THE NEW COMPILER CACHE
    ::
    PRIME
  ::  RESET AND PRIME THE WORM CACHE FOR SCRYS
  ::
  ::    IF THE +SLAP/+SLYM IN SCRY ISN'T CACHED, WE SPEND THE MAJORITY OF
  ::    THE TIME IN A SCRY IN THE COMPILER. THE +SCRY GATE CANNOT HAVE SIDE
  ::    EFFECTS SO WE CAN'T MODIFY THE CACHE AT ACCESS TIME. SO WE SEED THE
  ::    CACHE WITH ALL THE THINGS +SCRY WILL NEED WHEN WE INSTALL THE VANE
  ::
  ++  PRIME
    ^+  ..PRIME
    ::
    %_    ..PRIME
        WORM.VANE
      ::  RESET CACHE AND ADD IN VANE ACTIVATION ENTRY
      ::
      =^  RIG  WORM.VANE
        (~(SLYM WA *WORM) VASE.VANE *VANE-SAMPLE)
      ::  CACHE THE ACCESS OF THE %SCRY ARM
      ::
      +:(~(SLAP WA WORM.VANE) RIG [%LIMB %SCRY])
    ==
  ::
  ++  WINK                                              ::  DEPLOY
    |=  {NOW/@DA ENY/@ SKI/SLYD}
    =^  RIG  WORM.VANE
      ~|  [%FAILED-VANE-ACTIVATION-FOR LAL]
      (~(SLYM WA WORM.VANE) VASE.VANE `VANE-SAMPLE`[WHO +<])  ::  ACTIVATE VANE
    ~%  %WINK  +>+>  ~
    |%
    ++  SLID
      |=  {HED/MILL TAL/MILL}
      ^-  MILL
      ?:  &(?=(%& -.HED) ?=(%& -.TAL))
        [%& (SLOP P.HED P.TAL)]
      [%| [%CELL P.P.HED P.P.TAL] [Q.P.HED Q.P.TAL]]
    ::
    ++  SLIX
      |=  HIL/MILL
      ^-  MILL
      ?-  -.HIL
        %&  [%& (SLOP [TYP.VIL P.P.HIL] P.HIL)]
        %|  [%| [%CELL TYP.VIL P.P.HIL] P.HIL]
      ==
    ::
    ++  SLUR                                            ::  CALL GATE ON
      |=  {GAT/VASE HIL/MILL}
      ^-  (UNIT (PAIR VASE WORM))
      =^  SAM  WORM.VANE
        ~|  [%FAILED-SLOT-IN LAL]
        (~(SLOT WA WORM.VANE) 6 GAT)
      =^  HIG  WORM.VANE
        ~|  [%FAILED-NEST-IN LAL]
        ?-  -.HIL
          %&  (~(NEST WA WORM.VANE) P.SAM P.P.HIL)
          %|  (~(NETS WA WORM.VANE) P.SAM P.P.HIL)
        ==
      ?.  HIG
        ~
      ~|  [%FAILED-SLYM-IN LAL]
      `(~(SLYM WA WORM.VANE) GAT +>.HIL)
    ::
    ++  SLUR-A  ~/(%SLUR-A |=({GAT/VASE HIL/MILL} =+(%A (SLUR GAT HIL))))
    ++  SLUR-B  ~/(%SLUR-B |=({GAT/VASE HIL/MILL} =+(%B (SLUR GAT HIL))))
    ++  SLUR-C  ~/(%SLUR-C |=({GAT/VASE HIL/MILL} =+(%C (SLUR GAT HIL))))
    ++  SLUR-D  ~/(%SLUR-D |=({GAT/VASE HIL/MILL} =+(%D (SLUR GAT HIL))))
    ++  SLUR-E  ~/(%SLUR-E |=({GAT/VASE HIL/MILL} =+(%E (SLUR GAT HIL))))
    ++  SLUR-F  ~/(%SLUR-F |=({GAT/VASE HIL/MILL} =+(%F (SLUR GAT HIL))))
    ++  SLUR-G  ~/(%SLUR-G |=({GAT/VASE HIL/MILL} =+(%G (SLUR GAT HIL))))
    ++  SLUR-J  ~/(%SLUR-J |=({GAT/VASE HIL/MILL} =+(%J (SLUR GAT HIL))))
    ++  SLUR-Z  ~/(%SLUR-Z |=({GAT/VASE HIL/MILL} =+(%Z (SLUR GAT HIL))))
    ::
    ++  SLUR-PRO                                        ::  PROFILING SLUR
      ~/  %SLUR-PRO
      |=  {LAL/@TAS GAT/VASE HIL/MILL}
      ?+  LAL  (SLUR-Z GAT HIL)
        $A  (SLUR-A GAT HIL)
        $B  (SLUR-B GAT HIL)
        $C  (SLUR-C GAT HIL)
        $D  (SLUR-D GAT HIL)
        $E  (SLUR-E GAT HIL)
        $F  (SLUR-F GAT HIL)
        $G  (SLUR-G GAT HIL)
        $J  (SLUR-J GAT HIL)
      ==
    ::
    ++  SONG                                            ::  REDUCE METACARD
      ~/  %SONG                                         ::
      |=  MEX/VASE                                      ::  MEX: VASE OF CARD
      ^-  (UNIT (PAIR MILL WORM))                       ::
      =^  HIP  WORM.VANE  (~(NELL WA WORM.VANE) P.MEX)          ::
      ?.  HIP  ~                                        ::  A CARD IS A CELL
      ?.  ?=($META -.Q.MEX)  `[[%& MEX] WORM.VANE]          ::  ORDINARY CARD
      =^  TIV  WORM.VANE  (~(SLOT WA WORM.VANE) 3 MEX)          ::
      =^  HIP  WORM.VANE  (~(NELL WA WORM.VANE) P.TIV)          ::
      ?.  HIP  ~                                        ::  A VASE IS A CELL
      =^  VAX  WORM.VANE  (~(SLOT WA WORM.VANE) 2 TIV)          ::
      =^  HIP  WORM.VANE  (~(NEST WA WORM.VANE) TYP.VIL P.VAX)  ::
      ?.  HIP  ~                                        ::  VASE HEAD IS TYPE
      %+  BIFF                                          ::
        =+  MUT=(MILT Q.TIV)                            ::  CARD TYPE, VALUE
        |-  ^-  (UNIT (PAIR MILT WORM))                 ::
        ?.  ?=({$META P/* Q/MILT} Q.MUT)  `[MUT WORM.VANE]  ::  ORDINARY METACARD
        =^  HIP  WORM.VANE  (~(NETS WA WORM.VANE) MEV.VIL P.MUT)::
        ?.  HIP  ~                                      ::  META-METACARD
        $(MUT +.Q.MUT)                                  ::  DESCEND INTO META
      |=(A/(PAIR MILT WORM) `[[%| P.A] Q.A])            ::  MILT TO MILL
    ::
    ++  SUMP                                            ::  VASE TO MOVE
      ~/  %SUMP
      |=  WEC/VASE
      ^-  (UNIT (PAIR MOVE WORM))
      %+  BIFF  ((SOFT DUCT) -.Q.WEC)
      |=  A/DUCT
      %+  BIND
        =-  ?-  -.HAR
              %|  ~&  [%DEAD-CARD P.HAR]  ~             ::  XX PROPERLY LOG?
              %&  (SOME P.HAR)
            ==
        ^=  HAR  ^-  (EACH (PAIR ARVO WORM) TERM)
        =^  CAQ  WORM.VANE  (~(SPOT WA WORM.VANE) 3 WEC)
        ?+    Q.CAQ   [%| (CAT 3 %FUNK (SYMP Q.CAQ))]
        ::
            {$PASS P/* Q/@TAS R/{P/@TAS Q/*}}
          %-  (BOND |.([%| P.R.Q.CAQ]))
          %+  BIFF  ((SOFT @) Q.Q.CAQ)
          |=  LAL/@TAS
          ?.  ((SANE %TAS) LAL)  ~
          %+  BIFF  ((SOFT PATH) P.Q.CAQ)
          |=  PAX/PATH
          =^  YAV  WORM.VANE  (~(SPOT WA WORM.VANE) 15 CAQ)
          %+  BIND  (SONG YAV)
          |=  {HIL/MILL VEL/WORM}
          [%& [%PASS PAX LAL HIL] VEL]
        ::
            {$GIVE P/{P/@TAS Q/*}}
          %-  (BOND |.([%| P.P.Q.CAQ]))
          =^  YAV  WORM.VANE  (~(SPOT WA WORM.VANE) 3 CAQ)
          %+  BIND  (SONG YAV)
          |=  {HIL/MILL VEL/WORM}
          [%& [%GIVE HIL] VEL]
        ::
            {$SLIP P/@TAS Q/{P/@TAS Q/*}}
          %-  (BOND |.([%| P.Q.Q.CAQ]))
          %+  BIFF  ((SOFT @) P.Q.CAQ)
          |=  LAL/@TAS
          ?.  ((SANE %TAS) LAL)  ~
          =^  YAV  WORM.VANE  (~(SPOT WA WORM.VANE) 7 CAQ)
          %+  BIND  (SONG YAV)
          |=  {HIL/MILL VEL/WORM}
          [%& [%SLIP LAL HIL] VEL]
        ==
      |=(B/(PAIR ARVO WORM) [`MOVE`[A P.B] Q.B])
    ::
    ++  SAID                                            ::  VASE TO (LIST MOVE)
      |=  VUD/VASE
      |-  ^-  (PAIR (LIST MOVE) WORM)
      ?:  =(~ Q.VUD)  [~ WORM.VANE]
      =^  HED  WORM.VANE  (~(SLOT WA WORM.VANE) 2 VUD)
      =^  TAL  WORM.VANE  (~(SLOT WA WORM.VANE) 3 VUD)
      =^  MOV  WORM.VANE  (NEED (SUMP HED))
      =^  MOZ  WORM.VANE  $(VUD TAL)
      [[MOV MOZ] WORM.VANE]
    ::
    ++  SCRY                                            ::  READ NAMESPACE
      ~/  %SCRY
      |=  $:  FUR/(UNIT (SET MONK))
              REN/@T
              BED/BEAM
          ==
      ^-  (UNIT (UNIT (CASK)))
      ::  ~&  [%ARVO-SCRY REN BED]
      =/  OLD=SCRY-SAMPLE
        :*  FUR
            REN
            [%& P.BED]
            Q.BED
            `COIN`[%$ R.BED]
            (FLOP S.BED)
        ==
      ^-  (UNIT (UNIT (CASK)))
      =+  FUN=-:(~(SLAP WA WORM.VANE) RIG [%LIMB %SCRY])
      ::
      %-  (UNIT (UNIT (CASK)))
      (SLUM Q.FUN OLD)
    ::
    ++  SOAR                                            ::  SCRUB VANE
      |=  SEV/VASE
      ^-  VASE
      ?:  &(=(-.Q.VASE.VANE -.Q.SEV) =(+>.Q.VASE.VANE +>.Q.SEV))
        VASE.VANE                                           ::  UNCHANGED, USE OLD
      =|  SAM=VANE-SAMPLE
      SEV(+<.Q SAM(SKI =>(~ |~(* ~))))                      ::  CLEAR TO STOP LEAK
    ::
    ++  SWIM
      ~/  %SWIM
      |=  $:  ORG/@TAS
              PUX/(UNIT WIRE)
              HEN/DUCT
              HIL/MILL
          ==
      ^-  [(LIST MOVE) _VANE]
      ~|  [%FAILED-SWIM LAL ORG PUX]
      ::  ~&  [%SWIM-WYT `@UD`~(WYT IN WORM.VANE)]
      =+  ^=  PRU
          ?~  PUX
            ~|  [%SWIM-CALL-VANE LAL (SYMP ?@(+.P.HIL +.P.HIL +<.P.HIL))]
            =^  VAX  WORM.VANE  (~(SLAP WA WORM.VANE) RIG [%LIMB %CALL])
            %^  SLUR-PRO  LAL  VAX
            (SLID [%& DUC.VIL HEN] (SLIX HIL))
          ~|  [%SWIM-TAKE-VANE LAL (SYMP ?@(+.P.HIL +.P.HIL +<.P.HIL))]
          =^  VAX  WORM.VANE  (~(SLAP WA WORM.VANE) RIG [%LIMB %TAKE])
          %^  SLUR-PRO  LAL   VAX
          ;:  SLID
            [%& PAH.VIL U.PUX]
            [%& DUC.VIL HEN]
            (SLIX (SLID [%& [%ATOM %TAS `ORG] ORG] HIL))
          ==
      ?~  PRU
        ~&  [%SWIM-LOST LAL (SYMP +>-.HIL)]
        [~ [VASE.VANE WORM.VANE]]
      =^  PRO  WORM.VANE  (NEED PRU)
      =^  MOZ  WORM.VANE  (~(SLOT WA WORM.VANE) 2 PRO)
      =^  VEM  WORM.VANE  (~(SLOT WA WORM.VANE) 3 PRO)
      =^  SAD  WORM.VANE  (SAID MOZ)
      [SAD [(SOAR VEM) WORM.VANE]]
    --
  --
::
++  VINT                                                ::  CREATE VANE
  |=  $:  WHO=SHIP
          LAL=@TAS
          VIL=VILE
          BUD=VASE
          PAX=PATH
          TXT=@TA
      ==
  =-  ?:(?=(%| -.RES) ((SLOG P.RES) ~) (SOME P.RES))
  ^=  RES  %-  MULE  |.
  ~|  [%FAILED-VINT LAL]
  =+  GEN=(RAIN PAX TXT)
  ~&  [%VANE-PARSED `@P`(MUG GEN)]
  =+  PRO=(VENT WHO LAL VIL BUD [(SLYM (SLAP BUD GEN) BUD) *WORM])
  ~&  [%VANE-COMPILED `@P`(MUG PRO)]
  PRIME:PRO
::
++  VIOL                                                ::  VANE TOOLS
  |=  BUT/TYPE
  ^-  VILE
  =+  PAL=|=(A/@T ^-(TYPE (~(PLAY UT BUT) (VICE A))))
  :*  TYP=(PAL '$:TYPE')
      DUC=(PAL '$:DUCT')
      PAH=(PAL '$:PATH')
      MEV=(PAL '$:{$META $VASE}')
  ==
::
++  IS                                                  ::  OPERATE IN TIME
  |=  [WHO=SHIP VIL=VILE ENY=@ BUD=VASE VANES=(LIST [LABEL=@TAS =VANE])]
  |_  NOW/@DA
  ++  BECK
    ^-  SLYD
    |=  {* FUR/(UNIT (SET MONK)) RON/TERM BED/BEAM}
    ^-  (UNIT (UNIT (CASK)))
    =>  .(FUR ?^(FUR FUR `[[%& P.BED] ~ ~]))            ::  XX HEINOUS
    =+  LAL=(END 3 1 RON)
    =+  REN=(@T (RSH 3 1 RON))
    |-  ^-  (UNIT (UNIT (CASK)))
    ?~  VANES  ~
    ?.  =(LAL LABEL.I.VANES)  $(VANES T.VANES)
    ~|  [%FAILED-SCRY RON BED]
    %-  SCRY:(WINK:(VENT WHO LAL VIL BUD VANE.I.VANES) NOW ENY ..^$)
    [FUR REN BED]
  ::
  ++  DINK                                              ::  VASE BY CHAR
    |=  DIN/@TAS  ^-  VASE
    ?~(VANES !! ?:(=(DIN LABEL.I.VANES) VASE.VANE.I.VANES $(VANES T.VANES)))
  ::
  ++  DINT                                              ::  INPUT ROUTING
    |=  HAP/PATH  ^-  @TAS
    ?+  HAP  !!
      {@ $AMES *}  %A
      {@ $BOAT *}  %C
      {@ $NEWT *}  %A
      {@ $SYNC *}  %C
      {@ $TERM *}  %D
      {@ $HTTP *}  %E
      {@ $BEHN *}  %B
    ==
  ::
  ++  HURL                                              ::  START LOOP
    |=  {LAC/? OVO/OVUM}
    ~?  &(!LAC !=(%BELT -.Q.OVO))  ["" %UNIX -.Q.OVO P.OVO]
    ::  ^-  {P/(LIST OVUM) Q/(PAIR WORM (LIST {P/@TAS Q/VASE}))}
    ^-  {P/(LIST OVUM) Q=(LIST [LABEL=@TAS =VANE])}
    ?>  ?=(^ P.OVO)
    %+  KICK  LAC
    :~  :*  I.P.OVO
            ~
            :^  %PASS  T.P.OVO
              (DINT P.OVO)
            :+  %&
              [%CELL [%ATOM %TAS `%SOFT] %NOUN]
            [%SOFT Q.OVO]
            0
        ==
    ==
  ::
  ++  RACE                                              ::  TAKE
    |=  {ORG/@TAS LAL/@TAS PUX/(UNIT WIRE) HEN/DUCT HIL/MILL =VANE}
    ^-  [P=(LIST MOVE) Q=_VANE]
    =+  VEN=(VENT WHO LAL VIL BUD VANE)
    ~|  [%FAILED-TAKE LAL]
    =+  WIN=(WINK:VEN NOW ENY BECK)
    (SWIM:WIN ORG PUX HEN HIL)
  ::
  ++  FIRE                                              ::  EXECUTE
    |=  {ORG/TERM DEH/@UD LAL/TERM PUX/(UNIT WIRE) HEN/DUCT HIL/MILL}
    ^-  {{P/(LIST OVUM) Q/(LIST MUSE)} _VANES}
    ?:  &(?=(^ PUX) ?=($~ HEN))
      [[[[LAL U.PUX] (CURD +>.HIL)]~ ~] VANES]
    =+  NAF=VANES
    |-  ^-  {{P/(LIST OVUM) Q/(LIST MUSE)} _VANES}
    ?~  NAF  [[~ ~] ~]
    ?.  =(LAL LABEL.I.NAF)
      =+  TUH=$(NAF T.NAF)
      [-.TUH [+<.TUH [I.NAF +>.TUH]]]
    ::
    =+  FIQ=(RACE ORG LAL PUX HEN HIL VANE.I.NAF)
    :-  [~ (TURN P.FIQ |=(A/MOVE [LAL P.A Q.A +(DEH)]))]
    [[LABEL.I.NAF Q.FIQ] T.NAF]
  ::
  ++  JACK                                              ::  DISPATCH CARD
    |=  {LAC/? GUM/MUSE}
    ^-  {{P/(LIST OVUM) Q/(LIST MUSE)} _VANES}
    ~|  %FAILED-JACK
    ::  =.  LAC  |(LAC ?=(?(%G %F) P.GUM))
    ::  =.  LAC  &(LAC !?=($B P.GUM))
    %^    FIRE
        P.GUM
      S.GUM
    ?-    -.R.GUM
        $PASS
      ~?  &(!LAC !=(%$ P.GUM))
        :-  (RUNT [S.GUM '|'] "")
        :^  %PASS  [P.GUM P.Q.R.GUM]
          [(SYMP +>-.Q.Q.R.GUM) P.R.GUM]
        Q.GUM
      [P.Q.R.GUM ~ [[P.GUM P.R.GUM] Q.GUM] Q.Q.R.GUM]
    ::
        $GIVE
      ?.  &(?=(^ Q.GUM) ?=(^ I.Q.GUM))
        ~|  [%JACK-BAD-DUCT Q.GUM]
        ~|  [%JACK-BAD-CARD P.GUM (SYMP +>-.P.R.GUM)]
        !!
      ~?  &(!LAC |(!=(%BLIT +>-.P.R.GUM) !=(%D P.GUM)))
        :-  (RUNT [S.GUM '|'] "")
        [%GIVE P.GUM (SYMP +>-.P.R.GUM) `DUCT`Q.GUM]
      [I.I.Q.GUM [~ T.I.Q.GUM] T.Q.GUM P.R.GUM]
    ::
        $SLIP
      ~?  !LAC
        :-  (RUNT [S.GUM '|'] "")
        [%SLIP P.GUM (SYMP +>-.Q.P.R.GUM) Q.GUM]
      [P.P.R.GUM ~ Q.GUM Q.P.R.GUM]
    ==
  ::
  ++  KICK                                              ::  NEW MAIN LOOP
    |=  {LAC/? MOR/(LIST MUSE)}
    =|  OVA/(LIST OVUM)
    |-  ^-  {P/(LIST OVUM) Q=(LIST [LABEL=@TAS =VANE])}
    ?~  MOR
      [OVA VANES]
    =^  NYX  VANES  (JACK LAC I.MOR)
    ::  WE EMIT OVA TO UNIX IN FIFO ORDER, BUT EMIT INTERNAL MOVES DEPTH-FIRST
    ::
    $(OVA (WELD OVA P.NYX), MOR (WELD Q.NYX T.MOR))
  ::  +SPAM: KICK EVERY VANE WITH :OVUM
  ::
  ++  SPAM
    |=  [LAC=? OVO=OVUM]
    ^-  [(LIST OVUM) (LIST [LABEL=@TAS =VANE])]
    =/  CARD
      :+  %&
        [%CELL [%ATOM %TAS `%SOFT] %NOUN]
      [%SOFT Q.OVO]
    %+  KICK  LAC
    %+  TURN  VANES
    |=([LABEL=@TAS *] [LABEL ~ [%PASS P.OVO LABEL CARD] 0])
  --
--
=<  ::  ARVO LARVAL STAGE
    ::
    ::    THE TRUE ARVO KERNEL KNOWS WHO IT IS. IT SHOULD NOT *MAYBE*
    ::    HAVE AN IDENTITY, NOR SHOULD IT CONTAIN MULTITUDES. THIS OUTER
    ::    KERNEL EXISTS TO ACCUMULATE IDENTITY, ENTROPY, AND THE
    ::    STANDARD LIBRARY. UPON HAVING DONE SO, IT UPGRADES ITSELF INTO
    ::    THE TRUE ARVO KERNEL. SUBSEQUENT UPGRADES WILL FALL THROUGH
    ::    THE LARVAL STAGE DIRECTLY INTO THE ACTUAL KERNEL.
    ::
    ::    FOR CONVENIENCE, THIS LARVAL STAGE ALSO SUPPORTS HOON COMPILATION
    ::    WITH +WISH AND VANE INSTALLATION WITH THE %VEER EVENT.
    ::
    =/  PIT=VASE  !>(..IS)
    =|  $:  ::  WHO: OUR IDENTITY ONCE WE KNOW IT
            ::  ENY: ENTROPY ONCE WE LEARN IT
            ::  BOD: %ZUSE ONCE WE RECEIVE IT
            ::
            WHO=(UNIT SHIP)
            ENY=(UNIT @)
            BOD=(UNIT VASE)
        ==
    ::  LARVAL ARVO STRUCTURAL INTERFACE
    ::
    |%
    ++  COME  ^COME                                     ::   4
    ++  LOAD  ^LOAD                                     ::  10
    ++  PEEK  |=(* ~)                                   ::  46
    ::
    ++  POKE  |=  *                                     ::  47
              ^-  [(LIST OVUM) *]
              =>  .(+< ((HARD ,[NOW=@DA OVO=OVUM]) +<))
              ^-  [(LIST OVUM) *]
              =.  +>.$
                ?+  -.Q.OVO
                  ::  IGNORE UNRECOGNIZED
                  ::
                  ~&  [%LARVAL-IGNORE P.OVO -.Q.OVO]
                  +>.$
                ::  INSTALL %ZUSE OR VANE
                ::
                    %VEER
                  ^+  +>.$
                  ::  USE THE MAXIMUM COMET IF WE DON'T KNOW WHO WE ARE YET
                  ::
                  =/  OUR
                    ?^  WHO
                      U.WHO
                    =/  FIP=SHIP  (DEC (BEX 128))
                    ~>(%SLOG.[0 LEAF+"ARVO: LARVAL IDENTITY {(SCOW %P FIP)}"] FIP)
                  =.  ..VEER  (VEER OUR NOW Q.OVO)
                  +>.$(BOD ?^(BOD BOD `BUD.^POKE))
                ::  ADD ENTROPY
                ::
                    %WACK
                  ^+  +>.$
                  ?>  ?=(@ Q.Q.OVO)
                  +>.$(ENY `Q.Q.OVO)
                ::  BECOME WHO YOU WERE BORN TO BE
                ::
                    %WHOM
                  ^+  +>.$
                  ?>  ?=(@ Q.Q.OVO)
                  +>.$(WHO `Q.Q.OVO)
                ==
              ::  UPGRADE ONCE WE'VE ACCUMULATED IDENTITY, ENTROPY, AND %ZUSE
              ::
              ?.  &(?=(^ WHO) ?=(^ ENY) ?=(^ BOD))
                [~ +>.$]
              ~>  %SLOG.[0 LEAF+"ARVO: METAMORPHOSIS"]
              =/  NYF
                (TURN VANES.^POKE |=([LABEL=@TAS =VANE] [LABEL VASE.VANE]))
              (LOAD U.WHO NOW U.ENY OVA=~ U.BOD NYF)
    ::
    ++  WISH  |=  TXT=*                                 ::  22
              ?>  ?=(@ TXT)
              Q:(SLAP ?~(BOD PIT U.BOD) (REAM TXT))
    --
::
::  PERSISTENT ARVO STATE
::
=/  PIT=VASE  !>(..IS)                                  ::
=/  VIL=VILE  (VIOL P.PIT)                              ::  CACHED REFLEXIVES
=|  $:  LAC=?                                           ::  LACONIC BIT
        ENY=@                                           ::  ENTROPY
        OUR=SHIP                                        ::  IDENTITY
        BUD=VASE                                        ::  %ZUSE
        VANES=(LIST [LABEL=@TAS =VANE])                 ::  MODULES
    ==                                                  ::
=<  ::  ARVO STRUCTURAL INTERFACE
    ::
    |%
    ++  COME  |=  {@ @ @ (LIST OVUM) VISE PONE}         ::   4
              ^-  {(LIST OVUM) _+>}
              ~&  %HOON-COME
              =^  REY  +>+  (^COME +<)
              [REY +>.$]
    ::
    ++  LOAD  |=  {@ @ @ (LIST OVUM) VASE PANE}         ::  10
              ^-  {(LIST OVUM) _+>}
              ~&  %HOON-LOAD
              =^  REY  +>+  (^LOAD +<)
              [REY +>.$]
    ::
    ++  PEEK  |=(* (^PEEK ((HARD {@DA PATH}) +<)))      ::  46
    ::
    ++  POKE  |=  *                                     ::  47
              ^-  [(LIST OVUM) *]
              =>  .(+< ((HARD ,[NOW=@DA OVO=OVUM]) +<))
              =^  OVA  +>+.$  (^POKE NOW OVO)
              =|  OUT=(LIST OVUM)
              |-  ^-  [(LIST OVUM) *]
              ?~  OVA
                [(FLOP OUT) +>.^$]
              ::  UPGRADE THE KERNEL
              ::
              ?:  ?=(%LYRA -.Q.I.OVA)
                %+  FALL
                  (VEGA NOW T.OVA ({@ @} +.Q.I.OVA))
                [~ +>.^$]
              ::  ITERATE OVER EFFECTS, HANDLING THOSE ON ARVO PROPER
              ::  AND PASSING THE REST THROUGH AS OUTPUT
              ::
              =^  VOV  +>+.^$  (FECK NOW I.OVA)
              =?  OUT  ?=(^ VOV)  [+.VOV OUT]
              $(OVA T.OVA)
    ::
    ++  WISH  |=(* (^WISH ((HARD @TA) +<)))             ::  22
    --
::  ARVO IMPLEMENTATION CORE
::
|%
++  COME                                                ::  LOAD INCOMPATIBLE
  |=  [WHO=SHIP NOW=@DA YEN=@ OVA=(LIST OVUM) DUB=VISE NYF=PONE]
  ^+  [OVA +>]
  =/  FYN  (TURN NYF |=([A=@TAS B=VISE] [A (SLIM B)]))
  (LOAD WHO NOW YEN OVA (SLIM DUB) FYN)
::
++  LOAD                                                ::  LOAD COMPATIBLE
  |=  [WHO=SHIP NOW=@DA YEN=@ OVA=(LIST OVUM) DUB=VASE NYF=PANE]
  ^+  [OVA +>]
  =:  OUR  WHO
      ENY  YEN
      BUD  DUB
      VANES  (TURN NYF |=({A/@TAS B/VISE} [A [B *WORM]]))
    ==
  =|  OUT=(LIST OVUM)
  |-  ^-  [(LIST OVUM) _+>.^$]
  ?~  OVA
    [(FLOP OUT) +>.^$]
  ::  ITERATE OVER EFFECTS, HANDLING THOSE ON ARVO PROPER
  ::  AND PASSING THE REST THROUGH AS OUTPUT
  ::
  ::    IN PRACTICE, THE PENDING EFFECTS AFTER AN UPGRADE
  ::    ARE THE %VEER MOVES TO INSTALL %ZUSE AND THE VANES,
  ::    PLUS A %VEGA NOTIFICATION THAT THE UPGRADE IS COMPLETE.
  ::
  ::    N.B. THIS IMPLEMENTATION ASSUMES THAT %VEGA WILL BE
  ::    AT THE END OF :OVA.
  ::
  ?:  ?=(%VEGA -.Q.I.OVA)
    =^  ZEF  VANES
      (~(SPAM (IS OUR VIL ENY BUD VANES) NOW) LAC I.OVA)
    $(OUT [I.OVA OUT], OVA (WELD T.OVA ZEF))
  ::
  =^  VOV  +>.^$  (FECK NOW I.OVA)
  =?  OUT  ?=(^ VOV)  [+.VOV OUT]
  $(OVA T.OVA)
::
++  PEEK                                                ::  EXTERNAL INSPECT
  |=  {NOW/@DA HAP/PATH}
  ^-  (UNIT)
  ?~  HAP  [~ HOON-VERSION]
  =+  ROB=((SLOY ~(BECK (IS OUR VIL ENY BUD VANES) NOW)) [151 %NOUN] HAP)
  ?~  ROB  ~
  ?~  U.ROB  ~
  [~ U.U.ROB]
::
++  POKE                                                ::  EXTERNAL APPLY
  |=  [NOW=@DA OVO=OVUM]
  =.  ENY  (SHAZ (CAT 3 ENY NOW))
  ^-  [(LIST OVUM) _+>.$]
  ::
  ::  THESE EXTERNAL EVENTS ARE ACTUALLY EFFECTS ON ARVO PROPER.
  ::  THEY CAN ALSO BE PRODUCED AS THE EFFECTS OF OTHER EVENTS.
  ::  IN EITHER CASE, THEY FALL THROUGH HERE TO BE HANDLED
  ::  AFTER THE FACT IN +FECK.
  ::
  ?:  ?=(?(%VEER %VERB %WACK) -.Q.OVO)
    [[OVO ~] +>.$]
  ::
  =^  ZEF  VANES
    (~(HURL (IS OUR VIL ENY BUD VANES) NOW) LAC OVO)
  [ZEF +>.$]
::  +FECK: HANDLE AN ARVO EFFECT
::
++  FECK
  |=  [NOW=@DA OVO=OVUM]
  ^-  [(UNIT OVUM) _+>.$]
  ?+  -.Q.OVO
      ::  PASS THROUGH UNRECOGNIZED EFFECT
      ::
      [[~ OVO] +>.$]
  ::  TOGGLE EVENT VERBOSE EVENT PRINTFS
  ::
      %VERB
    [~ +>.$(LAC !LAC)]
  ::  INSTALL %ZUSE OR VANE
  ::
      %VEER
    [~ (VEER OUR NOW Q.OVO)]
  ::  ADD DATA TO MEMORY PROFILE
  ::
      %MASS
    =.  Q.Q.OVO
      :-  %USERSPACE
      :-  %|
      :~  HOON+&+PIT
          ZUSE+&+BUD
          :+  %CACHES  %|
          %+  TURN
            %+  SORT  VANES
            |=([A=[LAB=@TAS *] B=[LAB=@TAS *]] (AOR LAB.A LAB.B))
          |=([LABEL=@TAS =VANE] [(CAT 3 %VANE- LABEL) %& WORM.VANE])
          Q.Q.OVO
          :+  %VASES  %|
          %+  TURN
            %+  SORT  VANES
            |=([A=[LAB=@TAS *] B=[LAB=@TAS *]] (AOR LAB.A LAB.B))
          |=([LABEL=@TAS =VANE] [(CAT 3 %VANE- LABEL) %& VASE.VANE])
          DOT+&+.
      ==
    [[~ OVO] +>.$]
  ::  ADD ENTROPY
  ::
      %WACK
    ?>  ?=(@ Q.Q.OVO)
    =.  ENY  (SHAZ (CAT 3 ENY Q.Q.OVO))
    [~ +>.$]
  ==
::
++  VEGA                                                ::  REBOOT KERNEL
  |=  $:  ::  NOW: CURRENT DATE
          ::  OVA: ACTIONS TO PROCESS AFTER REBOOT
          ::  HUN: HOON.HOON SOURCE
          ::  ARV: ARVO.HOON SOURCE
          ::
          NOW=@DA
          OVA=(LIST OVUM)
          HUN=@T
          VAN=@T
      ==
  ^-  (UNIT (PAIR (LIST OVUM) *))
  ::  VIRTUALIZE; DUMP ERROR IF WE FAIL
  ::
  =-  ?:(?=(%| -.RES) ((SLOG P.RES) ~) `P.RES)
  ^=  RES  %-  MULE  |.
  ::  PRODUCE A NEW KERNEL AND AN EFFECT LIST
  ::
  ^-  (PAIR (LIST OVUM) *)
  ::  COMPILE THE HOON.HOON SOURCE WITH THE CURRENT COMPILER
  ::
  =/  RAW
    ~&  [%HOON-COMPILE `@P`(MUG HUN)]
    (RIDE %NOUN HUN)
  ::  ACTIVATE THE NEW COMPILER GATE, PRODUCING +RIDE
  ::
  =/  COP  .*(0 +.RAW)
  ::  FIND THE HOON VERSION NUMBER OF THE NEW KERNEL
  ::
  =/  NEX
    (@ .*(COP Q:(~(MINT UT P.RAW) %NOUN [%LIMB %HOON-VERSION])))
  ?>  |(=(NEX HOON-VERSION) =(+(NEX) HOON-VERSION))
  ::  IF WE'RE UPGRADING LANGUAGE VERSIONS, RECOMPILE THE COMPILER
  ::
  ::    HOT: RAW COMPILER FORMULA
  ::
  =>  ?:  =(NEX HOON-VERSION)
        [HOT=`*`RAW .]
      ~&  [%HOON-COMPILE-UPGRADE NEX]
      =/  HOT  (SLUM COP [%NOUN HUN])
      .(COP .*(0 +.HOT))
  ::  EXTRACT THE HOON CORE FROM THE OUTER GATE (+RIDE)
  ::
  =/  HOC  .*(COP [%0 7])
  ::  COMPUTE THE TYPE OF THE HOON.HOON CORE
  ::
  =/  HYP  -:(SLUM COP [-.HOT '+>'])
  ::  COMPILE ARVO
  ::
  =/  RAV
    ~&  [%ARVO-COMPILE `@P`(MUG HYP) `@P`(MUG VAN)]
    (SLUM COP [HYP VAN])
  ::  ACTIVATE ARVO, AND EXTRACT THE ARVO CORE FROM THE OUTER GATE
  ::
  =/  VOC  .*(HOC [%7 +.RAV %0 7])
  ::  ENTRY GATE: ++LOAD FOR THE NORMAL CASE, ++COME FOR UPGRADE
  ::
  =/  GAT
    =/  ARM  ?:(=(NEX HOON-VERSION) 'LOAD' 'COME')
    ::  COMPUTE THE TYPE OF THE ARVO.HOON CORE
    ::
    =/  VIP  -:(SLUM COP [-.RAV '+>'])
    ::  COMPUTE THE FORMULA FOR THE UPGRADE GATE
    ::
    =/  FOL  +:(SLUM COP [VIP ARM])
    ::  PRODUCE THE UPGRADE GATE
    ::
    .*(VOC FOL)
  ::  UPGRADE GATE SAMPLE
  ::
  =/  SAM
    :*  OUR
        NOW
        ENY
        ::  TACK A NOTIFICATION ONTO THE PENDING EFFECTS
        ::
        (WELD OVA [`OVUM`[/ %VEGA ~] ~])
        BUD
        (TURN VANES |=([LABEL=@TAS =VANE] [LABEL VASE.VANE]))
    ==
  ::  CALL INTO THE NEW KERNEL
  ::
  =/  OUT  (SLUM GAT SAM)
  ::  ADD TYPES TO THE PRODUCT
  ::
  [((LIST OVUM) -.OUT) +.OUT]
::  +VEER: INSTALL %ZUSE OR A VANE
::
::    IDENTITY IS IN THE SAMPLE SO THE LARVAL STAGE
::    CAN USE THIS AS WELL.
::
++  VEER
  |=  [WHO=SHIP NOW=@DA FAV=CURD]
  =>  .(FAV ((HARD {$VEER LAL/@TA PAX/PATH TXT/@T}) FAV))
  =-  ?:(?=(%| -.RES) ((SLOG P.RES) +>.$) P.RES)
  ^=  RES  %-  MULE  |.
  ?:  =(%$ LAL.FAV)
    ~&  [%TANG PAX.FAV `@P`(MUG TXT.FAV)]
    =+  GEN=(RAIN PAX.FAV TXT.FAV)
    =+  VAX=(SLAP PIT GEN)
    +>.^$(BUD VAX)
  %_    +>.^$
      VANES
    |-  ^+  VANES
    ?~  VANES
      ~&  [%VANE `@TAS`LAL.FAV PAX.FAV `@P`(MUG TXT.FAV)]
      =+  VIN=(VINT WHO LAL.FAV VIL BUD PAX.FAV TXT.FAV)
      ?~  VIN
        VANES
      [[LAL.FAV VANE:U.VIN] VANES]
    ?.  =(LAL.FAV LABEL.I.VANES)
      [I.VANES $(VANES T.VANES)]
    ~&  [%VANE `@TAS`LAL.FAV PAX.FAV `@P`(MUG TXT.FAV)]
    :_  T.VANES
    :-  LABEL.I.VANES
    ~|  [%FAILED-VANE-ACTIVATION NOW LAL.FAV]
    VANE:(RUCK:(VENT WHO LAL.FAV VIL BUD [VASE.VANE.I.VANES *WORM]) PAX.FAV TXT.FAV)
  ==
::
++  WISH                                                ::  EXTERNAL COMPUTE
  |=  TXT/@
  Q:(SLAP BUD (REAM TXT))
--
