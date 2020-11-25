set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'posva/vim-vue'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'

call plug#end()

filetype plugin indent on

syntax on
set termguicolors
colorscheme dracula
set background=dark
set nolazyredraw
set number
set relativenumber
set nocursorline
set mouse=a
set ttyfast
set encoding=utf-8
set backspace=indent,eol,start
set autoread
set laststatus=2
set shell=zsh
set incsearch
set hlsearch
set smartcase
set ignorecase
set showcmd
set splitright
set splitbelow
set showtabline=2
set linespace=8
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set nowrap
set listchars=tab:\ \ ,trail:·
set timeoutlen=1000 ttimeoutlen=10

" Turn Off Swap Files
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Completion
set wildmode=longest,list,full
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*

let mapleader=","
" Alt-j moves current line down and Alt-k moves current line up
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
" disable recording macros until comfortable

nmap <silent> <Leader>a :bprev!<Return>
nmap <silent> <Leader>s :bnext!<Return>
nmap <silent> <Leader>d :bd!<Return>
nmap <silent> <Leader>c :noh<Return>
nmap <silent> <Leader>wq :wq!<Return>
nmap <silent> <Leader>q :q!<Return>
nmap <silent> <Leader>w :w<Return>
nmap <silent> <Leader>b gg=G<Return>
nmap <silent> <Leader>qa :qa!<Return>
nmap <silent> <Leader>Q :q!<Return>
nmap <silent> <Leader>q :q!<Return>
nmap <silent> <Leader>r :source ~/.vimrc<Return>
" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" NERDTree Enable on Load
" "autocmd VimEnter * NERDTree
" let g:NERDTreeQuitOnOpen=0
" Toggle NERDTree
" nmap <silent> <leader>k :NERDTreeToggle<cr>
" " expand to the path of the file in the current buffer
" map <silent> <leader>f :NERDTreeFind<cr>

" airline configuration
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" open new split panes to right and below
" set splitright
" set splitbelow
" turn terminal to normal mode with escape
" if has("nvim")
"   au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
" au FileType fzf tunmap <buffer> <Esc>
" endif
" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
" function! OpenTerminal()
"   split term://zsh
"   set nonumber
"   set norelativenumber
" resize 10
" endfunction
" nnoremap <c-n> :call OpenTerminal()<CR>

let g:vue_pre_processors = ['scss']
let g:vue_pre_processors = 'detect_on_enter'

command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd BufWritePre   *.vue call CocAction('format')

nnoremap <C-p> :FZF<CR>
" nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

let g:startify_change_to_vcs_root=1
