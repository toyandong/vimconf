"""""""""""""基本设置"""""""""""""""""""
set nocompatible
if has("syntax")
    syntax on            " 语法高亮
endif

"设置配色方案，/usr/share/vim/vim72/color目录下
set termguicolors
colorscheme monokai_pro
"colorscheme molokai
"colorscheme monokai
"colorscheme solarized
"colorscheme phd
"let g:solarized_termcolors=256
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

" 上一次打开的位置
autocmd BufReadPost * normal! g`"

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-powerline'

" 语法检查
Plug 'w0rp/ale'
" 代码补全
Plug 'Valloric/YouCompleteMe', {'do':'git submodule update --init --recursive && ./install.py --clang-completer --go-completer'}

"函数参数提示
Plug 'Shougo/echodoc.vim'

" 自动后台更新ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug  'aceofall/gtags.vim'
"搜索栏预览
Plug 'skywind3000/vim-preview'
" 强化具体语言文件
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'

" 代码染色配置插件
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'
Plug 'tomasr/molokai'
Plug 'phanviet/vim-monokai-pro'
"模糊查找leaderf
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

call plug#end()

" YCM代码补全
let g:ycm_global_ycm_extra_conf= '~/.vim/config/ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-y>'
set completeopt=menu,menuone
" 使用 Ctrl+y 主动触发语义补全
noremap <c-y> <NOP>
" 修改补全列表配色
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "go":1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ }

let g:ycm_filetype_blacklist = {
        \ 'markdown' : 1,
        \ 'text' : 1,
        \ 'pandoc' : 1,
        \ 'infolog' : 1,
        \}

" -----------LeaderF 模糊文件查找-------------------------------
" Ctrl + p 打开文件搜索
let g:Lf_ShortcutF = '<c-p>'
" default <Leader> is \
noremap <Leader>ff :LeaderfFunction<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>fl :LeaderfLine<cr>

noremap <F8> :LeaderfFunction<CR>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }

"-----------ale 静态检查插件-----------------------------------------------
" 对应语言需要安装相应的检查工具
" apt install shellcheck  cppcheck
let g:ale_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'bash': ['shellcheck'],
  \   'go': ['gofmt', 'golint'],
  \   'python': ['pylint'],
  \   'c': ['gcc', 'cppcheck'],
  \   'cpp': ['gcc', 'cppcheck'],
  \   'text': [],
  \}

let g:ale_sign_column_always = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

"let g:ale_set_quickfix = 1
"let g:ale_open_list = 1"打开quitfix对话框

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = ">>"
let g:ale_sign_warning = "--"
map <F7> ::ALEToggle<CR>

"""""""""""""vim-gutentags"""""""""""""""""""
" sudo apt-get install universal-ctags
" sudo apt-get install global
" 安装依赖
" sudo apt build-dep global
" sudo apt install libncurses5-dev libncursesw5-dev
""设置标签tags
set tags=./.tags;,.tags
"设置根据打开文件自动更换目录
"set autochdir

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
let g:gutentags_modules += ['gtags_cscope']

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('./.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazSl']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" Get ctags version
let g:ctags_version = system('ctags --version')[0:8]

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--extras=+q', '--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 1
"Change focus to quickfix window after search (optional).
"let g:gutentags_plus_switch = 1

map <silent> <F2> :cclose <CR> " 关闭quickfix窗口
map <silent> <F3> :GscopeFind g <C-R>=expand("<cword>")<CR><CR> " 查看定义
map <silent> <F4> :GscopeFind s <C-R>=expand("<cword>")<CR><CR> " 查看引用

"----------vim-preview配置-----------------------------------------
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

"""""""""""""NERDTree"""""""""""""""""""
"NERDTree - file navigation
nmap <F7> :NERDTreeToggle<CR>

"""""""""""""Powerline"""""""""""""""""""
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
"let g:Powerline_colorscheme='monokai_pro.vim'

