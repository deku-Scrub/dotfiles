" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/bin/fzf

"call vundle#begin()
    "" alternatively, pass a path where Vundle should install plugins
    ""call vundle#begin('~/some/path/here')
"
    "" let Vundle manage Vundle, required
    "Plugin 'VundleVim/Vundle.vim'
    "Plugin 'Valloric/YouCompleteMe'
"
    "" All of your Plugins must be added before the following line
    "call vundle#end()            " required
    "filetype plugin indent on    " required
    "" To ignore plugin indent changes, instead use:
    "filetype plugin on
    ""
    "" Brief help
    "" :PluginList       - lists configured plugins
    "" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    "" :PluginSearch foo - searches for foo; append `!` to refresh local cache
    "" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    ""
    "" see :h vundle for more details or wiki for FAQ
    "" Put your non-Plugin stuff after this line



" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" Path. Directories in which to search for files.
" set path+=~/...

filetype plugin on
" Colors
colorscheme deku_light

" Settings
syntax on
" set number
set hls
set wrap
set linebreak
set breakindent
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set cindent
set ruler
set noignorecase
set nocompatible
set showcmd
set history=50
set showmatch
set ignorecase smartcase
set mouse=a
set belloff=all
" set iskeyword+=-

" Keys
" Nothing: <Nop>
" Escape: <Esc>
" Fx: <Fx>
" Enter/Return: <CR>
" Space: <Space>
" Backspace: <BS>
" Left: <Left>
" Right: <Right>
" Shift: <S->
" Ctrl: <C->
" Home: <Home>
" End: <End>
" Insert: <Insert>
" Tab: <Tab>
" Pagedown: <PageDown>
" PageUp: <PageUp>
" |: <Bar> or \|
" Mappings okay to override: C-HJKL,<BS>,<Space>,HJKL
set nottimeout
set timeoutlen=1000000000
set ttimeoutlen=1000000000
set ttimeout
set timeout

