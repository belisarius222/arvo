::    CONSOLE FRONT-END
::
::::  /HOON/DOJO/WEB
  ::
/?    310
|%
++  CDNJ  |=(A/TAPE ;SCRIPT(SRC "//CDNJS.CLOUDFLARE.COM/AJAX/LIBS/{A}");)
--
::
::::
  ::
^-  MANX
;MODULE
    =NAV_TITLE   "DOJO"
    =NAV_NO-DPAD  ""
    =NAV_NO-SIBS  ""
  ;SCRIPT(SRC "//CDNJS.CLOUDFLARE.COM/AJAX/LIBS/MOUSETRAP/1.4.6/MOUSETRAP.JS");
  ;STYLE:'''
         #TERM { WIDTH: 100%; }
         #TERM * { MARGIN: 0PX; }
         .MODULE PRE { MARGIN-BOTTOM: 0; }
         '''
  ;DIV#ERR;
  ;DIV#TERM:""
  ;SCRIPT@"/LIB/JS/SOLE.JS";
  ;SOLE(APPL "DOJO");
==
