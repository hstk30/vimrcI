call plug#begin()

" Search
Plug 'git@github.com:mileszs/ack.vim'
Plug 'git@github.com:Yggdroot/LeaderF'

" unknow
" Plug 'git@github.com:tomtom/tlib_vim'
" Plug 'git@github.com:editorconfig/editorconfig-vim'
" Plug 'git@github.com:MarcWeber/vim-addon-mw-utils'

" Auxiliary
Plug 'git@github.com:tpope/vim-surround'
Plug 'git@github.com:tpope/vim-repeat'
Plug 'git@github.com:tpope/vim-commentary'
Plug 'git@github.com:tpope/vim-abolish'
Plug 'git@github.com:jiangmiao/auto-pairs'
Plug 'git@github.com:preservim/nerdtree'
Plug 'git@github.com:terryma/vim-expand-region'
Plug 'git@github.com:nathanaelkane/vim-indent-guides'

Plug 'git@github.com:skywind3000/asyncrun.vim'
Plug 'git@github.com:roman/golden-ratio.git'
Plug 'git@github.com:michaeljsmith/vim-indent-object'
Plug 'git@github.com:machakann/vim-highlightedyank.git'

" Status Line
Plug 'git@github.com:itchyny/lightline.vim'
Plug 'git@github.com:maximbaz/lightline-ale'

" Git 
Plug 'git@github.com:tpope/vim-rhubarb'
Plug 'git@github.com:tpope/vim-fugitive'
Plug 'git@github.com:airblade/vim-gitgutter'

" Lang
" Plug 'git@github.com:preservim/tagbar'
Plug 'git@github.com:dense-analysis/ale'
Plug 'git@github.com:ludovicchabant/vim-gutentags'
Plug 'git@github.com:hstk30/YCM-Generator.git'
Plug 'git@github.com:ycm-core/YouCompleteMe'
" Plug 'git@github.com:garbas/vim-snipmate'
" Plug 'git@github.com:honza/vim-snippets'

Plug 'git@github.com:nvie/vim-flake8'
Plug 'git@github.com:Vimjas/vim-python-pep8-indent'

Plug 'git@github.com:plasticboy/vim-markdown'

Plug 'git@github.com:rust-lang/rust.vim'

" Plug 'git@github.com:digitaltoad/vim-pug'
" Plug 'git@github.com:chr4/nginx.vim'

call plug#end()


" => vim-indent-guides
nnoremap <leader>ti <Plug>IndentGuidesToggle

""""""""""""""""""""""""""""""
" => snipMate support <CTRL-j>
""""""""""""""""""""""""""""""
" ino <C-j> <C-r>=snipMate#TriggerSnippet()<CR>
" snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<CR>
" let g:snipMate = { 'snippet_version' : 1 }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'python': ['flake8'],
\   'c': ['clang']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'python': ['autopep8'],
\}

let g:ale_c_gcc_options = '-Wall -std=c89'
nnoremap  <silent> [e <Plug>(ale_previous_wrap)
nnoremap  <silent> ]e <Plug>(ale_next_wrap)
nnoremap  <silent> [E <Plug>(ale_first)
nnoremap  <silent> ]E <Plug>(ale_last)

nnoremap <leader>dl :ALEDetail<CR>

