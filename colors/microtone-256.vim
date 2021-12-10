runtime colors/microtone.vim
let colors_name = 'microtone-256'

if &background == 'light'
  " 138, 146
  hi Normal ctermbg=232
  hi BaseA ctermfg=138
  hi BaseAi ctermfg=138 cterm=italic gui=italic
  hi BaseB ctermfg=59
  hi BaseBu ctermfg=59
  hi BaseC ctermfg=61 cterm=italic gui=italic
  hi BaseD ctermfg=97
  hi BaseH1 ctermfg=168 ctermbg=230 cterm=bold,underline
  hi BaseH2 ctermfg=29 ctermbg=194
else
  hi Normal ctermbg=233 ctermfg=189
  hi BaseA ctermfg=95
  hi BaseAi ctermfg=95 cterm=italic gui=italic
  hi BaseB ctermfg=60
  hi BaseBu ctermfg=60
  hi BaseC ctermfg=62 cterm=italic gui=italic
  hi BaseD ctermfg=152
endif

call MicrotoneSetVariantOverrides()
