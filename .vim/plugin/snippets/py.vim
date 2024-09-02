let g:file_ext_to_snippet_map['py'] = {
    \ 'main_function': [
        \ "#!/usr/bin/env python3",
        \ "",
        \ "",
        \ "def main():",
        \ "pass",
        \ "",
        \ "",
        \ "if __name__ == '__main__':",
        \ "main()",
    \ ],
    \ 'for_loop': [
        \ "for aj in (a):",
        \ "pass",
    \ ],
    \ 'array_assignment': [
        \ "a = []",
    \ ],
    \ 'array_type': [
        \ "[]",
    \ ],
    \ 'vector_assignment': [
        \ "a = []",
    \ ],
    \ 'vector_type': [
        \ "[]",
    \ ],
    \ 'set_assignment': [
        \ "a = set()",
    \ ],
    \ 'set_type': [
        \ "set()",
    \ ],
    \ 'map_assignment': [
        \ "a = dict()",
    \ ],
    \ 'map_type': [
        \ "dict()",
    \ ],
    \ 'string_type': [
        \ "str()",
    \ ],
    \ 'lambda_function': [
        \ "lambda a: a",
    \ ],
    \ 'error_with': [
        \ "with a as b:",
        \ "pass",
    \ ],
    \ 'read_stdin': [
        \ "a = input()",
    \ ],
    \ 'print_stderr': [
        \ "print('{}'.format(a), file=sys.stderr)",
    \ ],
    \ 'print_stdout': [
        \ "print('{}'.format(a))",
    \ ],
    \ 'class': [
        \ "class A:",
        \ "",
        \ "def __init__(self):",
        \ "pass",
    \ ],
    \ 'method': [
        \ "def f(self):",
        \ "pass",
    \ ],
    \ 'function': [
        \ "def f():",
        \ "pass",
    \ ],
    \ 'error_try': [
        \ "try:",
        \ "pass",
        \ "except Exception as err:",
        \ "pass",
    \ ],
    \ 'else': [
        \ "else:",
        \ "pass",
    \ ],
    \ 'if': [
        \ "if (a):",
        \ "pass",
    \ ],
    \ 'elseif': [
        \ "elif (a):",
        \ "pass",
    \ ],
    \ 'while_loop': [
        \ "while (a):",
        \ "pass",
    \ ],
\ 'ch': [
\ "''",
\ ],
\ 'literal_string': [
\ "''",
\ ],
\ 'multiline_string': [
\ "a = (",
\ "'',",
\ ")",
\ ],
\ 'format_string': [
\ "'{}'.format(a)",
\ ],
    \ 'logical_not': [ "not", ],
    \ 'logical_and': [ "and", ],
    \ 'logical_or': [ "or", ],
    \ 'logical_xor': [ "^", ],
    \ 'ternary': [ "b if a else c", ],
    \ 'assignment2': [ ":=", ],
    \ 'exponentiation': [ "**", ],
    \ 'import': [ "import", ],
\}
