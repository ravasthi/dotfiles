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

" Reload your vimrc with <leader>vr
map <leader>vr :source $MYVIMRC<CR>:echoe "Vimrc Reloaded!"<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save a keystroke when typing commands
nnoremap ; :

" GUI and colors
set guifont=EspressoMono-Regular:h14
set t_Co=256 " use 256 colors
if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  autocmd VimEnter * GuiColorScheme tutticolori
else
  colorscheme tutticolori
endif

" Show invisibles like TextMate
set list
set listchars=tab:▸\ ,eol:¬,trail:·

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
set numberwidth=5

" Don't blink cursor
set guicursor=a:blinkon0

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
set wildignore+=.git,.hg,.svn,.sass-cache

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

" Show a vertical line/guard at column 120
if exists('+colorcolumn')
  set colorcolumn=120
endif

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Open current file in Marked
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""
"  Abolish
"  abolish.vim
"  http://www.vim.org/scripts/script.php?script_id=1545
"
"  easily search for, substitute, and abbreviate multiple variants of a word
"""

"""
"  Ack
"  ack.vim
"  http://www.vim.org/scripts/script.php?script_id=2572
"
"  Ack is way faster than grep
"""
nnoremap <silent> <leader>a :Ack<space>

"""
"  Auto-Pairs
"  auto-pairs.vim
"  http://www.vim.org/scripts/script.php?script_id=3599
"
"  Automatically pair quotes, parens, brackets, braces.
"""

"""
"  AutoTag
"  AutoTag.vim
"  https://github.com/vim-scripts/AutoTag
"
"  Automatically update your ctags file on save.
"""

"""
"  BufExplorer
"  bufexplorer.vim
"  http://www.vim.org/scripts/script.php?script_id=42
"
"  Really useful.
"""
let g:bufExplorerSortBy = 'fullpath'   " Sort by full file path name.
let g:bufExplorerShowRelativePath = 1  " Show relative paths.
let g:bufExplorerSplitOutPathName = 0  " Don't split the path and file

"""
"  Coffeescript
"  coffeescript.vim
"  http://www.vim.org/scripts/script.php?script_id=3590
"
"  Tools for working with CoffeeScript
"""

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
"  Fugitive
"  fugitive.vim
"  http://www.vim.org/scripts/script.php?script_id=2975
"""
nnoremap <silent> <leader>gst :Gstatus<CR>
nnoremap <silent> <leader>gci :Gcommit<CR>
nnoremap <silent> <leader>gmv :Gmove<CR>
nnoremap <silent> <leader>grm :Gremove<CR>

"""
"  Gundo
"  gundo.vim
"  https://github.com/sjl/gundo.vim
"""
nnoremap <silent> <leader>u :GundoToggle<CR>

"""
"  HTML auto close tag
"  html-auto-close-tag.vim
"  http://www.vim.org/scripts/script.php?script_id=2591
"
"  Automatically close HTML tags.
"""

"""
"  Indent guides
"  vim-indent-guides.vim
"  http://www.vim.org/scripts/script.php?script_id=3361
"""
" let g:indent_guides_guide_size = 1

"""
"  The NERD commenter
"  NERD_commenter.vim
"  http://www.vim.org/scripts/script.php?script_id=1218
"""

"""
"  The NERD tree
"  NERD_tree.vim
"  http://www.vim.org/scripts/script.php?script_id=1658
"
"  Trying to use this, but not convinced yet.
"""
let g:NERDTreeHijackNetrw = 0 " for now, don't use it for directory browsing
nnoremap <silent> <leader>d :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<cr>

"""
"  Repeat
"  repeat.vim
"  http://www.vim.org/scripts/script.php?script_id=2136
"
"  Open a temporary scratch buffer
"""

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
"  Speed-dating
"  speeddating.vim
"  http://www.vim.org/scripts/script.php?script_id=2120
"
"  use CTRL-A/CTRL-X to increment dates, times, and more
"""

"""
"  Sparkup
"  sparkup.vim
"  https://github.com/rstacruz/sparkup
"
"  A souped-up version of Zen-coding
"""

"""
"  TagBar
"  tagbar.vim
"  https://github.com/majutsushi/tagbar
"
"  Symbol browser (à la TextMate)
"""
nnoremap <silent> <leader><S-t> :TagbarToggle<CR>

"""
"  Surround
"  surround.vim
"  http://www.vim.org/scripts/script.php?script_id=1697
"
"  A souped-up version of Zen-coding
"""

"""
"  Vim Markdown
"  https://github.com/tpope/vim-markdown
"""

"""
"  Vim Bundler
"  bundler.vim
"  https://github.com/tpope/vim-bundler
"
"  Bundler
"""

"""
"  Vim Haml
"  haml.vim
"  https://github.com/tpope/vim-haml
"
"  Haml, Sass, SCSS support
"""

"""
"  Vim Rails
"  rails.vim
"  http://www.vim.org/scripts/script.php?script_id=1567
"
"  Rails power tools
"""

"""
"  XMLedit
"  xmledit.vim
"  http://www.vim.org/scripts/script.php?script_id=301
"
"  XML/SGML/HTML conveniences
"""

"""
"  YankRing
"  yankring.vim
"  http://www.vim.org/scripts/script.php?script_id=1234
"
"  Yank history
"""
nnoremap <silent> <leader>yr :YRShow<cr>
inoremap <silent> <leader>yr <ESC>:YRShow<cr>

