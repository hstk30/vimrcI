""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

autocmd BufWinEnter *.py nmap <silent> <leader>db :w<CR>:botright terminal python3 -m pdb %:p<CR>
autocmd BufWinEnter *.py nmap <silent> <leader>rn :w<CR>:botright terminal python3 %:p<CR>

autocmd BufWinEnter *.c nmap <silent> <leader>db :w<CR>:botright terminal lldb ./main<CR>

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

""""""""""""""""""""""""""""""
" => Shell section
""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif


"----------------------------------------------------------------------
" Fixing Vim's Background Color Erase for 256-color tmux and GNU screen
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

