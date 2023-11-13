vim9script
import "../snippets.vim" as snippets
# tuple, pair

var python_snippets = {
    'shb': [
        "#!/usr/bin/env python3",
    ],
    'main': [
        "def main():",
        "pass",
        "",
        "if __name__ == '__main__':",
        "main()",
    ],
    'for': [
        "for aj in (a):",
        "pass",
    ],
    'arreq': [
        "a = []",
    ],
    'arr': [
        "[]",
    ],
    'veceq': [
        "a = []",
    ],
    'vec': [
        "[]",
    ],
    'seteq': [
        "a = set()",
    ],
    'set': [
        "set()",
    ],
    'mapeq': [
        "a = dict()",
    ],
    'map': [
        "dict()",
    ],
    'lambda': [
        "lambda a: a",
    ],
    'with': [
        "with a as b:",
        "pass",
    ],
    'pi': [
        "a = input()",
    ],
    'pe': [
        "print('{}'.format(a), file=sys.stderr)",
    ],
    'po': [
        "print('{}'.format(a))",
    ],
    'class': [
        "class A:",
        "'''",
        "'''",
        "",
        "def __init__(self):",
        "'''",
        "'''",
        "pass",
    ],
    'meth': [
        "def f(self):",
        "'''",
        "'''",
        "pass",
    ],
    'func': [
        "def f():",
        "'''",
        "'''",
        "pass",
    ],
    'try': [
        "try:",
        "pass",
        "except Exception as err:",
        "pass",
    ],
    'else': [
        "else:",
        "pass",
    ],
    'if': [
        "if (a):",
        "pass",
    ],
    'elif': [
        "elif (a):",
        "pass",
    ],
    'while': [
        "while (a):",
        "pass",
    ],
'char': [
"''",
],
'string': [
"''",
],
'multilinestring': [
"a = (",
"'',",
")",
],
'stringformat': [
"'{}'.format(a)",
],
    'lessthan': [ "<", ],
    'lessthaneq': [ "<=", ],
    'greaterthane': [ ">", ],
    'greaterthaneq': [ ">=", ],
    'logicaleq': [ "==", ],
    'noteq': [ "!=", ],
    'not': [ "not", ],
    'and': [ "and", ],
    'or': [ "or", ],
    'xor': [ "^", ],
    'group': [ "()", ],
    'ternary': [ "b if a else c", ],
    'leftshift': [ "<<", ],
    'rightshift': [ ">>", ],
    'bitwisenot': [ "~", ],
    'bitwiseand': [ "&", ],
    'bitwiseor': [ "|", ],
    'bitwisexor': [ "^", ],
    'equal': [ "=", ],
    'assignment': [ ":=", ],
    'plus': [ "+", ],
    'minus': [ "-", ],
    'times': [ "*", ],
    'divide': [ "/", ],
    'power': [ "**", ],
    'mod': [ "%", ],
    'import': [ "import", ],
}

snippets.Lol('py', python_snippets)
