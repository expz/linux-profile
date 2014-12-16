" Jonathan's .vimrc.
"
" NOTE: Don't forget to create the directories
"   ~/temp/vim/backup
"   ~/temp/vim/swap
"   ~/temp/vim/undo
" and change their permissions to 700.
"
" Author: Jonathan Skowera <jskowera@gmail.com>
"

" Initialisation -------------------------------------------------------------- {{{

" Be iMproved, required for Vundle
set nocompatible

" Required for Vundle
filetype off

" Set runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim

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
Plugin 'file:///home/user/.vim/bundle/auctex.vim'
" Plugin 'file:///home/user/.vim/bundle/calendar.vim'
Plugin 'file:///home/user/.vim/bundle/Command-T'
Plugin 'file:///home/user/.vim/bundle/conqueterm-vim'
" Plugin 'file:///home/user/.vim/bundle/csapprox'
" Plugin 'file:///home/user/.vim/bundle/gundo.vim'
" Plugin 'file:///home/user/.vim/bundle/inline_edit.vim'
" Plugin 'file:///home/user/.vim/bundle/LaTeX-Box'
" Plugin 'file:///home/user/.vim/bundle/nerdtree'
Plugin 'file:///home/user/.vim/bundle/numbers.vim'
" Plugin 'file:///home/user/.vim/bundle/pydoc.vim'
" Plugin 'file:///home/user/.vim/bundle/ropevim'
Plugin 'file:///home/user/.vim/bundle/sbt-vim'
" OLD Plugin 'file:///home/user/.vim/bundle/supertab'
Plugin 'file:///home/user/.vim/bundle/syntastic'
" Plugin 'file:///home/user/.vim/bundle/tabman.vim'
" Plugin 'file:///home/user/.vim/bundle/taglist'
" Plugin 'file:///home/user/.vim/bundle/tlib_vim'
" Plugin 'file:///home/user/.vim/bundle/vim-addon-mw-utils'
" Plugin 'file:///home/user/.vim/bundle/vim-bundle-mako'
Plugin 'file:///home/user/.vim/bundle/vim-commentary'
" Plugin 'file:///home/user/.vim/bundle/VimExplorer'
Plugin 'file:///home/user/.vim/bundle/vim-flake8'
Plugin 'file:///home/user/.vim/bundle/vim-fugitive'
Plugin 'file:///home/user/.vim/bundle/vim-pandoc'
Plugin 'file:///home/user/.vim/bundle/vim-pandoc-syntax'
Plugin 'file:///home/user/.vim/bundle/vim-vinegar'
Plugin 'file:///home/user/.vim/bundle/vim-scala'
Plugin 'file:///home/user/.vim/bundle/vim-scalaConceal'
" Plugin 'file:///home/user/.vim/bundle/vim-sneak'
"  Plugin 'file:///home/user/.vim/bundle/vim-snipmate'
" Plugin 'file:///home/user/.vim/bundle/vim-snippets'
" Plugin 'file:///home/user/.vim/bundle/vimoutliner'
" Plugin 'file:///home/user/.vim/bundle/vimwiki'
Plugin 'file:///home/user/.vim/bundle/YouCompleteMe'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remote versions
"   Activate using :PluginInstall

" Plugin 'gmarik/Vundle.vim'

" Plugin 'vim-scripts/auctex.vim'  " TeX highlighting
" Plugin 'yonchu/accelerated-smooth-scroll'  " Smooth scrolling
" Plugin 'mileszs/ack.vim'  " Use ack from vim
" Plugin 'itchyny/calendar.vim'  " (Google) Calendar access
" Plugin 'wincent/Command-T'  " Fast file navigation but few features (requires manual compilation step)
" Plugin 'godlygeek/csapprox'  " Make GUI color schemes work in terminal
" Plugin 'pthrasher/conqueterm-vim'  " Use shell from vim
" Plugin 'sjl/gundo.vim'  " Visualize undo tree
" Plugin 'AndrewRadev/inline_edit.vim'  " Extract javascript from HTML to new buffer
" Plugin 'LaTeX-Box-Team/LaTeX-Box'  " LaTeX commands
" Plugin 'scrooloose/nerdtree'  " File navigation
" Plugin 'myusuf3/numbers.vim'  " Better line numbers
" Plugin 'vim-scripts/pydoc.vim'  " Search Python documentation
" Plugin 'python-rope/ropevim'  " rope Python refactoring library
" Plugin 'ktvoelker/sbt-vim'  " SBT Vim Bridge
"" OLD Plugin 'ervandrew/supertab'  " auto-completion using Tab
" Plugin 'scrooloose/syntastic'  " Syntax checking
" Plugin 'kien/tabman.vim'  " Close tabs without switching to them
" Plugin 'vim-scripts/taglist.vim'  " Overview of structure of source code files
" Plugin 'tomtom/tlib_vim'  " Lib required for SnipMate Python snippets
" Plugin 'MarcWeber/vim-addon-mw-utils'  " Utils required for SnipMate
" Plugin 'sophacles/vim-bundle-mako'  " Python template library
" Plugin 'tpope/vim-commentary'  " Light-weight comment out lines
" Plugin 'mbbill/VimExplorer'  " Powerful file manager
" Plugin 'nvie/vim-flake8'  " Python syntax/style checker
" Plugin 'tpope/vim-fugitive'  " GIT repositories
" Plugin 'vim-pandoc/vim-pandoc'  " Pandoc markdown, etc
" Plugin 'vim-pandoc/vim-pandoc-syntax'  " Pandoc syntax help
" Plugin 'derekwyatt/vim-scala'  " Scala
" Plugin 'mpollmeier/vim-scalaConceal'  " Allow UTF-8 method names for Scala
" Plugin 'tpope/vim-vinegar'  " Slightly extended netrw file explorer
" Plugin 'justinmk/vim-sneak'  " Best seeking library
" Plugin 'garbas/vim-snipmate'  " Insert Python snippets
" Plugin 'honza/vim-snippets'  " Collection of snippets
" Plugin 'vimoutliner/vimoutliner'  " Write outlines, to-do list, etc
" Plugin 'vimwiki/vimwiki'  " Wiki editor
" Plugin 'Valloric/YouCompleteMe'  " Auto-completion and omnibox

