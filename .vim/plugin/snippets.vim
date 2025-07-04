if exists("g:file_ext_to_snippet_map")
    finish
endif

" Namespaces.
inoremap <unique> s/ <C-R>=PrintSnippet('standardlib')<CR>

" <unique> Types.
" Given type `T`:
"   iaT: is assignment T (`T a = b`, `a: T = b`, etc)
"   iT: is T (`str`, `vector`, etc)
"   idT: is defintion T (`T a`, `a: T`, etc)
" Types:
"   a: array
"   t: tuple
"   m: map
"   s: string
"   c: char
"   se: set
"   v: vector
"   l: list
"   q: queue
"   f: function
"   T: template
inoremap <unique> iaa/ <C-R>=PrintSnippet('array_assignment')<CR>
inoremap <unique> ia/ <C-R>=PrintSnippet('array_type')<CR>
inoremap <unique> ida/ <C-R>=PrintSnippet('array_declaration')<CR>
inoremap <unique> iat/ <C-R>=PrintSnippet('tuple_assignment')<CR>
inoremap <unique> it/ <C-R>=PrintSnippet('tuple_type')<CR>
inoremap <unique> idt/ <C-R>=PrintSnippet('tuple_declaration')<CR>
inoremap <unique> iam/ <C-R>=PrintSnippet('map_assignment')<CR>
inoremap <unique> im/ <C-R>=PrintSnippet('map_type')<CR>
inoremap <unique> idm/ <C-R>=PrintSnippet('map_declaration')<CR>
inoremap <unique> ias/ <C-R>=PrintSnippet('string_assignment')<CR>
inoremap <unique> is/ <C-R>=PrintSnippet('string_type')<CR>
inoremap <unique> ids/ <C-R>=PrintSnippet('string_declaration')<CR>
inoremap <unique> iac/ <C-R>=PrintSnippet('char_assignment')<CR>
inoremap <unique> ic/ <C-R>=PrintSnippet('char_type')<CR>
inoremap <unique> idc/ <C-R>=PrintSnippet('char_declaration')<CR>
inoremap <unique> iase/ <C-R>=PrintSnippet('set_assignment')<CR>
inoremap <unique> ise/ <C-R>=PrintSnippet('set_type')<CR>
inoremap <unique> idse/ <C-R>=PrintSnippet('set_declaration')<CR>
inoremap <unique> iav/ <C-R>=PrintSnippet('vector_assignment')<CR>
inoremap <unique> iv/ <C-R>=PrintSnippet('vector_type')<CR>
inoremap <unique> idv/ <C-R>=PrintSnippet('vector_declaration')<CR>
inoremap <unique> ial/ <C-R>=PrintSnippet('list_assignment')<CR>
inoremap <unique> il/ <C-R>=PrintSnippet('list_type')<CR>
inoremap <unique> idl/ <C-R>=PrintSnippet('list_declaration')<CR>
inoremap <unique> iaq/ <C-R>=PrintSnippet('queue_assignment')<CR>
inoremap <unique> iq/ <C-R>=PrintSnippet('queue_type')<CR>
inoremap <unique> idq/ <C-R>=PrintSnippet('queue_declaration')<CR>
inoremap <unique> iaf/ <C-R>=PrintSnippet('function_assignment')<CR>
inoremap <unique> if/ <C-R>=PrintSnippet('function_type')<CR>
inoremap <unique> idf/ <C-R>=PrintSnippet('function_declaration')<CR>
inoremap <unique> iaT/ <C-R>=PrintSnippet('template_assignment')<CR>
inoremap <unique> iT/ <C-R>=PrintSnippet('template_type')<CR>
inoremap <unique> idT/ <C-R>=PrintSnippet('template_declaration')<CR>

" Strings
inoremap <unique> sl/ <C-R>=PrintSnippet('literal_string')<CR>
inoremap <unique> sf/ <C-R>=PrintSnippet('format_string')<CR>
inoremap <unique> sm/ <C-R>=PrintSnippet('multiline_string')<CR>
inoremap <unique> sd/ <C-R>=PrintSnippet('docstring')<CR>

