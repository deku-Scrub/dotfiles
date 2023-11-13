vim9script noclear
# tuple, pair
if exists("g:ext_to_abbrvs")
    finish
endif
g:ext_to_abbrvs = {}
g:abbrv_to_snippet = {}

export def Lol(a: string, b: dict<list<string>>)
    g:ext_to_abbrvs[a] = b
enddef

def g:InsertSnippet(snippet_name: string): bool
    if !has_key(g:abbrv_to_snippet, snippet_name)
        return false
    endif

    var lines = g:abbrv_to_snippet[snippet_name]
    var beg = line(".")
    var endidx = beg + len(lines) - 1
    var k = 0
    for line in lines
        setline(beg + k, line)
        execute $"normal ==o"
        k += 1
    endfor
    execute $"normal dd"
    execute $"normal {beg}G^"
    return true
enddef

def g:ReloadSnippets()
    var file_ext = expand("%:e")
    if has_key(g:ext_to_abbrvs, file_ext)
        g:abbrv_to_snippet = g:ext_to_abbrvs[file_ext]
    else
        g:abbrv_to_snippet = {}
    endif
enddef

def g:Eatchar(oldstr: string, newstr: string, inplace: bool): string
    var c = nr2char(getchar(0))

    if !has_key(g:abbrv_to_snippet, newstr)
        return $"{oldstr}{c}"
    endif

    var s = ''
    if (c == ' ') || (c == '.')
        if inplace
            s = g:abbrv_to_snippet[newstr][0]

            if c == ' '
                s = $"{s} "
            endif
        else
            var i = g:InsertSnippet(newstr)
            s = i ? "" : $"{oldstr}{c}"
        endif
    else
        s = $"{oldstr}{c}"
    endif

    return s
enddef

noremap <unique> / /\v
noremap <unique> <Space>sed :s/\v
noremap <unique> <Space>sd *
noremap <unique> <Space>su #
noremap <unique> <Space>ssd g*
noremap <unique> <Space>ssu g#
noremap <unique> <Space>ku gU
noremap <unique> <Space>kd gu
noremap <unique> <Space>kk g~
noremap <unique> <Space>iu <
noremap <unique> <Space>io >
noremap <unique> <Space>ii =
noremap <unique> <Space>man K
noremap <unique> <Space>ww <C-g>
noremap <unique> <Space>ad a[0]<ESC>h
noremap <unique> <Space>av a<A><ESC>h
noremap <unique> <Space>as a{}<ESC>
noremap <unique> <Space>af a()<ESC>
noremap <unique> <Space>a; a''<ESC>
noremap <unique> <Space>aa a""<ESC>
noremap <unique> <Space>o o<ESC>
noremap <unique> <Space>j :join<CR>
noremap <unique> K <C-y>
noremap <unique> J <C-e>
noremap <unique> H ^
noremap <unique> L $

# <unique> Namespaces.
iabbr <unique> std <C-R>=Eatchar('std', 'std', v:true)<CR>

# <unique> Types.
iabbr <unique> ar <C-R>=Eatchar('ar', 'arr', v:true)<CR>
iabbr <unique> are <C-R>=Eatchar('are', 'arreq', v:false)<CR>
iabbr <unique> v <C-R>=Eatchar('vec', 'vec', v:true)<CR>
iabbr <unique> ve <C-R>=Eatchar('ve', 'veceq', v:false)<CR>
iabbr <unique> set <C-R>=Eatchar('set', 'set', v:true)<CR>
iabbr <unique> sete <C-R>=Eatchar('sete', 'seteq', v:false)<CR>
iabbr <unique> map <C-R>=Eatchar('map', 'map', v:true)<CR>
iabbr <unique> mape <C-R>=Eatchar('mape', 'mapeq', v:false)<CR>
iabbr <unique> qe_ <C-R>=Eatchar('qe', 'queueeq', v:false)<CR>
iabbr <unique> lste_ <C-R>=Eatchar('lste', 'listeq', v:false)<CR>
iabbr <unique> hpe_ <C-R>=Eatchar('hpe', 'heapeq', v:false)<CR>
iabbr <unique> sl <C-R>=Eatchar('sl', 'string', v:true)<CR>
iabbr <unique> s <C-R>=Eatchar('s', 'stringtype', v:true)<CR>
iabbr <unique> ch <C-R>=Eatchar('ch', 'char', v:true)<CR>
iabbr <unique> mls <C-R>=Eatchar('mls', 'multilinestring', v:false)<CR>
iabbr <unique> strf <C-R>=Eatchar('strf', 'stringformat', v:true)<CR>
iabbr <unique> mv <C-R>=Eatchar('mv', 'movable', v:true)<CR>

# <unique> Conditionals.
iabbr <unique> elif <C-R>=Eatchar('elif', 'elif', v:false)<CR>
iabbr <unique> if <C-R>=Eatchar('if', 'if', v:false)<CR>
iabbr <unique> else <C-R>=Eatchar('else', 'else', v:false)<CR>
iabbr <unique> switch_ <C-R>=Eatchar('switch', 'switch', v:false)<CR>
iabbr <unique> case_ <C-R>=Eatchar('case', 'case', v:false)<CR>
iabbr <unique> ter <C-R>=Eatchar('ter', 'ternary', v:true)<CR>

# <unique> Loops.
iabbr <unique> f <C-R>=Eatchar('f', 'for', v:false)<CR>
iabbr <unique> fe <C-R>=Eatchar('fe', 'foreach', v:false)<CR>
iabbr <unique> wh <C-R>=Eatchar('wh', 'while', v:false)<CR>
iabbr <unique> dow_ <C-R>=Eatchar('dow', 'dowhile', v:false)<CR>

