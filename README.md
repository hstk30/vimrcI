# vimrcI

# <leader>
```
" PracticalVim Tip 49
let mapleader="," 
noremap \ ,
```
## 依赖

- `Universal Ctags`，插件`tagbar` 和`vim-gutentags` 需要
- `YouCompleteMe` 的各种依赖[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe#installation)

## Key Mappings

### **模式** 说明

- `N`: Normal mode
- `V`: Visual mode
- `I`: Insert mode
- `C`: Command mode

`+` 表示支持多个 **模式**


### 窗口移动

| 按键 | 模式 | 说明 |
|:----:| ---  | --- |
| `C-k` | `N` | 跳转到上面窗口 |
| `C-j` | `N` | 跳转到下面窗口 |
| `C-h` | `N` | 跳转到左边窗口 |
| `C-l` | `N` | 跳转到右边窗口 |

### 文件管理

| 按键 | 模式 | 说明 |
| :---: | --- | --- |
| `[ot` | `N` | 打开一个 **tab**  |
| `]ot` | `N` | 关闭当前 **tab** |
| `C-\` | `N+I` | 最近 **tab** 之间来回切换 |
| `<leader>to` | `N` | 只保留当前 **tab**，关闭其他 **tab** |
| `<leader>1` | `N` | 切换到 **1** 号 **tab**  |
| `<leader>2` | `N` | 切换到 **2** 号 **tab**  |
| ... | `N` | 切换到 **x** 号 **tab**  |
| `<leader>0` | `N` | 切换到 **10** 号 **tab**  |
| `<leader>ew` | `N` | 在当前 **buffer** 打开文件，扩展了当前文件路径 |
| `<leader>es` | `N` | 以 `split` 打开文件，扩展了当前文件路径  |
| `<leader>ev` | `N` | 以 `vsplit` 打开文件，扩展了当前文件路径  |
| `<leader>et` | `N` | 在新 **tab** 打开文件，扩展了当前文件路径  |

### 交换邻近行

| 按键 | 模式 | 说明 |
| :--: | --- | --- |
| `dk` | `N+V` | 当前行和上一行交换 |
| `dj` | `N+V` | 当前行和下一行交换 |

记为先删除(`d`)然后移动到上/下(`k/j`)

### Bash-Like

| 按键 | 模式 | 说明 |
| :--: | --- | --- |
| `C-a` | `I+C` | 光标到行头 `Home` |
| `C-e` | `I+C` | 光标到行尾 `End` |
| `C-k` | `C` | 删除整行 |
| `C-p` | `C` | 上一条历史命令 `Up` |
| `C-n` | `C` | 下一条历史命令 `Down` |


### 插件


[ack.vim](https://github.com/mileszs/ack.vim) : **vimgrep** 替代

    `<leader>ss` -- `N` -- `:Search xxx` 当前项目下递归查找`xxx`，默认为 last pattern
    `<leader>sv` -- `N` -- 当前项目下递归查找选中的内容


[LeaderF](https://github.com/Yggdroot/LeaderF) : 文件模糊查找

    `<leader>ff` -- `N` -- 当前项目下按文件名模糊查找
    `<leader>fb` -- `N` -- 查找 **buffer**
    `<leader>fm` -- `N` -- 在最近打开过的文件里模糊查找
    `<leader>ft` -- `N` -- 按 **tag** 查找
    `<leader>fl` -- `N` -- 按行查找


[ale](https://github.com/dense-analysis/ale) : 语法动态检查

    `<leader>[e` -- `N` -- 当前 **buffer** 的上一个语法错误 **error** **warning** 
    `<leader>]e` -- `N` -- 当前 **buffer** 的下一个语法错误 **error** **warning** 
    `<leader>[E` -- `N` -- 当前 **buffer** 的第一个语法错误 **error** **warning** 
    `<leader>]E` -- `N` -- 当前 **buffer** 的最后一个语法错误 **error** **warning** 
    `<leader>dl` -- `N` -- 小窗口显示具体错误信息


[vim-fugitive](https://github.com/tpope/vim-fugitive) : git 相关

    `<leader>gb` -- `N` -- git blame
    `<leader>gf` -- `N` -- git diff


[vim-gitgutter](https://github.com/airblade/vim-gitgutter) : git diff 可视化

    `<leader>df` -- `N` -- 开启/关闭 `git diff` 可视化
    `<leader>[h` -- `N` -- 当前 **buffer** 的上一个 `git diff` 改动
    `<leader>]h` -- `N` -- 当前 **buffer** 的下一个 `git diff` 改动
    `<leader>cp` -- `N` -- 小窗口显示改动前后的差异
    `<leader>cs` -- `N+V` -- 暂存当前差异
    `<leader>cu` -- `N` -- 撤销当前差异


[needtree](https://github.com/preservim/nerdtree) : 文件树

    `<leader>nn` -- `N` -- 开启/关闭文件树
    `<leader>nf` -- `N` -- 显示当前 **buffer** 在文件树中的位置



[asyncrun.vim](https://github.com/skywind3000/asyncrun.vim) : 异步执行Shell 命令

    `<leader>ar` -- `N` -- `:AsyncRun `


[YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) : 代码补全

    `<leader>gd` -- `N` -- go to definition or declaration
    `<leader>gr` -- `N` -- go to references
    `<leader>gi` -- `N` -- go to implementation
    `<leader>gcr` -- `N` -- go to callers
    `<leader>gce` -- `N` -- go to callees
    `<leader>gk` -- `N` -- 查看文档说明

不同语言不一样，有点不灵。


[golden-ratio](https://github.com/roman/golden-ratio) : 多窗口自动调整尺寸

    `<leader>wr` -- `N` -- 多窗口时，调整窗口布局


[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)

    `<leader>ti` -- `N` -- 开启/关闭缩进可视化


### [vim-unimpaired](https://github.com/tpope/vim-unimpaired) 的继承和扩展

| 按键 | 模式 | 说明 |
| :--: | --- | --- |
| `[oh` | `N` | 高亮搜索开启 |
| `]oh` | `N` | 高亮搜索关闭 |
| `[os` | `N` | 拼写纠错开启 |
| `]os` | `N` | 拼写纠错关闭 |
| `[op` | `N` | 粘贴模式开启 |
| `]op` | `N` | 粘贴模式关闭 |


### Misc

- `<leader>cn` -- `N` -- 统计 last pattern 匹配的数量
- `<leader>sy` -- `N` -- 分步替换，先 **search** 被替换的文本，再 **yank** 要替换的文本，再执行这个命令进行替换

