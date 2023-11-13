vim9script
import "../snippets.vim" as snippets
# tuple, pair

var cpp_snippets = {
    'main': [
        "auto main(int argc, char *argv[]) -> int {",
        "return 0;",
        "}",
    ],
    'arreq': [
        "auto a = std::array<A, n>();",
    ],
    'arr': [
        "std::array<A, n>",
    ],
    'veceq': [
        "auto v = std::vector<A>();",
    ],
    'vec': [
        "std::vector<A>",
    ],
    'seteq': [
        "auto v = std::unordered_set<A>();",
    ],
    'set': [
        "std::unordered_set<A>",
    ],
    'mapeq': [
        "auto v = std::unordered_map<A, A>();",
    ],
    'map': [
        "std::unordered_map<A, A>",
    ],
    'lambda': [
        "[&](auto& a) { return a; };",
    ],
    'cin': [
        "std::cin >> a;",
    ],
    'cerr': [
        "std::cerr << a << std::endl;",
    ],
    'cout': [
        "std::cout << a << std::endl;",
    ],
    'class': [
        "/**",
        "*/",
        "class A {",
        "",
        "public:",
        "/**",
        "*/",
        "A();",
        "",
        "private:",
        "//",
        "}",
    ],
    'struct': [
        "/**",
        "*/",
        "struct A {",
        "};",
    ],
    'meth': [
        "/**",
        "*/",
        "auto A::f() -> void {",
        "}",
    ],
    'sig': [
        "auto f() -> void;",
    ],
    'func': [
        "/**",
        "*/",
        "auto f() -> void {",
        "}",
    ],
    'try': [
        "try {",
        "}",
        "catch (std::exception& e) {",
        "}",
    ],
    'else': [
        "else {",
        "}",
    ],
    'if': [
        "if (a) {",
        "}",
    ],
    'elif': [
        "else if (a) {",
        "}",
    ],
    'while': [
        "while (a) {",
        "}",
    ],
    'foreach': [
        "for (const auto& aj : a) {",
        "}",
    ],
    'for': [
        "for (int j = 0; j < n; ++j) {",
        "}",
    ],
'stringtype': [
"std::string",
],
'char': [
"''",
],
'string': [
"\"\"",
],
'multilinestring': [
"std::string a = \\",
"\"\" \\",
"+ \"\" \\",
"+ \"\";",
],
'stringformat': [
"std::string a = \\",
"\"\" \\",
"+ \"\" \\",
"+ \"\";",
],
    'movable': [ "&&", ],
    'lessthan': [ "<", ],
    'lessthaneq': [ "<=", ],
    'greaterthan': [ ">", ],
    'greaterthaneq': [ ">=", ],
    'logicaleq': [ "==", ],
    'noteq': [ "!=", ],
    'not': [ "!", ],
    'and': [ "&&", ],
    'or': [ "||", ],
    'xor': [ "^", ],
    'group': [ "()", ],
    'ternary': [ "a ? b : c;", ],
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
    'power': [ "std::pow(a, b)", ],
    'mod': [ "%", ],
    'import': [ "#include <>", ],
    'cimport': [ "#include ''", ],
    'addressof': [ "&", ],
    'valueof': [ "*", ],
    'uniquepointer': [ "std::unique_ptr<A>", ],
    'uniquepointereq': [ "auto a = std::make_unique<A>()", ],
    'std': [ "std::", ],
}

snippets.Lol('cpp', cpp_snippets)
snippets.Lol('cxx', cpp_snippets)
snippets.Lol('cc', cpp_snippets)
snippets.Lol('c', cpp_snippets)
snippets.Lol('h', cpp_snippets)
snippets.Lol('hpp', cpp_snippets)
