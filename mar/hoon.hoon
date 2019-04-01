::
::::  /HOON/HOON/MAR
  ::
/?    310
::
=,  EYRE
|_  OWN/@T
::
++  GROW                                                ::  CONVERT TO
  |%
  ++  MIME  `^MIME`[/TEXT/X-HOON (AS-OCTS:MIMES:HTML OWN)] ::  CONVERT TO %MIME
  ++  ELEM                                              ::  CONVERT TO %HTML
    ;DIV:PRE(URB_CODEMIRROR "", MODE "HOON"):"{(TRIP OWN)}"
    :: =+  GEN-ID="SRC-{<`@UI`(MUG OWN)>}"
    :: ;DIV
    ::   ;TEXTAREA(ID "{GEN-ID}"):"{(TRIP OWN)}"
    ::   ;SCRIPT:"""
    ::           CODEMIRROR.FROMTEXTAREA(
    ::             WINDOW[{<GEN-ID>}],
    ::             \{LINENUMBERS:TRUE, READONLY:TRUE}
    ::           )
    ::           """
    :: ==
  ++  HYMN
    :: ;HTML:(HEAD:TITLE:"SOURCE" "+{ELEM}")
    ;HTML
      ;HEAD
        ;TITLE:"SOURCE"
        ;SCRIPT@"//CDNJS.CLOUDFLARE.COM/AJAX/LIBS/CODEMIRROR/4.3.0/CODEMIRROR.JS";
        ;SCRIPT@"/LIB/SYNTAX/HOON.JS";
        ;LINK(REL "STYLESHEET", HREF "//CDNJS.CLOUDFLARE.COM/AJAX/LIBS/".
          "CODEMIRROR/4.3.0/CODEMIRROR.MIN.CSS");
        ;LINK/"/LIB/SYNTAX/CODEMIRROR.CSS"(REL "STYLESHEET");
      ==
      ;BODY
        ;TEXTAREA#SRC:"{(TRIP OWN)}"
        ;SCRIPT:'CODEMIRROR.FROMTEXTAREA(SRC, {LINENUMBERS:TRUE, READONLY:TRUE})'
      ==
    ==
  ++  TXT
    (TO-WAIN:FORMAT OWN)
  --
++  GRAB
  |%                                            ::  CONVERT FROM
  ++  MIME  |=({P/MITE Q/OCTS} Q.Q)
  ++  NOUN  @T                                  ::  CLAM FROM %NOUN
  ++  TXT   OF-WAIN:FORMAT
  --
++  GRAD  %TXT
--
