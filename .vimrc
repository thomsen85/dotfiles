language en_US.UTF-8
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile 
set nobackup
set undodir=~/.vim/undoddir
set undofile
set incsearch

" Remapping
let mapleader = "," " map leader to comma
let g:airline_powerline_fonts = 1

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
"Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

call plug#end()


" python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), { "__file__": activate_this })
EOF

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
map <leader>gt  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file


"FZF
set rtp+=/usr/local/opt/fzf

"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,tsx EmmetInstall

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Key Binds
nnoremap <C-g> :GFiles<CR>
nnoremap <C-i> :NERDTree<CR>
nnoremap <C-¨> <C-^>

nmap <leader>gs :G<CR>


map <C-ø> <C-[>

" Color
colorscheme onedark
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

autocmd BufNewFile *.cpp 0r ~/.vim/skeltons/cpp_basic.cpp

