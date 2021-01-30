"|-| Suhas Palwai neovim config file |-|"

filetype indent on
filetype plugin on

call plug#begin('~/.config/nvim/plugged')
" => AESTHETIC

Plug 'sainnhe/forest-night'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'mhinz/vim-startify'
" => EDITING

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

let mapleader = "\<Space>"
set tabstop=8 softtabstop=8 shiftwidth=8 expandtab autoindent nu nowrap noerrorbells incsearch nohlsearch
set nobackup noswapfile
syntax enable
set foldmethod=indent foldlevel=0 foldnestmax=1
highlight Folded ctermbg=NONE
if has('termguicolors')
      set termguicolors
endif
set bg=light 
colorscheme forest-night
let g:forest_night_cursor = 'green'
let g:forest_night_diagnostic_line_highlight = 1

let g:gitgutter_enabled=1 

let g:airline_powerline_fonts = 1
let g:airline_theme = 'forest_night'

let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

"let g:ale_linters = {'c': ['gcc']}
"let g:ale_cpp_gcc_options = '-Wall -O2'

autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
set encoding=UTF-8
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1

hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
set cot=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_confirm_key = "<C-a>"
:lua << EOF
        local nvim_lsp = require('lspconfig')
        local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
        require('completion').on_attach()

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }
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
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

        -- Set some keybinds conditional on server capabilities
        if client.resolved_capabilities.document_formatting then
                buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        elseif client.resolved_capabilities.document_range_formatting then
                buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        end

        -- Set autocommands conditional on server_capabilities
        if client.resolved_capabilities.document_highlight then
                vim.api.nvim_exec([[
                        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
                        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
                        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
                augroup lsp_document_highlight
                        autocmd!
                        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
                ]], false)
                end
        end

        -- Use a loop to conveniently both setup defined servers 
        -- and map buffer local keybindings when the language server attaches
        local servers = { "ccls" }
        for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup { on_attach = on_attach }
        end
EOF
:lua << EOF
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                -- This will disable virtual text, like doing:
                -- let g:diagnostic_enable_virtual_text = 0
                virtual_text = {
                        spacing = 8,
                        prefix = '',
                },

                -- This is similar to:
                -- let g:diagnostic_show_sign = 1
                -- To configure sign display,
                --  see: ":help vim.lsp.diagnostic.set_signs()"
                signs = true,

                -- This is similar to:
                -- "let g:diagnostic_insert_delay = 1"
                update_in_insert = true,
        }
)
EOF
" THE END "
