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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wesQ3/vim-windowswap'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'szw/vim-ctrlspace'
Plugin 'rking/ag.vim'

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
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'scrooloose/syntastic'

" languages
Plugin 'jeroenbourgois/vim-actionscript'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'kchmck/vim-coffee-script'
Plugin 'chrisbra/csv.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'jwalton512/vim-blade'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
Plugin 'vim-ruby/vim-ruby'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-pug'
Plugin 'nikvdp/ejs-syntax'

" colorschemes
Plugin 'w0ng/vim-hybrid'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'nanotech/jellybeans.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'jdkanani/vim-material-theme'

call vundle#end()
filetype plugin indent on
syntax on

" leader to comma
let mapleader=","

" show indention when wrapping
" set breakindent
" set showbreak=\ 

" basic formatting
set nosmartindent
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

" dont match parenthesis, they are usually wrong
let loaded_matchparen = 1

" more natural split resizing
set splitbelow
set splitright

set fillchars+=vert:│ 

" simpler airline display
let g:airline_powerline_fonts = 1

" let g:airline#extensions#tabline#tab_min_count = 2
" let g:airline#extensions#tabline#buf_min_count = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = '┃'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = '┃'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '┃'

let g:indentLine_faster = 1
let g:indentLine_leadingSpaceChar = '∙'
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_fileTypeExclude = ['', 'qf', 'gitv', 'tagbar', 'vimfiler', 'unite', 'help', 'man', 'gitcommit', 'vimwiki', 'notes']

" status bar is hidden if only one split
set laststatus=1

" todo
nnoremap <silent> <leader>td :set norelativenumber nonumber invwrap wrap linebreak laststatus=0<CR>

" dont show the tab line
set showtabline=1

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

" bold is OK
let g:enable_bold_font = 1

" copy to my osx clipboard, we also need reattach plugin here if using tmux
set clipboard=unnamed

" allow more/less time for leader
set timeoutlen=500
set ttimeoutlen=50

" auto refresh file changes
set autoread

" fix blade auto indent issue
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade

" dont fold my markdown
let g:vim_markdown_folding_disabled = 1

" open a new tab
:nnoremap <C-S-t> :tabnew<CR>

:nnoremap Ò :bn<CR>
:nnoremap Ó :bp<CR>
:nnoremap Ô :tabn<CR>
:nnoremap  :tabp<CR>

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
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,.vimrc_background so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
:nnoremap <leader><leader>r :so $MYVIMRC<CR>

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
:nnoremap ¬ :wincmd l<CR>
:nnoremap ˙ :wincmd h<CR>
:nnoremap ∆ :wincmd j<CR>
:nnoremap ˚ :wincmd k<CR>
:nnoremap <leader>w= :wincmd =<CR>

" quick function to toggle the tabline
:nnoremap <silent> <leader>tl :execute 'set showtabline=' . (&showtabline ==# 0 ? 2 : 0)<CR>

" quick function to toggle the status line
:nnoremap <silent> <leader>sl :execute 'set laststatus=' . (&laststatus ==# 1 ? 2 : 1)<CR>

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

" jumping around, i always want my cursor to be in the middle
:noremap <Leader><leader>q :q!<CR>
:noremap L Lzz
:noremap H Hzz

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
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "*.min.js" --ignore "*.min.css"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

if has('python') || has('python3')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" select entire file
:nnoremap <leader><leader>a ggVG

" change cursor to underscore on visual mode or insert mode.
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" seamless switching tmux panes
" if exists('$TMUX')
"   function! TmuxOrSplitSwitch(wincmd, tmuxdir)
"     let previous_winnr = winnr()
"     silent! execute "wincmd " . a:wincmd
"     if previous_winnr == winnr()
"       if a:tmuxdir == 'L'
"         call system("tmux select-pane -L && tmux resize-pane -Z")
"       else
"         call system("tmux select-pane -" . a:tmuxdir)
"       endif
"       redraw!
"     endif
"   endfunction

"   let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
"   let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
"   let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

"   nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
"   nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
"   nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
"   nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
" else
"   map <C-h> <C-w>h
"   map <C-j> <C-w>j
"   map <C-k> <C-w>k
"   map <C-l> <C-w>l
" endif

" environment switching
:nnoremap <leader>efd :call SetSethEnv('freelance', 'dark')<Cr>
:nnoremap <leader>efl :call SetSethEnv('freelance', 'light')<Cr>
:nnoremap <leader>ewd :call SetSethEnv('work', 'dark')<Cr>
:nnoremap <leader>ewl :call SetSethEnv('work', 'light')<Cr>
:nnoremap <leader>eod :call SetSethEnv('other', 'dark')<Cr>
:nnoremap <leader>eol :call SetSethEnv('other', 'light')<Cr>

set t_Co=256
let base16colorspace=256
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1

function! SetSethEnv(col, bg)
    exec 'set background='.a:bg
    exec 'colorscheme '.a:col

    highlight LineNr ctermbg=NONE guibg=NONE
    hi link CtrlSpaceNormal Normal
    hi link CtrlSpaceSelected Visual
    hi link CtrlSpaceStatus Ctrlpdark
endfunction

if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background

    highlight LineNr ctermbg=NONE guibg=NONE
    hi link CtrlSpaceNormal Normal
    hi link CtrlSpaceSelected Visual
    hi link CtrlSpaceStatus Ctrlpdark
endif

" nerdtree settings
let NERDTreeQuitOnOpen = 1
map <leader>n :NERDTreeToggle<CR>
map <leader>m :NERDTreeFind<CR>
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

