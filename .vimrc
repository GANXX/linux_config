

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"This must be first, because it changes other options as a side effect.
set nocompatible "关闭vi兼容模式，可以启用方向键和Backspace

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup    " do not keep a backup file, use versions instead
set noundofile    " 禁止keep an undo file (undo changes after closing)
set history=999 " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set noswapfile  " 禁止交换文件
set showmatch   " 括号高亮匹配
 "set autochdir "自动切换当前编辑文件所在的工作目录
"set tags=~/path/tags 
set tags=/path/to/tags 

set tags=./tags,tags;$HOME
 "For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
set mouse=nv
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
syntax on
set hlsearch
endif

filetype on               " 检测文件类型
filetype indent on        " 针对不同的文件类型采用不同的缩进格式
filetype plugin on        " 允许插件
filetype plugin indent on " 启动自动补全

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

augroup END

set autoindent  " always set autoindenting on
set smartindent " 智能缩进
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
	      \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
" Prevent that the langmap option applies to characters that result from a
" mapping.  If unset (default), this may break plugins (but it's backward
" compatible).
set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit
"键盘映射
:imap <c-f> <Esc>
:nmap J }
:nmap K {
:nmap 9 $
"使用sudo强制保存
cnoremap w!! w !sduo tee % >/dev/null

"剪切板快捷键设置
:nmap <c-p>	"0p  "粘贴0号粘贴板的内容
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
"设置leader按键
let mapleader=';'
let g:mapleader=';'

"buffer快捷键映射
nnoremap  [b :bprevious<CR>
nnoremap  [n :bnext<CR> 
nnoremap <leader>q :w<CR>:bdelete<CR>
nnoremap <leader>w :w<CR>

"设置显示行号
set nu
set clipboard+=unnamed " 共享剪切板
set cursorline         " 突出显示当前行,
"autocmd InsertEnter 

"统一Tab宽度为4
set tabstop=4 "设置制表符(tab按键)的宽度
set softtabstop=4 "设置软制表符的宽度
set shiftwidth=3
set scrolloff=5 "光标上下两侧最少保留的屏幕行数
set cindent         "使用C/C++语言的自动缩进方式
set autowrite       "自动保存


"colorscheme gruvbox

" tabnew 是新建标签
" tabnew . 是打开目录


hi comment ctermfg=1

"--------------------------------------------------------"
"使用vim-plug管理插件
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'  " 自动对齐
Plug 'jiangmiao/auto-pairs'     " 自动补全括号
Plug 'scrooloose/nerdcommenter' " 快速代码注释
Plug 'Yggdroot/LeaderF' "tagbar的升级版
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}      " 文件树
Plug 'jistr/vim-nerdtree-tabs'  " 文件树
Plug 'octol/vim-cpp-enhanced-highlight' "c++语法高亮
Plug 'vim-airline/vim-airline' "下方状态栏插件
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline' "添加缩进线
Plug 'w0ng/vim-hybrid' "主题
Plug 'itchyny/vim-cursorword' "自动下划线单词
Plug 'lfv89/vim-interestingwords' "多选择单词标记
Plug 'mbbill/echofunc' "提示函数原型
Plug 'ludovicchabant/vim-gutentags' "自动添加tag文件
call plug#end()

"设置主题
set background=dark
colorscheme hybrid
" vim-easy-aling插件配置
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" nerdcommenter 快速代码注释
" 使用 <leader> ci 可以快速的注释和取消注释

" LeaderF 配置
" 按i进入模糊匹配模式，TAB返回选择模式
nmap <F8> :LeaderfFunction!<CR>

"打开最近使用的文件目录
noremap <c-p> :LeaderfMru<cr>
"打开buffer目录
noremap <c-n> :LeaderfBuffer<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': ''  }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.50
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"nerdtree 配置
"当输入 vim . 打开空文档的时候 自动打开文件树
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <leader>j :NERDTreeToggle<CR>

"taglist 配置Toggle<CR>

"taglist 配置
let Tlist_Show_One_File=1    " 只展示一个文件的taglist
let Tlist_Exit_OnlyWindow=1  " 当taglist是最后以个窗口时自动退出
let Tlist_Use_Right_Window=1 " 在右边显示taglist窗口
"let Tlist_Sort_Type="name"   " tag按名字排序
" 更新ctags标签文件快捷键设置
noremap <F6> :!ctags -R<CR>  
"设置taglist窗口大小
let Tlist_WinHeight = 100
let Tlist_WinWidth = 50

"gutentags**********************************
"
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
"把 opt里面的所有的头文件都建立索引然后加入ctag搜索中，
"如果是新配置需要在include文件夹中 sudo ctags -R
set tags+=/opt/ros/kinetic/include/tags
"**************************************************

"为了让tmux上面个的主题颜色显示正常
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
