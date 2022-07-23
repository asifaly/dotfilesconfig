set nocompatible

call plug#begin()

"Plug 'tpope/vim-rails'
Plug 'mhinz/vim-startify'
Plug 'lewis6991/gitsigns.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'sbdchd/neoformat'
Plug 'Mofiqul/dracula.nvim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'akinsho/bufferline.nvim'

call plug#end()

filetype plugin indent on

syntax on
set background=dark
set termguicolors
colorscheme nightfly 
set noerrorbells
set nowrap
set cursorline
set hidden
set encoding=utf-8
set noswapfile
set nobackup
set nowritebackup
set shortmess+=c
set number
set relativenumber
set mouse=a
set ttyfast
set lazyredraw
set signcolumn=yes
set list
set timeoutlen=500
set listchars=trail:~,extends:>,precedes:<,space:·
set smartcase
set incsearch
set smartindent
set ignorecase
set splitright
set splitbelow
set showtabline=2
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set updatetime=50
set nohlsearch
set clipboard=unnamedplus
set wildignore+=*/node_modules/**
set showcmd
set incsearch
set scrolloff=2
set showmatch
set textwidth=80
set colorcolumn=+1
set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=#273033

highlight Comment cterm=italic
highlight Cursor guifg=#f00 guibg=#657b83

let mapleader="\<space>"

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
nmap <silent> <Leader>u :source ~/.config/nvim/init.vim<Return>
" nmap <C-j> <C-W>j
" nmap <C-k> <C-W>k
" nmap <C-h> <C-W>h
" nmap <C-l> <C-W>l

" Move Lines Up/Down in Visual Mode
"xnoremap K :move '<-2<Return>gv-gv
"xnoremap J :move '>+1<Return>gv-gv

" Resize Splits
nnoremap <Leader><Up> :resize +2<Return>
nnoremap <Leader><Down> :resize -2<Return>
nnoremap <Leader><Left> :vertical resize +2<Return>
nnoremap <Leader><Right> :vertical resize -2<Return>


" For Neovim Health
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Telescope keybindings
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').file_browser({cwd = vim.fn.expand('%:p:h')})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader>fz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fk <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').colorscheme()<cr>
nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>

" Neoformat - Format on Save

let g:shfmt_opt="ci"
augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry
augroup END

lua << EOF
require'gitsigns'.setup()
require'colorizer'.setup()
require'nvim-autopairs'.setup{}
vim.opt.termguicolors = true
require("bufferline").setup{}

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_diagnostic'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
  extensions = {}
}


local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  client.resolved_capabilities.document_formatting = true
  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_st_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', 'wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', 'wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', 'DD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'ee', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'qo', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', 'fm','<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local lsp_installer = require("nvim-lsp-installer")
local coq = require("coq")
lsp_installer.on_server_ready(function(server)
    local opts = {"yaml", "vue", "vim", "typescript", "tsx", "svelte", "solidity", "scss", "ruby", "python", "lua", "json", "json5", "jsdoc", "javascript", "java", "html", "go", "dot", "dart", "bash", "rust"}
    server:setup(coq.lsp_ensure_capabilities(opts))
    vim.cmd('COQnow -s')
end)

require'nvim-treesitter.configs'.setup {
  ensure_installed = {}, 
 sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true
  },
}

EOF

