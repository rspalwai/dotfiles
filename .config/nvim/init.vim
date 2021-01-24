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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" => LINTER
Plug 'w0rp/ale'
call plug#end()

let mapleader = "."
set tabstop=8 softtabstop=8 shiftwidth=8 expandtab autoindent nu nowrap noerrorbells
set foldmethod=indent foldlevel=0 foldnestmax=1
highlight Folded ctermbg=NONE
if has('termguicolors')
      set termguicolors
endif
set bg=light termguicolors
colorscheme forest-night
let g:forest_night_cursor = 'green'
let g:forest_night_diagnostic_line_highlight = 1


let g:gitgutter_enabled=1 

let g:airline_powerline_fonts = 1
let g:airline_theme = 'forest_night'

let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

let g:ale_linters = {'c': ['gcc']}
let g:ale_cpp_gcc_options = '-Wall -O2'

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
" THE END "
