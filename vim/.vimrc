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
set cursorline "高亮显示当前行
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

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight  
"colorscheme molokai
"colorscheme onedark 

map <F5> :call RunPython()<CR>
func! RunPython()
	exec "w"
	if &filetype=='python'
		exec "!time python3.9 %"
	endif
endfunc

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>


" 设置leader键，设置为空格键
let mapleader=" "
nnoremap <leader>ev :e $MYVIMRC<cr> " 打开我的配置文件

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