" Loops.
inoremap <unique> Lf/ <C-R>=PrintSnippet('for_loop')<CR>
inoremap <unique> Lw/ <C-R>=PrintSnippet('while_loop')<CR>
inoremap <unique> Le/ <C-R>=PrintSnippet('foreach_loop')<CR>
inoremap <unique> Ld/ <C-R>=PrintSnippet('dowhile_loop')<CR>
inoremap <unique> Lm/ <C-R>=PrintSnippet('mapping_loop')<CR>
inoremap <unique> Lr/ <C-R>=PrintSnippet('reduction_loop')<CR>
inoremap <unique> Lwr/ <C-R>=PrintSnippet('whileread_loop')<CR>

" Conditionals.
inoremap <unique> cif/ <C-R>=PrintSnippet('if')<CR>
inoremap <unique> cei/ <C-R>=PrintSnippet('elseif')<CR>
inoremap <unique> cel/ <C-R>=PrintSnippet('else')<CR>
inoremap <unique> csw/ <C-R>=PrintSnippet('switch')<CR>
inoremap <unique> csc/ <C-R>=PrintSnippet('switchcase')<CR>
inoremap <unique> c3/ <C-R>=PrintSnippet('ternary')<CR>
inoremap <unique> cm/ <C-R>=PrintSnippet('match')<CR>

" IO.
inoremap <unique> Io/ <C-R>=PrintSnippet('print_stdout')<CR>
inoremap <unique> Ii/ <C-R>=PrintSnippet('read_stdin')<CR>
inoremap <unique> Ie/ <C-R>=PrintSnippet('print_stderr')<CR>

" Functions.
inoremap <unique> fs/ <C-R>=PrintSnippet('function_signature')<CR>
inoremap <unique> fme/ <C-R>=PrintSnippet('method')<CR>
inoremap <unique> fl/ <C-R>=PrintSnippet('lambda_function')<CR>
inoremap <unique> ff/ <C-R>=PrintSnippet('function')<CR>
inoremap <unique> fma/ <C-R>=PrintSnippet('main_function')<CR>

" Benchmarks.
inoremap <unique> bmt/ <C-R>=PrintSnippet('timer')<CR>

" Classes.
inoremap <unique> Cpod/ <C-R>=PrintSnippet('plain_old_data')<CR>
inoremap <unique> Cc/ <C-R>=PrintSnippet('class')<CR>
inoremap <unique> Cmc/ <C-R>=PrintSnippet('mutable_class')<CR>
inoremap <unique> Csc/ <C-R>=PrintSnippet('subclass')<CR>
inoremap <unique> Cmsc/ <C-R>=PrintSnippet('mutable_subclass')<CR>
inoremap <unique> Ce/ <C-R>=PrintSnippet('enum')<CR>
inoremap <unique> Ci/ <C-R>=PrintSnippet('iterator')<CR>

" Error handling.
inoremap <unique> et/ <C-R>=PrintSnippet('error_try')<CR>
inoremap <unique> ec/ <C-R>=PrintSnippet('error_catch')<CR>
inoremap <unique> ef/ <C-R>=PrintSnippet('error_finally')<CR>
inoremap <unique> ew/ <C-R>=PrintSnippet('error_with')<CR>

" Logical.
inoremap <unique> lt/ <C-R>=PrintSnippet('less_than')<CR>
inoremap <unique> gt/ <C-R>=PrintSnippet('greater_than')<CR>
inoremap <unique> leq/ <C-R>=PrintSnippet('less_than_or_equal')<CR>
inoremap <unique> geq/ <C-R>=PrintSnippet('greater_than_or_equal')<CR>
inoremap <unique> le/ <C-R>=PrintSnippet('logical_equals')<CR>
inoremap <unique> ne/ <C-R>=PrintSnippet('logical_not_equals')<CR>
inoremap <unique> n/ <C-R>=PrintSnippet('logical_not')<CR>
inoremap <unique> a/ <C-R>=PrintSnippet('logical_and')<CR>
inoremap <unique> o/ <C-R>=PrintSnippet('logical_or')<CR>
inoremap <unique> x/ <C-R>=PrintSnippet('logical_xor')<CR>
inoremap <unique> in/ <C-R>=PrintSnippet('membership_test')<CR>
inoremap <unique> pa/ <C-R>=PrintSnippet('parentheses')<CR>

