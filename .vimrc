" Jonathan's .vimrc.
"
" NOTE: Don't forget to create the directories
"   ~/tmp/vim/backup
"   ~/tmp/vim/swap
"   ~/tmp/vim/undo
" and change their permissions to 700.
"
" Author: Jonathan Skowera <jskowera@gmail.com>
"

" Initialisation ----------------------------------------------------------- {{{
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Vundle Preparation
set nocompatible    " Be vim, not vi
filetype off        " Reset later (see below)
set rtp+=~/.vundle  " Runtime path

" BEGIN PLUGINS
call vundle#begin('~/.vim/bundle/')

"""""""""""""""""""""""""""""""""""""""
" EXAMPLES

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
""""""""""""""""""""""""""""""""""""""""""""""

" Local versions (for portability and security)
" Plugin 'file:///home/user/.vim/bundle/Vundle.vim'

" Plugin 'file:///home/user/.vim/bundle/accelerated-smooth-scroll'
" Plugin 'file:///home/user/.vim/bundle/ack.vim'
" Plugin 'file:///home/user/.vim/bundle/auctex.vim'
" Plugin 'file:///home/user/.vim/bundle/calendar.vim'
" Plugin 'file:///home/user/.vim/bundle/Command-T'
" Plugin 'file:///home/user/.vim/bundle/conqueterm-vim'
" Plugin 'file:///home/user/.vim/bundle/csapprox'
" Plugin 'file:///home/user/.vim/bundle/gundo.vim'
" Plugin 'file:///home/user/.vim/bundle/inline_edit.vim'
" Plugin 'file:///home/user/.vim/bundle/LaTeX-Box'
" Plugin 'file:///home/user/.vim/bundle/nerdtree'
" Plugin 'file:///home/user/.vim/bundle/numbers.vim'
" Plugin 'file:///home/user/.vim/bundle/pydoc.vim'
" Plugin 'file:///home/user/.vim/bundle/ropevim'
" Plugin 'file:///home/user/.vim/bundle/sbt-vim'
" OLD Plugin 'file:///home/user/.vim/bundle/supertab'
" Plugin 'file:///home/user/.vim/bundle/syntastic'
" Plugin 'file:///home/user/.vim/bundle/tabman.vim'
" Plugin 'file:///home/user/.vim/bundle/taglist'
" Plugin 'file:///home/user/.vim/bundle/tlib_vim'
" Plugin 'file:///home/user/.vim/bundle/vim-addon-mw-utils'
" Plugin 'file:///home/user/.vim/bundle/vim-bundle-mako'
" Plugin 'file:///home/user/.vim/bundle/vim-commentary'
" Plugin 'file:///home/user/.vim/bundle/VimExplorer'
" Plugin 'file:///home/user/.vim/bundle/vim-flake8'
" Plugin 'file:///home/user/.vim/bundle/vim-fugitive'
" Plugin 'file:///home/user/.vim/bundle/vim-markdown'
" Plugin 'file:///home/user/.vim/bundle/vim-pandoc'
" Plugin 'file:///home/user/.vim/bundle/vim-pandoc-syntax'
" Plugin 'file:///home/user/.vim/bundle/vim-vinegar'
" Plugin 'file:///home/user/.vim/bundle/vim-scala'
" Plugin 'file:///home/user/.vim/bundle/vim-scalaConceal'
" Plugin 'file:///home/user/.vim/bundle/vim-sneak'
"  Plugin 'file:///home/user/.vim/bundle/vim-snipmate'
" Plugin 'file:///home/user/.vim/bundle/vim-snippets'
" Plugin 'file:///home/user/.vim/bundle/vimoutliner'
" Plugin 'file:///home/user/.vim/bundle/vimwiki'
" Plugin 'file:///home/user/.vim/bundle/YouCompleteMe'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remote versions
"   Activate using :PluginInstall

" Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/auctex.vim'  " TeX highlighting
" Plugin 'yonchu/accelerated-smooth-scroll'  " Smooth scrolling
" Plugin 'mileszs/ack.vim'  " Use ack from vim
" Plugin 'itchyny/calendar.vim'  " (Google) Calendar access
" Plugin 'wincent/Command-T'  " Fast file navigation (requires manual compile)
Plugin 'pthrasher/conqueterm-vim'  " Use shell from vim
" Plugin 'sjl/gundo.vim'  " Visualize undo tree
" Plugin 'AndrewRadev/inline_edit.vim'  " Extract JS from HTML to new buffer
" Plugin 'LaTeX-Box-Team/LaTeX-Box'  " LaTeX commands
Plugin 'scrooloose/nerdtree'  " File navigation
Plugin 'myusuf3/numbers.vim'  " Better line numbers
" Plugin 'vim-scripts/pydoc.vim'  " Search Python documentation
" Plugin 'python-rope/ropevim'  " rope Python refactoring library
Plugin 'ktvoelker/sbt-vim'  " SBT Vim Bridge
"" OLD Plugin 'ervandrew/supertab'  " auto-completion using Tab
Plugin 'vim-syntastic/syntastic'  " Syntax checking
" Plugin 'kien/tabman.vim'  " Close tabs without switching to them
" Plugin 'vim-scripts/taglist.vim'  " Overview of structure of source code
" Plugin 'tomtom/tlib_vim'  " Lib required for SnipMate Python snippets
" Plugin 'MarcWeber/vim-addon-mw-utils'  " Utils required for SnipMate
Plugin 'Chiel92/vim-autoformat'  " Autoformat code using external programs
" Plugin 'sophacles/vim-bundle-mako'  " Python template library
Plugin 'tpope/vim-commentary'  " Light-weight comment out lines
" Plugin 'mbbill/VimExplorer'  " Powerful file manager
" Plugin 'nvie/vim-flake8'  " Python syntax/style checker
Plugin 'tpope/vim-fugitive'  " GIT repositories
Plugin 'tpope/vim-markdown'  " Markdown
" Plugin 'vim-pandoc/vim-pandoc'  " Pandoc markdown, etc
" Plugin 'vim-pandoc/vim-pandoc-syntax'  " Pandoc syntax help
Plugin 'derekwyatt/vim-scala'  " Scala
Plugin 'mpollmeier/vim-scalaConceal'  " Allow UTF-8 method names for Scala
" Plugin 'tpope/vim-vinegar'  " Slightly extended netrw file explorer
" Plugin 'justinmk/vim-sneak'  " Best seeking library
" Plugin 'garbas/vim-snipmate'  " Insert Python snippets
" Plugin 'honza/vim-snippets'  " Collection of snippets
" Plugin 'vimoutliner/vimoutliner'  " Write outlines, to-do list, etc
" Plugin 'vimwiki/vimwiki'  " Wiki editor
" Plugin 'Valloric/YouCompleteMe'  " Auto-completion and omnibox

call vundle#end()
" END PLUGINS


" }}}
" Colors and Fonts --------------------------------------------------------- {{{

syntax on
set background=dark

" set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
" set guifont=Akkurat-Mono\ 10
" If you have it, this is somewhat preferable, otherwise use the above.
set guifont=DejaVu\ Sans\ Mono\ 10

" }}}
" General Options ---------------------------------------------------------- {{{

set shell=/bin/bash

set nofsync
set autowrite

set nofoldenable
set number

set backspace=indent,eol,start
set completeopt=menuone,longest,preview

"set autoread
"set shiftround
"set notimeout
"set nottimeout

" }}}
" Formatting --------------------------------------------------------------- {{{

set encoding=utf-8
set wrap              " only wrap visually
set linebreak         " only wrap at characters in the breakat option
set nolist            " list disables linebreak
set formatoptions+=l  " prevent auto reformat when typing in existing lines
set formatprg=fmt\ -w80

" Hex dumps activated by calling vim -b or by :%!xxd
"   convert hex back to binary using :%!xxd -r
set display=uhex

" 	> Tabs __________________ {{{

" Filetype specific indentation will override autoindent when necessary
set autoindent
" Use filetype specific indentation
filetype plugin indent on

set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" set formatoptions=qrjtco

" 	}}}

" }}}
" Backups / Undo ----------------------------------------------------------- {{{

set noswapfile
set undodir=~/tmp/vim/undo/
set backupdir=~/tmp/vim/backup/
set directory=~/tmp/vim/swap/
set backup
set history=10000
set undofile
set undoreload=10000
set clipboard=unnamed

