set nocompatible
filetype off
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
"NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle "ctrlpvim/ctrlp.vim"
"NeoBundle "Yggdroot/indentLine"
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vhda/verilog_systemverilog.vim'
NeoBundle 'vimtaku/hl_matchit.vim.git'
NeoBundle 'junegunn/vim-easy-align'
"NeoBundle 'mariappan/dragvisuals.vim'
NeoBundle 'soares/rainbow.vim'
NeoBundle 'mbbill/undotree'
"NeoBundle 'Shougo/unite.vim'
NeoBundle 'juneedahamed/svnj.vim'
NeoBundle 'jinfengyi/svn_rev_powerline'
NeoBundle 'jinfengyi/vimtabline'
call neobundle#end()
filetype plugin indent on
"nnoremap <silent><C-e> :NERDTreeToggle<CR>

"set ambiwidth=double
set encoding=utf-8
set backspace=indent,eol,start
set wildmenu
set wildmode=longest:full,full

"let g:jedi#auto_initialization = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#use_tabs_not_buffers = 0
""let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#show_call_signatures = "1"
"let g:quickrun_config={'*': {'split': ''}}
let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace=0
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_powerline_fonts = 0
"let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'molokai'
let g:airline_section_x = '%{strlen(&filetype)?&filetype:""}'

set splitbelow
set cursorline
set number
"set noautoindent
set laststatus=2
"-------tab------
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
"set hidden

set splitbelow
set splitright
set showtabline=2

"-------------neocomplete------
"let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

colorscheme molokai
set t_Co=256
syntax on
"let g:molokai_original = 1
"let g:rehash256 = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '>'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowHidden=1
set background=dark

nnoremap <S-Tab> gT
nnoremap <Tab><Tab> gt
for i in range(1, 9)
    execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
endfor


"""" key
nnoremap <silent><F1> :vs \|  :e.<CR>
nnoremap <silent><F2> :tabnew \|  :e.<CR>
nmap <F3> :IndentLinesToggle<CR>
nmap <F4> :AirlineToggleWhitespace<CR>
nmap <F5> :colorscheme default<CR>
nmap <F8> :TagbarToggle<CR>
noremap j gj
noremap k gk
noremap <S-j> <C-f>
noremap <S-k> <C-B>



"autocmd BufNewFile,BufRead *.sv set filetype=verilog
"autocmd BufNewFile,BufRead *.svh set filetype=verilog
"autocmd BufNewFile,BufRead *.vh set filetype=verilog
nnoremap :df :vertical diffsplit
set diffopt+=vertical
let g:indentLine_enable=0
let g:indentLine_char = '|'
set so=7

"set foldmethod=manual
"let g:verilog_syntax_fold_lst = "function,task"
"let b:verilog_indent_modules = 1
"let b:verilog_indent_width = 3
"let b:verilog_indent_width = 2
"let b:verilog_indent_verbose = 1
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Matchlocal'
"let g:hl_matchit_speed_level = 2
"let g:hl_matchit_hl_priority = 10
nnoremap ,u :VerilogGotoInstanceStart<CR>
nnoremap ,i :VerilogGetInstanceName<CR>
"nnoremap ,i :VerilogFollowInstance<CR>
"nnoremap ,n :VerilogFollowPort<CR>


runtime macros/matchit.vim
if has("multi_lang")
    language C
endif

"--
hi Matchlocal ctermbg=236

highlight TagbarHighlight term=bold cterm=bold ctermfg=Green gui=bold guifg=#F92672
let g:tagbar_ctags_bin ='/usr/bin/ctags'

setlocal foldmethod=expr
setlocal foldexpr=VerilogEmacsAutoFoldLevel(v:lnum)

" VerilogEmacsAutoFoldLevel function
" only deals with 0 and 1 levels
function VerilogEmacsAutoFoldLevel(l)
   if (getline(a:l-1)=~'\/\*A\S*\*\/' && getline(a:l)=~'\/\/ \(Outputs\|Inputs\|Inouts\|Beginning\)')
      return 1
   endif
   if (getline(a:l-1)=~'\(End of automatics\|);\)')
      return 0
   endif
   return '='
endfunction
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""----undotree
if has("persistent_undo")
   set undodir=~/.undodir/
   set undofile
endif

""svn
let g:svnj_trunk_url = "svn://pces0003.k-micro.com/mercury3/chip/trunk"

"vim grep cursor word
command! -nargs=0 VG exec 'vimgrep 'expand('<cword>').' ** | cw'
