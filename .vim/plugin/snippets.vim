if exists("g:file_ext_to_snippet_map")
    finish
endif






noremap <unique> <Space>sed :s/\v
noremap <unique> <Space>sd *
noremap <unique> <Space>su #
noremap <unique> <Space>ssd g*
noremap <unique> <Space>ssu g#
noremap <unique> <Space>ku gU
noremap <unique> <Space>kd gu
noremap <unique> <Space>kk g~
noremap <unique> <Space>iu <
noremap <unique> <Space>io >
noremap <unique> <Space>ii =
noremap <unique> <Space>man K
noremap <unique> <Space>ww <C-g>
noremap <unique> <Space>ad a[0]<ESC>h
noremap <unique> <Space>av a<A><ESC>h
noremap <unique> <Space>as a{}<ESC>
noremap <unique> <Space>af a()<ESC>
noremap <unique> <Space>a; a''<ESC>
noremap <unique> <Space>aa a""<ESC>
noremap <unique> <Space>o o<ESC>
noremap <unique> <Space>j :join<CR>
noremap <unique> K <C-y>
noremap <unique> J <C-e>
noremap <unique> H ^
noremap <unique> L $

" <unique> Namespaces.
iabbr <unique> sd <C-R>=PrintSnippet('sd')<CR>

" <unique> Types.
iabbr <unique> ar <C-R>=PrintSnippet('ar')<CR>
iabbr <unique> are <C-R>=PrintSnippet('ae')<CR>
iabbr <unique> vv <C-R>=PrintSnippet('vv')<CR>
iabbr <unique> ve <C-R>=PrintSnippet('ve')<CR>
iabbr <unique> se <C-R>=PrintSnippet('se')<CR>
iabbr <unique> seq <C-R>=PrintSnippet('seq')<CR>
iabbr <unique> ma <C-R>=PrintSnippet('ma')<CR>
iabbr <unique> mae <C-R>=PrintSnippet('mae')<CR>
iabbr <unique> qe <C-R>=PrintSnippet('qe')<CR>
iabbr <unique> lste_ <C-R>=PrintSnippet('lste')<CR>
iabbr <unique> hpe_ <C-R>=PrintSnippet('hpe')<CR>
iabbr <unique> sl <C-R>=PrintSnippet('sl')<CR>
iabbr <unique> ss <C-R>=PrintSnippet('ss')<CR>
iabbr <unique> ch <C-R>=PrintSnippet('ch')<CR>
iabbr <unique> mls <C-R>=PrintSnippet('mls')<CR>
iabbr <unique> ssf <C-R>=PrintSnippet('ssf')<CR>
iabbr <unique> mv <C-R>=PrintSnippet('mv')<CR>
iabbr <unique> tu <C-R>=PrintSnippet('tu')<CR>
iabbr <unique> tue <C-R>=PrintSnippet('tue')<CR>

" <unique> Conditionals.
iabbr <unique> elif <C-R>=PrintSnippet('elif')<CR>
iabbr <unique> iff <C-R>=PrintSnippet('iff')<CR>
iabbr <unique> ife <C-R>=PrintSnippet('ife')<CR>
iabbr <unique> sw <C-R>=PrintSnippet('sw')<CR>
iabbr <unique> swc <C-R>=PrintSnippet('swc')<CR>
iabbr <unique> ter <C-R>=PrintSnippet('ter')<CR>

" <unique> Loops.
iabbr <unique> fl <C-R>=PrintSnippet('fl')<CR>
iabbr <unique> fel <C-R>=PrintSnippet('fel')<CR>
iabbr <unique> wl <C-R>=PrintSnippet('wl')<CR>
iabbr <unique> dwl <C-R>=PrintSnippet('dwl')<CR>

" <unique> Printing.
iabbr <unique> co <C-R>=PrintSnippet('co')<CR>
iabbr <unique> ci <C-R>=PrintSnippet('ci')<CR>
iabbr <unique> ce <C-R>=PrintSnippet('ce')<CR>

