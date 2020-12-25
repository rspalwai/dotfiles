"-------------------------------------------------------------------------------------------------------------------"
"SUHAS PALWAI vimrc file                                                                                            "
"-------------------------------------------------------------------------------------------------------------------"

"-------------------------------------------------------------------------------------------------------------------"
" -> GENERAL SETTINGS                                                                                               "
"-------------------------------------------------------------------------------------------------------------------"
filetype plugin on
filetype indent on

let mapleader = ","
nmap <leader>w :w!<cr>

"-------------------------------------------------------------------------------------------------------------------"
" -> VIM UI SETTINGS                                                                                                "
"-------------------------------------------------------------------------------------------------------------------"

" => NO LINE WRAP
set nowrap
" => HIGHLIGHTS CURRENT ROW 
set cul
" => TAB AND OTHER SETTINGS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" => INDENT SETTINGS
set autoindent
" => FOLDING
set foldmethod=indent
set foldlevel=0
set foldnestmax=1
highlight Folded ctermbg=NONE
" => LINE NUMBER SETTINGS
set nu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

"-------------------------------------------------------------------------------------------------------------------"
" -> COLORSCHEME + FONT                                                                                             "
"-------------------------------------------------------------------------------------------------------------------"
" => FONT SETTINGS
set guifont="FiraMonoNerdFontComplete-Regular:h14"
  
"-------------------------------------------------------------------------------------------------------------------"
" -> PLUGINS                                                                                                        "
"-------------------------------------------------------------------------------------------------------------------"
call plug#begin()

" => AESTHETIC
Plug 'sainnhe/forest-night'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
" => EDITING
Plug 'preservim/nerdtree'
Plug 'yggdroot/indentline'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" => LINTER
Plug 'w0rp/ale'

call plug#end()

"-------------------------------------------------------------------------------------------------------------------"
" -> PLUGIN SETTINGS                                                                                                "
"-------------------------------------------------------------------------------------------------------------------"
set bg=dark
set termguicolors 
let g:forest_night_enable_italic = 1
let g:forest_night_disable_italic_comment = 1
colorscheme forest-night
let g:forest_night_cursor = 'green'
" => GITGUTTER
let g:gitgutter_enabled=1

" => AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = ['help', 'markdown', 'rst', 'org', 'text', 'asciidoc', 'tex', 'mail']
let g:airline#extensions#wordcount#filetypes += ['pandoc']
let g:pandoc#formatting#mode = 'h'
let g:pandoc#formatting#textwidth = 80
let g:airline_theme = 'forest_night'

" => INDENT GUIDES
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
"=> NERDTREE
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" => ALE
let g:ale_linters = {'cpp': ['clang', 'g++']}
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++17'

" -> YOU HAVE REACHED THE END!!!"
"-------------------------------------------------------------------------------------------------------------------"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"==================================================================================================================="