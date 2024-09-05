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

source $VIMRUNTIME/menu.vim
runtime ftplugin/man.vim
filetype on
filetype plugin on
colorscheme deku_light
syntax enable
packadd! matchit
filetype plugin indent on

set nocompatible
let &path = ",," . &path . ",src/**," . system("dirname $(git ls-files) | sort | uniq | sed -r 's/([, ])/\\\1/g' | tr '\n' ',' | sed -r 's/,$//'")
set wildignorecase
set nowildmenu
"set wildoptions=tagfile
set wildmode=longest:list,full
set wildignore+=**/*.pyc,**/*.o,**/*.class,**/*.jar,**/pylib/**/*,**/dist/**/*,.git/**/*,**/*.gz,**/*.tar,**/*.zip,**/*.bz2
set matchpairs+=<:>
set noincsearch
set noautoread
set formatoptions=tcqj
set nohidden
set fsync
set joinspaces
set startofline
"set switchbuf=
"set shortmess-=SF
set hls
set wrap
set linebreak
set breakindent
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set cindent
set noautoread
set ruler
set showcmd
set history=10000
set showmatch
set ignorecase smartcase
set grepprg=grep\ -nHIEi
set mouse=a
set belloff=all
" set iskeyword+=-
set nottimeout
set timeoutlen=1000000000
set ttimeoutlen=1000000000
set ttimeout
set timeout
set shortmess-=S
let g:deku_n_jobs = 1
let g:deku_grep_flags = ''

" space:
" XweXXyuiop
" asdfXXjXl;
" zXXXbXmXXX
noremap <unique> <Space>ww <C-g>
map <Space>e <C-e><SID>
map <Space>y <C-y><SID>
noremap <Space>um :set mouse=<CR>
noremap <Space>uc :call Comment(v:true)<CR>
map <Space>i <C-i><SID>
map <Space>o <C-o><SID>
map <Space>p :b#<CR>
nnoremap <unique> <Space>aa a""<ESC>
nnoremap <unique> <Space>as a{}<ESC>
nnoremap <unique> <Space>ad a[0]<ESC>h
nnoremap <unique> <Space>af a()<ESC>
noremap <unique> <Space>ai gU
noremap <unique> <Space>ao gu
noremap <unique> <Space>aj <
noremap <unique> <Space>al >
noremap <unique> <Space>ak =
nnoremap <unique> <Space>a; a''<ESC>
nnoremap <unique> <Space>av a<A><ESC>h
noremap <unique> <Space>si :s/\v
" Right hand is exact search (like `*`).  Left is substring search (like `g*`).
" https://vi.stackexchange.com/questions/39954/how-to-grep-only-the-contents-of-the-current-file
noremap <unique> <Space>ss :call SearchTags('<C-R><C-W>')<CR>
noremap <unique> <Space>sd :call SearchFiles('<C-R><C-W>')<CR>
noremap <unique> <Space>sf :call SearchBuffer('<C-R><C-W>')<CR>
noremap <unique> <Space>sj :call SearchBuffer('\b<C-R><C-W>\b')<CR>
noremap <unique> <Space>sk :call SearchFiles('\b<C-R><C-W>\b')<CR>
noremap <unique> <Space>sl :call SearchTags('/<C-R><C-W>')<CR>
noremap <unique> <Space>sm :SearchBuffer<Space>
noremap <unique> <Space>s, :SearchFiles<Space>
noremap <unique> <Space>s. :SearchTags<Space>
" https://www.reddit.com/r/vim/comments/8mrwu3/search_in_part_of_file/
noremap <expr> <Space>s/ '/\%(\%>'.(line('w0')-1).'l\%<'.(line('w$')+1).'l\)\&\v'
noremap <Space>d :FindFuzzySubstring<Space>
map <Space>f <C-f><SID>
noremap <Space>j o<Esc>
noremap <Space>l :ls<CR>:b<Space>
noremap <Space>; :<C-f>
noremap <Space>z <C-z>
noremap <Space>c :call Comment(v:false)<CR>
map <Space>b <C-b><SID>
noremap <Space>m :set mouse=a<CR>
noremap <Space><Space> :write<CR>:mksession!<CR>
" The leader is sticky for these keys.
noremap <script> <SID>o <C-o><SID>
noremap <script> <SID>i <C-i><SID>
noremap <script> <SID>e <C-e><SID>
noremap <script> <SID>y <C-y><SID>
noremap <script> <SID>f <C-f><SID>
noremap <script> <SID>b <C-b><SID>
noremap <SID> <Nop>

