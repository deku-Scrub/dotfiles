let g:file_ext_to_snippet_map['sh'] = {
    \ 'ch': [
        \ "''",
    \ ],
    \ 'string_type': [
        \ '""',
    \ ],
    \ 'multiline_string': [
        \ 'A=$(cat <<HEREDOC',
                \ 'txt',
                \ 'HEREDOC',
                \ ')',
    \ ],
    \ 'value_of': [ '"${A}"', ],
    \ 'print_stdout': [ 'echo ""', ],
    \ 'if': [
    \ 'if [ see man test ]',
    \ 'then',
    \ 'exit',
    \ 'fi',
    \ ],
    \ 'elseif': [
    \ 'elif [ see man test ]',
    \ 'then',
    \ 'exit',
    \ ],
    \ 'else': [
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
    \ 'array_assignment': [ 'A[0]=1', ],
    \ 'for_loop': [
        \ 'for A in B',
    \ 'do',
    \ 'exit',
    \ 'done',
    \ ],
    \ 'while_loop': [
        \ 'while [ A ]',
    \ 'do',
    \ 'exit',
    \ 'done',
    \ ],
    \ 'switch': [
        \ 'case "$A" in',
    \ 'cond )',
    \ 'exit',
    \ ';;',
    \ '* )',
    \ 'exit',
    \ ';;',
    \ 'esac',
    \ ],
    \ 'switchcase': [
        \ 'cond )',
    \ 'exit',
    \ ';;',
    \ ],
    \ 'function': [
        \ 'f() (',
    \ ')',
    \ ],
    \ 'hd': [
        \ 'cmd <<HEREDOC',
    \ 'txt',
    \ 'HEREDOC',
    \ ],
    \ 'value_of_math': [ '"$(())"', ],
    \ 'value_of_function': [ '"$()"', ],
    \ 'main_function': [
        \ "#!/bin/bash",
        \ "set -euo pipefail",
        \ "IFS=$'\\n\\t'",
        \ "",
        \ "SCRIPT_DIR=$(cd -- \"$(dirname -- \"${BASH_SOURCE[0]}\")\" &> /dev/null && pwd)",
        \ "",
        \ "",
        \ 'main() (',
        \ ")",
        \ "",
        \ 'main "${@}"',
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
    \ 'whileread_loop': [
        \ 'while read -r LINE',
    \ 'do',
    \ 'echo "${LINE}"',
    \ 'done',
    \ ],
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
    "iabbr <unique> math <C-R>=PrintSnippet('value_of_math')<CR>
    "iabbr <unique> pi <C-R>=PrintSnippet('pi')<CR>
    "iabbr <unique> bg <C-R>=PrintSnippet('bg')<CR>
    "iabbr <unique> ss <C-R>=PrintSnippet('string_type')<CR>
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
