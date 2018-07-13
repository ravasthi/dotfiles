""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ugh https://github.com/vim/vim/issues/3117#issuecomment-402622616
if has('python3')
  silent! python3 1
endif

" Turn off vi-compatibility
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle, plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required by Vundle
filetype off

" Setup vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle: required
Plugin 'gmarik/Vundle.vim'

" ack.vim using ag as its backend
" requires 'brew install the_silver_searcher'
Plugin 'mileszs/ack.vim'
" Auto-pairs
Plugin 'jiangmiao/auto-pairs'
" AutoTag
Plugin 'vim-scripts/AutoTag'
" Better whitespace
Plugin 'ntpeters/vim-better-whitespace'
" BufExplorer
Plugin 'firat/vim-bufexplorer'
" Bundler integration
Plugin 'tpope/vim-bundler'
" Coffeescript
Plugin 'kchmck/vim-coffee-script'
" CSApprox
Plugin 'godlygeek/csapprox'
" CSSComb
Plugin 'csscomb/vim-csscomb'
" Editorconfig
Plugin 'editorconfig/editorconfig-vim'
" Fuzzy file search
Plugin 'kien/ctrlp.vim'
" Dash
Plugin 'rizzatti/dash.vim'
" Add your ends
Plugin 'tpope/vim-endwise'
" Git integration
Plugin 'tpope/vim-fugitive'
" Gist
Plugin 'mattn/gist-vim'
" Gundo
Plugin 'sjl/gundo.vim'
" HAML, Sass, SCSS
Plugin 'tpope/vim-haml'
" Lightline
Plugin 'itchyny/lightline.vim'
" Markdown
Plugin 'tpope/vim-markdown'
" Mustache
Plugin 'juvenn/mustache.vim'
" Handlebars
Plugin 'nono/vim-handlebars'
" The NERD commenter
Plugin 'scrooloose/nerdcommenter'
" File tree explorer
Plugin 'scrooloose/nerdtree'
" Rails integration
Plugin 'tpope/vim-rails'
" Repeat even through mappings
Plugin 'tpope/vim-repeat'
" Open a temporary scratch buffer
Plugin 'duff/vim-scratch'
" Sparkup
Plugin 'rstacruz/sparkup'
" Speed-dating
Plugin 'tpope/vim-speeddating'
" Surround things with other things
Plugin 'tpope/vim-surround'
" Text filtering and alignment
Plugin 'godlygeek/tabular'
" TagBar (symbol browser like TextMate)
Plugin 'majutsushi/tagbar'
" Theme: papercolor
Plugin 'NLKNguyen/papercolor-theme'
" Tmux syntax
Plugin 'zaiste/tmux.vim'
" xTerm color table (!!)
Plugin 'guns/xterm-color-table.vim'
" YankRing
Plugin 'vim-scripts/YankRing.vim'
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" Required by Vundle
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Back to basic settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set nowritebackup
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
let g:lightline = { 'colorscheme': 'PaperColor' }

set background=dark
colorscheme PaperColor

" Show invisibles like TextMate
set list
set listchars=tab:▸\ ,eol:¬,trail:·

" Always show status line
set laststatus=2

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
highlight CursorLine cterm=NONE ctermbg=239 guibg=#4e4e4e
highlight clear CursorLineNr
highlight CursorLineNr cterm=NONE ctermfg=247 guifg=#9e9e9e
highlight Cursor cterm=NONE ctermbg=253 ctermfg=239 guifg=#4e4e4e guibg=#dadada

" Don't blink cursor
" set guicursor=a:blinkon0

set guicursor=a:blinkwait500-blinkon800-blinkoff800
set guicursor+=a:lCursor

if &term =~ '^xterm\\|rxvt'
  let &t_SI .= "\<Esc>[5 q"
  let &t_EI .= "\<Esc>[1 q"

  " 1 or 0 -> blinking block
  " 2 -> solid block
  " 3 -> blinking underscore
  " 4 -> solid underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

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
set wildignore+=*/.build,*/.cache,*/.git,*/.hg,*/.svn,*/.sass-cache,*/.*-cache
set wildignore+=*/coverage,*/node_modules

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

" Show a vertical line/guard at columns 80 and 10, and change the background
" past column 120, because that's right out.
if exists('+colorcolumn')
  let &colorcolumn="80,100,".join(range(120,999),",")
endif

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Strip trailing whitespace on save
au BufWritePre * StripWhitespace

" Open current file in Marked
nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

" Adds a global snippet for ^L to insert a hash rocket
imap <C-L> <Space>=><Space>

" Format JSON nicely
command! FormatJSON %!python -m json.tool
nnoremap =j :FormatJSON<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom syntax highlighing settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWinEnter,BufRead,BufNewFile Guardfile set filetype=ruby
au BufWinEnter,BufRead,BufNewFile Vendorfile set filetype=ruby
au BufWinEnter,BufRead,BufNewFile .powenv set filetype=sh
au BufWinEnter,BufRead,BufNewFile .powrc set filetype=sh

au Filetype gitcommit setlocal spell textwidth=72

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ack (using ag as a backend)
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
nnoremap <silent> <leader>f :Ack<space>

" BufExplorer
let g:bufExplorerSortBy = 'fullpath'   " Sort by full file path name.
let g:bufExplorerShowRelativePath = 1  " Show relative paths.
let g:bufExplorerSplitOutPathName = 0  " Don't split the path and file

" Colors
nnoremap <silent> <leader>cls :colorscheme<space>

" CtrlP
let g:ctrlp_map = '<leader>p'         " command to invoke the plugin
let g:ctrlp_working_path_mode = 'ra'  " set cwd to nearest vcs-repo ancestor, &
                                      " directory of current file unless it's
                                      " a subdirectory of the cwd
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

" YouCompleteMe
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
