let g:file_ext_to_snippet_map['java'] = {
    \ 'main_function': [
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
    \ 'array_assignment': [
        \ "A[] a = new A[n];",
    \ ],
    \ 'array_type': [
        \ "A[]",
    \ ],
    \ 'vector_assignment': [
        \ "ArrayList<A> a = new ArrayList<>();",
    \ ],
    \ 'vector_type': [
        \ "ArrayList<A>",
    \ ],
    \ 'set_assignment': [
        \ "HashSet<A> a = new HashSet<A>();",
    \ ],
    \ 'set_type': [
        \ "HashSet<A>",
    \ ],
    \ 'map_assignment': [
        \ "HashMap<A, A> a = new HashMap<A>();",
    \ ],
    \ 'map_type': [
        \ "HashMap<A>()",
    \ ],
    \ 'lambda_function': [
        \ "(a) -> { return a; };",
    \ ],
    \ 'error_with': [
        \ "try (A a = B;) {",
        \ "}",
        \ "catch (Exception e) {",
        \ "}",
    \ ],
    \ 'read_stdin': [
        \ "numRead = System.in.read(buf);",
    \ ],
    \ 'print_stderr': [
        \ 'System.err.println(String.format("%1$s", a));',
    \ ],
    \ 'print_stdout': [
        \ 'System.out.println(String.format("%1$s", a));',
    \ ],
    \ 'class': [
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
    \ 'error_try': [
        \ "try {",
        \ "}",
        \ "catch (Exception e) {",
        \ "}",
    \ ],
    \ 'foreach_loop': [
        \ "for (T aj : a) {",
        \ "}",
    \ ],
    \ 'function': [
        \ "/**",
        \ "*/",
        \ "void f() {",
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
    \ 'for_loop': [
        \ "for (int j = 0; j < n; ++j) {",
        \ "}",
    \ ],
\ 'string_type': [
\ "String",
\ ],
\ 'ch': [
\ "''",
\ ],
\ 'literal_string': [
\ "\"\"",
\ ],
\ 'multiline_string': [
\ "String a = \\",
\ "\"\" \\",
\ "+ \"\" \\",
\ "+ \"\";",
\ ],
\ 'format_string': [
\ 'String.format("%1%s", a);',
\ ],
    \ 'exponentiation': [ "Math.pow(a, b)", ],
    \ 'import': [ "import ;", ],
    \ 'timer': [
        \ 'long t0 = Instant.now().toEpochMilli();',
        \ 'long t1 = Instant.now().toEpochMilli();',
        \ 'System.out.println(String.format("%1$s", t1 - t0));',
    \ ],
\}
