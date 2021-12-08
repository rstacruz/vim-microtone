hi clear
if exists('syntax_on') | syntax reset | endif
let colors_name = 'microtone'
let s:is_dark = (&background == 'dark')

" Helper function {{{
  function! s:LinkGroups(groups)
    for item in items(a:groups) " item == ["BaseA", ["VertSplit", "LineNr", ...]]
      for hlgroup in item[1]
        exec "hi! link " . hlgroup . " " . item[0]
      endfor
    endfor
  endfunction
" }}}

" Base palette - terminal {{{
  " Normal
  hi Normal ctermfg=none ctermbg=none

  " Colours of increasing importance:
  "   [A] noise > [B] keywords > [C] type > [D] constants
  " With some variations:
  "   [i] italic [u] underline [r] reversed
  hi BaseA  ctermfg=8
  hi BaseAi ctermfg=8 cterm=italic gui=italic
  hi BaseB  ctermfg=4
  hi BaseBu ctermfg=4 cterm=underline gui=underline
  hi BaseC  ctermfg=5 cterm=italic gui=italic
  hi BaseD  ctermfg=2

  " Ranges:
  "   [R1] cursorline > [R2] visual/menu
  " These don't have fg colours, N/ABCD are supposed to be readable
  " over these backgrounds
  hi BaseR1  ctermbg=8
  hi BaseR1r ctermfg=8
  hi BaseR2  ctermbg=8

  " Highlights:
  "   [H1] search > [H2] title > [H3] selection
  hi BaseH1 ctermfg=3 ctermbg=0 cterm=underline
  hi BaseH2 ctermfg=3 cterm=bold
  hi BaseH3 ctermbg=5 ctermfg=232

  " Curled underlines
  hi UndercurlError gui=undercurl guisp=#ff5555 cterm=underline
  hi UndercurlInfo  gui=undercurl guisp=#33aa33 cterm=underline

  " 256 color background overrides
  if s:is_dark
    hi BaseR1  ctermbg=237
    hi BaseR1r ctermfg=237
    hi BaseR2  ctermbg=238
    hi BaseH2  ctermbg=236
  else
    hi BaseR1  ctermbg=254
    hi BaseR1r ctermfg=254
    hi BaseR2  ctermbg=253
    hi BaseH2  ctermbg=230
  endif
" }}}

" Base palette - GUI {{{
  if s:is_dark
    " todo
    hi Normal guibg=#282838 guifg=#dadaea
  else
    hi Normal guibg=#fdfdfd guifg=#303040
    hi BaseA  guifg=#8282a0
    hi BaseAi guifg=#8282a0 gui=italic
    hi BaseB  guifg=#40405a
    hi BaseBu guifg=#60607a gui=underline
    hi BaseC  guifg=#60607a gui=italic
    hi BaseD  guifg=#7070cc gui=italic
    hi BaseR1 guibg=#ececf3
    hi BaseR2 guibg=#ead0ef
    hi BaseH1 guibg=#ead0ef
    hi BaseH2 guifg=#3030aa guibg=#daeafa
    hi BaseH3 guibg=#ead0ef
  endif
" }}}

" Basic syntax {{{
  call s:LinkGroups({
    \ 'Normal': ['Special', 'Identifier', 'PreProc', 'Ignore', 'Error',
                \ 'Todo', 'MoreMsg', 'ErrorMsg', 'SpecialKey', 'Number', 'Boolean'],
    \ 'BaseA': ['LineNr', 'NonText', 'EndOfBuffer', 'SignColumn',
               \ 'FoldColumn', 'Noise'],
    \ 'BaseAi': ['Comment', 'Folded'],
    \ 'BaseB': ['Statement', 'Operator', 'Delimiter', 'Quote'],
    \ 'BaseBu': ['Underlined'],
    \ 'BaseC': ['Type', 'Directory', 'Constant'],
    \ 'BaseD': ['String'],
    \ 'BaseR1': ['CursorLine', 'TabLine', 'TabLineFill', 'StatusLineNC'],
    \ 'BaseR1r': ['VertSplit'],
    \ 'BaseR2': ['Visual', 'StatusLine', 'Pmenu'],
    \ 'BaseH1': ['Search', 'MatchParen'],
    \ 'BaseH2': ['Title'],
    \ 'BaseH3': ['TabLineSel', 'PmenuSel'],
    \ })
  " Later: DiffAdd DiffChange DiffDelete DiffText Conceal SpellBad SpellCap SpellRare SpellLocal
