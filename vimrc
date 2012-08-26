""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on syntax highlighting
syntax enable

" Enable Pathogen
call pathogen#infect()
filetype plugin indent on

" Turn off vi-compatibility
set nocompatible

" Secure against modelines exploits
set modelines=0

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Encoding
set encoding=utf-8

" Use Unix as the standard line ending style
set ffs=unix,mac,dos

" Disable backups and swapfiles
set nobackup
set noswapfile

" Create undo files
set undofile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save a keystroke when typing commands
nnoremap ; :

" GUI and colors
set guifont=EspressoMono-Regular:h14
colorscheme desertedoceanburnt

" Show invisibles like TextMate
set list
set listchars=tab:▸\ ,eol:¬

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Show mode I'm in
set showmode

" Show command I'm typing
set showcmd

" Show matching parentheses
set showmatch

" Show line numbers
set number

" Don't blink cursor
set guicursor+=a:blinkon0

" Use Perl-compatible regex formatting
nnoremap / /\v
vnoremap / /\v

" Ignore case when searching with a lowercase string
set ignorecase
" Only do a case-sensitive search if uppercase letters are in the search string
set smartcase

" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

" Clear out a search once you're done
nnoremap <leader><space> :noh<cr>

" Apply substitutions globally on lines
set gdefault

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Visual bell
set visualbell

" Enhanced command line completion
set wildmenu
set wildmode=list,longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*~,*.pyc
set wildignore+=.git,.hg,.svn

" Use w!! when you forget to use sudo before editing a root-privilege-only
" file.
cmap w!! w !sudo tee % >/dev/null


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent settings
set autoindent
set smartindent

" Tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Text wrapping
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""
"  Ack
"  ack.vim
"  http://www.vim.org/scripts/script.php?script_id=42
"
"  Ack is way faster than grep
"""
nnoremap <leader>a :Ack

"""
"  BufExplorer
"  bufexplorer.vim
"  http://www.vim.org/scripts/script.php?script_id=42
"
"  Really useful.
"""
let g:bufExplorerSortBy='fullpath'   " Sort by full file path name.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSplitOutPathName=0  " Don't split the path and file

"""
"  CtrlP
"  ctrlp.vim
"  http://www.vim.org/scripts/script.php?script_id=3736
"
"  Fast file finding, like fuzzy_finder.
"  Better version of command-t:
"    - no external ruby compilation needed
"    - accommodates different working directory styles
"""
let g:ctrlp_map = '<leader>p'         " command to invoke the plugin
let g:ctrlp_working_path_mode = 'rc'  " don't manage working directory
let g:ctrlp_max_height = 30           " maximum size of match window

" Bind leader-t to ctrlp to reduce transition pain
nnoremap <silent> <leader>t :CtrlP<CR>

"""
"  Indent guides
"  vim-indent-guides.vim
"  http://www.vim.org/scripts/script.php?script_id=3361
"""
" let g:indent_guides_guide_size=1

"""
"  The NERD tree
"  NERD_tree.vim
"  http://www.vim.org/scripts/script.php?script_id=1658
"
"  Trying to use this, but not convinced yet.
"""
let g:NERDTreeHijackNetrw=0 " for now, don't use it for directory browsing
nnoremap <silent> <leader>d :NERDTreeToggle<CR>

"""
"  Scratch
"  scratch.vim
"  http://www.vim.org/scripts/script.php?script_id=664
"
"  Open a temporary scratch buffer
"""
nnoremap <silent> <leader>sc :Scratch<cr>
nnoremap <silent> <leader>ssc :Sscratch<cr>

"""
"  YankRing
"  yankring.vim
"  http://www.vim.org/scripts/script.php?script_id=1234
"
"  Yank history
"""
nnoremap <silent> <leader>yr :YRShow<cr>
inoremap <silent> <leader>yr <ESC>:YRShow<cr>

