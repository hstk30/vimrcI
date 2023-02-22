" PracticalVim Tip 49.
let mapleader=","
noremap \ ,

" Vim’s plus register references the system clipboard
noremap  <leader>y "+y
noremap  <leader>Y "+Y
noremap  <leader>p "+p
noremap  <leader>P "+P

" Smart way to move between windows
noremap  <C-k> <C-W>k
noremap  <C-j> <C-W>j
noremap  <C-h> <C-W>h
noremap  <C-l> <C-W>l

" Close the current buffer
noremap  <leader>bd :Bclose<CR>:tabclose<CR>gT

" Close all the buffers
noremap  <leader>ba :bufdo bd<CR>

" <leader>+num switch tab
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

" In Mac <C-Tab> doesn't exist.
" So map <C-\> to switch last tab
nnoremap <C-\> g<Tab>
inoremap <C-\> <C-O>g<Tab>

" Switch CWD to the directory of the open buffer
noremap  <leader>cd :cd %:p:h<CR>:pwd<CR>

" switch adjacent line
nnoremap dk :move .-2<CR>==
nnoremap dj :move .+1<CR>==
vnoremap dk :move '<-2<CR>gv=gv
vnoremap dj :move '>+1<CR>gv=gv

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Quickly open a buffer for scribble
noremap  <leader>q :e ~/buffer<CR>

" Quickly open a markdown buffer for scribble
noremap  <leader>x :e ~/buffer.md<CR>

" => some tips from Practical Vim
" search for the text we want, and store the search pattern,
" then yank the replace text to default reg 0, 
" final press <leader>sp add flag
nnoremap <leader>sy :%s//\=@0/g

" count the matches for the current pattern
nnoremap <leader>cn :%s///gn<CR>

" => unimpaired like
" **Build-in** commands: `[` + 
"   - Special keystroke: `<C-d>` `<C-i>` `<MiddleMouse>`
"   - Alphabet keystroke: `DIPcdfimpsz`
"   - Punctuation marks: `#'(*\`/{`
" **Customized**: `bBtTqQ<C-q>lLeEh`

" highlight 
nnoremap <silent> [oh :hlsearch<CR>
nnoremap <silent> ]oh :nohlsearch<CR>

" argument-list
nnoremap <silent> [a :prev<CR>
nnoremap <silent> ]a :next<CR>
nnoremap <silent> [A :first<CR>
nnoremap <silent> ]a :last<CR>

" buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Useful mappings for managing tabs
nnoremap  [ot :tabnew<CR>
nnoremap  ]ot :tabclose<CR>
nnoremap  <leader>to :tabonly<CR>

" tag  
nnoremap [t :tprevious<CR>
nnoremap ]t :tnext<CR>
nnoremap [T :tfirst<CR>
nnoremap ]T :tlast<CR>

" Spell checking
nnoremap [os :setlocal spell!<CR>
nnoremap ]os :setlocal spell!<CR>

" quickfix-window
nnoremap [oq :botright copen<CR>
nnoremap ]oq :cclose<CR> 
" nnoremap <leader>co ggVGy:tabnew<CR>:set syntax=qf<CR>pgg
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [<C-Q> :cpfile<CR>
nnoremap ]<C-Q> :cnfile<CR>

" Toggle paste mode on and off
nnoremap [op :setlocal paste!<CR>
nnoremap ]op :setlocal paste!<CR>

" location
nnoremap <silent>[l :lprevious<cr>
nnoremap <silent>]l :lnext<cr>
nnoremap <silent>[L :lfirst<cr>
nnoremap <silent>]L :llast<cr>
" => unimpaired end

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g') 
    let @s = temp
endfunction

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Bash like keys for insert line
inoremap <C-A> <Home>
inoremap <C-E> <End>

" Fix the & command in normal+visual modes 
nnoremap & :&&<CR>
xnoremap & :&&<CR>

cnoremap %% <C-R>=expand("%:p:h").'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Remap VIM 0 to first non-blank character
noremap  0 ^

" Fix Y so that behaves like D
map Y y$

" Practical Vim tip 86: search for the current visual selection
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR> 
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" Just search the word but not forword to the next 
noremap * mm*N

" Visual line repeat 
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo '@'.getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" terminal 
if has("terminal")
    noremap <leader>tt :botright terminal ++close<CR>
    tnoremap <Esc> <C-W>N
endif