" <unique> Functions.
iabbr <unique> fs <C-R>=PrintSnippet('fs')<CR>
iabbr <unique> fme <C-R>=PrintSnippet('fme')<CR>
"iabbr <unique> abm_ <C-R>=PrintSnippet('abm')<CR>
iabbr <unique> lam <C-R>=PrintSnippet('lam')<CR>
iabbr <unique> fx <C-R>=PrintSnippet('fx')<CR>
iabbr <unique> fma <C-R>=PrintSnippet('fma')<CR>
"iabbr <unique> sz <C-R>=PrintSnippet('sz')<CR>
" benchmark
iabbr <unique> bm <C-R>=PrintSnippet('bm')<CR>

" <unique> Classes.
iabbr <unique> st <C-R>=PrintSnippet('st')<CR>
iabbr <unique> cl <C-R>=PrintSnippet('cl')<CR>
iabbr <unique> scl <C-R>=PrintSnippet('scl')<CR>
"iabbr <unique> abc <C-R>=PrintSnippet('abc')<CR>
"iabbr <unique> inter_ <C-R>=PrintSnippet('inter')<CR>

" <unique> Error handling.
iabbr <unique> tr <C-R>=PrintSnippet('tr')<CR>
iabbr <unique> ca <C-R>=PrintSnippet('ca')<CR>
iabbr <unique> fi <C-R>=PrintSnippet('fi')<CR>
iabbr <unique> wi <C-R>=PrintSnippet('wi')<CR>

" <unique> Logical.
iabbr <unique> lt <C-R>=PrintSnippet('lt')<CR>
iabbr <unique> gt <C-R>=PrintSnippet('gt')<CR>
iabbr <unique> leq <C-R>=PrintSnippet('leq')<CR>
iabbr <unique> geq <C-R>=PrintSnippet('geq')<CR>
iabbr <unique> le <C-R>=PrintSnippet('le')<CR>
iabbr <unique> ne <C-R>=PrintSnippet('ne')<CR>
iabbr <unique> nn <C-R>=PrintSnippet('nn')<CR>
iabbr <unique> aa <C-R>=PrintSnippet('aa')<CR>
iabbr <unique> oo <C-R>=PrintSnippet('oo')<CR>
iabbr <unique> xx <C-R>=PrintSnippet('xx')<CR>
iabbr <unique> pa <C-R>=PrintSnippet('pa')<CR>
iabbr <unique> in_ <C-R>=PrintSnippet('in')<CR>
iabbr <unique> isa <BS><C-R>=PrintSnippet('isa')<CR>
iabbr <unique> ise <C-R>=PrintSnippet('ise')<CR>

" <unique> Bitwise.
iabbr <unique> llt <C-R>=PrintSnippet('llt')<CR>
iabbr <unique> ggt <C-R>=PrintSnippet('ggt')<CR>
iabbr <unique> nnn <C-R>=PrintSnippet('nnn')<CR>
iabbr <unique> aaa <C-R>=PrintSnippet('aaa')<CR>
iabbr <unique> ooo <C-R>=PrintSnippet('ooo')<CR>
iabbr <unique> xxx <C-R>=PrintSnippet('xxx')<CR>

" <unique> Mathematical.
iabbr <unique> ee <C-R>=PrintSnippet('ee')<CR>
"iabbr <unique> asg <C-R>=PrintSnippet('asg')<CR>
iabbr <unique> pp <C-R>=PrintSnippet('pp')<CR>
iabbr <unique> pe <C-R>=PrintSnippet('pe')<CR>
iabbr <unique> mi <C-R>=PrintSnippet('mi')<CR>
iabbr <unique> mie <C-R>=PrintSnippet('mie')<CR>
iabbr <unique> tt <C-R>=PrintSnippet('tt')<CR>
iabbr <unique> dd <C-R>=PrintSnippet('dd')<CR>
iabbr <unique> ttt <C-R>=PrintSnippet('ttt')<CR>
iabbr <unique> mod <C-R>=PrintSnippet('mod')<CR>

