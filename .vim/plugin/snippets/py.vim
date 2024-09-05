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
    \ 'whileread_loop': [
        \ "for line in sys.stdin:",
        \ "pass",
    \ ],
    \ 'for_loop': [
        \ "for aj in a:",
        \ "pass",
    \ ],
    \ 'array_declaration': [
        \ "a: Sequence[A]",
    \ ],
    \ 'array_assignment': [
        \ "a: Sequence[A] = []",
    \ ],
    \ 'array_type': [
        \ "list()",
    \ ],
    \ 'vector_declaration': [
        \ "a: Sequence[A]",
    \ ],
    \ 'vector_assignment': [
        \ "a: Sequence[A] = []",
    \ ],
    \ 'vector_type': [
        \ "list()",
    \ ],
    \ 'tuple_declaration': [
        \ "a: Sequence[A]",
    \ ],
    \ 'tuple_assignment': [
        \ "a: Sequence[A] = tuple()",
    \ ],
    \ 'tuple_type': [
        \ "tuple()",
    \ ],
    \ 'map_declaration': [
        \ "a: Mapping[K, V]",
    \ ],
    \ 'map_assignment': [
        \ "a: Mapping[K, V] = dict()",
    \ ],
    \ 'map_type': [
        \ "dict()",
    \ ],
    \ 'string_declaration': [
        \ "a: str",
    \ ],
    \ 'string_assignment': [
        \ "a: str = ''",
    \ ],
    \ 'string_type': [
        \ "str()",
    \ ],
    \ 'char_declaration': [
        \ "a: str",
    \ ],
    \ 'char_assignment': [
        \ "a: str = ''",
    \ ],
    \ 'char_type': [
        \ "str()",
    \ ],
    \ 'set_declaration': [
        \ "a: Set[A]",
    \ ],
    \ 'set_assignment': [
        \ "a: Set[A] = set()",
    \ ],
    \ 'set_type': [
        \ "set()",
    \ ],
    \ 'list_declaration': [
        \ "a: Sequence[A]",
    \ ],
    \ 'list_assignment': [
        \ "a: Sequence[A] = []",
    \ ],
    \ 'list_type': [
        \ "list()",
    \ ],
    \ 'queue_declaration': [
        \ "a: multiprocessing.Queue[A]",
    \ ],
    \ 'queue_assignment': [
        \ "a: multiprocessing.Queue[A] = multiprocessing.Queue()",
    \ ],
    \ 'queue_type': [
        \ "multiprocessing.Queue()",
    \ ],
    \ 'function_declaration': [
        \ "a: Callable[[A], A]",
    \ ],
    \ 'function_assignment': [
        \ "a: Callable[[A], A] = f",
    \ ],
    \ 'function_type': [
        \ "Callable[[A], A]",
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
    \ 'mutable_class': [
        \ "class A:",
        \ "",
        \ "def __init__(self):",
        \ "pass",
    \ ],
    \ 'class': [
        \ "@dataclasses.dataclass(frozen=True)",
        \ "class A:",
        \ "",
        \ "",
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
        \ "if a:",
        \ "pass",
    \ ],
    \ 'elseif': [
        \ "elif a:",
        \ "pass",
    \ ],
    \ 'while_loop': [
        \ "while a:",
        \ "pass",
    \ ],
\ 'literal_string': [
\ "''",
\ ],
\ 'multiline_string': [
\ "a = '''",
\ "",
\ "'''",
\ ],
\ 'docstring': [
\ "a = '''",
\ "",
\ "'''",
\ ],
\ 'format_string': [
\ "'{}'.format(a)",
\ ],
\ 'match': [
\ "match a:",
\ "case a:",
\ "",
\ ],
\ 'timer': [
\ "t0 = time.time()",
\ "t_tot = time.time() - t0",
\ ],
    \ 'logical_not': [ "not", ],
    \ 'logical_and': [ "and", ],
    \ 'logical_or': [ "or", ],
    \ 'logical_xor': [ "^", ],
    \ 'ternary': [ "a if s else d", ],
    \ 'assignment2': [ ":=", ],
    \ 'exponentiation': [ "**", ],
    \ 'import': [ "import", ],
\}