" }}}

" Syntax - filetypes {{{
  hi! link cssClassName     Type " `.button` in `.button { ... }`
  hi! link cssIdentifier    Type " `#button` in `#button { ... }`
  hi! link cssProp          Statement " `display` in `display: block`
  hi! link cssPseudoClassId Type " `:root` in `:root { ... }`

  hi! link cUserFunction BaseH2

  hi! link htmlBold   String
  hi! link htmlH1     BaseH2
  hi! link htmlItalic Type

  hi! link jsDestructuringBlock BaseH2
  hi! link jsFuncName           BaseH2 " `greet` in `function greet()`
  hi! link jsVariableDef        BaseH2 " `user` in `const user = ...`
  hi! link jsObjectKey          Type " `keyname` in `{ keyname: 1234 }`
  hi! link jsThis               Type " `this` in `this.render()`

  hi! link mkdBold          Delimiter " `*` in `**hello**`
  hi! link mkdCodeDelimiter Delimiter
  hi! link mkdCodeEnd       Delimiter
  hi! link mkdCodeStart     Delimiter " triple-backticks
  hi! link mkdHeading       BaseH2 " `#` in `# Hello`
  hi! link mkdItalic        Delimiter " `_` in `_hello_`
  hi! link mkdListItem      Delimiter " `-` in `- item`

  hi! link pythonClass    BaseH2
  hi! link pythonFunction BaseH2

  hi! link rubyClassName  BaseH2
  hi! link rubyMethodName BaseH2
  hi! link rubyModuleName BaseH2

  hi! link typescriptAliasDeclaration    BaseH2 " `Post` in `type Post = { ... }`
  hi! link typescriptDestructureVariable BaseH2 " `x` in `{ x } = y`
  hi! link typescriptExport              Statement " `export`
  hi! link typescriptFuncName            BaseH2 " `greet` in `function greet()`
  hi! link typescriptIdentifierName      Normal " `React` in `import React from 'react'`
  hi! link typescriptImport              Statement " `import` and `from`
  hi! link typescriptInterfaceName       BaseH2 " `Post` in `inteface Post { ... }`
  hi! link typescriptLabel               Type " `keyname` in `{ keyname: 1234 }`
  hi! link typescriptVariableDeclaration BaseH2 " `user` in `const user = ...`
  hi! link typescriptArrayMethod         Normal " `map` in `[...].map()`
  hi! link typescriptStringMethod        Normal " `split` in `'...'.split()`
  hi! link typescriptRegExpProp          Normal " `global` in `theme().global`
  hi! link typescriptBOMLocationMethod   Normal " `replace` in `'...'.replace()`
  hi! link typescriptCacheMethod         Normal " `match` in `bg.match()`
  hi! link typescriptMathStaticMethod    Normal " `random` in `Math.random()`

  hi! link vimFunction BaseH2 " `! Hello` in `function! Hello()`
  hi! link vimHiGroup  Normal " `Normal` in `hi Normal ctermfg=none`
" }}}

" Syntax - plugins {{{
  hi! link CocErrorHighlight   UndercurlError
  hi! link CocFadeOut          UndercurlInfo " unused vars
  hi! link CocUnderline        UndercurlError
  hi! link CocWarningHighlight UndercurlInfo

  hi! link FloatermBorder LineNr

  hi! link GitSignsAdd    Type
  hi! link GitSignsChange Type
  hi! link GitSignsDelete Type

  hi! link StartifyFile   String
  hi! link StartifyHeader Title
  hi! link StartifyPath   Statement
  hi! link StartifySlash  Statement

  hi! link TelescopeBorder LineNr
" }}}

" Variations {{{
  for style in get(g:, 'microtone_variants', [])
    if style == 'less-italic' " less italic
      hi! BaseC cterm=none gui=none

    elseif style == 'no-italic' " no italic
      hi! BaseAi cterm=none gui=none
      hi! BaseC cterm=none gui=none

    elseif style == 'bg' " add a solid background
      hi! Normal ctermbg=0

    elseif style == 'no-highlight' " no background highlight on id
      hi! BaseH2 ctermbg=none guibg=none
    endif
  endfor
" }}