" <unique> Imports.
iabbr <unique> im <C-R>=PrintSnippet('im')<CR>
iabbr <unique> imc <C-R>=PrintSnippet('imc')<CR>

" <unique> Comments.
"iabbr <unique> com_ <C-R>=PrintSnippet('com')<CR>
"iabbr <unique> mlcom_ <C-R>=PrintSnippet('mlcom')<CR>

" <unique> Data reading.
iabbr <unique> vo <C-R>=PrintSnippet('vo')<CR>
"iabbr <unique> ao <C-R>=PrintSnippet('adr')<CR>
"iabbr <unique> up <C-R>=PrintSnippet('up')<CR>
"iabbr <unique> upe <C-R>=PrintSnippet('upe')<CR>





let g:root_file = expand('<sfile>')
let g:root_dir = fnamemodify(g:root_file, ':h')

let g:file_ext_to_comment = {
    \ 'vim': '"',
    \ 'py': '#',
    \ 'java': '//',
    \ 'c': '//',
    \ 'cpp': '//',
    \ 'cxx': '//',
    \ 'hpp': '//',
    \ 'h': '//',
\ }

let g:default_abbrev_to_snippet = {
    \ 'sl': ['""'],
    \ 'ch': ["''"],
    \ 'pa': ['()'],
    \ 'ne': ['!='],
    \ 'leq': ['<='],
    \ 'geq': ['>='],
    \ 'gt': ['>'],
    \ 'lt': ['>'],
    \ 'nn': ['!'],
    \ 'oo': ['||'],
    \ 'xx': ['^'],
    \ 'aa': ['&&'],
    \ 'le': ['=='],
    \ 'ggt': ['>>'],
    \ 'llt': ['<<'],
    \ 'ooo': ['|'],
    \ 'aaa': ['&'],
    \ 'xxx': ['^'],
    \ 'nnn': ['~'],
    \ 'ee': ['='],
    \ 'ise': [':='],
    \ 'isa': [':'],
    \ 'ter': [ "a ? b : c;", ],
    \ 'mod': ['%'],
    \ 'pp': ['+'],
    \ 'pe': ['+='],
    \ 'mi': ['-'],
    \ 'mie': ['-=']
\}
let g:abbrev_to_snippet = {}
let g:file_ext_to_snippet_map = {}

function LoadSnippets()
    let l:file_ext = expand('%:e')
    if has_key(g:file_ext_to_snippet_map, l:file_ext)
        let g:abbrev_to_snippet = g:file_ext_to_snippet_map[l:file_ext]
    else
        let g:abbrev_to_snippet = {}
    endif
endfunction

function SetSnippetForFiletype()
    call LoadSnippets()
    let l:file_ext = expand('%:e')
    let snippet_filename = g:root_dir . '/snippets/' . l:file_ext . '.vim'
    if empty(g:abbrev_to_snippet) && filereadable(snippet_filename)
        exec "source" . l:snippet_filename
        call LoadSnippets()
        if !empty(g:abbrev_to_snippet)
            for [key, value] in items(g:abbrev_to_snippet)
                " add global abbreviations.
            endfor
        endif
    endif
endfunction

function PrintSnippet(abbreviation)
    let l:snippet = []

    if has_key(g:abbrev_to_snippet, a:abbreviation)
        let l:snippet = g:abbrev_to_snippet[a:abbreviation]
    elseif has_key(g:default_abbrev_to_snippet, a:abbreviation)
        let l:snippet = g:default_abbrev_to_snippet[a:abbreviation]
    endif

    if empty(l:snippet)
        return a:abbreviation
    elseif len(l:snippet) == 1
       return l:snippet[0]
    endif

    " Ignore the character that triggered the abbreviation.
    let _ = getchar(0)
    call append('.', l:snippet)
    exec 'normal dd' .. len(l:snippet) .. '=$'
    return ''
endfunction

function Comment(uncomment)
    let l:file_ext = expand('%:e')
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

autocmd! BufEnter,BufWinEnter,BufRead,BufNewFile * call SetSnippetForFiletype()
