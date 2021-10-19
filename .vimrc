
"source $VIMRUNTIME/vimrc_example.vim
set nocompatible    "去掉vi一致性模式

"autocmd BufWritePost $MYVIMRC source $MYVIMRC
"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""显示相关配置""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""

set nu!		            	    " 显示行号

set relativenumber              " 显示相对行号

set autoread                	" 自动重新读入

set ai!		                	" 自动缩进

set expandtab					" 用space替代tab的输入
	

"autocmd InsertLeave * se nocul  " 用浅色高亮当前行

"autocmd InsertEnter * se cul    " 用浅色高亮当前行

set showcmd                     " 输入的命令显示出来

set novisualbell                " 不要闪烁

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\
"%{strftime(\"%d/%m/%y\ -\ %H:%M\")}   " 状态行显示的内容 

set laststatus=1                " 启动显示状态行=1，总是显示状态行=2

set foldenable                  " 允许折叠

"set showtabline=2	            " 设置标签栏的显示

set guifont=consolas:h14	    " 字体格式和大小

set encoding=utf-8              " 编码格式
set helplang=cn                 " 显示中文帮助

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

set langmenu=zh_CN.utf-8        " 设置菜单栏编码方式
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"language messages zh_CN.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" 实用设置 """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""

 
set nobackup                	" 不做备份

set mouse=a				        " 鼠标可用

set ambiwidth=double

set autoread                    " 当前文档在别处改动时自动载入

set completeopt=preview,menu    " 代码补全

set clipboard+=unnamed          " 共享剪贴板

set autowrite                   " 自动保存

"set cursorline	                " 突出显示当前行

set magic                       " 设置魔术

syntax enable	                " 语法高亮
syntax on

set confirm                     " 处理未保存或只读文件时，弹出确认

set autoindent                  " 自动缩进
set cindent                     
    
set tabstop=4                   " Tab键宽度

set softtabstop=4               " 统一缩进为4
set shiftwidth=4                

set smarttab                    " 行和段开始的时候使用制表符

set history=1000                " 历史记录数

set nobackup                    " 禁止生成临时文件
set noswapfile

set hlsearch                    " 搜索逐字符高亮

set incsearch					" 开启实时搜索功能

set ignorecase					" 搜索时大小写不敏感

set wildmenu					" 自身命令行模式智能补全

set cmdheight=2                 " 命令行高度设为2，默认为1

set linespace=0					" 字符间插入像素行数目

set backspace=2					" 使回格键正常处理indent，eol，start等

set whichwrap+=<,>,h,l			" 允许backspace和光标键跨行边界

set report=0					" 使用:commands命令，查看哪一行被修改过
set fillchars=vert:\ ,stl:\ ,stlnc:\

set showmatch					" 高亮显示配的括号

set matchtime=1					" 高亮匹配括号时间（单位是十分之一秒）

set smartindent					" c程序自动缩进

set t_Co=256



"""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" 键盘命令""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
vmap <C-c> "+y              " 选中状态下 CTRL+c 复制

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""插件管理配置""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"Vundle配置
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
"let path='$VIM/vimfiles/bundle'
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'taghighlight'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'grep.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'tomasr/molokai'
Plugin 'majutsushi/tagbar'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'luochen1990/rainbow'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on

"Ctags配置

set tags+=tags						" 设置tags
set tags+=/opt/esp_sdk/esp-idf/tags     " 设置esp-idf tags 
set tags+=/home/chentengfei5/gatt_client/tags " 设置esp-idf tags 
set tags+=/home/chentengfei5/gatt_client/main/tags " 设置esp-idf tags 
"set tags+=/home/chentengfei5/gatt_server/tags " 设置esp-idf tags 
"set tags+=/home/chentengfei5/gatt_server/main/tags " 设置esp-idf tags 
"set tags+=$VIM/vimfiles/tags/VStags
set autochdir

