set nocompatible
set ignorecase
set nu
"colorscheme murphy
"colorscheme desert 
"colorscheme elflord
"colorscheme ron

colorscheme torte

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile *  setfiletype txt

"搜索逐字符高亮
set hlsearch
set incsearch

set noswapfile
set nobackup

syntax on
filetype plugin on

if has("gui_running")
    set lines=36
    set columns=80
    "去掉工具栏
    set guioptions-=T
endif

set ruler
set showcmd "输入的命令显示出来

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  

set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  

"C，C++ 按F5编译运行
"map <F5> :call CompileRunGcc()<CR>
"func! CompileRunGcc()
"	exec "w"
"	if &filetype == 'c'
"		exec "!clang % -o %<"
"		exec "! ./%<"
"	elseif &filetype == 'cpp'
"		exec "!clang++ % -o %<"
"		exec "! ./%<"
"	elseif &filetype == 'java' 
"		exec "!javac %" 
"		exec "!java %<"
"	elseif &filetype == 'sh'
"		:!./%
"	elseif &filetype == 'py'
"		exec "!python %"
"		exec "!python %<"
"	endif
"endfunc

" TxtBrowser          高亮TXT文本文件
au BufRead,BufNewFile *.txt setlocal ft=txt

"一键编译
nmap <F5> :SCCompile<CR>
"显示编译错误
nmap C-<F5> :cope
"运行
nmap <F6> ：
nmap C-<F6> :SCCompileRun<CR>

set cursorline              " 突出显示当前行
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
"
if has("gui_macvim")
    "set guifont=Menlo Regular:h16
    set guifont=Menlo:h15
    set transparency=12
endif


"set termencoding=cp936

"language messages zh_CN.UTF-8
"""""""""""""""""""""""""""""
"解决windows下的中文乱码问题
"""""""""""""""""""""""""""""
set encoding=utf-8
"set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin-1

if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif

"解决中文菜单乱码
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决console输出乱码
language messages zh_cn.utf-8

" 允许退格键删除和tab操作  
set smartindent  
set smarttab  
set expandtab  
set tabstop=4  
set softtabstop=4  
set shiftwidth=4  
set backspace=2
set textwidth=79

"change buffer, without saving
set hid

"Smart way to move btw. window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""
" => Minibuffer
""""""""""""""""""""""""""""""
""let g:miniBufExplModSelTarget = 1
""let g:miniBufExplorerMoreThanOne = 0
""let g:miniBufExplModSelTarget = 0
""let g:miniBufExplUseSingleClick = 1
""let g:miniBufExplMapWindowNavVim = 1
""let g:miniBufExplVSplit = 15
""let g:miniBufExplSplitBelow=1


   

nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarOpen j<CR>


"cscope
"s：查找C代码符号
"g：查找本定义
"d：查找本函数调用的函数
"c：查找调用本函数的函数
"t：查找本字符串
"e：查找本egrep模式
"f：查找本文件
"i：查找包含本文件的文件
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

set cscopequickfix=s-,c-,d-,i-,t-,e-

let g:Powerline_symbols='fancy'

"记住上次编辑位置
:au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif




"vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Bundle 'gmarik/vundle'
"
" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic.git'
Bundle 'Lokaltog/powerline'
Bundle 'majutsushi/tagbar'
Bundle 'xuhdev/SingleCompile'
"dash mac osx 下使用
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'Blackrush/vim-gocode'

"有错误时自动显示quickfix
let g:SingleCompile_showquickfixiferror = 1
"将clang设置为c，cpp文件的默认编译器

call SingleCompile#SetPriority('c', 'clang', 10)
call SingleCompile#SetPriority('c', 'gcc', 20)
call SingleCompile#SetPriority('cpp', 'clang', 10)
call SingleCompile#SetPriority('cpp', 'g++', 20)

"call SingleCompile#ChooseCompiler('cpp', 'clang')
"call SingleCompile#ChooseCompiler('c', 'clang')



"插件Bufkill的说明
":bun unload a buffer
":bd delete a buffer
":bw wipe a buffer

""<C-W> H/J/K/L(注意大写)
"调整当前窗口的位置，最上或最右等等


"26个字母的寄存器，使用小写的话，先清空寄存器再写入
"使用大写的话，在原有内容后面增加
"例："ayy 将当前行复制到a寄存器
"注意 5"ayy 5是作用在yy上的，即复制五行到a寄存器，a中有五行内容了

"寄存器%存储当前文件名
"寄存器#存储前一次编辑的文件名
"
"

"英文句点. -->重复上次命令，移动光标和冒号命令不算
"
"
"查找命令
"/ 向后查找
"？向前查找
"n 继续查找
"N 反向继续查找

"* 查找光标所在单词（向后）
"# 查找光标所在单词（向前）
"g* 同*，部分符合即可
"g# 同#，部分符合即可

"替换命令
"通用格式 :[range]s/pattern/string/[c,e,g,i]
"range指的的范围，如1，7或者直接%，代表当前文档，或者#，前一次编辑的文档
"pattern是指被替换掉的字符串，可以用正则表达式
"c confirm 每次替换前询问
"e 不显示error
"g globe，不询问，整行替换
"i ignore，不区分大小写

"书签命令
"mx 将光标所在处设为书签，存储在寄存器x中（mark）
" 'x 回到x寄存器所存储的位置
"书签有自己的独立一套寄存器
"小写的书签只能作用于一个文件内
"但大写的
