Definitions.
L = [a-z|A-Z]
D = [0-9]
H = [0-9|a-f|A-F]
RESERVED_WORDS = constructor|catch|class|debugger|default|delete|export|extends|finally|function|import|in|instanceof|new|return|super|is|throw|try|typeof|void|with|yield|enum|implements|interface|package|private|protected|public|static|yield|await|abstract|native|synchronized|throws|transient|volatil|arguments|get|set
CS = break|case|continue|do|else|for|if|switch|while
VARIABLE_NAMES = const|var|let
LITERALS = null|NaN
OPERATORS = [\=\+\-\*\/\>\<\!\|\&\?\:\~\%]
CLOSING_OPS = [\(\)\[\]\{\}]
ARRAYS = \[|\]

Rules.
\s\s\s\s                                                            : {token, {tab, TokenLine, TokenChars}}.
\s                                                                  : {token, {space, TokenLine, TokenChars}}.
\n                                                                  : {token, {newline, TokenLine, TokenChars}}.
\r                                                                  : {token, {return, TokenLine, TokenChars}}.
\v                                                                  : {token, {verticaltab, TokenLine, TokenChars}}.
\f                                                                  : {token, {formfeed, TokenLine, TokenChars}}.
\t                                                                  : {token, {tabtab, TokenLine, TokenChars}}.


//[^(\r|\n)]*|/\*[^(\r|\n)]\*/                                      : {token, {comment, TokenLine, TokenChars}}.

{RESERVED_WORDS}                                                    : {token, {reservedword, TokenLine, TokenChars}}.
{CS}                                                                : {token, {controlstructure, TokenLine, TokenChars}}.
{VARIABLE_NAMES}                                                    : {token, {variablename, TokenLine, TokenChars}}.
{LITERALS}                                                          : {token, {literal, TokenLine, TokenChars}}.

0(b|B)[0-1]+                                                        : {token, {binary, TokenLine,TokenChars}}.
0(o|O)[0-7]+|0[1-7][0-7]+                                           : {token, {octal, TokenLine,TokenChars}}.
0(x|X){H}+                                                          : {token, {hexadecimal, TokenLine,TokenChars}}.
true|false                                                          : {token, {bool, TokenLine, TokenChars}}.
(\+|-)?{D}+((E|e)?({D}{0-4}))?|(\+|-)?[1-9]{D}*(\_{D}+)+            : {token, {int, TokenLine, TokenChars}}.
(\+|-)?{D}+\.{D}+((E|e)(\+|-)?{D}+)?                                : {token, {float, TokenLine, TokenChars}}.
{OPERATORS}{OPERATORS}*                                             : {token, {operators, TokenLine, TokenChars}}.
{CLOSING_OPS}                                                       : {token, {closingops, TokenLine, TokenChars}}.
{ARRAYS}                                                            : {token, {array, TokenLine, TokenChars}}.
\_*([a-z]|[A-Z]|[0-9])+\_*\:                                        : {token, {key, TokenLine, TokenChars}}.
\`(.*|((\$\{.*})*))\`                                               : {token, {templatestring, TokenLine, TokenChars}}.
this                                                                : {token, {this, TokenLine, TokenChars}}.

\'.*\'|\"[^\"]*\"                                                   : {token, {string, TokenLine, TokenChars}}.

(\_*({L}|{D})+\_*)+                                                 : {token, {identifier, TokenLine, TokenChars}}.        

\,|\.|\;                                                            : {token, {symbols, TokenLine, TokenChars}}.

Erlang code.
