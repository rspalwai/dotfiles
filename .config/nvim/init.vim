"|-| Suhas Palwai neovim config file |-|"

filetype indent on
filetype plugin on

call plug#begin('~/.config/nvim/plugged')
" => AESTHETIC
Plug 'sainnhe/forest-night'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
" => EDITING
Plug 'preservim/nerdtree'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" => LINTER
Plug 'w0rp/ale'
call plug#end()

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent nu nowrap noerrorbells
set foldmethod=indent foldlevel=0 foldnestmax=1
highlight Folded ctermbg=NONE
set bg=dark termguicolors
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1
colorscheme forest-night

autocmd BufNewFile *.cpp r /Users/rspalwai/programming/CODEFORCES/cf.cpp

let g:gitgutter_enabled=1 

let g:airline_powerline_fonts = 1
let g:airline_theme = 'forest_night'

let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

let g:ale_linters = {'cpp': ['clang', 'g++']}
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'

""" THE END """ 
