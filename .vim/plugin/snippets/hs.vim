let g:file_ext_to_snippet_map['hs'] = {
    \ 'main_function': [
        \ "main :: IO ()",
        \ "main = x",
    \ ],
    \ 'whileread_loop': [
        \ "",
    \ ],
    \ 'for_loop': [
        \ "",
    \ ],
    \ 'array_declaration': [
        \ "",
    \ ],
    \ 'array_assignment': [
        \ "",
    \ ],
    \ 'array_type': [
        \ "",
    \ ],
    \ 'vector_declaration': [
        \ "",
    \ ],
    \ 'vector_assignment': [
        \ "",
    \ ],
    \ 'vector_type': [
        \ "",
    \ ],
    \ 'tuple_declaration': [
        \ "",
    \ ],
    \ 'tuple_assignment': [
        \ "",
    \ ],
    \ 'tuple_type': [
        \ "",
    \ ],
    \ 'map_declaration': [
        \ "",
    \ ],
    \ 'map_assignment': [
        \ "",
    \ ],
    \ 'map_type': [
        \ "",
    \ ],
    \ 'string_declaration': [
        \ "",
    \ ],
    \ 'string_assignment': [
        \ "",
    \ ],
    \ 'string_type': [
        \ "String",
    \ ],
    \ 'char_declaration': [
        \ "",
    \ ],
    \ 'char_assignment': [
        \ "",
    \ ],
    \ 'char_type': [
        \ "",
    \ ],
    \ 'set_declaration': [
        \ "",
    \ ],
    \ 'set_assignment': [
        \ "",
    \ ],
    \ 'set_type': [
        \ "",
    \ ],
    \ 'list_declaration': [
        \ "",
    \ ],
    \ 'list_assignment': [
        \ "",
    \ ],
    \ 'list_type': [
        \ "",
    \ ],
    \ 'queue_declaration': [
        \ "",
    \ ],
    \ 'queue_assignment': [
        \ "",
    \ ],
    \ 'queue_type': [
        \ "",
    \ ],
    \ 'function_declaration': [
        \ "",
    \ ],
    \ 'function_assignment': [
        \ "",
    \ ],
    \ 'function_type': [
        \ "",
    \ ],
    \ 'lambda_function': [
        \ "\\x -> x",
    \ ],
    \ 'error_with': [
        \ "",
    \ ],
    \ 'read_stdin': [
        \ "",
    \ ],
    \ 'print_stderr': [
        \ "",
    \ ],
    \ 'print_stdout': [
        \ 'putStrLn ("")',
    \ ],
    \ 'mutable_class': [
        \ "",
    \ ],
    \ 'class': [
        \ "",
    \ ],
    \ 'method': [
        \ "",
    \ ],
    \ 'function': [
        \ "f :: A -> S",
        \ "f a = s",
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
\ '""',
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
\ "case e of",
\ "A -> x",
\ "B -> y",
\ ],
\ 'timer': [
\ "t0 = time.time()",
\ "t_tot = time.time() - t0",
\ ],
    \ 'logical_not_equals': [ "/=", ],
    \ 'logical_not': [ "not", ],
    \ 'logical_and': [ "&&", ],
    \ 'logical_or': [ "||", ],
    \ 'logical_xor': [ "", ],
    \ 'ternary': [ "if a then s else d", ],
    \ 'assignment2': [ ":=", ],
    \ 'exponentiation': [ "^", ],
    \ 'import': [ "import", ],
    \ 'plusplus': [ "++", ],
\}
