" The colors correspond to those displayed by running:
"   for COLOR in {1..255}; do echo -en "\e[38;5;${COLOR}m${COLOR} "; done; echo;
"
" Init
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name="deku_light"
set background=dark
"
"" General Colors
" 1
" 4
" 7
" 13
" 36
" 40
" 52
" 58
hi Normal ctermfg=16 ctermbg=15
hi NonText ctermfg=16
hi Underlined ctermfg=16
hi Ignore ctermfg=16
hi Directory ctermfg=16 ctermbg=15 cterm=bold

hi Comment ctermfg=16 ctermbg=7

" 136
hi String ctermfg=16 cterm=italic
hi Character ctermfg=16
hi Special ctermfg=16
hi Constant ctermfg=16
hi SpecialKey ctermfg=16
hi Identifier ctermfg=16
hi Function ctermfg=16 cterm=bold

hi Number ctermfg=16
hi Boolean ctermfg=16
hi Float ctermfg=16

hi Keyword ctermfg=16 cterm=bold
hi Exception ctermfg=16 cterm=bold
hi Conditional ctermfg=16 cterm=bold
hi Repeat ctermfg=16 cterm=bold
hi Label ctermfg=16 cterm=bold
hi Statement ctermfg=16 cterm=bold
hi PreProc ctermfg=16
hi MatchParen ctermbg=8 ctermfg=7
hi Operator ctermfg=16 cterm=bold
hi Type ctermfg=16 cterm=bold
hi PreProc ctermfg=16 cterm=bold

hi Search ctermbg=8 ctermfg=15
hi IncSearch ctermbg=8 ctermfg=15 term=None cterm=None
hi MoreMsg ctermbg=16 ctermfg=7
hi LineNr ctermbg=15 ctermfg=16
hi CursorLineNr ctermbg=7 ctermfg=16 term=None cterm=None
hi Question ctermbg=15 ctermfg=16
hi ErrorMsg ctermbg=15 ctermfg=16
hi WarningMsg ctermbg=15 ctermfg=16
hi StatusLine ctermbg=8 ctermfg=15 term=None cterm=None
hi StatusLineNC ctermbg=16 ctermfg=7 term=None cterm=None
hi Title ctermfg=16 cterm=underline term=None
hi VertSplit ctermbg=8 ctermfg=15 term=None cterm=None
hi Visual ctermbg=8 ctermfg=7 term=None
hi WildMenu ctermbg=7 ctermfg=15 term=None
hi Folded ctermbg=8 ctermfg=15 term=None
hi FoldColumn ctermbg=8 ctermfg=15 term=None

hi Error ctermfg=16 ctermbg=15 cterm=underline,italic
hi Todo ctermbg=7 ctermfg=16 cterm=underline,bold

" https://stackoverflow.com/questions/29192124/how-to-color-function-call-in-vim-syntax-highlighting
syn match dFunction "\zs\(\k\w*\)*\s*\ze("
hi link dFunction Function
"syn match Op "[-+/*%~!^&|<>=]"
"hi Op cterm=underline
