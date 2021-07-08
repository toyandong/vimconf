"""""""""""""基本设置"""""""""""""""""""
set nocompatible
if has("syntax")
    syntax on            " 语法高亮
endif

"设置配色方案，/usr/share/vim/vim72/color目录下
"colorscheme monokai_pro
colorscheme molokai
"colorscheme monokai
"colorscheme solarized
"colorscheme phd
let g:solarized_termcolors=256
"set background=dark "light or dark
"set background=light
syntax enable
set ignorecase        	" 搜索模式里忽略大小写
set smartcase         	" 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。
set autowrite         	" 自动把内容写回文件
set backspace=indent,eol,start " backtrace失效问题
setlocal autoindent        	" 设置自动对齐(缩进)：即每行的缩进值与上一行相等
setlocal cinoptions=:0,l1,t0,t0,(0
set tabstop=8        		" 设置制表符(tab键)的宽度
set ts=8
"set expandtab
set noexpandtab
set softtabstop=8
set shiftwidth=8    		" (自动) 缩进使用的4个空格

set cindent            	" 使用 C/C++ 语言的自动缩进方式
set showmatch        		" 设置匹配模式，显示匹配的括号
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set mouse=a            	"使用鼠标
set history=500        	" 历史记录500条
set laststatus=2 				" 总显示最后一个窗口的状态行
set showcmd            	" 命令行显示输入的命令
set showmode        		" 命令行显示vim当前模式
set smarttab
" 总是显示状态栏
set laststatus=2
set t_Co=256 " Powerline 显示背景颜色
" " 显示光标当前位置
set ruler
" " 开启行号显示
set number
" " 高亮显示当前行/列
set cursorline
"set cursorcolumn
" " 高亮显示搜索结果
set hlsearch
"set encoding=utf-8
set list
set listchars=tab:>-,trail:-,extends:#,nbsp:-
set cc=80
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" " 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" " 色块宽度
let g:indent_guides_guide_size=1
" " 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"""""""""""""vundle设置"""""""""""""""""""
set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" 可以通过以下四种方式指定插件的来源
" a) 指定Github中vim-scripts仓库中的插件，直接指定插件名称即可，插件明中的空格使用“-”代替。
Bundle 'L9'
:" b) 指定Github中其他用户仓库的插件，使用“用户名/插件名称”的方式指定
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'winmanager'
Bundle 'tagbar'
" c) 指定非Github的Git仓库的插件，需要使用git地址
"Bundle 'git://git.wincent.com/command-t.git'
filetype plugin indent on     " required!

":PluginInstall
"vim +PluginInstall +qall

"""""""""""""插件设置"""""""""""""""""""
"taglist
"cscope
"NERDTree

"""""""""""""cscope"""""""""""""""""""
"cscope -Rbq
"cscope
cs add cscope.out
"set cscopequickfix=s-,c-,d-,i-,t-,e-
map <silent> <F2> :cs find g <C-R>=expand("<cword>")<CR><CR>
map <silent> <F3> :cs find c <C-R>=expand("<cword>")<CR><CR>
map <silent> <F4> :cs find s <C-R>=expand("<cword>")<CR><CR>
map <silent> <F5> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-c>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-c>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-c>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"""""""""""""NERDTree"""""""""""""""""""
"NERDTree - file navigation
nmap <F10> :NERDTreeToggle<CR>

"""""""""""""Taglist"""""""""""""""""""
"Taglist - source code browser
"ctags --extra=+q  --fields=+niazS --c-kinds=+px .
"map <silent> <F9> :TlistToggle<CR>
"let Tlist_Use_Right_Window = 1 "让taglist窗口出现在Vim的右边
"let Tlist_GainFocus_On_ToggleOpen = 1 "Taglist窗口打开时，立刻切换为有焦点状态
"let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim


"""""""""""""Tagbar"""""""""""""""""""
nmap <F9> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags' "tagbar以来ctags插件
"let g:tagbar_left = 1 "让tagbar在页面左侧显示，默认右边
let g:tagbar_width = 28  "设置tagbar的宽度为30列，默认40
let g:tagbar_autofocus = 1 "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_sort = 0 "设置标签不排序，默认排序


"""""""""""""Powerline"""""""""""""""""""
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
"let g:Powerline_colorscheme='monokai_pro.vim'

