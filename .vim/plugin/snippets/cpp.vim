let g:file_ext_to_snippet_map['cpp'] = {
    \ 'bm': [
        \ "auto t0 = std::chrono::steady_clock::now();",
        \ "",
        \ "auto t1 = std::chrono::steady_clock::now();",
        \ "std::chrono::duration<double> init_time = t1 - t0;",
    \ ],
    \ 'fma': [
        \ "auto main(int argc, char *argv[]) -> int {",
        \ "return 0;",
        \ "}",
    \ ],
    \ 'tu': [
        \ "std::tuple<>",
    \ ],
    \ 'ae': [
        \ "auto a = std::array<A, n>();",
    \ ],
    \ 'len': [
        \ "std::size()",
    \ ],
    \ 'ar': [
        \ "std::array<A, n>",
    \ ],
    \ 've': [
        \ "auto v = std::vector<A>();",
    \ ],
    \ 'vv': [
        \ "std::vector<A>",
    \ ],
    \ 'seq': [
        \ "auto v = std::unordered_set<A>();",
    \ ],
    \ 'se': [
        \ "std::unordered_set<A>",
    \ ],
    \ 'me': [
        \ "auto v = std::unordered_map<A, A>();",
    \ ],
    \ 'ma': [
        \ "std::unordered_map<A, A>",
    \ ],
    \ 'lam': [
        \ "[&](auto& a) { return a; };",
    \ ],
    \ 'ci': [
        \ "std::cin >> a;",
    \ ],
    \ 'ce': [
        \ "std::cerr << a << std::endl;",
    \ ],
    \ 'co': [
        \ "std::cout << a << std::endl;",
    \ ],
    \ 'cl': [
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
    \ 'st': [
        \ "/**",
        \ "*/",
        \ "struct A {",
        \ "};",
    \ ],
    \ 'fme': [
        \ "/**",
        \ "*/",
        \ "auto A::f() -> void {",
        \ "}",
    \ ],
    \ 'fs': [
        \ "auto f() -> void;",
    \ ],
    \ 'fx': [
        \ "/**",
        \ "*/",
        \ "auto f() -> void {",
        \ "}",
    \ ],
    \ 'tr': [
        \ "try {",
        \ "}",
        \ "catch (std::exception& e) {",
        \ "}",
    \ ],
    \ 'ife': [
        \ "else {",
        \ "}",
    \ ],
    \ 'iff': [
        \ "if (a) {",
        \ "}",
    \ ],
    \ 'elif': [
        \ "else if (a) {",
        \ "}",
    \ ],
    \ 'wl': [
        \ "while (a) {",
        \ "}",
    \ ],
    \ 'fel': [
        \ "for (const auto& aj : a) {",
        \ "}",
    \ ],
    \ 'fl': [
        \ "for (int j = 0; j < n; ++j) {",
        \ "}",
    \ ],
\ 'ss': [
\ "std::string",
\ ],
\ 'ch': [
\ "''",
\ ],
\ 'sl': [
\ "\"\"",
\ ],
\ 'mls': [
\ "std::string a = \\",
\ "\"\" \\",
\ "+ \"\" \\",
\ "+ \"\";",
\ ],
\ 'ssf': [
\ "std::string a = \\",
\ "\"\" \\",
\ "+ \"\" \\",
\ "+ \"\";",
\ ],
    "\ 'movable': [ "&&", ],
    \ 'ttt': [ "std::pow(a, b)", ],
    \ 'im': [ "#include <>", ],
    \ 'imc': [ "#include ''", ],
    \ 'val': [ "*", ],
    "\ 'uniquepointer': [ "std::unique_ptr<A>", ],
    "\ 'uniquepointereq': [ "auto a = std::make_unique<A>()", ],
    \ 'sd': [ "std::", ],
\ }

let g:file_ext_to_snippet_map['cxx'] = g:file_ext_to_snippet_map['cpp']
let g:file_ext_to_snippet_map['c'] = g:file_ext_to_snippet_map['cpp']
let g:file_ext_to_snippet_map['h'] = g:file_ext_to_snippet_map['cpp']
let g:file_ext_to_snippet_map['hpp'] = g:file_ext_to_snippet_map['cpp']
