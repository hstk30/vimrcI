" PracticalVim Tip 49.
let mapleader=","
noremap \ ,

" Disable highlight 
nnoremap <leader>/ :nohlsearch<CR>

" Vim’s plus register references the system clipboard
map <leader>y "+y
map <leader>Y "+Y
map <leader>p "+p
map <leader>P "+P

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<CR>:tabclose<CR>gT

" Close all the buffers
map <leader>ba :bufdo bd<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map [t :tprevious<CR>
map ]t :tnext<CR>
map [T :tfirst<CR>
map ]T :tlast<CR>

" <leader>+数字键 切换tab
noremap <silent><leader>1 1gt<CR>
noremap <silent><leader>2 2gt<CR>
noremap <silent><leader>3 3gt<CR>
noremap <silent><leader>4 4gt<CR>
noremap <silent><leader>5 5gt<CR>
noremap <silent><leader>6 6gt<CR>
noremap <silent><leader>7 7gt<CR>
noremap <silent><leader>8 8gt<CR>
noremap <silent><leader>9 9gt<CR>
noremap <silent><leader>0 10gt<CR>

" Let 'tl' toggle between this and the last accessed tab
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <C-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" switch adjacent line
nnoremap dj :move .+1<CR>==
nnoremap dk :move .-2<CR>==
vnoremap dj :move '>+1<CR>gv=gv
vnoremap dk :move '<-2<CR>gv=gv

" Spell checking
map [os :setlocal spell!<CR>
map ]os :setlocal spell!<CR>

" quickfix-window
map [oq :copen<CR>
map ]oq :cclose<CR> 
" map <leader>co ggVGy:tabnew<CR>:set syntax=qf<CR>pgg
map [q :cprevious<CR>
map ]q :cnext<CR>
map [Q :cfirst<CR>
map ]Q :clast<CR>

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<CR>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<CR>

" Toggle paste mode on and off
map [op :setlocal paste!<CR>
map ]op :setlocal paste!<CR>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Bash like keys for insert line
inoremap <c-A> <Home>
inoremap <C-E> <End>

" Remap VIM 0 to first non-blank character
map 0 ^

" Ack the selected text
vnoremap <leader>gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>gg :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" search for the text we want, and store the search pattern,
" then yank the replace text to default reg 0, 
" final press <leader>sp add flag
nnoremap <leader>sp :%s//\=@0/g

" count the matches for the current patten
nnoremap <leader>cn :%s///gn<CR>

" Practical Vim tip 86: search for the current visual selection
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR> 
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g') 
    let @s = temp
endfunction

