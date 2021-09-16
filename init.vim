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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'hrsh7th/nvim-compe'
" dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'kabouzeid/nvim-lspinstall'

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

" Rails.vim key bindings
nnoremap <Leader>em :Emodel<CR>
nnoremap <Leader>ec :Econtroller<CR>
nnoremap <Leader>ei :Eview index<CR>
nnoremap <Leader>es :Eview show<CR>
nnoremap <Leader>en :Eview new<CR>
nnoremap <Leader>ee :Eview edit<CR>
nnoremap <Leader>ef :Eview _form<CR>

" For Neovim Health
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '~/.pyenv/shims/python'

"Vim Vue
let g:vue_pre_processors = ['scss']

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
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
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local function setup_servers()
  require'lspinstall'.setup() -- important

  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

require'lspinstall'.post_install_hook = function () 
  setup_servers()
  vim.cmd("bufdo e")
end

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'vue', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
      vue = 'eslint'
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'eslint_d',
      javascriptreact = 'eslint_d',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      json = 'prettier',
      markdown = 'prettier',
      vue = 'eslint_d'
    }
  }
}

EOF

" Using lua functions
"
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()


