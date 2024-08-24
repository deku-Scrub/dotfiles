let g:file_ext_to_snippet_map['sh'] = {
    \ 'ch': [
        \ "''",
    \ ],
    \ 'ss': [
        \ '""',
    \ ],
    \ 'mls': [
        \ 'A=$(cat <<HEREDOC',
                \ 'txt',
                \ 'HEREDOC',
                \ ')',
    \ ],
    \ 'vo': [ '"${A}"', ],
    \ 'co': [ 'echo ""', ],
    \ 'iff': [
    \ 'if [ see man test ]',
    \ 'then',
    \ 'exit',
    \ 'fi',
    \ ],
    \ 'elif': [
    \ 'elif [ see man test ]',
    \ 'then',
    \ 'exit',
    \ ],
    \ 'ife': [
        \ 'else',
    \ 'exit',
    \ ],
    \ 'lt': [ '-lt', ],
    \ 'leq': [ '-le', ],
    \ 'gt': [ '-gt', ],
    \ 'geq': [ '-ge', ],
    \ 'le': [ '-eq', ],
    \ 'ne': [ '-ne', ],
    \ 'group': [ '[  ]', ],
    \ 'ae': [ 'A[0]=1', ],
    \ 'fl': [
        \ 'for A in B',
    \ 'do',
    \ 'exit',
    \ 'done',
    \ ],
    \ 'wl': [
        \ 'while [ A ]',
    \ 'do',
    \ 'exit',
    \ 'done',
    \ ],
    \ 'sw': [
        \ 'case "$A" in',
    \ 'cond )',
    \ 'exit',
    \ ';;',
    \ '* )',
    \ 'exit',
    \ ';;',
    \ 'esac',
    \ ],
    \ 'swc': [
        \ 'cond )',
    \ 'exit',
    \ ';;',
    \ ],
    \ 'fx': [
        \ 'f() (',
    \ ')',
    \ ],
    \ 'hd': [
        \ 'cmd <<HEREDOC',
    \ 'txt',
    \ 'HEREDOC',
    \ ],
    "\ 'math': [ '"$(())"', ],
    "\ 'pipe': [ '|', ],
    "\ 'bg': [ '&', ],
    \ 'sus': [ '"$()"', ],
    "\ 'longarg': [ '--', ],
    "\ 'shortarg': [ '-', ],
    \ 'fma': [
        \ "#!/bin/bash\n\bset -euo pipefail\nIFS=$'\\n\\t'\n\nSCRIPT_DIR=$(cd -- \"$(dirname -- \"${BASH_SOURCE[0]}\")\" &> /dev/null && pwd)\n\n\nmain() (\n)\n\n\nmain",
    \ ],
    "\ 'braceexpand': [ '{}', ],
    "\ 'append': [ '>>', ],
    "\ 'redirto': [ '>', ],
    "\ 'redirfrom': [ '<', ],
    "\ 'procsubfrom': [ '<()', ],
    "\ 'redirouterr': [ '&>', ],
    "\ 'exitcode': [ '$?', ],
    "\ 'home': [ '~/', ],
    "\ 'arg': [ '"$1"', ],
    "\ 'lenargs': [ '$#', ],
    "\ 'whileread': [
        "\ 'while read LINE',
    "\ 'do',
    "\ 'exit',
    "\ 'done < A',
    "\ ],
    "\ 'select': [
        "\ 'select A in B',
    "\ 'do',
    "\ 'exit',
    "\ 'done',
    "\ ],
    "\ 'logicalstreq': [ '=', ],
    "\ 'notstreq': [ '!=', ]
\}

"try
    "iabbr <unique> math <C-R>=PrintSnippet('math')<CR>
    "iabbr <unique> pi <C-R>=PrintSnippet('pi')<CR>
    "iabbr <unique> bg <C-R>=PrintSnippet('bg')<CR>
    "iabbr <unique> ss <C-R>=PrintSnippet('ss')<CR>
    "iabbr <unique> la <C-R>=PrintSnippet('la')<CR>
    "iabbr <unique> sa <C-R>=PrintSnippet('sa')<CR>
    "iabbr <unique> shb <C-R>=PrintSnippet('shb')<CR>
    "iabbr <unique> be <C-R>=PrintSnippet('be')<CR>
    "iabbr <unique> app <C-R>=PrintSnippet('app')<CR>
    "iabbr <unique> to <C-R>=PrintSnippet('to')<CR>
    "iabbr <unique> fr <C-R>=PrintSnippet('fr')<CR>
    "iabbr <unique> frp <C-R>=PrintSnippet('frp')<CR>
    "iabbr <unique> ec <C-R>=PrintSnippet('ec')<CR>
    "iabbr <unique> h <C-R>=PrintSnippet('h')<CR>
    "iabbr <unique> arg <C-R>=PrintSnippet('arg')<CR>
    "iabbr <unique> lenarg <C-R>=PrintSnippet('lenarg')<CR>
    "iabbr <unique> whr <C-R>=PrintSnippet('whr')<CR>
    "iabbr <unique> sel <C-R>=PrintSnippet('sel')<CR>
    "iabbr <unique> les <C-R>=PrintSnippet('les')<CR>
    "iabbr <unique> nes <C-R>=PrintSnippet('nes')<CR>
"catch /.*/
"endtry
