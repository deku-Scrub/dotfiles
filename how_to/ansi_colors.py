print('The information here comes mainly from:')
print()
print('    https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences')
print()
print('The `X` in the following are the values displayed below (numbers,')
print('possibly inlcuding semicolons).  The value of `your_text` can')
print('itself include escape codes so to combine formats (for example,')
print('bold and italicized).')
print()
print("    python: print('\\033[Xmyour_text\\033[0m'")
print("    bash: echo -e '\\033[Xmyour_text\\033[0m'")
print()
print('0: normal, 1: bold, 4: underline, 7: reverse, 9: strikethrough')
print()
print('Formats')
for text_format in (1, 3, 4, 7, 9):
    print('\033[{fmt}m{fmt}\033[0m'.format(fmt=text_format), end='\t')
print()
print()
print('Normal intensity')
for text_format in (0, 1, 4, 7):
    for color in range(30, 38):
        print('\033[{fmt};{c}m{fmt};{c}\033[0m'.format(fmt=text_format, c=color), end='\t')
    print()
print()
print('High intensity')
for text_format in (0, 1, 4, 7):
    for color in range(90, 98):
        print('\033[{fmt};{c}m{fmt};{c}\033[0m'.format(fmt=text_format, c=color), end='\t')
    print()
print()
print('Backgrounds')
for color in range(40, 48):
    print('\033[{c}m{c}\033[0m'.format(c=color), end='\t')
print()
for color in range(100, 108):
    print('\033[{fmt};{c}m{fmt};{c}\033[0m'.format(fmt=0, c=color), end='\t')
print()
print()
print('Default background')
print('\033[39m39\033[0m')
print()
print('256 colors')
for j, c1 in enumerate(range(32)):
    for c2 in range(8):
        print('\033[38;5;{c}m38;5;{c:<5}\033[0m'.format(c=8*j + c2), end='')
    print()
