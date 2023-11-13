vim9script
import "../snippets.vim" as snippets
# tuple, pair

var markdown_snippets = {
    'table': [
        "+---------+--------+--------+",
        "| header  | header | header |",
        "+=========+========+========+",
        "| field   | field  | field  |",
        "+---------+--------+--------+",
        "| field   | field  | field  |",
        "+---------+--------+--------+",
        "",
        ": caption",
    ],
    'img': [
            "![alttxt](path)\\",
        ],
    'url': [
            "[txt](path)",
        ],
    'code': [
            "```lang",
            "```",
        ],
    'bold': [
            "****",
        ],
    'em': [
            "**",
        ],
}

snippets.Lol('md', markdown_snippets)
snippets.Lol('mkd', markdown_snippets)
