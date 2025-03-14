let g:file_ext_to_snippet_map['rs'] = {
    \ 'timer': [
        \ "let t1 = Instant::now();",
        \ "x",
        \ "let tot_1 = t1.elapsed().as_millis();",
    \ ],
    \ 'enum': [
        \ "/**",
        \ "*/",
        \ "enum {",
        \ "A,",
        \ "}",
    \ ],
    \ 'method': [
        \ "/**",
        \ "*/",
        \ "fn f(&self) -> void {",
        \ "}",
    \ ],
    \ 'function_signature': [
    \ ],
    \ 'function': [
        \ "/**",
        \ "*/",
        \ "fn f() -> void {",
        \ "}",
    \ ],
    \ 'lambda_function': [
        \ "|x| y",
    \ ],
    \ 'main_function': [
        \ "fn  main() {",
        \ "}",
    \ ],
    \ 'len': [
    \ ],
    \ 'array_assignment': [
        \ "let a: [T; n] = [];",
    \ ],
    \ 'array_type': [
    \ ],
    \ 'array_declaration': [
        \ "a: [T; n]",
    \ ],
    \ 'tuple_assignment': [
        \ "let a: (T1, Tn) = (t1, tn);",
    \ ],
    \ 'tuple_type': [
    \ ],
    \ 'tuple_declaration': [
        \ "a: (T1, Tn)",
    \ ],
    \ 'map_assignment': [
        \ "a: HashMap::new();",
    \ ],
    \ 'map_type': [
        \ "HashMap",
    \ ],
    \ 'map_declaration': [
        \ "a: HashMap",
    \ ],
    \ 'string_assignment': [
        \ 'let a = String::from("");',
    \ ],
    \ 'string_type': [
    \ ],
    \ 'string_declaration': [
    \ ],
    \ 'char_assignment': [
        \ "let a = '';",
    \ ],
    \ 'char_type': [
        \ "char",
    \ ],
    \ 'char_declaration': [
        \ "a: char",
    \ ],
    \ 'set_assignment': [
        \ "auto v = std::unordered_set<A>();",
    \ ],
    \ 'set_type': [
        \ "std::unordered_set<A>",
    \ ],
    \ 'set_declaration': [
        \ "std::unordered_set<A> a",
    \ ],
    \ 'vector_assignment': [
        \ "let a: Vec<T> = Vec::new();",
    \ ],
    \ 'vector_type': [
        \ "Vec<T>",
    \ ],
    \ 'vector_declaration': [
        \ "a: Vec<T>",
    \ ],
    \ 'list_assignment': [
        \ "auto a = std::list<A>();",
    \ ],
    \ 'list_type': [
        \ "std::list<A>",
    \ ],
    \ 'list_declaration': [
        \ "std::list<A> a",
    \ ],
    \ 'queue_assignment': [
        \ "auto a = std::queue<A>();",
    \ ],
    \ 'queue_type': [
        \ "std::queue<A>",
    \ ],
    \ 'queue_declaration': [
        \ "std::queue<A> a",
    \ ],
    \ 'function_assignment': [
        \ "auto a = std::function<R(A, S)>();",
    \ ],
    \ 'function_type': [
        \ "std::function<R(A, S)>",
    \ ],
    \ 'function_declaration': [
        \ "std::function<R(A, S)> a",
    \ ],
    \ 'template_assignment': [
        \ "auto a = T();",
    \ ],
    \ 'template_type': [
    \ ],
    \ 'template_declaration': [
    \ ],
    \ 'read_stdin': [
        \ 'io::stdin()',
        \ '.read_line(&mut a)',
        \ '.expect("Error reading from stdin.");',
    \ ],
    \ 'print_stderr': [
        \ 'eprintln!("{}", a);',
    \ ],
    \ 'print_stdout': [
        \ 'println!("{}", a);',
    \ ],
    \ 'class': [
        \ "/**",
        \ "*/",
        \ "struct A {",
        \ "",
        \ "/**",
        \ "*/",
        \ "public: A();",
        \ "",
        \ "private: a",
        \ "//",
        \ "}",
    \ ],
    \ 'plain_old_data': [
        \ "/**",
        \ "*/",
        \ "struct A {",
        \ "};",
    \ ],
    \ 'error_try': [
        \ "try {",
        \ "}",
        \ "catch (std::exception& e) {",
        \ "}",
    \ ],
    \ 'else': [
        \ "else {",
        \ "}",
    \ ],
    \ 'if': [
        \ "if a {",
        \ "}",
    \ ],
    \ 'elseif': [
        \ "else if a {",
        \ "}",
    \ ],
    \ 'ternary': [
        \ "if a {s} else {d}",
    \ ],
    \ 'match': [
    \ "match a {",
    \ "c1 => f1,",
    \ "cn => fn,",
    \ "}",
    \ ],
    \ 'infinite_loop': [
        \ "loop {",
        \ "}",
    \ ],
    \ 'while_loop': [
        \ "while a {",
        \ "}",
    \ ],
    \ 'whileread_loop': [
    \ ],
    \ 'foreach_loop': [
        \ "for x in a {",
        \ "}",
    \ ],
    \ 'for_loop': [
    \ ],
\ 'literal_string': [
\ '""',
\ ],
\ 'multiline_string': [
\ ],
\ 'format_string': [
    \ 'format!("{}")',
\ ],
\ 'docstring': [
\ "///",
\ ],
    "\ 'Variable': [ "let", ],
    "\ 'membership_test': [ "x.contains(y)", ],
    "\ 'movable': [ "&&", ],
    \ 'exponentiation': [ "std::pow(a, b)", ],
    \ 'import': [ "use", ],
    "\ 'val': [ "*", ],
    "\ 'uniquepointer': [ "std::unique_ptr<A>", ],
    "\ 'uniquepointereq': [ "auto a = std::make_unique<A>()", ],
    \ 'standardlib': [ "std::", ],
\ }

let g:file_ext_to_snippet_map['cxx'] = g:file_ext_to_snippet_map['cpp']
let g:file_ext_to_snippet_map['c'] = g:file_ext_to_snippet_map['cpp']
let g:file_ext_to_snippet_map['h'] = g:file_ext_to_snippet_map['cpp']
let g:file_ext_to_snippet_map['hpp'] = g:file_ext_to_snippet_map['cpp']
