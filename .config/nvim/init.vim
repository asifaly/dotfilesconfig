set nocompatible

call plug#begin()

"Plug 'glepnir/dashboard-nvim'
Plug 'tpope/vim-rails'
Plug 'sheerun/vim-polyglot'
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
Plug 'haishanh/night-owl.vim'
Plug 'creativenull/diagnosticls-configs-nvim'
"Plug 'folke/which-key.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

filetype plugin indent on

syntax on
colorscheme night-owl
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
"set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
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
set termguicolors
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
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

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

"Vim Vue
"let g:vue_pre_processors = ['scss']


" Using lua functions
"
"nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>
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
"nnoremap <leader>fr <cmd>lua require'telescope'.extensions.repo.list{}<cr>
nnoremap <leader>gl <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ga   <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>fo <cmd>lua vim.lsp.buf.formatting()<CR>

lua << EOF
require'gitsigns'.setup()
--require("which-key").setup()
--require'telescope'.load_extension'repo'
require'colorizer'.setup()

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'nightfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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

local lsp_installer = require("nvim-lsp-installer")
local coq = require("coq")
--local saga = require("lspsaga")

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(coq.lsp_ensure_capabilities(opts))
    vim.cmd('COQnow -s')
end)
EOF

lua << EOF
-- npm install -g diagnostic-languageserver eslint_d prettier_d_slim prettier
local function on_attach(client)
  print('Attached to ' .. client.name)
end
local dlsconfig = require 'diagnosticls-configs'
dlsconfig.init {
  default_config = false,
  format = true,
  on_attach = on_attach,
}
local eslint = require 'diagnosticls-configs.linters.eslint'
local prettier = require 'diagnosticls-configs.formatters.prettier'
--local rubocop = require 'diagnosticls-configs.linters.rubocop'
prettier.requiredFiles = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.toml',
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.js',
    '.prettierrc.cjs',
    'prettier.config.js',
    'prettier.config.cjs',
    'prettierrc.vue'
  }
dlsconfig.setup {
  ['javascript'] = {
    linter = eslint,
    formatter = { prettier }
  },
  ['javascriptreact'] = {
    linter = { eslint },
    formatter = { prettier }
  },
  ['vue'] = {
    linter = { eslint },
    formatter = { prettier }
  },
  ['css'] = {
    formatter = prettier
  },
  ['html'] = {
    formatter = prettier
  },
}

--require'nvim-treesitter.configs'.setup {
-- ensure_installed = "maintained", 
--  sync_install = false,
--  highlight = {
--    enable = true,
--    additional_vim_regex_highlighting = false,
--  },
--  indent = {
--    enable = true,
--  },
--}

EOF

