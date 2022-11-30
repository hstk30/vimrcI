call plug#begin()

" Search
Plug 'git@github.com:mileszs/ack.vim'
Plug 'git@github.com:Yggdroot/LeaderF'

" Auxiliary
Plug 'git@github.com:tpope/vim-surround'
Plug 'git@github.com:tpope/vim-repeat'
Plug 'git@github.com:tpope/vim-commentary'
Plug 'git@github.com:tpope/vim-abolish'
Plug 'git@github.com:jiangmiao/auto-pairs'
Plug 'git@github.com:preservim/nerdtree'
Plug 'git@github.com:tomtom/tlib_vim'
Plug 'git@github.com:terryma/vim-expand-region'
Plug 'git@github.com:nathanaelkane/vim-indent-guides'
Plug 'git@github.com:editorconfig/editorconfig-vim'
Plug 'git@github.com:preservim/tagbar'
Plug 'git@github.com:skywind3000/asyncrun.vim'
" Plug 'git@github.com:MarcWeber/vim-addon-mw-utils'
" Plug 'git@github.com:sophacles/vim-bundle-mako'
" Plug 'git@github.com:michaeljsmith/vim-indent-object'

" Status Line
Plug 'git@github.com:itchyny/lightline.vim'
Plug 'git@github.com:maximbaz/lightline-ale'

" Git 
Plug 'git@github.com:tpope/vim-rhubarb'
Plug 'git@github.com:tpope/vim-fugitive'
Plug 'git@github.com:airblade/vim-gitgutter'

" Lang
Plug 'git@github.com:dense-analysis/ale'
Plug 'git@github.com:ludovicchabant/vim-gutentags'
Plug 'git@github.com:ycm-core/YouCompleteMe'
Plug 'git@github.com:MarcWeber/vim-addon-mw-utils'
Plug 'git@github.com:garbas/vim-snipmate'
Plug 'git@github.com:honza/vim-snippets'

Plug 'git@github.com:nvie/vim-flake8'
Plug 'git@github.com:Vimjas/vim-python-pep8-indent'

Plug 'git@github.com:plasticboy/vim-markdown'

Plug 'git@github.com:rust-lang/rust.vim'

Plug 'git@github.com:digitaltoad/vim-pug'

Plug 'git@github.com:chr4/nginx.vim'

call plug#end()


""""""""""""""""""""""""""""""
" => snipMate support <CTRL-j>
""""""""""""""""""""""""""""""
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>
let g:snipMate = { 'snippet_version' : 1 }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.log$', '\.o$']
let g:NERDTreeWinSize=30
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


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
nmap <silent> <leader>a <Plug>(ale_next_wrap)
nnoremap <leader>ld :ALEDetail<cr>

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
let g:gitgutter_enabled=0
nnoremap <silent> <leader>df :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EditorConfig (project-specific EditorConfig rule)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy the link to the line of a Git repository to the clipboard
nnoremap <leader>v :.GBrowse!<CR>
xnoremap <leader>v :'<'>GBrowse!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'


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

nmap <leader>fw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>fd <Plug>(YCMFindSymbolInDocument)
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ji :YcmCompleter GoToImplementation<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jcr :YcmCompleter GoToCallers<CR>
nnoremap <leader>jce :YcmCompleter GoToCallees<CR>

nnoremap <leader>kd :YcmCompleter GetDoc<CR>

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

