" vim 基础配置

" 显示行号
set nu

" 自动语法高亮
syntax on 

" 显示标尺
set ruler

" 去掉有关vi一致性模式
set nocompatible

" 显示状态行(1) 总是显示状态行(2)
set laststatus=2

" 显示当前模式
set showmode

" 显示当前键入指令
set showcmd

" 开启文件类型检查
filetype indent on

" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent

" 按下 Tab 键时，Vim 显示的空格数
set tabstop=4

" 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格 
set expandtab

" Tab 转为多少空格
set softtabstop=4

" 光标所在行高亮
set cursorline

" 一行显示多少个字符
set textwidth=128

" 自动折行
set wrap

" 关闭自动折行
" set nowrap

" 不在单词内进行折行
set linebreak

" 指定折行处与编辑窗口的右边缘之间空出的字符数
set wrapmargin=2

" 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set showmatch

" 高亮显示匹配结果
set hlsearch

" 输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set incsearch

" 搜索忽略大小写
" set ignorecase

" 保留撤销历史
set undofile

" 不创建备份文件
" 默认情况下，文件保存时，会额外创建一个备份文件，它的文件名是在原文件名的末尾，再添加一个波浪号（〜）
" set nobackup

" 不创建交换文件
" 交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp
" set noswapfile

" 设置备份文件、交换文件、操作历史文件的保存位置
" set backupdir=~/.vim/.backup//  
" set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

" Vim 需要记住多少次历史操作
set history=1000

" 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示
set autoread

" 出错时，不要发出响声
set noerrorbells

" 出错时，发出视觉提示，通常是屏幕闪烁
set visualbell

" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下
" Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full

" 
set t_Co=256
colorscheme molokai

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"              按键映射表
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编辑模式下<Esc>映射
inoremap jj <Esc>

" 选中状态下Ctrl+c复制
vmap <C-c> "+y

" 全选+复制 Ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" 文件保存与退出
nmap fw :w<CR>
nmap fq :q<CR>
nmap fwq :wq<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             插件設置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" fzf 最快的文件搜索器
Plug 'junegunn/fzf', { 'dir':'~/.fzf', 'do':'./install --all'}
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             YouCompleteMe設置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_add_preview_to_completeopt=0

let g:ycm_complete_in_comments=1
let g:ycm_min_num_of_chars_for_completion=1

nnoremap <F4> :YcmDiags<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <C-g> :YcmCompleter GoTo<CR>
nnoremap <C-t> :YcmCompleter GetType<CR>
nnoremap <leader>ycmd :YcmCompleter GetDoc<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             NerdTree設置 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
"打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"设置树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
"let g:NERDTreeShowLineNumbers=1  " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