" Look here for navigation based on tree-sitter:
"   https://github.com/nvim-treesitter/nvim-treesitter/tree/master/queries
map [[ ?{<CR>o99[{
"map ][ /}<CR>u99]}
map ]] k0[[>/{<CR>
"map [] i$][>?}<CR>
"
nnoremap / /\v
noremap zz ZQ
noremap c <C-w>w
noremap Cc :split<CR>
noremap Cv <C-w>_
noremap Cf <C-w>=
noremap x <C-r>
noremap s c
noremap S C
omap af a(
omap ad a[
omap as a{
omap aa a"
omap a; a'
omap av a<
omap ak ap
omap aj as
omap if i(
omap id i[
omap is i{
omap ia i"
omap i; i'
omap iv i<
omap ik ip
omap ij is

" includeexpr
":djump
"quit instead of c-z in vim and w3m (save undo history for vim)
"lz haskell
"
" e: edit, E: edit+motion, m: motion, X: misc, other: misc frequent
" Xmmem yeeee poiaX mgbwe
" eEEmm mmmmm yvsdX hjkln
" zXXvm mmmem zXurX ft,;/

" https://www.reddit.com/r/vim/comments/232jsu/tab_for_autocompletion/
inoremap <expr> <Tab> getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible()
      \ ? '<C-N>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() \|\| getline('.')[col('.')-2] !~ '^\s\?$'
      \ ? '<C-P>' : '<Tab>'
autocmd CmdwinEnter * inoremap <expr> <buffer> <Tab>
      \ getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible()
      \ ? '<C-X><C-V>' : '<Tab>'


:map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Function. Must start with capital letter. Call using :call

" Autocommand. When something happens, do something
" autocmd BufNewFile *.cpp read ~/template_cpp.cpp
autocmd BufNewFile,BufRead *.* syntax match Paren /[(){}\[\]]/
autocmd BufNewFile,BufRead *.* syntax match Oper /[!%^&*;:\-+=<>,.]/
autocmd BufNewFile,BufRead *.* syn match dFunction "\zs\(\k\w*\)*\s*\ze("
autocmd BufNewFile,BufRead *.* set tabstop=4
autocmd BufNewFile,BufRead *.* call Retab()
source ~/.vim/plugin/snippets.vim

function! Retab()
    if &modifiable
        retab 8
    endif
endfunc

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

" Select file to edit with an interactive file chooser.
let g:output = ''
function! Ccb(channel)
    exec "edit " . g:output
endfunc
function! Tapi_F(bufnum, msg)
    let g:output = a:msg
endfunc
function! F()
    " printf '\e]51;["call", "Tapi_F", "%s"]\a' "${A}"
    let output = term_start('bash /tmp/a.sh', {'term_finish': 'close', 'close_cb': 'Ccb'})
endfunc

" Fuzzy find with substrings.
" The query `x y z` searches `*x*/**/*y*/**/*z*`.
function FindFuzzySubstring(...)
    let l:s = a:000->mapnew({idx, val -> "*" . val . "*"})
    let l:s = join(l:s, '/**/')
    call feedkeys(':find ' . l:s . "\<Tab>", 't')
endfunction
command -nargs=+ FindFuzzySubstring call FindFuzzySubstring(<f-args>)

function SearchBuffer(pattern)
    exec ':silent grep! ' . "'" . a:pattern . "' " . expand('%')
    :cw
endfunction
command -nargs=+ SearchBuffer call SearchBuffer(<q-args>)

function SearchFiles(pattern)
    let l:cmd = 'git ls-files | parallel -j' . g:deku_n_jobs . ' -N10000 "' . &grepprg . " --include='*." . expand('%:e') . "' '" . a:pattern . "' " . '"'
    if !empty(g:deku_grep_flags)
        let l:cmd = 'git ls-files | parallel -j' . g:deku_n_jobs . ' -N10000 "' . &grepprg . ' ' . g:deku_grep_flags . " '" . a:pattern . "' " . '"'
    endif
    let l:matches = system(cmd)
    let l:matches = split(l:matches, '\n')
    let l:matches = map(l:matches, {_, m -> split(m, ':')})
    let l:matches = map(l:matches, {_, m -> {'filename': m[0], 'lnum': m[1], 'text': join(m[2:], ":")}})
    call setqflist([], 'r', {'items': l:matches, 'title': cmd})
    :cw
endfunction
command -nargs=+ SearchFiles call SearchFiles(<q-args>)

function SearchTags(pattern)
    exec ':ltag ' . a:pattern
    exec "normal \<C-o>"
    lopen
endfunction
command -nargs=+ SearchTags call SearchTags(<q-args>)

function Comment(uncomment)
    let l:file_ext = expand('%:e')
    if empty(l:file_ext)
        let l:file_ext = &ft
    endif
    if has_key(g:file_ext_to_comment, l:file_ext)
        let l:comment = g:file_ext_to_comment[l:file_ext]
        let l:sep = l:comment =~ '/' ? '#' : '/'
        if a:uncomment
            exec printf('s%s\v^(\s*)%s%s\1%s', l:sep, l:comment, l:sep, l:sep)
        else
            exec printf('s%s\v^(\s*)%s\1%s%s', l:sep, l:sep, l:comment, l:sep)
        endif
    endif
endfunction

function GetTags(kinds)
    let l:kinds = a:kinds
    if empty(l:kinds)
        let l:kinds = "f"
    endif
    let l:suffix = expand('%:e')
    if empty(l:suffix)
        let l:suffix = &ft
    endif
    let l:cmd = 'ctags --excmd=number --kinds-' . l:suffix . '=' . l:kinds . ' -f- ' . expand("%")
    let l:matches = system(cmd)
    let l:matches = split(l:matches, '\n')
    let l:matches = map(l:matches, {_, m -> split(m, '\t')})
    let l:matches = map(l:matches, {_, m -> {'filename': m[1], 'lnum': str2nr(split(m[2], ';"')[0]), 'type': m[3]}})
    let l:matches = map(l:matches, {_, m -> extend(m, {'text': getline(m["lnum"])})})
    call setqflist([], 'r', {'items': l:matches, 'title': cmd})
    :cw
endfunction
command -nargs=+ GetTags call GetTags(<q-args>)
