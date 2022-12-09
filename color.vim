" Colorscheme
" 推荐备选一个light 的主题，写代码使用dark，有时候需要投屏的使用就需要light 
set background=dark
colorscheme PaperColor
" set background=light
" colorscheme mac_classic

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
" 	\ gui=NONE guifg=DarkGrey guibg=NONE

" " 去掉 sign column 的白色背景
" hi! SignColumn term=standout ctermfg=178 ctermbg=248 guifg=Cyan guibg=Grey
hi! SignColumn ctermfg=White ctermbg=22 guifg=#e0e0e0 guibg=#008000 gui=NONE

hi! ALEErrorSign term=standout ctermfg=1 ctermbg=22 guifg=Red guibg=#008000
hi! ALEWarningSign term=standout ctermfg=11 ctermbg=22 guifg=Yellow guibg=#008000

" 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" 只显示红色或者蓝色下划线或者波浪线
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
