|%
++  jaco  {x/@ y/@ z/@}                                 ::  jacobian point
++  pont  {x/@ y/@}                                     ::  curve point
--
=/  para                                                ::  curve params
  :*
    p=(sub (bex 256) 0x1.0000.03d1)                     ::  modulo
    a=0                                                 ::  y^3=x^2+ax+b
    b=7
    ^=  g                                               ::  "prime" point
    :*  x=0x79be.667e.f9dc.bbac.55a0.6295.ce87.0b07.
            029b.fcdb.2dce.28d9.59f2.815b.16f8.1798
        y=0x483a.da77.26a3.c465.5da4.fbfc.0e11.08a8.
            fd17.b448.a685.5419.9c47.d08f.fb10.d4b8
    ==
    n=0xffff.ffff.ffff.ffff.ffff.ffff.ffff.fffe.        ::  prime order of g
        baae.dce6.af48.a03b.bfd2.5e8c.d036.4141
  ==
=/  p  ~(. fo p.para)                                   ::  ops mod p
=/  n  ~(. fo n.para)                                   ::  ops mod n
  ::
::::  ecdsa
::
|%
++  priv-to-pub                                         ::  get pub from priv
  |=  prv/@
  ^-  pont
  (mul g.para prv)
::
++  hmc                                                 ::  hmac swap endianness
    |=  {k/@ kl/@ t/@ tl/@}
    ^-  @
    (swap 3 (hml:scr (swap 3 k) kl (swap 3 t) tl))
::
++  make-k                                              ::  deterministic nonce
  |=  {has/@uvI prv/@}
  ^-  @
  =/  v  (fil 3 32 1)
  =/  k  0
  =.  k  (hmc k 32 [+ -]:(taco (can 3 [32 has] [32 prv] [1 0x0] [32 v] ~)))
  =.  v  (hmc k 32 v 32)
  =.  k  (hmc k 32 [+ -]:(taco (can 3 [32 has] [32 prv] [1 0x1] [32 v] ~)))
  =.  v  (hmc k 32 v 32)
  (hmc k 32 v 32)
::
++  ecdsa-raw-sign                                      ::  generate signature
  |=  {has/@uvI prv/@}
  ^-  {v/@ r/@ s/@}
  =/  z  has
  =/  k  (make-k has prv)
  =+  [r y]=(mul g.para k)
  =/  s  (pro.n (inv.n k) (sum.n z (mul.n r prv)))
  =/  big-s  (gte (^mul 2 s) n.para)
  :*  v=(^add 27 (mix (end 0 1 y) ?:(big-s 1 0)))
      r=r
      s=?.(big-s s (sub n.para s))
  ==
::
++  ecdsa-raw-recover                                   ::  get pubkey from sig
  |=  {has/@uvI sig/{v/@ r/@ s/@}}
  ^-  pont
  ?>  ?&((lte 27 v.sig) (lte v.sig 34))
  =/  x  r.sig
  =/  ysq  (sum.p b.para (exp.p 3 x))                   ::  omits A=0
  =/  bet  (exp.p (div +(p.para) 4) ysq)
  =/  y  ?:(=(1 (end 0 1 (mix v.sig bet))) bet (dif.p 0 bet))
  ?>  =(0 (dif.p ysq (pro.p y y)))
  ?<  =(0 (sit.n r.sig))
  ?<  =(0 (sit.n s.sig))
  =/  gz  (mul:jc [x y 1]:g.para (dif.n 0 has))
  =/  xy  (mul:jc [x y 1] s.sig)
  =/  qr  (add:jc gz xy)
  (from:jc (mul:jc qr (inv.n r.sig)))
::
++  test
  |.
  =/  prv  0x792e.ca68.2b89.0b31.3562.47f2.b046.62bf.
             f448.b6bb.19ea.1c8a.b48d.a222.c894.ef9b
  =/  pub
  :*  x=0x2c4a.ab44.7fc5.b593.be6a.2bd1.c54a.2737.
          666c.88e0.dd74.b998.81a5.2532.a1d7.d126
      y=0x9f61.40a0.1a67.19a5.1b49.88a3.8135.af5e.
          de06.72ab.01af.a6b1.18e8.f38b.6616.66ad
  ==
  =/  sig
  :*  v=27
      r=0xc12f.850a.091d.a920.a6fc.c4aa.3dec.58db.
          5e7a.a00c.acd5.1580.6a1a.d8e0.f71f.7fe9
      s=0x1fba.758e.b8c1.d7f3.dec5.040c.3bf3.6176.
          e276.40d1.b87a.f71b.6ec1.3cb2.0361.aa4d
  ==
  =/  k  0xa556.3d27.07d3.333f.d4b7.1bf9.17bf.21a5.
           ec99.3871.01b4.7c2d.7808.bf61.3674.6ef1
  ?>  =((priv-to-pub prv) pub)
  ::
  =/  msg  (fil 3 32 0x35)
  =/  kreal  (make-k msg prv)
  ?>  =(kreal k)
  ~&  %make-k-ok
  ?>  =((ecdsa-raw-sign msg prv) sig)
  ~&  %ecdsa-raw-sign-ok
  =/  rec  (ecdsa-raw-recover msg sig)
  ?>  =(rec pub)
  ~&  %ecdsa-raw-recover-ok
  ~
  ::
::::  jacobian ops
::
++  mul                                                 ::  point x scalar
  |=  {a/pont n/@}
  ^-  pont
  (from:jc (mul:jc (into:jc a) n))
::
++  add                                                 ::  add points
  |=  {a/pont b/pont}
  ^-  pont
  (from:jc (add:jc (into:jc a) (into:jc b)))
::
++  jc                                                  ::  jacobian core
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
  ::
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
  ::
  ++  mul                                               :: jaco x scalar
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
  ::
  ++  from                                              :: jaco -> point
    |=  a/jaco
    ^-  pont
    =/  z  (inv.p z.a)
    [:(pro.p x.a z z) :(pro.p y.a z z z)]
  ::
  ++  into                                              :: point -> jaco
    |=  pont
    ^-  jaco
    [x y z=1]
  --
--
