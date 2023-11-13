" The colors correspond to those displayed by running:
"   for COLOR in {1..255}; do echo -en "\e[38;5;${COLOR}m${COLOR} "; done; echo;
"
" Init
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name="deku"
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
hi Normal ctermfg=252
hi NonText ctermfg=252
hi Underlined ctermfg=252
hi Ignore ctermfg=252
hi Identifier ctermfg=252
hi Type ctermfg=252

hi Comment ctermfg=100

" 136
hi String ctermfg=172
hi Character ctermfg=172
hi Special ctermfg=172

hi Number ctermfg=142
hi Boolean ctermfg=142
hi Float ctermfg=142

hi SpecialKey ctermfg=5

hi Keyword ctermfg=110
hi Statement ctermfg=110
hi PreProc ctermfg=110
hi MatchParen ctermbg=110 ctermfg=4
hi Operator ctermfg=110

hi Error ctermbg=none ctermfg=1
hi ErrorMsg ctermbg=1 ctermfg=7
hi Todo ctermbg=none ctermfg=1

hi Search ctermbg=136 ctermfg=4
