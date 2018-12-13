!:
::  %behn, just a timer
::
!?  164
::
=,  behn
|=  pit=vase
=>  |%
    +$  move  [p=duct q=(wind note:able gift:able)]
    +$  sign  ~
    ::
    +$  behn-state
      $:  timers=(list timer)
          unix-duct=duct
          next-wake=(unit @da)
      ==
    ::
    +$  timer  [date=@da =duct]
    --
::
=|  behn-state
=*  state  -
::
|=  [our=ship now=@da eny=@uvJ ski=sley]                ::  current invocation
::
=*  behn-gate  .
=|  moves=(list move)
::
^?
|%                                                      ::  poke+peek pattern
++  call                                                ::  handle request
  |=  $:  hen=duct
          type=*
          wrapped-task=(hobo task:able)
      ==
  ^+  [moves behn-gate]
  ::
  =/  =task:able
    ?.  ?=(%soft -.wrapped-task)
      wrapped-task
    ((hard task:able) p.wrapped-task)
  ::
  |^  =<  [moves behn-gate]
      ::
      ?-    -.task
          ::  %crud: error report; hand off to %dill to be printed
          ::
          %crud
        (emit [hen %slip %d %flog task])
      ::
          ::  %born: handle urbit restart
          ::
          %born
        ::  store this duct for setting unix wakeup timers
        ::
        =.  unix-duct  hen
        ::  process any elapsed timers, then clear and reset next unix wakeup
        ::
        =>(notify-clients set-doze(next-wake ~))
      ::
          ::  %rest: cancel a timer, resetting :next-wake if needed
          ::
          %rest
        =.  timers  (unset-timer [date=p.task duct=hen])
        set-doze
      ::
          ::  %wait: set a new timer
          ::
          %wait
        =/  =timer  [date=p.task duct=hen]
        ::  process elapsed timers first to maintain sort order
        ::
        =>  .(self notify-clients)
        ::  set the new timer, then adjust :next-wake if needed
        ::
        =.  timers  (set-timer timer)
        set-doze
      ::
          ::  %wake: unix says wake up; notify clients and set next wakeup
          ::
          %wake
        =>(notify-clients set-doze(next-wake ~))
      ::
          ::  %wegh: produce memory usage report for |mass
          ::
          %wegh
        (emit [hen %give %mass %behn %| [%timers %& timers]~])
      ==
  ::  +set-timer: set a timer, maintaining the sort order of the :timers list
  ::
  ++  set-timer
    |=  t=timer
    ^+  timers
    ::
    ?~  timers
      ~[t]
    ::  timers at the same date form a fifo queue
    ::
    ?:  (lth date.t date.i.timers)
      [t timers]
    ::
    [i.timers $(timers t.timers)]
  ::  +unset-timer: cancel a timer; if it already elapsed, no-op
  ::
  ++  unset-timer
    |=  t=timer
    ^+  timers
    ::  if we don't have this timer, no-op; for debugging, add a printf here
    ::
    ?~  timers
      ~
    ?:  =(i.timers t)
      t.timers
    ::
    [i.timers $(timers t.timers)]
  ::  +notify-clients: wake up vanes whose timers have elapsed
  ::
  ++  notify-clients
    |-  ^+  self
    ::
    ?~  timers
      self
    ?:  (gth date.i.timers now)
      self
    ::
    $(timers t.timers, self (emit [duct.i.timers %give %wake ~]))
  ::  +set-doze: set or unset a unix timer to wake us when next timer elapses
  ::
  ++  set-doze
    ^+  self
    ::  if no timers, cancel existing unix wakeup timer or no-op
    ::
    ?~  timers
      ::
      ?~  next-wake
        self
      (doze ~)
    ::  if :next-wake is in the past or not soon enough, reset it
    ::
    ?^  next-wake
      ::
      ?:  &((gte date.i.timers u.next-wake) (lte now u.next-wake))
        self
      (doze `date.i.timers)
    ::  there was no unix wakeup timer; set one
    ::
    (doze `date.i.timers)
  ::  +doze: emit a move to ask unix to wake us at :u.next or never
  ::
  ++  doze
    |=  next=(unit @da)
    ^+  self
    ::
    =.  next-wake  next
    (emit [unix-duct %give %doze next])
  ::  +emit: emit a move, producing self
  ::
  ++  emit  |=(=move self(moves [move moves]))
  ::  +self: the |^ core in +call
  ::
  ++  self  .
  --
::
++  load
  |=  old=*
  ^+  behn-gate
  ::
  ?^  new=((soft behn-state) old)
    ::
    ~&  %behn-load-new
    behn-gate(state u.new)
  ::
  ~&  %behn-load-wipe
  behn-gate(state *behn-state)
::  +scry: view timer state
::
::    TODO: not referentially transparent w.r.t. elapsed timers,
::    which might or might not show up in the product
::
++  scry
  |=  [fur=(unit (set monk)) ren=@tas why=shop syd=desk lot=coin tyl=path]
  ^-  (unit (unit cage))
  ::
  ?.  ?=(%& -.why)
    ~
  [~ ~ %tank !>(>timers<)]
::
++  stay  state
++  take                                                ::  process move
  |=  [tea=wire hen=duct hin=(hypo sign)]
  ^+  [moves behn-gate]
  ~|  %behn-take-not-implemented
  !!
--
