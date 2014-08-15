""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off vi-compatibility
set nocompatible

" Required by Vundle
filetype off
filetype plugin indent on

" Setup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Turn on syntax highlighting
syntax enable

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
map <leader>vr :source $MYVIMRC<CR>:echoe "vimrc reloaded!"<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User interface
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save a keystroke when typing commands
nnoremap ; :

" GUI and colors
set guifont=EspressoMono-Regular:h14
set t_Co=256 " use 256 colors
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme Tomorrow-Night

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

" Show ruler
set ruler

" Show matching parentheses
set showmatch

" Show line numbers
set relativenumber
set number
set numberwidth=5
hi LineNr cterm=NONE ctermfg=241 guifg=#606060

" Highlight cursor line number
set cursorline
hi CursorLine cterm=NONE ctermbg=240 guibg=#606060
hi clear CursorLineNr
hi CursorLineNr cterm=NONE ctermfg=247 guifg=#a0a0a0

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

" Automatically set paste mode
" from: https://coderwall.com/p/if9mda
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

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
set textwidth=0
set wrapmargin=0

" Show a vertical line/guard at column 120
if exists('+colorcolumn')
  let &colorcolumn="80,100,".join(range(120,999),",")
endif

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Open current file in Marked
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Adds a global snippet for ^L to insert a hash rocket
imap <C-L> <Space>=><Space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom syntax highlighing settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWinEnter,BufRead,BufNewFile Guardfile set filetype=ruby
au BufWinEnter,BufRead,BufNewFile Vendorfile set filetype=ruby
au BufWinEnter,BufRead,BufNewFile .powenv set filetype=sh
au BufWinEnter,BufRead,BufNewFile .powrc set filetype=sh


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle: required
Bundle "gmarik/vundle"
" ag.vim
" requires 'brew install the_silver_searcher'
Bundle "rking/ag.vim"
" Auto-pairs
Bundle "jiangmiao/auto-pairs"
" AutoTag
Bundle "vim-scripts/AutoTag"
" BufExplorer
Bundle "firat/vim-bufexplorer"
" Bundler integration
Bundle "tpope/vim-bundler"
" Coffeescript
Bundle "kchmck/vim-coffee-script"
" CSApprox
Bundle "godlygeek/csapprox"
" Fuzzy file search
Bundle "kien/ctrlp.vim"
" Add your ends
Bundle "tpope/vim-endwise"
" Git integration
Bundle "tpope/vim-fugitive"
" Gist
Bundle "mattn/gist-vim"
" Gundo
Bundle "sjl/gundo.vim"
" HAML, Sass, SCSS
Bundle "tpope/vim-haml"
" Markdown
Bundle "tpope/vim-markdown"
" Mustache
Bundle "juvenn/mustache.vim"
" Handlebars
Bundle "nono/vim-handlebars"
" The NERD commenter
Bundle "scrooloose/nerdcommenter"
" File tree explorer
Bundle "scrooloose/nerdtree"
" Rails integration
Bundle "tpope/vim-rails"
" Repeat even through mappings
Bundle "tpope/vim-repeat"
" Open a temporary scratch buffer
Bundle "duff/vim-scratch"
" Sparkup
Bundle "rstacruz/sparkup"
" Speed-dating
Bundle "tpope/vim-speeddating"
" Surround things with other things
Bundle "tpope/vim-surround"
" Text filtering and alignment
Bundle "godlygeek/tabular"
" TagBar (symbol browser like TextMate)
Bundle "majutsushi/tagbar"
" Tmux syntax
Bundle "zaiste/tmux.vim"
" YankRing
Bundle "vim-scripts/YankRing.vim"
" YouCompleteMe
Bundle "Valloric/YouCompleteMe"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ag
nnoremap <silent> <leader>f :Ag<space>
let g:agprg = 'ag --column'

" BufExplorer
let g:bufExplorerSortBy = 'fullpath'   " Sort by full file path name.
let g:bufExplorerShowRelativePath = 1  " Show relative paths.
let g:bufExplorerSplitOutPathName = 0  " Don't split the path and file

" Colors
nnoremap <silent> <leader>cls :colorscheme<space>

" CtrlP
let g:ctrlp_map = '<leader>p'         " command to invoke the plugin
let g:ctrlp_working_path_mode = 'rc'  " don't manage working directory
let g:ctrlp_max_height = 30           " maximum size of match window
let g:ctrlp_show_hidden = 1           " include dotfiles and dotdirs in search

" Bind leader-t to ctrlp to reduce transition pain
nnoremap <silent> <leader>t :CtrlP<CR>

" Fugitive
nnoremap <silent> <leader>gst :Gstatus<CR>
nnoremap <silent> <leader>gci :Gcommit<CR>
nnoremap <silent> <leader>gmv :Gmove<CR>
nnoremap <silent> <leader>grm :Gremove<CR>

" Gundo
nnoremap <silent> <leader>u :GundoToggle<CR>

" The NERD tree
let g:NERDTreeHijackNetrw = 0 " for now, don't use it for directory browsing
let NERDTreeShowHidden=1
nnoremap <silent> <leader>d :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<cr>

" Scratch
nnoremap <silent> <leader>sc :Scratch<cr>
nnoremap <silent> <leader>ssc :Sscratch<cr>

"************************************************
" Tabularize

  "*********************
  " Keymappings
  "
  nnoremap <leader>al,    :Tabularize /,\zs<CR>
  vnoremap <leader>al,    :Tabularize /,\zs<CR>
  nnoremap <leader>al::   :Tabularize /\s:<CR>
  vnoremap <leader>al::   :Tabularize /\s:<CR>
  nnoremap <leader>al=    :Tabularize /=>\@!<CR>
  vnoremap <leader>al=    :Tabularize /=>\@!<CR>
  nnoremap <leader>al=>   :Tabularize /=><CR>
  vnoremap <leader>al=>   :Tabularize /=><CR>
  nnoremap <leader>al->   :Tabularize /-><CR>
  vnoremap <leader>al->   :Tabularize /-><CR>
  nnoremap <leader>al{    :Tabularize /{<CR>
  vnoremap <leader>al{    :Tabularize /{<CR>
  nnoremap <leader>al}    :Tabularize /}<CR>
  vnoremap <leader>al}    :Tabularize /}<CR>
  nnoremap <leader>al:    :Tabularize /:\zs<CR>
  vnoremap <leader>al:    :Tabularize /:\zs<CR>

  "*********************
  " Custom Functions
  "
  " Tabularize Auto Table Styling:
  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

  " Tabularize Auto Table Styling:
  function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      Tabularize/|/l1
      normal! 0
      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
  endfunction
"************************************************

" TagBar
nnoremap <silent> <leader><S-t> :TagbarToggle<CR>

" YankRing
nnoremap <silent> <leader>yr :YRShow<cr>
inoremap <silent> <leader>yr <ESC>:YRShow<cr>

