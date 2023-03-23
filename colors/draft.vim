" Maintainer: Ronaldo Santiago <setzerwolf@gmail.com>

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='draft'

hi Normal guifg=#c6cedb ctermfg=252 guibg=#2f3348 ctermbg=237 gui=NONE cterm=NONE
hi Comment guifg=#767ba4 ctermfg=103 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Constant guifg=#c6cedb ctermfg=252 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi String guifg=#c3ed91 ctermfg=192 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi Keyword guifg=#d599f0 ctermfg=177 guibg=NONE ctermbg=NONE gui=italic cterm=italic
hi Type guifg=#90b3ff ctermfg=111 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ["@type.qualifier] guifg=#d599f0 ctermfg=177 guibg=NONE ctermbg=NONE gui=bold,italic cterm=bold,italic
hi Todo guifg=#c3e88d ctermfg=186 guibg=#2f3348 ctermbg=237 gui=reverse,italic cterm=reverse,italic
hi ColorColumn guifg=#2f3348 ctermfg=237 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi SignColumn guifg=#2f3348 ctermfg=237 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi CursorLine guifg=NONE ctermfg=NONE guibg=#25283a ctermbg=236 gui=NONE cterm=NONE
hi DiffAdd guifg=#c3e88d ctermfg=186 guibg=#2f3348 ctermbg=237 gui=reverse,italic cterm=reverse,italic
hi DiffChange guifg=#feee99 ctermfg=228 guibg=#2f3348 ctermbg=237 gui=reverse,italic cterm=reverse,italic
hi DiffDelete guifg=#fe9273 ctermfg=210 guibg=#2f3348 ctermbg=237 gui=reverse,italic cterm=reverse,italic
hi DiffText guifg=#2f3348 ctermfg=237 guibg=#feee99 ctermbg=228 gui=reverse,italic cterm=reverse,italic
hi VertSplit guifg=#2f3348 ctermfg=237 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi Folded guifg=#767ba4 ctermfg=103 guibg=#3c3f63 ctermbg=239 gui=italic cterm=italic
hi FoldColumn guifg=#585d81 ctermfg=60 guibg=#585d81 ctermbg=60 gui=NONE cterm=NONE
hi IncSearch guifg=#2f3348 ctermfg=237 guibg=#d599f0 ctermbg=177 gui=NONE cterm=NONE
hi LineNr guifg=#585d81 ctermfg=60 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NonText guifg=#585d81 ctermfg=60 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#c6cedb ctermfg=252 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi PmenuSel guifg=#3c3f63 ctermfg=239 guibg=#d599f0 ctermbg=177 gui=bold cterm=bold
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#585d81 ctermbg=60 gui=NONE cterm=NONE
hi Search guifg=#2f3348 ctermfg=237 guibg=#90b3ff ctermbg=111 gui=NONE cterm=NONE
hi StatusLine guifg=NONE ctermfg=NONE guibg=#3c3f63 ctermbg=239 gui=bold cterm=bold
hi StatusLineNC guifg=#767ba4 ctermfg=103 guibg=#585d81 ctermbg=60 gui=bold cterm=bold
hi TabLine guifg=NONE ctermfg=NONE guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi WildMenu guifg=#d599f0 ctermfg=177 guibg=#585d81 ctermbg=60 gui=bold cterm=bold
hi TSPunctDelimiter guifg=#767ba4 ctermfg=103 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctBracket guifg=#767ba4 ctermfg=103 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctSpecial guifg=#767ba4 ctermfg=103 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTagDelimiter guifg=#585d81 ctermfg=60 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi GitSignsChange guifg=#feee99 ctermfg=228 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi GitSignsAdd guifg=#c3e88d ctermfg=186 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi GitSignsDelete guifg=#fe9273 ctermfg=210 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi DiagnosticSignHint guifg=#c3e88d ctermfg=186 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi DiagnosticSignInfo guifg=#c3e88d ctermfg=186 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi DiagnosticSignWarn guifg=#feee99 ctermfg=228 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
hi DiagnosticSignError guifg=#fe9273 ctermfg=210 guibg=#3c3f63 ctermbg=239 gui=NONE cterm=NONE
