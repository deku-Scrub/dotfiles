let g:file_ext_to_snippet_map['cpp'] = {
    \ 'timer': [
        \ "auto t0 = std::chrono::steady_clock::now();",
        \ "",
        \ "auto t1 = std::chrono::steady_clock::now();",
        \ "std::chrono::duration<double> init_time = t1 - t0;",
    \ ],
    \ 'main_function': [
        \ "auto main(int argc, char *argv[]) -> int {",
        \ "return 0;",
        \ "}",
    \ ],
    \ 'tu': [
        \ "std::tuple<>",
    \ ],
    \ 'array_assignment': [
        \ "auto a = std::array<A, n>();",
    \ ],
    \ 'len': [
        \ "std::size()",
    \ ],
    \ 'array_type': [
        \ "std::array<A, n>",
    \ ],
    \ 'vector_assignment': [
        \ "auto v = std::vector<A>();",
    \ ],
    \ 'vector_type': [
        \ "std::vector<A>",
    \ ],
    \ 'set_assignment': [
        \ "auto v = std::unordered_set<A>();",
    \ ],
    \ 'set_type': [
        \ "std::unordered_set<A>",
    \ ],
    \ 'map_assignment': [
        \ "auto v = std::unordered_map<A, A>();",
    \ ],
    \ 'map_type': [
        \ "std::unordered_map<A, A>",
    \ ],
    \ 'lambda_function': [
        \ "[&](auto& a) { return a; };",
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
        \ "public:",
        \ "/**",
        \ "*/",
        \ "A();",
        \ "",
        \ "private:",
        \ "//",
        \ "}",
    \ ],
    \ 'plain_old_data': [
        \ "/**",
        \ "*/",
        \ "struct A {",
        \ "};",
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
    \ 'while_loop': [
        \ "while (a) {",
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
\ 'string_type': [
\ "std::string",
\ ],
\ 'ch': [
\ "''",
\ ],
\ 'literal_string': [
\ "\"\"",
\ ],
\ 'multiline_string': [
\ "std::string a = \\",
\ "\"\" \\",
\ "+ \"\" \\",
\ "+ \"\";",
\ ],
\ 'format_string': [
\ "std::string a = \\",
\ "\"\" \\",
\ "+ \"\" \\",
\ "+ \"\";",
\ ],
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
