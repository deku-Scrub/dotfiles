let g:file_ext_to_snippet_map['md'] = {
    \ 'table': [
        \ "+---------+--------+--------+",
        \ "| header  | header | header |",
        \ "+=========+========+========+",
        \ "| field   | field  | field  |",
        \ "+---------+--------+--------+",
        \ "| field   | field  | field  |",
        \ "+---------+--------+--------+",
        \ "",
        \ ": caption",
    \ ],
    \ 'img': [
            \ "![alttxt](path)\\",
        \ ],
    \ 'url': [
            \ "[txt](path)",
        \ ],
    \ 'code': [
            \ "```lang",
            \ "```",
        \ ],
    \ 'bold': [
            \ "****",
        \ ],
    \ 'em': [
            \ "**",
        \ ],
\}

let g:file_ext_to_snippet_map['mkd'] = g:file_ext_to_snippet_map['md']