" Disabling highlighting
let g:ale_set_highlights = 0

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_python_flake8_options = '--config=$HOME/.vim/vimrcI/conf/flake8.conf'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100
let g:gitgutter_enabled=0
nnoremap <leader>df :GitGutterToggle<CR>:GitGutterLineHighlightsToggle<CR>
nmap [h <Plug>(GitGutterPrevHunk)]
nmap ]h <Plug>(GitGutterNextHunk)
nmap <leader>cp <Plug>(GitGutterPreviewHunk)
nmap <leader>cs <Plug>(GitGutterStageHunk)
nmap <leader>cu <Plug>(GitGutterUndoHunk)
xmap <leader>cs <Plug>(GitGutterStageHunk)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EditorConfig (project-specific EditorConfig rule)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:EditorConfig_exclude_patterns = ['fugitive://.*']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
" => rhubarb
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy the link to the line of a Git repository to the clipboard
nnoremap <leader>v :.GBrowse!<CR>
xnoremap <leader>v :'<'>GBrowse!<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gf :topleft Git diff<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap  <F8> :TagbarToggle<CR>
" let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" let g:gutentags_exclude_filetypes = ['.pyc', '.dll', '.log']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += [
            \ '--exclude=.git', '--exclude=BUILD', '--exclude=.svn',
            \ '--exclude=*.js', '--exclude=vendor/*', '--exclude=node_modules/*',
            \ '--exclude=db/*', '--exclude=log/*', '--exclude=\*.min.\*',
            \ '--exclude=\*.swp', '--exclude=\*.bak', '--exclude=\*.pyc',
            \ '--exclude=\*.class', '--exclude=\*.sln', '--exclude=\*.csproj',
            \ '--exclude=\*.csproj.user', '--exclude=\*.cache', '--exclude=\*.dll',
            \ '--exclude=\*.pdb', '--exclude=target', '--exclude=.idea',
            \ '--exclude=\*.md', '--exclude=\*.markdown', '--exclude=doc/*',
            \ '--exclude=docs/*', '--exclude=bin/*', '--exclude=ide/*'
            \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.log$', '\.o$']
let g:NERDTreeWinSize=30
nnoremap  <leader>nn :NERDTreeToggle<CR>
nnoremap  <leader>nb :NERDTreeFromBookmark<Space>
nnoremap  <leader>nf :NERDTreeFind<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't show the help in normal mode
set modelines=1
let g:Lf_ShowDevIcons = 0
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode need `vim8+`
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" 排除搜索的文件夹和文件
let g:Lf_WildIgnore = {
       \ 'dir': ['.svn','.git','.hg','venv','.vscode','.SpaceVim.d', 'target', 'log', 'vendor'],
       \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
       \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Asyncrun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
nnoremap <leader>ar :AsyncRun 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_show_diagnostics_ui=0
let g:ycm_server_log_level='info'
let g:ycm_min_num_identifier_candidate_chars=2
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion='<c-z>'
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt=0

nnoremap <leader>sw <Plug>(YCMFindSymbolInWorkspace)
nnoremap <leader>sd <Plug>(YCMFindSymbolInDocument)
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gi :YcmCompleter GoToImplementation<CR>
nnoremap <leader>gcr :YcmCompleter GoToCallers<CR>
nnoremap <leader>gce :YcmCompleter GoToCallees<CR>

nnoremap <leader>gk :YcmCompleter GetDoc<CR>

let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{3}'],
			\ 'cs,lua,javascript': ['re!\w{3}'],
			\ }

let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "python":1,
            \ "rust": 1,
            \ "lua": 1,
            \ "go": 1,
            \ "asm": 1,
			\ "sh":1,
			\ "make":1,
			\ "zsh":1,
			\ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1
set conceallevel=2

" => golden-ratio
let g:golden_ratio_autocommand = 0
nnoremap <leader>wr <Plug>(golden_ratio_resize)

" => ack
command! -nargs=* Search call WrapAck(<f-args>)

" Use `mM` to mark the location first, 
" when travel in the quickfix list will create many `tabs`,
" finally back to original location by `M, 
" and `:tabonly` (`,to`) to delete all `tabs`

" Use Ack to search
noremap <leader>ss mM:Search 

" Ack the selected text
vnoremap <leader>sv mM:call VSearch()<CR>

" Ack the word under the cursor 
noremap <leader>* mM:call WSearch()<CR>


function! WrapAck(...) 
    " [Search results leak into terminal](https://github.com/mileszs/ack.vim/issues/18)
    let l:string = @/
    if a:0 == 0
        " for the last-pattern is 'iskeyword', throw the boundary
        if l:string[0:1] == '\<' && l:string[-2:] == '\>'
            let l:string = l:string[2:-3]
        endif
    elseif a:0 == 1
        let l:string = a:1
    else
        echoerr "Too many arguments"
    endif

    let saved_shellpipe = &shellpipe
    let &shellpipe = '>'
    try
        execute 'Ack!' shellescape(l:string, 1)
    finally
        let &shellpipe = saved_shellpipe
    endtry
endfunction


function! WSearch()
    let l:temp = expand("<cword>")
    call WrapAck(temp)
endfunction


function! VSearch()
    let l:temp = @s
    norm! gv"sy

    call WrapAck(@s)
    let @s = temp
endfunction
