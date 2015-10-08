" vundle start
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" load plugins
call vundle#begin()

" required
Plugin 'gmarik/Vundle.vim'

" file/window organization
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'wesQ3/vim-windowswap'
Plugin 'kien/ctrlp.vim'
Plugin 'szw/vim-ctrlspace'
Plugin 'mileszs/ack.vim'

" utilities
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'majutsushi/tagbar'

" languages
Plugin 'jeroenbourgois/vim-actionscript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'chrisbra/csv.vim'
Plugin 'xsbeats/vim-blade'
Plugin 'StanAngeloff/php.vim'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'

" colorschemes
Plugin 'w0ng/vim-hybrid'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on
syntax on

" leader to comma
let mapleader=","

" use 256 colors when available
set t_Co=256

" show indention when wrapping
set breakindent
set showbreak=\ 

" basic formatting
set smartindent
set ruler
set hidden

" relative line numbers
set number
set norelativenumber

" spacing & whitespace
set tabstop=4
set shiftwidth=4
set textwidth=0
set wrapmargin=0
set nowrap
set linebreak
set nolist
set backspace=indent,eol,start
set expandtab

" list chars
set listchars=""
set listchars=tab:>-
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

" folding/searching
set hlsearch
set incsearch
set ignorecase
set foldmethod=manual

" dont use buffer saving
set nobackup
set noswapfile

" no cursor line highlight
set nocursorline
set nocursorcolumn

" more natural split resizing
set splitbelow
set splitright

" simpler airline display
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '

" status bar is hidden if only one split
set laststatus=1

" never show the tab line bar (use ctrl-space)
set showtabline=0

" disable output and vcs files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" ignore librarian-chef, vagrant, test-kitchen and berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" disable temp and backup files
set wildignore+=*.swp,*~,._*

" tagbar options
let g:tagbar_sort = 0

" copy to my osx clipboard, we also need reattach plugin here if using tmux
set clipboard=unnamed

" allow more/less time for leader
set timeoutlen=500
set ttimeoutlen=50

" fix blade auto indent issue
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade

" open a new tab
:nnoremap <C-S-t> :tabnew<CR>

:nnoremap <C-S-l> :tabn<CR>
:nnoremap <C-S-h> :tabp<CR>

" quick switch between buffers
:nnoremap <leader>l :bn<CR>
:nnoremap <leader>h :bp<CR>
:nnoremap <leader>tb :TagbarToggle<CR>
:vnoremap <leader>tc :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<CR>

" better copying
:vnoremap <silent> y y`]
:vnoremap <silent> p p`]
:nnoremap <silent> p p`]
:noremap gV `[v`]
:nnoremap <silent> p p`]
:nnoremap <silent> p p`]

" vimrc refresh automatically
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" quickly edit vimrc
:noremap <leader>ve :tabedit ~/.vimrc<CR>

" show current file full path
:nnoremap <leader>fn :echo expand('%:p')<CR>

" relative number toggling
:nnoremap <leader>rn :call NumToggle()<CR>

function! NumToggle()
    set relativenumber!
    if (&relativenumber > 0)
        set nonumber
    else
        set number
    endif
endfunction

" vertical resize
:nnoremap = :res +10<CR>
:nnoremap - :res -10<CR>

" horizontal resize
:nnoremap + :vertical res +10<CR>
:nnoremap _ :vertical res -10<CR>

" easier window motions with leader
:nnoremap <leader>wl :wincmd l<CR>
:nnoremap <leader>wh :wincmd h<CR>
:nnoremap <leader>wj :wincmd j<CR>
:nnoremap <leader>wk :wincmd k<CR>
:nnoremap <leader>w= :wincmd =<CR>

" add space above/below current line
:nnoremap <leader>o o<esc>k
:nnoremap <leader>O O<esc>j

" visual selection of text on a line, not including the return char
:nnoremap <leader>vl ^v$h

" file saving
:noremap <Leader>s :update<CR>
:noremap <Leader>w :update<CR>
:noremap <Leader>wq :wq!<CR>
:noremap <Leader>bd :bd<CR>
:noremap <Leader>q :wincmd q<CR>
:noremap <Leader><leader>q :q!<CR>

" toggle paste mode
nmap <leader><leader>p :set invpaste<CR>:set paste?<CR>
imap <leader><leader>p <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" upper/lower format word without selection
nmap <leader>uc mQviwU`Q
nmap <leader>lc mQviwu`Q

" underline the current line with '='
nmap <silent> <leader>ul :t.<CR>Vr=

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>:set linebreak<CR>

" even on wrap, i only want to go one line
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" flip single lines
nmap <C-k> [e
nmap <C-j> ]e

" flip multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" remove trailing whitespaces
:nnoremap <leader>fws :FixWhitespace<CR>

" fix indentation to spaces
:nnoremap <leader>fi  ggVG>gv<<esc>

" multiple cursor don't exit until second escape
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" toggle search highlighting
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" function file, buffer, mru search
:nnoremap <C-I> :CtrlPBuffer<Cr>
:nnoremap <C-U> :CtrlPMRU<Cr>
:nnoremap <C-O> :CtrlPFunky<Cr>
:nnoremap <leader>fu :CtrlPFunky<Cr>
:nnoremap <leader>fp :CtrlP<Cr>

" more speedy startup of ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_max_files=30000

" select entire file
:nnoremap <leader><leader>a ggVG

" environment switching
:nnoremap <leader>efd :call SetSethEnv('freelance', 'dark')<Cr>
:nnoremap <leader>efl :call SetSethEnv('freelance', 'light')<Cr>
:nnoremap <leader>ewd :call SetSethEnv('work', 'dark')<Cr>
:nnoremap <leader>ewl :call SetSethEnv('work', 'light')<Cr>
:nnoremap <leader>eod :call SetSethEnv('other', 'dark')<Cr>
:nnoremap <leader>eol :call SetSethEnv('other', 'light')<Cr>

function! SetSethEnv(env, bg)
    if(a:bg == 'dark')
        set background=dark
    else
        set background=light
    endif

    if a:env == 'work'
        let g:hybrid_use_Xresources = 1
        set background=dark
        colorscheme hybrid
    elseif a:env =='freelance'
        colorscheme solarized
    else
    endif

    highlight LineNr ctermbg=NONE guibg=NONE
    hi link CtrlSpaceNormal Normal
    hi link CtrlSpaceSelected Visual
    hi link CtrlSpaceStatus Ctrlpdark
endfunction

" nerdtree settings
let NERDTreeQuitOnOpen = 1
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=0
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='s'

" if the opening parameter is a directory, cd into it
augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

function! s:CdIfDirectory(directory)
    let explicitDirectory = isdirectory(a:directory)
    let directory = explicitDirectory || empty(a:directory)

    if explicitDirectory
      exe "cd " . fnameescape(a:directory)
    endif

    " Allows reading from stdin
    " ex: git diff | mvim -R -
    if strlen(a:directory) == 0
      return
    endif

    if directory
      NERDTree
      wincmd p
      bd
    endif

    if explicitDirectory
      wincmd p
    endif
endfunction

function! s:UpdateNERDTree(...)
    let stay = 0

    if(exists("a:1"))
      let stay = a:1
    end

    if exists("t:NERDTreeBufName")
      let nr = bufwinnr(t:NERDTreeBufName)
      if nr != -1
        exe nr . "wincmd w"
        exe substitute(mapcheck("R"), "<CR>", "", "")
        if !stay
          wincmd p
        end
      endif
    endif
endfunction

" set environment
:call SetSethEnv('freelance', 'light')
:call SetSethEnv('work', 'light')
:call SetSethEnv('work', 'dark')
