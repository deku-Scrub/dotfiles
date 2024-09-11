let g:file_ext_to_snippet_map['cpp'] = {
    \ 'timer': [
        \ "auto t0 = std::chrono::steady_clock::now();",
        \ "",
        \ "auto t1 = std::chrono::steady_clock::now();",
        \ "std::chrono::duration<double> init_time = t1 - t0;",
    \ ],
    \ 'method': [
        \ "/**",
        \ "*/",
        \ "auto A::f() -> void {",
        \ "}",
    \ ],
    \ 'function_signature': [
        \ "auto f() -> void;",
    \ ],
    \ 'function': [
        \ "/**",
        \ "*/",
        \ "auto f() -> void {",
        \ "}",
    \ ],
    \ 'lambda_function': [
        \ "[&](auto& a) { return a; }",
    \ ],
    \ 'main_function': [
        \ "auto main(int argc, char *argv[]) -> int {",
        \ "return 0;",
        \ "}",
    \ ],
    \ 'len': [
        \ "std::size()",
    \ ],
    \ 'array_assignment': [
        \ "auto a = std::array<A, n>();",
    \ ],
    \ 'array_type': [
        \ "std::array<A, n>",
    \ ],
    \ 'array_declaration': [
        \ "std::array<A, n> a",
    \ ],
    \ 'tuple_assignment': [
        \ "auto a = std::tuple<A, S>();",
    \ ],
    \ 'tuple_type': [
        \ "std::tuple<A, S>",
    \ ],
    \ 'tuple_declaration': [
        \ "std::tuple<A, S> a",
    \ ],
    \ 'map_assignment': [
        \ "auto v = std::unordered_map<A, A>();",
    \ ],
    \ 'map_type': [
        \ "std::unordered_map<A, A>",
    \ ],
    \ 'map_declaration': [
        \ "std::unordered_map<A, A> a",
    \ ],
    \ 'string_assignment': [
        \ 'auto v = std::string("");',
    \ ],
    \ 'string_type': [
        \ "std::string",
    \ ],
    \ 'string_declaration': [
        \ "std::string a",
    \ ],
    \ 'char_assignment': [
        \ "auto v = '';",
    \ ],
    \ 'char_type': [
        \ "char",
    \ ],
    \ 'char_declaration': [
        \ "char a",
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
        \ "auto a = std::vector<A>();",
    \ ],
    \ 'vector_type': [
        \ "std::vector<A>",
    \ ],
    \ 'vector_declaration': [
        \ "std::vector<A> a",
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
        \ "T",
    \ ],
    \ 'template_declaration': [
        \ "T a",
    \ ],
    \ 'read_stdin': [
        \ "std::cin >> a;",
    \ ],
    \ 'print_stderr': [
        \ "std::cerr << a << std::endl;",
    \ ],
    \ 'print_stdout': [
        \ "std::cout << a << std::endl;",
    \ ],
    \ 'class': [
        \ "/**",
        \ "*/",
        \ "class A {",
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
        \ "if (a) {",
        \ "}",
    \ ],
    \ 'elseif': [
        \ "else if (a) {",
        \ "}",
    \ ],
    \ 'ternary': [
        \ "a ? s : d",
    \ ],
    \ 'while_loop': [
        \ "while (a) {",
        \ "}",
    \ ],
    \ 'whileread_loop': [
        \ "auto line = std::string();",
        \ "while (std::getline(std::cin, line)) {",
        \ "}",
    \ ],
    \ 'foreach_loop': [
        \ "for (const auto& aj : a) {",
        \ "}",
    \ ],
    \ 'for_loop': [
        \ "for (int j = 0; j < n; ++j) {",
        \ "}",
    \ ],
\ 'literal_string': [
\ '""',
\ ],
\ 'multiline_string': [
\ "auto a = std::string(",
\ '""',
\ '+ ""',
\ ");",
\ ],
\ 'format_string': [
\ "std::string a = \\",
\ "\"\" \\",
\ "+ \"\" \\",
\ "+ \"\";",
\ ],
\ 'docstring': [
\ "/**",
\ "* ",
\ "*/",
\ ],
    "\ 'Variable': [ "auto", ],
    "\ 'membership_test': [ "x.contains(y)", ],
    "\ 'movable': [ "&&", ],
    \ 'exponentiation': [ "std::pow(a, b)", ],
    \ 'import': [ "#include <>", ],
    \ 'c_import': [ "#include ''", ],
    "\ 'val': [ "*", ],
    "\ 'uniquepointer': [ "std::unique_ptr<A>", ],
    "\ 'uniquepointereq': [ "auto a = std::make_unique<A>()", ],
    \ 'standardlib': [ "std::", ],
\ }

let g:file_ext_to_snippet_map['cxx'] = g:file_ext_to_snippet_map['cpp']
let g:file_ext_to_snippet_map['c'] = g:file_ext_to_snippet_map['cpp']
let g:file_ext_to_snippet_map['h'] = g:file_ext_to_snippet_map['cpp']
let g:file_ext_to_snippet_map['hpp'] = g:file_ext_to_snippet_map['cpp']
