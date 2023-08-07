" => universal ctags  https://github.com/universal-ctags/ctags
set tags=./.tags;,.tags

filetype plugin on
filetype indent on

set history=200
set nojoinspaces
set autoread
" vim q: e11: invalid in command-line window; <cr> executes, ctrl-c quits: checktime
au FocusGained * checktime

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=7

" Put the new window right of the current one.
set splitright

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu
set wildmode=full

" display line number
set number

" display position (row, column)
set ruler

set cmdheight=1

" buffer become hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Always show the signcolumn(show mark/gitdiff info)
" set signcolumn=yes

" Always show tab line
set showtabline=2
set foldcolumn=1

" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent
set smartindent
set wrap "Wrap lines

let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()

" Ignore special files
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Always show the status line
set laststatus=2

" from vim-sensible
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" terminal 
if v:version >= 900
    set termwinsize=16x0
endif

" Strip trailing whitespace
function! Preserve(command)
    let l:save = winsaveview()
    execute a:command
    call winrestview(l:save)
endfunction

command! TrimWhitespace call Preserve("%s/\\s\\+$//e")

if has("autocmd")
    autocmd BufWritePre *.txt,*.py,*.sh,*.c,*.rs TrimWhitespace
endif

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

""""""""""keymap""""""""""
" PracticalVim Tip 49.
let mapleader=","
noremap \ ,

" Smart way to move between windows
noremap  <C-k> <C-W>k
noremap  <C-j> <C-W>j
noremap  <C-h> <C-W>h
noremap  <C-l> <C-W>l

" Close the current buffer
noremap  <leader>bd :Bclose<CR>:tabclose<CR>gT

" Close all the buffers
noremap  <leader>ba :bufdo bd<CR>

" Close empty buffers
noremap <leader>bc :<C-u>call DeleteEmptyBuffers()<CR>

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
nnoremap <silent> ]A :last<CR>

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

" Some operation will generate many [No Name] buffer
function! DeleteEmptyBuffers()
    let [i, n] = [1, bufnr('$')]
    let empty = []
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bwipeout' join(empty)
    endif
endfunction