" Mathematical.
inoremap <unique> e/ <C-R>=PrintSnippet('assignment')<CR>
inoremap <unique> ee/ <C-R>=PrintSnippet('assignment2')<CR>
inoremap <unique> p/ <C-R>=PrintSnippet('addition')<CR>
inoremap <unique> pe/ <C-R>=PrintSnippet('additionequals')<CR>
inoremap <unique> pp/ <C-R>=PrintSnippet('plusplus')<CR>
inoremap <unique> m/ <C-R>=PrintSnippet('subtraction')<CR>
inoremap <unique> me/ <C-R>=PrintSnippet('subtractionsequals')<CR>
inoremap <unique> mm/ <C-R>=PrintSnippet('minusminus')<CR>
inoremap <unique> t/ <C-R>=PrintSnippet('multiplication')<CR>
inoremap <unique> te/ <C-R>=PrintSnippet('multiplication_equals')<CR>
inoremap <unique> d/ <C-R>=PrintSnippet('division')<CR>
inoremap <unique> de/ <C-R>=PrintSnippet('division_equals')<CR>
inoremap <unique> xx/ <C-R>=PrintSnippet('exponentiation')<CR>
inoremap <unique> mod/ <C-R>=PrintSnippet('mod')<CR>

" Imports.
inoremap <unique> ./ <C-R>=PrintSnippet('import')<CR>
inoremap <unique> .c/ <C-R>=PrintSnippet('c_import')<CR>

" Variable dereferencing/declaring.
inoremap <unique> vo/ <C-R>=PrintSnippet('value_of')<CR>
inoremap <unique> vom/ <C-R>=PrintSnippet('value_of_math')<CR>
inoremap <unique> vof/ <C-R>=PrintSnippet('value_of_function')<CR>
inoremap <unique> vx/ <C-R>=PrintSnippet('variable')<CR>

let g:root_file = expand('<sfile>')
let g:root_dir = fnamemodify(g:root_file, ':h')

let g:file_ext_to_comment = {
    \ 'vim': '"',
    \ 'hs': '--',
    \ 'py': '#',
    \ 'sh': '#',
    \ 'java': '//',
    \ 'js': '//',
    \ 'c': '//',
    \ 'cpp': '//',
    \ 'cxx': '//',
    \ 'hpp': '//',
    \ 'h': '//',
    \ 'rs': '//',
\ }

let g:default_abbrev_to_snippet = {
    \ 'literal_string': ['""'],
    \ 'parentheses': ['()'],
    \ 'logical_equals': ['=='],
    \ 'logical_not_equals': ['!='],
    \ 'less_than_or_equal': ['<='],
    \ 'less_than': ['<'],
    \ 'greater_than_or_equal': ['>='],
    \ 'greater_than': ['>'],
    \ 'logical_not': ['!'],
    \ 'logical_or': ['||'],
    \ 'logical_xor': ['^'],
    \ 'logical_and': ['&&'],
    \ 'assignment': ['='],
    \ 'assignment2': [':='],
    \ 'ternary': [ "a ? b : c;", ],
    \ 'mod': ['%'],
    \ 'addition': ['+'],
    \ 'additionequals': ['+='],
    \ 'subtraction': ['-'],
    \ 'subtractionsequals': ['-='],
    \ 'multiplication': ['*'],
    \ 'multiplication_equals': ['*='],
    \ 'division': ['/'],
    \ 'division_equals': ['/=']
\}

let g:abbrev_to_snippet = {}
let g:file_ext_to_snippet_map = {}

function LoadSnippets()
    let l:file_ext = expand('%:e')
    if has_key(g:file_ext_to_snippet_map, l:file_ext)
        let g:abbrev_to_snippet = g:file_ext_to_snippet_map[l:file_ext]
    elseif has_key(g:file_ext_to_snippet_map, &ft)
        let g:abbrev_to_snippet = g:file_ext_to_snippet_map[&ft]
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

autocmd! BufEnter,BufWinEnter,BufRead,BufNewFile * call SetSnippetForFiletype()
