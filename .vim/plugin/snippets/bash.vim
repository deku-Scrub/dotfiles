vim9script
import "../snippets.vim" as snippets
# tuple, pair

var bash_snippets = {
'char': [
"''",
],
'string': [
'""',
],
'multilinestring': [
        'A=$(cat <<HEREDOC',
        'txt',
        'HEREDOC',
        ')',
],
    'equal': [ "=", ],
    'plus': [ "+", ],
    'minus': [ "-", ],
    'times': [ "*", ],
    'power': [ "**", ],
    'mod': [ "%", ],
    'valueof': [ '"${A}"', ],
    'cout': [ 'echo ""', ],
    'if': [
        "if [ see man test ]",
        "then",
        "exit",
        "fi",
    ],
    'elif': [
        "elif [ see man test ]",
        "then",
        "exit",
    ],
    'else': [
        "else",
        "exit",
    ],
    'lessthan': [ "-lt", ],
    'lessthaneq': [ "-le", ],
    'greaterthan': [ "-gt", ],
    'greaterthaneq': [ "-ge", ],
    'logicaleq': [ "-eq", ],
    'noteq': [ "-ne", ],
    'not': [ "!", ],
    'and': [ "&&", ],
    'or': [ "||", ],
    'xor': [ "^", ],
    'group': [ "[  ]", ],
    'rightshift': [ '>>', ],
    'leftshift': [ '<<', ],
    'bitwisenot': [ "~", ],
    'bitwiseand': [ "&", ],
    'bitwiseor': [ "|", ],
    'bitwisexor': [ "^", ],
    'arr': [ "A[0]=1", ],
    'for': [
        "for A in B",
        "do",
        "exit",
        "done",
    ],
    'while': [
        "while [ A ]",
        "do",
        "exit",
        "done",
    ],
    'switch': [
        'case "$A" in',
        'cond )',
        'exit',
        ';;',
        '* )',
        'exit',
        ';;',
        'esac',
    ],
    'case': [
        'cond )',
        'exit',
        ';;',
    ],
    'func': [
        "f() {",
        "}",
    ],
    'heredoc': [
        'cmd <<HEREDOC',
        'txt',
        'HEREDOC',
    ],
    'math': [ '"$(())"', ],
    'pipe': [ "|", ],
    'bg': [ "&", ],
    'subshell': [ '"$()"', ],
    'longarg': [ "--", ],
    'shortarg': [ "-", ],
    'shabang': [ "#!", ],
    'braceexpand': [ '{}', ],
    'append': [ '>>', ],
    'redirto': [ '>', ],
    'redirfrom': [ '<', ],
    'procsubfrom': [ '<()', ],
#'redirouterr': [ '&>', ],
    'exitcode': [ '$?', ],
    'home': [ '~/', ],
    'arg': [ '"$1"', ],
    'lenargs': [ '$#', ],
    'whileread': [
        "while read LINE",
        "do",
        "exit",
        "done < A",
    ],
    'select': [
        "select A in B",
        "do",
        "exit",
        "done",
    ],
    'logicalstreq': [ "=", ],
    'notstreq': [ "!=", ],
}

snippets.Lol('sh', bash_snippets)
iabbr <unique> math <C-R>=Eatchar('math', 'math', v:true)<CR>
iabbr <unique> pi <C-R>=Eatchar('pi', 'pipe', v:true)<CR>
iabbr <unique> bg <C-R>=Eatchar('bg', 'bg', v:true)<CR>
iabbr <unique> ss <C-R>=Eatchar('ss', 'subshell', v:true)<CR>
iabbr <unique> la <C-R>=Eatchar('la', 'longarg', v:true)<CR>
iabbr <unique> sa <C-R>=Eatchar('sa', 'shortarg', v:true)<CR>
iabbr <unique> shb <C-R>=Eatchar('shb', 'shabang', v:true)<CR>
iabbr <unique> be <C-R>=Eatchar('be', 'braceexpand', v:true)<CR>
iabbr <unique> app <C-R>=Eatchar('app', 'append', v:true)<CR>
iabbr <unique> to <C-R>=Eatchar('to', 'redirto', v:true)<CR>
iabbr <unique> fr <C-R>=Eatchar('fr', 'redirfrom', v:true)<CR>
iabbr <unique> frp <C-R>=Eatchar('frp', 'procsubfrom', v:true)<CR>
iabbr <unique> ec <C-R>=Eatchar('ec', 'exitcode', v:true)<CR>
iabbr <unique> h <C-R>=Eatchar('h', 'home', v:true)<CR>
iabbr <unique> arg <C-R>=Eatchar('arg', 'arg', v:true)<CR>
iabbr <unique> lenarg <C-R>=Eatchar('lenarg', 'lenargs', v:true)<CR>
iabbr <unique> whr <C-R>=Eatchar('whr', 'whileread', v:true)<CR>
iabbr <unique> sel <C-R>=Eatchar('sel', 'select', v:true)<CR>
iabbr <unique> les <C-R>=Eatchar('les', 'logicalstreq', v:true)<CR>
iabbr <unique> nes <C-R>=Eatchar('nes', 'notstreq', v:true)<CR>
