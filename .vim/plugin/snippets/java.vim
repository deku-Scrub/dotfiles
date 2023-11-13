vim9script
import "../snippets.vim" as snippets
# tuple, pair

var java_snippets = {
    'main': [
        "public static void main(String[] args) {",
        "}",
    ],
    'arreq': [
        "A[] a = new A[n];",
    ],
    'arr': [
        "A[]",
    ],
    'veceq': [
        "ArrayList<A> a = new ArrayList<>();",
    ],
    'vec': [
        "ArrayList<A>",
    ],
    'seteq': [
        "HashSet<A> a = new HashSet<A>();",
    ],
    'set': [
        "HashSet<A>",
    ],
    'mapeq': [
        "HashMap<A, A> a = new HashMap<A>();",
    ],
    'map': [
        "HashMap<A>()",
    ],
    'lambda': [
        "(a) -> { return a; };",
    ],
    'with': [
        "try (A a = B;) {",
        "}",
        "catch (Exception e) {",
        "}",
    ],
    'pi': [
        "numRead = System.in.read(buf);",
    ],
    'pe': [
        'System.err.println(String.format("%1$s", a));',
    ],
    'po': [
        'System.out.println(String.format("%1$s", a));',
    ],
    'class': [
        "/**",
        "*/",
        "class A {",
        "",
        "/**",
        "*/",
        "public A() {",
        "}",
        "}",
    ],
    'try': [
        "try {",
        "}",
        "catch (Exception e) {",
        "}",
    ],
    'foreach': [
        "for (T aj : a) {",
        "}",
    ],
    'func': [
        "/**",
        "*/",
        "void f() {",
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
    'for': [
        "for (int j = 0; j < n; ++j) {",
        "}",
    ],
'stringtype': [
"String",
],
'char': [
"''",
],
'string': [
"\"\"",
],
'multilinestring': [
"String a = \\",
"\"\" \\",
"+ \"\" \\",
"+ \"\";",
],
'stringformat': [
'String.format("%1%s", a);',
],
    'lessthan': [ "<", ],
    'lessthaneq': [ "<=", ],
    'greaterthane': [ ">", ],
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
    'power': [ "Math.pow(a, b)", ],
    'mod': [ "%", ],
    'import': [ "import ;", ],
}
java_snippets['meth'] = java_snippets['func']

snippets.Lol('java', java_snippets)
