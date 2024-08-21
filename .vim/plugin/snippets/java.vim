let g:file_ext_to_snippet_map['java'] = {
    \ 'fma': [
        \ "/**",
        \ "*/",
        \ "class A {",
        \ "",
        \ "/**",
        \ "*/",
        \ "public A() {",
        \ "}",
        \ "",
        \ "public static void main(String[] args) {",
        \ "}",
        \ "}",
    \ ],
    \ 'ae': [
        \ "A[] a = new A[n];",
    \ ],
    \ 'ar': [
        \ "A[]",
    \ ],
    \ 've': [
        \ "ArrayList<A> a = new ArrayList<>();",
    \ ],
    \ 'vv': [
        \ "ArrayList<A>",
    \ ],
    \ 'seq': [
        \ "HashSet<A> a = new HashSet<A>();",
    \ ],
    \ 'se': [
        \ "HashSet<A>",
    \ ],
    \ 'me': [
        \ "HashMap<A, A> a = new HashMap<A>();",
    \ ],
    \ 'ma': [
        \ "HashMap<A>()",
    \ ],
    \ 'lam': [
        \ "(a) -> { return a; };",
    \ ],
    \ 'wi': [
        \ "try (A a = B;) {",
        \ "}",
        \ "catch (Exception e) {",
        \ "}",
    \ ],
    \ 'ci': [
        \ "numRead = System.in.read(buf);",
    \ ],
    \ 'ce': [
        \ 'System.err.println(String.format("%1$s", a));',
    \ ],
    \ 'co': [
        \ 'System.out.println(String.format("%1$s", a));',
    \ ],
    \ 'cl': [
        \ "/**",
        \ "*/",
        \ "class A {",
        \ "",
        \ "/**",
        \ "*/",
        \ "public A() {",
        \ "}",
        \ "}",
    \ ],
    \ 'tr': [
        \ "try {",
        \ "}",
        \ "catch (Exception e) {",
        \ "}",
    \ ],
    \ 'fel': [
        \ "for (T aj : a) {",
        \ "}",
    \ ],
    \ 'fx': [
        \ "/**",
        \ "*/",
        \ "void f() {",
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
    \ 'fl': [
        \ "for (int j = 0; j < n; ++j) {",
        \ "}",
    \ ],
\ 'ss': [
\ "String",
\ ],
\ 'ch': [
\ "''",
\ ],
\ 'sl': [
\ "\"\"",
\ ],
\ 'mls': [
\ "String a = \\",
\ "\"\" \\",
\ "+ \"\" \\",
\ "+ \"\";",
\ ],
\ 'ssf': [
\ 'String.format("%1%s", a);',
\ ],
    \ 'ttt': [ "Math.pow(a, b)", ],
    \ 'im': [ "import ;", ],
\}