" }}}
" Status line -------------------------------------------------------------- {{{

set shortmess=a

if has('statusline')
    set statusline=%<%f    " Path.
    set statusline+=%w   " Preview window flag.
    set statusline+=%h
    set statusline+=%m   " Modified flag.
    set statusline+=%r   " Readonly flag.
    set statusline+=%{fugitive#statusline()}   "  Fugitive GIT status

    set statusline+=\    " Space.

    set statusline+=%=   " Right align.

    " File format, encoding and type.  Ex: "(unix/utf-8/python)"
    set statusline+=(
    set statusline+=%{&ff}                        " Format (unix/DOS).
    set statusline+=/
    set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
    set statusline+=/
    set statusline+=%{&ft}                        " Type (python).
    set statusline+=)

    " Line and column position and counts.
    set statusline+=\ (line\ %l\/%L,\ col\ %03c)

    " Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
endif

" }}}
" Searching and movement --------------------------------------------------- {{{

set ignorecase
set smartcase
set incsearch
set showmatch

" }}}
" Filetype-specific settings ----------------------------------------------- {{{
"   > Markdown ___________________ {{{
augroup ft_md
    au!

    au BufReadPost,BufNewFile *.md set filetype=markdown
augroup END
"   }}}
"   > Python ________________ {{{
augroup ft_python
    au!

    au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
    au FileType python filetype indent on

    au FileType python setlocal omnifunc=pythoncomplete#Complete
augroup END
"   }}}
"   > QuickFix ______________ {{{
augroup ft_quickfix
    au!

    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap
augroup END
"   }}}
"   > Scala ____________ {{{
augroup ft_scala
    au!

    au BufRead,BufNewFile *.scala set filetype=scala
    au! Syntax scala source ~/.vim/bundle/vim-scala/syntax/scala.vim
augroup END
"   }}}
"   > TeX ___________________ {{{
augroup ft_tex
    au!

    au BufRead,BufNewFile *.tex 	set filetype=tex
    au FileType tex setlocal formatoptions=qrjtco
augroup END
"   }}}
" }}}
" Plugin configuration ----------------------------------------------------- {{{
"   > Commentary ____________ {{{

    nmap <c-c> <Plug>CommentaryLine
    vmap <c-c> <Plug>Commentary

"   }}}
"   > ConqueTerm ____________ {{{

    " Bugfix for ConqueTerm
    let g:ConqueTerm_SessionSupport = 0

"   }}}
"   > LaTeX-Box _____________ {{{

    let g:LatexBox_Folding = 0
    let g:LatexBox_fold_preamble = 0
    let g:LatexBox_fold_envs = 0

"   }}}
"   > vim-markdown ______________ {{{

    let g:vim_markdown_folding_disabled=1

"   }}}
"   > vim-syntastic ______________ {{{
"
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers = ['flake8']

"   }}}
" }}}
" Remappings --------------------------------------------------------------- {{{
"   > General _______________ {{{
    
    " Use comma instead of \ for <Leader>
    let mapleader = ","

    " Remap window navigation keys
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>

    " Copy and paste to Linux (X11) clipboard
    " Must be done this way for compatibility with Centos/RHEL/Fedora
    "   i.e., when vim is not compiled with +xterm_clipboard
    vmap <c-y> :!xclip -f -sel clip<cr>
    map <c-p> :-1r !xclip -o -sel clip<cr>

    " Scroll with selection
    " Find the previous selection again with 'gv'
    xnoremap <ScrollWheelUp> <esc><ScrollWheelUp>
    xnoremap <ScrollWheelDown> <esc><ScrollWheelDown>

    " Shortcuts for saving
    " nnoremap <S-Space> :wa<cr>
    nnoremap <Space> :w<cr>

    " ConqueTerm terminal shortcuts
    map <leader>nt :ConqueTerm /bin/bash<cr>
    map <leader>vt :ConqueTermVSplit /bin/bash<cr>
    
    " NERDTree shortcuts
    map <leader>ls :NERDTreeToggle<CR>
"   }}}
"   > Leaders _______________ {{{

"   }}}
" }}}
" GUI config --------------------------------------------------------------- {{{

    " Different cursors for different modes.
    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0

" }}}