call vundle#end()
" END PLUGINS

" Required for Vundle
filetype plugin indent on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"

" }}}
" Colors and Fonts ------------------------------------------------------------ {{{

syntax on
set background=dark

" set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
" set guifont=Akkurat-Mono\ 10
" If you have it, this is somewhat preferable, otherwise use the above.
set guifont=DejaVu\ Sans\ Mono\ 10

" }}}
" General Options ------------------------------------------------------------- {{{

set shortmess=at  " Ensure we don't get hit-enter prompts
set encoding=utf-8
set backspace=indent,eol,start
set history=10000
set undofile
set undoreload=10000
set nolist
set shell=/bin/bash
set autoread
set display=uhex
set nofsync
set shiftround
set notimeout
set nottimeout
set autowrite
set foldlevelstart=1
set formatprg=fmt\ -w80
set clipboard=unnamed
set number

set completeopt=menuone,longest,preview


" 	> Tabs __________________ {{{

set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set textwidth=0

" set formatoptions=qrjtco

" 	}}}

" }}}
" Backups --------------------------------------------------------------------- {{{

set noswapfile
set undodir=~/temp/vim/undo/      " undo files
set backupdir=~/temp/vim/backup/  " backups
set directory=~/temp/vim/swap/    " swap files
set backup                        " enabled

" }}}
" Status line ----------------------------------------------------------------- {{{

if has('statusline')
    set statusline=%<%f    " Path.
    set statusline+=%w   " Preview window flag.
    set statusline+=%h
    set statusline+=%m   " Modified flag.
    set statusline+=%r   " Readonly flag.
    set statusline+=%{fugitive#statusline()}   "  Fugitive GIT status

    set statusline+=\    " Space.

    "set statusline+=%#redbar#                " Highlight the following as a warning.
    "set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
    "set statusline+=%*                           " Reset highlighting.

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
endif

" }}}
" Searching and movement ------------------------------------------------------ {{{

" Use sane regexes.
" nnoremap / /\v
" vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch

" }}}
" Shortcuts ----------------------------------------------------- {{{

" }}}
" Filetype-specific stuff ----------------------------------------------------- {{{
"   > Scala ____________ {{{
augroup ft_scala
    au!

    au BufRead,BufNewFile *.scala set filetype=scala
    au! Syntax scala source ~/.vim/bundle/vim-scala/syntax/scala.vim
augroup END

"   }}}
"   > Javascript ____________ {{{
augroup ft_javascript
    au!

augroup END
"   }}}
"   > Pandoc  _______________ {{{
augroup ft_pandoc
    au!

augroup END
"   }}}
"   > Python ________________ {{{
augroup ft_python
    au!

    au FileType python setlocal omnifunc=pythoncomplete#Complete
augroup END
"   }}}
"   > QuickFix ______________ {{{
augroup ft_quickfix
    au!

    au Filetype qf setlocal colorcolumn=0 nolist nocursorline nowrap
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
" Plugin configuration -------------------------------------------------------- {{{
"   > LaTeX-Box _____________ {{{
    " Folding is incredibly slow in latexbox, so we don't use it.
    let g:LatexBox_Folding = 0
    let g:LatexBox_fold_preamble = 0
    let g:LatexBox_fold_envs = 0
"   }}}
"   > Command-T _____________ {{{

"   }}}
"   > ConqueTerm ____________ {{{

    " Bugfix for ConqueTerm, doesn't check for this variable being
    " defined.
    let g:ConqueTerm_SessionSupport = 0

"   }}}
"   > PyFlakes ______________ {{{

"   }}}
"   > Commentary ____________ {{{

    nmap <c-c> <Plug>CommentaryLine
    vmap <c-c> <Plug>Commentary

"   }}}
" }}}
" Remappings ------------------------------------------------------------------ {{{
"   > General _______________ {{{
    
    " Use comma instead of \ for <Leader>
    let mapleader = ","

    " Remap window navigation keys
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>

    " Making it so that scrolling with selections doen't screw up; we can find the
    " previous selection again with 'gv'.

    xnoremap <ScrollWheelUp> <esc><ScrollWheelUp>
    xnoremap <ScrollWheelDown> <esc><ScrollWheelDown>

    " Faster way to get into command mode.
    noremap ; :

    " Shortcuts for saving
    " nnoremap <S-Space> :wa<cr>
    nnoremap <Space> :w<cr>

"   }}}
"   > Leaders _______________ {{{

"   }}}
" }}}
" GUI configs ----------------------------------------------------------------- {{{

    " Different cursors for different modes.
    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0

" }}}
" Utility Functions ----------------------------------------------------------- {{{


" }}}
" Commands -------------------------------------------------------------------- {{{


" }}}
" Wrapup ---------------------------------------------------------------------- {{{


" }}}