# <unique> Printing.
iabbr <unique> co <C-R>=Eatchar('co', 'cout', v:false)<CR>
iabbr <unique> ci <C-R>=Eatchar('ci', 'cin', v:false)<CR>
iabbr <unique> ce <C-R>=Eatchar('ce', 'cerr', v:false)<CR>

# <unique> Functions.
iabbr <unique> sig <C-R>=Eatchar('sig', 'sig', v:false)<CR>
iabbr <unique> meth <C-R>=Eatchar('meth', 'meth', v:false)<CR>
iabbr <unique> abm_ <C-R>=Eatchar('abm', 'abstractmeth', v:false)<CR>
iabbr <unique> lam <C-R>=Eatchar('lam', 'lambda', v:true)<CR>
iabbr <unique> fn <C-R>=Eatchar('fn', 'func', v:false)<CR>
iabbr <unique> main <C-R>=Eatchar('main', 'main', v:false)<CR>

# <unique> Classes.
iabbr <unique> struct <C-R>=Eatchar('struct', 'struct', v:false)<CR>
iabbr <unique> class <C-R>=Eatchar('class', 'class', v:false)<CR>
iabbr <unique> subc_ <C-R>=Eatchar('subc', 'subclass', v:false)<CR>
iabbr <unique> abc_ <C-R>=Eatchar('abc', 'abstractclass', v:false)<CR>
iabbr <unique> inter_ <C-R>=Eatchar('inter', 'interface', v:false)<CR>

# <unique> Error handling.
iabbr <unique> try <C-R>=Eatchar('try', 'try', v:false)<CR>
iabbr <unique> catch <C-R>=Eatchar('catch', 'catch', v:false)<CR>
iabbr <unique> finally <C-R>=Eatchar('finally', 'finally', v:false)<CR>
iabbr <unique> with <C-R>=Eatchar('with', 'with', v:false)<CR>

# <unique> Logical.
iabbr <unique> l <C-R>=Eatchar('l', 'lessthan', v:true)<CR>
iabbr <unique> g <C-R>=Eatchar('g', 'greaterthan', v:true)<CR>
iabbr <unique> lte <C-R>=Eatchar('lte', 'lessthaneq', v:true)<CR>
iabbr <unique> gte <C-R>=Eatchar('gte', 'greaterthaneq', v:true)<CR>
iabbr <unique> le <C-R>=Eatchar('le', 'logicaleq', v:true)<CR>
iabbr <unique> ne <C-R>=Eatchar('ne', 'noteq', v:true)<CR>
iabbr <unique> n <C-R>=Eatchar('n', 'not', v:true)<CR>
iabbr <unique> a <C-R>=Eatchar('a', 'and', v:true)<CR>
iabbr <unique> o <C-R>=Eatchar('o', 'or', v:true)<CR>
iabbr <unique> x <C-R>=Eatchar('x', 'xor', v:true)<CR>
iabbr <unique> grp <C-R>=Eatchar('grp', 'group', v:true)<CR>
iabbr <unique> in_ <C-R>=Eatchar('in', 'in', v:true)<CR>

# <unique> Bitwise.
iabbr <unique> ls <C-R>=Eatchar('ls', 'leftshift', v:true)<CR>
iabbr <unique> rs <C-R>=Eatchar('rs', 'rightshift', v:true)<CR>
iabbr <unique> bn <C-R>=Eatchar('bn', 'bitwisenot', v:true)<CR>
iabbr <unique> ba <C-R>=Eatchar('ba', 'bitwiseand', v:true)<CR>
iabbr <unique> bo <C-R>=Eatchar('bo', 'bitwiseor', v:true)<CR>
iabbr <unique> bx <C-R>=Eatchar('bx', 'bitwisexor', v:true)<CR>

# <unique> Mathematical.
iabbr <unique> e <C-R>=Eatchar('e', 'equal', v:true)<CR>
iabbr <unique> asg <C-R>=Eatchar('asg', 'assignment', v:true)<CR>
iabbr <unique> p <C-R>=Eatchar('p', 'plus', v:true)<CR>
iabbr <unique> m <C-R>=Eatchar('m', 'minus', v:true)<CR>
iabbr <unique> t <C-R>=Eatchar('t', 'times', v:true)<CR>
iabbr <unique> d <C-R>=Eatchar('d', 'divide', v:true)<CR>
iabbr <unique> pow <C-R>=Eatchar('pow', 'power', v:true)<CR>
iabbr <unique> mod <C-R>=Eatchar('mod', 'mod', v:true)<CR>

# <unique> Imports.
iabbr <unique> imp <C-R>=Eatchar('imp', 'import', v:false)<CR>
iabbr <unique> impc <C-R>=Eatchar('impc', 'cimport', v:false)<CR>

# <unique> Comments.
iabbr <unique> com_ <C-R>=Eatchar('com', 'comment', v:false)<CR>
iabbr <unique> mlcom_ <C-R>=Eatchar('mlcom', 'multilinecomment', v:false)<CR>

# <unique> Data reading.
iabbr <unique> vo <C-R>=Eatchar('val', 'valueof', v:true)<CR>
iabbr <unique> ao <C-R>=Eatchar('adr', 'addressof', v:true)<CR>
iabbr <unique> up <C-R>=Eatchar('up', 'uniquepointer', v:true)<CR>
iabbr <unique> upe <C-R>=Eatchar('upe', 'uniquepointereq', v:false)<CR>
