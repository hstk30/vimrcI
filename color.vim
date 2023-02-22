" Colorscheme
" Recommend an alternative light theme when using projector for code review.
set background=dark
colorscheme PaperColor
" set background=light
" colorscheme mac_classic

" hi! SignColumn term=standout ctermfg=178 ctermbg=248 guifg=Cyan guibg=Grey
hi! SignColumn ctermfg=White ctermbg=22 guifg=#e0e0e0 guibg=#008000 gui=NONE

hi! ALEErrorSign term=standout ctermfg=1 ctermbg=22 guifg=Red guibg=#008000
hi! ALEWarningSign term=standout ctermfg=11 ctermbg=22 guifg=Yellow guibg=#008000

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal
if has('gui_running')
	hi! SpellBad gui=undercurl guisp=red
	hi! SpellCap gui=undercurl guisp=blue
	hi! SpellRare gui=undercurl guisp=magenta
	hi! SpellRare gui=undercurl guisp=cyan
else
	hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
	hi! SpellCap term=underline cterm=underline
	hi! SpellRare term=underline cterm=underline
	hi! SpellLocal term=underline cterm=underline
endif
