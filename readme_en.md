# vimrcI

[中文-readme](./README.md) | [EN-readme](./readme_en.md)

![vim-show](https://github.com/hstk30/reference/blob/main/gifs/vimrcI/vim-jump.gif)


## Install

    git clone https://github.com/hstk30/vimrcI.git .vim/vimrcI
    ln -s ~/.vim/vimrcI/vimrc ~/.vimrc
    ln -s ~/.vim/vimrcI/ideavimrc ~/.ideavimrc

Install VIM plugins

    :PlugInstall

## No Plugin Ed

    git clone https://github.com/hstk30/vimrcI.git .vim/vimrcI
    ln -s ~/.vim/vimrcI/no_plugin_vimrc ~/.vimrc

## Dependency

- [Universal Ctags](https://ctags.io/), [global](https://www.gnu.org/software/global/) for [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags).
- [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe#installation)'s dependency.

## leader

```
" PracticalVim Tip 49
let mapleader="," 
noremap \ ,
```

## Basic rule

- **right-left-left** or **right-left-right**: Keep the plugin's hot-key map to left keystrokes because of the `,` **leader**.
- Override original Built-In commands as little as possible.
- No `M-x` `D-x` `A-x` `TAB` `Fn` keystroke combo.

## Feature

### **Mode** Intr

- `N`: Normal mode
- `V`: Visual mode
- `I`: Insert mode
- `C`: Command mode

`+` means work for multi-**Mode**


### Window move

| Keystrokes | Mode | Desc |
|:----:| ---  | --- |
| `C-k` | `N` | Move to the above window |
| `C-j` | `N` | Move to the below window |
| `C-h` | `N` | Move to the left window |
| `C-l` | `N` | Move to the right window |


### File manage

| Keystrokes | Mode | Desc |
| :---: | --- | --- |
| `[ot` | `N` | Open a **tab**  |
| `]ot` | `N` | Close current **tab** |
| `C-\` | `N+I` | Switch to the last accessed **tab** |
| `<leader>to` | `N` | **tab** only |
| `<leader>1` | `N` | Switch to the **1** **tab**  |
| `<leader>2` | `N` | Switch to the **2** **tab**  |
| ...       | `N` | Switch to the **x** **tab**  |
| `<leader>0` | `N` | Switch to the **10** **tab**  |
| `<leader>ew` | `N` | Edit file in window, expands to the current directory |
| `<leader>es` | `N` | Edit file in `split` window, expands to the current directory |
| `<leader>ev` | `N` | Edit file in `vsplit` window, expands to the current directory |
| `<leader>et` | `N` | Edit file in new **tab**, expands to the current directory |


### Swap adjacent lines

| Keystrokes | Mode | Desc |
| :--: | --- | --- |
| `dk` | `N+V` | Swap current line with above line |
| `dj` | `N+V` | Swap current line with below line |

Memo: delete(`d`) first, then move to above/below(`k/j`)

### Bash-Like

| Keystrokes | Mode | Desc |
| :--: | --- | --- |
| `C-a` | `I+C` | Go to the beginning of the line |
| `C-e` | `I+C` | Go to the end of the line |
| `C-k` | `C` | Clear the line after the cursor |
| `C-p` | `C` | Previous command |
| `C-n` | `C` | Next command |


### Copy and paste in clipboard

| Keystrokes | Mode | Desc |
| :--: | --- | --- |
| `<leader>y` | `N` | Copy to the system clipboard |
| `<leader>Y` | `N` | Copy to the system clipboard |
| `<leader>p` | `N` | Paste from the system clipboard |
| `<leader>P` | `N` | Paste from the system clipboard |


### Terminal

| Keystrokes | Mode | Desc |
| :--: | --- | --- |
| `<leader>tt` | `N` | Open terminal in the **bottom** |
| `<Esc>` | `Terminal` | Switch to `Terminal-Normal` mode，keystrokes `i/a` switch to the `Terminal-Job` mode |


### Plugins

[ack.vim](https://github.com/mileszs/ack.vim) : Replacement of **vimgrep** 

- `<leader>ss` `N` - `:Search xxx` Search `xxx` in the project, if not set `xxx` then use the **last pattern**.
- `<leader>sv` `V` - Search the selected area in the project.
- `<leader>*` `N` - Search the word under the cursor in the project.

[QFGrep](https://github.com/sk1418/QFGrep) : Filter entries in Quickfix

- `<leader>g` `N` - filter Quickfix-list entries
- `<leader>v` `N` - like grep -v
- `<leader>r` `N` - restore Quickfix-list

[LeaderF](https://github.com/Yggdroot/LeaderF) : An efficient fuzzy finder

- `<leader>ff` `N` - Fuzzy search file in the project.
- `<leader>fb` `N` - Fuzzy search **buffer**.
- `<leader>fm` `N` - Fuzzy search most recently used files.
- `<leader>ft` `N` - Navigate tags using the tags file.
- `<leader>fl` `N` - Search a line in the buffer.


[ale](https://github.com/dense-analysis/ale) : Check syntax asynchronously and fix files

- `[e` `N` - Go to the previous error or warning in the buffer.
- `]e` `N` - Go to the next error or warning in the buffer.
- `[E` `N` - Go to the first error or warning in the buffer.
- `]E` `N` - Go to the last error or warning in the buffer.
- `<leader>dl` `N` - Show the detail linter info in the preview window. 


[vim-fugitive](https://github.com/tpope/vim-fugitive) : Git wrapper

- `<leader>gb` `N` - Git blame
- `<leader>gf` `N` - Git diff


[vim-gitgutter](https://github.com/airblade/vim-gitgutter) : Shows a git diff in the sign column

- `<leader>df` `N` - Open/Close `git diff` info.
- `[h` `N` - Go to the previous hunk.
- `]h` `N` - Go to the next hunk.
- `<leader>cp` `N` - Preview the hunk the cursor in the preview window.
- `<leader>cs` `N+V` - Stage the diff.
- `<leader>cu` `N` - Undo the diff.


[nerdtree](https://github.com/preservim/nerdtree) : File tree explorer

- `<leader>nn` `N` - Open/Close the NERDTree.
- `<leader>nf` `N` - Locate current file in the NERDTree window.


[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) : Code-completion engine 

- `<leader>k` `N` - Open/Close the hover info, default closed.
- `<leader>gk` `N` - See the document.

May need [YCM-Generator](https://github.com/hstk30/YCM-Generator).


[vim-gutentags](https://github.com/ludovicchabant/vim-gutentags) and [gutentags_plus](https://github.com/skywind3000/gutentags_plus)

- `<leader>gs` `N` - Find this symbol.
- `<leader>gg` `N` - Find this definition.
- `<leader>gd` `N` - Find functions called by this function.
- `<leader>gc` `N` - Find functions calling this function.


[golden-ratio](https://github.com/roman/golden-ratio) : Automatic resizing windows

- `<leader>wr` `N` - Automatic resizing current window to the "Golden Ratio".


[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) : Indent visualize

- `<leader>ti` `N` - Open/Close indent visualize.


[argtextobj.vim](https://www.vim.org/scripts/script.php?script_id=2699) : Arg text object

- `aa` `N` - An arg text object.
- `ia` `N` - Inner arg text object.


[vim-surround](https://github.com/tpope/vim-surround) : Delete/change/add parentheses/quotes/XML-tags/much more with ease

-  `cs{src_pair}{des_pair}` `N` - `cs"'` `cs(]` ... Change surround pairs `src_pair` to `des_pair`
-  `ys{text-object}{des_pair}` `N` - `ysiw'` `ysiw]` ... Surround `text-object` by `des_pair`
-  `ds{des_pair}` `N` - `ds)` `ds"` ... Delete surround pairs `des_pair`
-  `S` `V` - surround the selected area.


[vim-commentary](https://github.com/tpope/vim-commentary) : Code comment

- `gcc` `N` - Comment/Uncomment line.
- `gc` `V` - Comment/Uncomment the selected area.


### [vim-unimpaired](https://github.com/tpope/vim-unimpaired) extend

| Keystrokes | Mode | Desc |
| :--: | --- | --- |
| `[oh` | `N` | Open the hlsearch |
| `]oh` | `N` | Close the hlsearch |
| `[os` | `N` | Open spell check |
| `]os` | `N` | Close spell check |
| `[op` | `N` | Open paste mode |
| `]op` | `N` | Close paste mode |


### Misc

- `<leader>cn` `N` - Count last pattern match number.
- `<leader>sy` `N` - Step substitute: First **search** the text, then **yank** the text which want to be substitute, finally fire this command.

