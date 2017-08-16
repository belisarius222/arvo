|%
++  jaco  {x/@ y/@ z/@}                                 ::  jacobian point
++  pont  {x/@ y/@}                                     ::  curve point
--
=/  para
  :*
    p=(sub (bex 256) 0x1.0000.03d1)
    a=0
    b=7
    ^=  g
    :*  x=0x79be.667e.f9dc.bbac.55a0.6295.ce87.0b07.
            029b.fcdb.2dce.28d9.59f2.815b.16f8.1798
        y=0x483a.da77.26a3.c465.5da4.fbfc.0e11.08a8.
            fd17.b448.a685.5419.9c47.d08f.fb10.d4b8
    ==
    n=0xffff.ffff.ffff.ffff.ffff.ffff.ffff.fffe.
        baae.dce6.af48.a03b.bfd2.5e8c.d036.4141
  ==
=/  p  ~(. fo p.para)
|%
++  priv-to-pub
  |=  prv/@
  ^-  pont
  (mul g.para prv)
++  make-k
  |=  {has/@uvI prv/@}
  ^-  @
  =/  v  (fil 3 32 1)
  =/  k  (hml:scr 0 32 [+ -]:(taco (can 3 [32 v] [1 0x0] [32 has] [32 prv] ~)))
  =.  v  (hmc:scr k v)
  =.  k  (hmc:scr k (can 3 [32 v] [1 0x1] [32 has] [32 prv] ~))
  (hmc:scr k (hmc:scr k v))  ::  REVIEW double hash?
++  ecdsa-raw-sign
  |=  {has/@uvI prv/@}
  ^-  {v/@ r/@ s/@}
  =/  z  has
  =/  k  (make-k has prv)
  =+  [r y]=(mul g.para k)
  =/  n  ~(. fo n.para)
  =/  s  (pro.n (inv.n k) (sum.n z (mul.n r prv)))
  =/  big-s  (gte (^mul 2 s) n.para)
  :*  v=(^add 27 (mix (end 0 1 y) ?:(big-s 1 0)))
      r=r
      s=?.(big-s s (sub n.para s))
  ==
  ::
::::
::
++  mul                                                 ::  multiply points
  |=  {a/pont n/@}
  ^-  pont
  (from:jc (mul:jc (into:jc a) n))
++  add                                                 ::  add points
  |=  {a/pont b/pont}
  ^-  pont
  (from:jc (add:jc (into:jc a) (into:jc b)))
++  jc                                                  ::  jacobian ops
  |%
  ++  add                                               ::  addition
    |=  {a/jaco b/jaco}
    ^-  jaco
    ?:  =(0 y.a)  b
    ?:  =(0 y.b)  a
    =/  u1  :(pro.p x.a z.b z.b)
    =/  u2  :(pro.p x.b z.a z.a)
    =/  s1  :(pro.p y.a z.b z.b z.b)
    =/  s2  :(pro.p y.b z.a z.a z.a)
    ?:  =(u1 u2)
      ?.  =(s1 s2)
        [0 0 1]
      (dub a)
    =/  h  (dif.p u2 u1)
    =/  r  (dif.p s2 s1)
    =/  h2  (pro.p h h)
    =/  h3  (pro.p h2 h)
    =/  u1h2  (pro.p u1 h2)
    =/  nx  (dif.p (pro.p r r) :(sum.p h3 u1h2 u1h2))
    =/  ny  (dif.p (pro.p r (dif.p u1h2 nx)) (pro.p s1 h3))
    =/  nz  :(pro.p h z.a z.b)
    [nx ny nz]
  ++  dub                                               ::  double
    |=  a/jaco
    ^-  jaco
    ?:  =(0 y.a)
      [0 0 0]
    =/  ysq  (pro.p y.a y.a)
    =/  s  :(pro.p 4 x.a ysq)
    =/  m  :(pro.p 3 x.a x.a)                           ::  omits A=0
    =/  nx  (dif.p (pro.p m m) (sum.p s s))
    =/  ny  (dif.p (pro.p m (dif.p s nx)) :(pro.p 8 ysq ysq))
    =/  nz  :(pro.p 2 y.a z.a)
    [nx ny nz]
  ++  mul                                               :: multiply by scalar
    |=  {a/jaco n/@}
    ^-  jaco
    ?:  =(0 y.a)
      [0 0 1]
    ?:  =(0 n)
      [0 0 1]
    ?:  =(1 n)
      a
    ?:  (gte n n.para)
      $(n (mod n n.para))
    ?:  =(0 (mod n 2))
      (dub $(n (div n 2)))
    (add a (dub $(n (div n 2))))
  ++  from                                              :: to point
    |=  a/jaco
    ^-  pont
    =/  z  (inv.p z.a)
    [:(pro.p x.a z z) :(pro.p y.a z z z)]
  ++  into                                              :: from point
    |=  pont
    ^-  jaco
    [x y z=1]
  --
--
