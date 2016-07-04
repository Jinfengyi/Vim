set nocompatible
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

"insert here your Neobundle plugins"
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle "Valloric/YouCompleteMe"
NeoBundle "majutsushi/tagbar"
call neobundle#end()
filetype plugin indent on
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:airline_powerline_fonts = 0
let g:airline_theme = 'molokai'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set backspace=indent,eol,start
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"
let g:quickrun_config={'*': {'split': ''}}
set splitbelow
set number
"inoremap " ""<Left>
"inoremap { {}<Left>
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap ( ()<ESC>i
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
colorscheme molokai
syntax on
"let g:molokai_original = 1
"let g:rehash256 = 1
set background=dark
