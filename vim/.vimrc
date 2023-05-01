set nocompatible "关闭与vi兼容模式
filetype on "检测文件类型
filetype plugin on " 允许加载文件类型插件
set number
set relativenumber "设置所在光标行的相对行号
set wrap "自动换行
set linebreak
syntax on
set showmatch
set scrolloff=3 "距顶部和底部3行
set mouse=
set ambiwidth=double "设置为双字宽显示，否则有些符号无法完整显示如：☆
set clipboard+=unnamed "系统剪贴板设置为默认无名寄存器
set wildmenu "输入命令的时候Tab显示提示
set nocursorline "不高亮显示当前行
set termguicolors
set t_Co=256

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab  "将Tab自动转化成空格
set autoindent  "自动与上一行缩进保持一致
set smartindent 
set ruler "显示当前行号列号
set showcmd "在状态栏显示正在输入的命令

" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1
" colorscheme tokyonight  
"colorscheme molokai
"colorscheme onedark 


" 设置leader键，设置为空格键
let mapleader=" "
nnoremap <leader>ev :e $MYVIMRC<cr> " 打开我的配置文件

"-------------------------------------------------------------------------------
" window
"-------------------------------------------------------------------------------
" Split window
nmap ss :split<Return><C-w>w
nmap vs :vsplit<Return><C-w>w
" Move window
"nmap <Space> <C-w>w
"map s<left> <C-w>h
"map s<up> <C-w>k
"map s<down> <C-w>j
"map s<right> <C-w>l
" map sh <C-w>h
" map sk <C-w>k
" map sj <C-w>j
" map sl <C-w>l

" Resize window
" 在mac/linux中使用Alt键，在webssh
" 中alt没用，就使用Ctrl,WEBSSH主要的WINDOWS中使用
"nmap <M-left> <C-w><
"nmap <C-left> <C-w><
"nmap s<left> <C-w><

"nmap <M-right> <C-w>>
"nmap <C-right> <C-w>>
"nmap s<right> <C-w>>

"nmap <M-up> <C-w>+
"nmap <C-up> <C-w>+
"nmap s<up> <C-w>+

"nmap <M-down> <C-w>-
"nmap <C-down> <C-w>-
"nmap s<down> <C-w>-

" 插入模式移动光标
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <Delete>
" 其实感觉home用的没有end多，统一风格都用大写的
"inoremap HH <Home>
" 单词中包含ll的太多了，所以用大写LL
"inoremap LL <End>
" jk <Esc>
inoremap jk <Esc>
" 插入模式鼠标滚轮抵消,不然会出现滚动鼠标录入了一堆5j5k
inoremap 5k <Esc>
inoremap 5j <Esc>
inoremap 9<CR> <Esc>a
" 快速跳转行首与行尾  
nnoremap L $
nnoremap H ^
" 向下5行
noremap <C-j> 5j
" 向上5行
noremap <C-k> 5k
" 保 存
noremap <C-s> :w<CR>
noremap s :w<CR>
" Coc智能处理，使用IDEA Alt+Enter 同样按键
"noremap <M-Enter> :CocAction<CR>
inoremap <C-s> <ESC> :w<CR>
" 代码格式化
noremap <leader>f :Format<CR> 

" 强制退出
map Q :q<CR>
"map qq :q<CR>
" 重新加载设置
map R :source $MYVIMRC<CR>
"自动关闭标签
inoremap <buffer> <C-v> <esc>yiwi<lt><esc>ea></><esc>hpF>i
set iskeyword+=<,>
iab <h1> <lt>h1> <lt>/h1><esc>5ha

" 全选
nmap <C-a> gg<S-v>G
" 加/减数字1
nnoremap + <C-a>
nnoremap - <C-x>

"-------------------------------------------------------------------------------
" Buffers
"-------------------------------------------------------------------------------
" Open current directory
"nmap te :tabedit
"nmap <S-Tab> :tabprev<Return>
nmap <S-Tab> :bprev<Return>
"nmap <Tab> :tabnext<Return>
nmap <Tab> :bnext<Return>
" 窗口管理器
" invoke with '-'
"nmap  -  <Plug>(choosewin)
"nmap  sw  <Plug>(choosewin)
"nmap  <leader>w  <Plug>(choosewin)

" 一键运行python
map <F5> :call RunPython()<CR>
func! RunPython()
	exec "w"
	if &filetype=='python'
	    set splitbelow
	    :sp
	    :term python3.9 %
		" exec "!time python3.9 %"
	endif
endfunc

" 自动创建python文件头
autocmd BufNewFile *.py,*.tex exec ":call SetTitle()"
func! SetTitle() 
    if &filetype == 'python'
        call setline(1,"#!/usr/bin/ python3")
        call append(line("."),"# -*- coding:UTF-8 -*-")
        call append(line(".")+1, "# File Name: ".expand("%"))
        call append(line(".")+2, "# Author: xssaw")
        call append(line(".")+3, "# Created Time: ".strftime("%c"))
    endif
    normal Go 
endfunc


autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>


" 代码大纲快捷键
nmap <F8> :TagbarToggle<CR>

"设置跳出自动补全的括号
func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunc
" 将tab键绑定为跳出括号
inoremap <TAB> <c-r>=SkipPair()<CR>
