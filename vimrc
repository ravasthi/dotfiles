""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ugh https://github.com/vim/vim/issues/3117#issuecomment-402622616
" if has('python3')
"   silent! python3 1
" endif

" Turn off vi-compatibility
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug, plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up vim-plug
let g:plug_timeout = 120
call plug#begin('~/.vim/plugged')

" ack.vim using ag as its backend
" requires 'brew install the_silver_searcher'
Plug 'mileszs/ack.vim'
" Auto-pairs
Plug 'jiangmiao/auto-pairs'
" AutoTag
Plug 'vim-scripts/AutoTag'
" Better whitespace
Plug 'ntpeters/vim-better-whitespace'
" BufExplorer
Plug 'jlanzarotta/bufexplorer'
" Bundler integration
Plug 'tpope/vim-bundler'
" CSApprox
Plug 'godlygeek/csapprox'
" CSSComb
Plug 'csscomb/vim-csscomb'
" Editorconfig
Plug 'editorconfig/editorconfig-vim'
" Fuzzy file search
Plug 'kien/ctrlp.vim'
" Dash
Plug 'rizzatti/dash.vim'
" Add your ends
Plug 'tpope/vim-endwise'
" Git integration
Plug 'tpope/vim-fugitive'
" Gist
Plug 'mattn/gist-vim'
" Gundo
Plug 'sjl/gundo.vim'
" HAML, Sass, SCSS
Plug 'tpope/vim-haml'
" Lightline
Plug 'itchyny/lightline.vim'
" Base16 Lightline
Plug 'daviesjamie/vim-base16-lightline'
" Markdown
Plug 'tpope/vim-markdown'
" Mustache
Plug 'juvenn/mustache.vim'
" Handlebars
Plug 'nono/vim-handlebars'
" The NERD commenter
Plug 'scrooloose/nerdcommenter'
" File tree explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Rails integration
Plug 'tpope/vim-rails'
" Repeat even through mappings
Plug 'tpope/vim-repeat'
" Open a temporary scratch buffer
Plug 'duff/vim-scratch'
" Sparkup
Plug 'rstacruz/sparkup'
" Speed-dating
Plug 'tpope/vim-speeddating'
" Surround things with other things
Plug 'tpope/vim-surround'
" Text filtering and alignment
Plug 'godlygeek/tabular'
" TagBar (symbol browser like TextMate)
Plug 'majutsushi/tagbar'
" Theme: aquarium
Plug 'FrenzyExists/aquarium-vim'
" Theme: aurora
Plug 'ray-x/aurora'
" Theme: ayu
Plug 'ayu-theme/ayu-vim'
" Theme: base16
Plug 'base16-project/base16-vim'
" Theme: catppuccin
Plug 'catppuccin/vim'
" Theme: darcula
Plug 'doums/darcula'
" Theme: elly
Plug 'ulwlu/elly.vim'
" Theme: everforest
Plug 'sainnhe/everforest'
" Theme: gruvbox
Plug 'morhetz/gruvbox'
" Theme: gruvbox-material
Plug 'sainnhe/gruvbox-material'
" Theme: iceberg
Plug 'cocopon/iceberg.vim'
" Theme: lucario
Plug 'raphamorim/lucario'
" Theme: melange
Plug 'savq/melange'
" Theme: monokai-pro
Plug 'phanviet/vim-monokai-pro'
" Theme: onedark
Plug 'joshdick/onedark.vim'
" Theme: sonokai
Plug 'sainnhe/sonokai'
" Theme: srcery
Plug 'srcery-colors/srcery-vim'
" Theme: papercolor
Plug 'NLKNguyen/papercolor-theme'
" Theme: vim-deep-space
Plug 'tyrannicaltoucan/vim-deep-space'
" Theme: zenbones
Plug 'mcchrish/zenbones.nvim'
" Tmux syntax
Plug 'zaiste/tmux.vim'
" xTerm color table (!!)
Plug 'guns/xterm-color-table.vim'
" YankRing
Plug 'vim-scripts/YankRing.vim'
" YouCompleteMe
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

" Required by vim-plug
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Back to basic settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nnoremap <silent> <leader>cls :colorscheme<space>

set guifont=EspressoMono-Regular:h14
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost
"$TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799
  "< https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option)
  "< https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  "< https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors") && ($TERM_PROGRAM != 'Apple_Terminal'))
    set termguicolors
  elseif ($TERM == 'xterm-256color')
    set t_Co=256
  endif
endif

let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

if exists('$BASE16_THEME') && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
  let base16colorspace=256
  colorscheme base16-$BASE16_THEME
  let g:lightline = { 'colorscheme': 'base16' }
" if full color is supported
elseif &termguicolors
  set background=dark
  colorscheme base16-darkmoss
  let g:lightline = { 'colorscheme': 'base16' }
" fall back on something that works
else
  set background=dark
  colorscheme gruvbox
  autocmd vimenter * ++nested colorscheme gruvbox
  let g:lightline = { 'colorscheme': 'solarized' }
endif

" Turn on syntax highlighting
syntax enable

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
highlight LineNr cterm=NONE ctermfg=241 guifg=#606060

" Highlight cursor line number
set cursorline
augroup vimrc
  autocmd!
  autocmd ColorScheme * highlight Cursor cterm=NONE ctermbg=253 ctermfg=233 guibg=#dadada guifg=#121212
  autocmd ColorScheme * highlight CursorLine cterm=NONE ctermbg=237 guibg=#3a3a3a
augroup end
highlight clear CursorLineNr
highlight CursorLineNr cterm=NONE ctermfg=247 guifg=#9e9e9e

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

" Show a vertical line/guard at columns 80 and 100, and change the background
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
au BufWinEnter,BufRead,BufNewFile *.zsh-theme set filetype=zsh

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