"" 配置 tagbar 插件
let g:tagbar_ctags_bin='ctags'     "ctags 程序的路径
let g:tagbar_width=30              "窗口宽度设置为 30
let g:tagbar_right=1               "设置在 vim you边显示
let g:tagbar_map_openfold = "zv"   "按 zv 组合键打开标签，默认 zc 关闭标签

"如果是 C 语言的程序的话，tagbar 自动开启
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() 

""grep配置
nnoremap <silent> <F3> :Grep<CR>

"Youcompleteme配置
let g:ycm_server_python_interpreter='/usr/bin/python2'
let g:ycm_global_ycm_extra_conf='/usr/lib/ycmd/ycm_extra_conf.py'
"let g:ycm_server_keep_logfiles=1
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files=1		" YCM从tags获取信息，ctags --fields=+l -R

let g:ycm_seed_identifiers_with_syntax=1			" 语法关键字补全

let g:ycm_autoclose_preview_window_after_completion=1		" 补全之后关闭preview

let g:ycm_key_invoke_completion='<S-Space>'			" 自动补全快捷键
let g:ycm_disable_for_files_larger_than_kb=50*1024

let g:ycm_complete_in_strings=1						" 允许在字符串里补全（双引号）

let g:ycm_max_num_candidates=10

let g:ycm_complete_in_comments=1					" 在注释中补全

let g:ycm_error_symbol = '>>'

let g:ycm_warning_symbol = '>*'

"nnoremap <leader>gl : YcmCompleter GoToImplementationElseDeclaration <CR>
"
"nnoremap <leader>gf : YcmCompleter GoToDefinition <CR>
"
"nnoremap <leader>gr : YcmCompleter GoToReferences <CR>
"
"nnoremap <F5> : YcmForceCompileAndDiagnostics <CR>

"air_line配置
set laststatus=2
let g:airline_theme='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

"let g:airline#extensions#whitespace#enabled = 1

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_tab_guides=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

let g:rainbow_active=1
let g:rainbow_conf={
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'guis': [''],
\   'cterms': [''],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'markdown': {
\           'parentheses_options': 'containedin=markdownCode contained', 
\       },
\       'vim': {
\           'parentheses_options': 'containedin=vimFuncBody', 
\       },
\   }
\}

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
let g:AutoPairs['<']='>'
let g:AutoPairsMapBS = 1
let g:AutoPairsMapCR = 1

au BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe("norm '\"") | else |exe "norm $"| endif | endif

"" 映射切换buffer的键位
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

"colorscheme molokai             " 配色方案
hi Comment              ctermfg=DarkGreen
hi PreProc              ctermfg=Blue           
hi Type                 ctermfg=Yellow   
hi Constant             ctermfg=Blue         
hi Statement            ctermfg=LightYellow 
hi Special              ctermfg=135
hi SpecialKey           ctermfg=135
hi Number               ctermfg=Blue     
hi cCppString           ctermfg=Brown
hi String               ctermfg=Brown
hi Identifier           ctermfg=135
hi Todo                 ctermfg=Black
hi NonText              ctermfg=LightBlue       
hi Directory            ctermfg=Blue           
hi Folded               ctermfg=DarkBlue      
hi FoldColumn           ctermfg=LightBlue    
hi Underlined           ctermfg=LightBlue   
hi Title                ctermfg=LightBlue  
hi Ignore               ctermfg=LightBlue 

hi CTagsDefinedName     ctermfg=135
hi CTagsFunction        ctermfg=208
hi CTagsGlobalVariable  ctermfg=229
hi Variable             ctermfg=229
hi CTagsStructure       ctermfg=Yellow
hi CTagsEnumerationName     ctermfg=135
hi CTagsEnumerationValue    ctermfg=135
hi Search               ctermfg=Yellow ctermbg=242
hi SpellBad             term=underline cterm=underline ctermfg=1 ctermbg=234
hi Visual               ctermbg=Grey
