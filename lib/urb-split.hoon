::
::::  /HOON/URB-SPLIT/LIB
  ::
/?    310
|=  {DEP/@UVH URB/MANX}  ^-  {HED/{@UVH MARL} BOD/{@UVH MARL}}
~|  [%MALFORMED-URB URB]  :: XX TYPES
?>  ?=({{$HTML ~} {{$HEAD ~} *} {{$BODY ~} *} ~} URB)
=+  `{{$HTML ~} {{$HEAD ~} HED/MARL} {{$BODY ~} BOD/MARL} ~}`URB
:-  [DEP HED]                         :: ASSUME ALL DEPENDENCIES ARE HARD
[0V0 BOD]
