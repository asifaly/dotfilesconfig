set nocompatible

call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'haishanh/night-owl.vim'
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-rails'
Plug 'ap/vim-css-color'
Plug 'tomtom/tcomment_vim'
Plug 'gruvbox-community/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'ms-jpq/coq_nvim'

call plug#end()

filetype plugin indent on

syntax on
colorscheme night-owl 
set cursorline
set hidden
set encoding=utf-8
set nobackup
set nowritebackup
set shortmess+=c
set background=dark
set number
set relativenumber
set mouse=a
set ttyfast
set signcolumn=yes
set smartcase
set smartindent
set ignorecase
set splitright
set splitbelow
set showtabline=2
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set updatetime=300
if has("termguicolors")     " set true colors
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
let mapleader=","

" Airline configuration
let g:airline_theme='night_owl'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'

" Startify
let g:startify_change_to_vcs_root=1
let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

" My Keybindings
nmap <silent> <Leader>a :bprev!<Return>
nmap <silent> <Leader>s :bnext!<Return>
nmap <silent> <Leader>d :bd!<Return>
nmap <silent> <Leader>c :noh<Return>
nmap <silent> <Leader>wq :wq!<Return>
nmap <silent> <Leader>q :q!<Return>
nmap <silent> <Leader>w :w<Return>
nmap <silent> <Leader>i gg=G<Return>
nmap <silent> <Leader>qa :qa!<Return>
nmap <silent> <Leader>Q :q!<Return>
nmap <silent> <Leader>q :q!<Return>
nmap <silent> <Leader>sr :source ~/.config/nvim/init.vim<Return>

" Move Lines Up/Down in Visual Mode
xnoremap K :move '<-2<Return>gv-gv
xnoremap J :move '>+1<Return>gv-gv

" Resize Splits
nnoremap <Leader><Up> :resize +2<Return>
nnoremap <Leader><Down> :resize -2<Return>
nnoremap <Leader><Left> :vertical resize +2<Return>
nnoremap <Leader><Right> :vertical resize -2<Return>


" For Neovim Health
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

"Vim Vue
let g:vue_pre_processors = ['scss']


" Using lua functions
"
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

lua << EOF

local lsp_installer = require("nvim-lsp-installer")
local coq = require("coq")

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(coq.lsp_ensure_capabilities(opts))
      -- Add keybinds
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end)
EOF
