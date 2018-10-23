if has("autocmd")

  au BufReadPost *.rkt,*.rktl set filetype=scheme

endif
" tabs
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=10

set number
syntax on
filetype plugin indent on

" some useful drracket commands
command Rtest w | ! raco test %
command Rrun w | ! racket %

" python run
command Prun ! python %

" jekyll commands
command Jserve ! bundle exec jekyll serve

" pandoc commands
command Ppdf w | ! pandoc % -s -o out.pdf; and open out.pdf
command TableModeHeaders let g:table_mode_corner_corner='+' | let g:table_mode_header_fillchar='='

" allow more yanking
set viminfo='20,<1000

" rainbow parens
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,racket RainbowParentheses
augroup END

" start NerdTree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map NerdTree to C-n
map <C-n> :NERDTreeToggle<CR>

" map C-w to tab for easy management of split
map <tab> <C-W><C-W> 


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug section
execute plug#begin('~/.vim/plugged')
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'dhruvasagar/vim-table-mode'
execute plug#end()
execute pathogen#infect()
