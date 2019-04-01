::  USERSPACE IMPLEMENTATION OF OLD  /_  @FOO BEHAVIOR
::                                                      ::  ::
::::  /HOON/REKEY/LIB                                   ::  ::
  ::                                                    ::  ::
/?  310                                                 ::  VERSION
::                                                      ::  ::
::::                                                    ::  ::
  ::                                                    ::  ::
=,  WIRED
|*  TYP=@TAS
|*  INP=(MAP KNOT *)  ^-  (MAP (ODO:RAID TYP) _(~(GOT BY INP)))
=>  .(INP `(MAP KNOT _(~(GOT BY INP)))`INP)
%-  MALT
%+  MURN  ~(TAP BY INP)
|*  [A=KNOT B=*]  ^-  (UNIT [(ODO:RAID TYP) _B])
(BOTH (SLAW TYP A) `B)