map [[ ?{<CR>o99[{
"map ][ /}<CR>u99]}
map ]] k0[[>/{<CR>
"map [] i$][>?}<CR>

noremap <Space>m :set mouse=a<CR>
noremap <Space>um :set mouse=<CR>
noremap <Space>l :ls<CR>:b<Space>
noremap <Space>sj :split<CR>
noremap <Space>sk :vsplit<CR>
noremap <Space>p :b#<CR>
noremap <Space>c :call Comment(v:false)<CR>
noremap <Space>uc :call Comment(v:true)<CR>
noremap <Space>; :
noremap <Space><Space> :write<CR>:mksession!<CR>

"    q    w    e    r    t    y    u    i    o    p  
"    a    s    d    f    g    h    j    k    l    ;  
"    z    x    c    v    b    n    m    ,    .    /  
"
"    base
"    xxx  i    o    xxx  xxx  xxx  n    k    w    ;  
"    v    y    c    d    c-r  u    h    j    k    g  
"    z    p    r    a    xxx  xxx  b    e    .    /  
"
"    shift
"    xxx  I    O    xxx  xxx  xxx  N    c-b  W    ,  
"    V    Y    C    D    @rpt @U   ^    c-f  $    xxx
"    P    R    A    xxx  xxx  xxx  B    E    %    ?  
"
"    ;
"    xxx  ~    xxx  xxx  xxx  xxx  xxx  #    *    xxx
"    gv   g~   gu   gu   g;   g,   f    t    t    f  
"    xxx  xxx  xxx  xxx  xxx  xxx  g#   g*   xxx  xxx
"
"    ;-spc
"    xxx  xxx  xxx  xxx  xxx  xxx  xxx  gg   xxx  xxx
"    xxx  <    =    >    xxx  xxx  xxx  G    xxx  xxx
"    xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx
"
"    a/s/d/f/;s/;d/;f
"    xxx  _gg  _G   xxx  xxx  xxx  _n   _^   _$   _; 
"    _w   _e   _b   _l   xxx  xxx  _a   _i   _t   _f 
"    xxx  xxx  xxx  _'   xxx  xxx  __   _j   _k   _/ 
"
"    a/s/d/f/;s/;d/;f
"    textblockops
"    xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx
"    _{   _<   _[   _(             _p   _s   _w   _' 
"    xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx
"
"    a-spc/s-spc/d-spc/f-spc/;s-spc/;d-spc/;f-spc
"    xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx
"    _}   _>   _]   _)             _p   _s   _w   _' 
"    xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx  xxx


noremap c <C-w>w
noremap x <C-r>
noremap e b
noremap m e
noremap E B
noremap M E
noremap s c
noremap ss cc
noremap S C
noremap siw ciw
noremap sif ci(
noremap sid ci[
noremap sis ci{
noremap sia ci`
noremap sij ^C
noremap sik cis
noremap sil cip
noremap si; ci'
noremap sip ci"
noremap saw caw
noremap saf ca(
noremap sad ca[
noremap sas ca{
noremap saa ca`
noremap saj ^C
noremap sak cas
noremap sal cap
noremap sa; ca'
noremap sap ca"

nmap <Space>j o<Esc>
nmap <Space>z <C-z>
nmap <Space>o <C-o><SID>
nmap <Space>i <C-i><SID>
nmap <Space>e <C-e><SID>
nmap <Space>y <C-y><SID>
nmap <Space>f <C-f><SID>
nmap <Space>b <C-b><SID>
nn <script> <SID>o <C-o><SID>
nn <script> <SID>i <C-i><SID>
nn <script> <SID>e <C-e><SID>
nn <script> <SID>y <C-y><SID>
nn <script> <SID>f <C-f><SID>
nn <script> <SID>b <C-b><SID>
nmap <SID> <Nop>

"map <Space>q !
"map <Space>w @
"map <Space>e #
"map <Space>r $
"map <Space>t %
"map <Space>y ^
"map <Space>u ~
"map <Space>i *
"map <Space>o {
"map <Space>p }
"
""map <Space>a
""map <Space>s
""map <Space>d
""map <Space>f
""map <Space>g
"map <Space>h <<
"map <Space>j (
"map <Space>k )
"map <Space>l >>
"map <Space>; :
"
""map <Space>z
""map <Space>x
""map <Space>c
""map <Space>v
""map <Space>b :b#<CR>
"map <Space>n =
"map <Space>m `
"map <Space>, '
"map <Space>. "
"map <Space>/ ?
"
"map gt g~
"map gi [I
"map gy gU
"map gu gu

noremap zz ZQ


:map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Function. Must start with capital letter. Call using :call

" Autocommand. When something happens, do something
" autocmd BufNewFile *.cpp read ~/template_cpp.cpp
autocmd BufNewFile,BufRead *.* syntax match Paren /[(){}\[\]]/
autocmd BufNewFile,BufRead *.* syntax match Oper /[!%^&*;:\-+=<>,.]/
autocmd BufNewFile,BufRead *.* syn match dFunction "\zs\(\k\w*\)*\s*\ze("
autocmd BufNewFile,BufRead *.* set tabstop=4
autocmd BufNewFile,BufRead *.* retab 8
source ~/.vim/plugin/snippets.vim

" Commands
" command Name action
" Plugins. See ~/.vim/plugin for global, ~/.vim/ftplugin for file specific
"

" https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

if (len(argv()) == 0) && filereadable('Session.vim')
    source Session.vim
endif

" c-b c-e c-f c-g c-i/tab c-l c-m c-o c-r c-w c-y
" ! @ # $ % ^ * ' " ( ) [ { } , . / ? ; < > = ~ `
" a b c d e f g h i j k l m n o p q r s t u v w x y z
" A B C D E F G   I J K     N O P   R S T   V W     Z
" {dcg~gugUvy}{wetiafghjkl;'bn,/?#$%^(){}}
" cc dd gg yy
" za zf
" ZQ ZZ
" g# g* g' g` g, g;
" ga gf gv
" [I
" 
" .     .     .   . .
" q w e r t y u i o p
" ! @ # $ % ^ ~ * { }
" 
  " .
" a s d f g h j k l ;
          " < ( ) >
" 
" . . . .     .   .
" z x c v b n m , . /
          " = ` ' " ?
" 
" gi = [I
" zz = zq
