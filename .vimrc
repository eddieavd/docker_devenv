if empty( glob( '~/.vim/autoload/plug.vim' ) )
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin( '~/.vim/plugged' )

Plug 'tpope/vim-fugitive'
Plug 'ilyachur/cmake4vim'
Plug 'mark2185/vim-alternator'
Plug 'bronson/vim-trailing-whitespace'
Plug 'whatyouhide/vim-gotham'

if !has( "macunix" )
	Plug 'valloric/YouCompleteMe'
	Plug 'puremourning/vimspector'
endif

call plug#end()

let g:cmake_compile_commands      =  1
let g:cmake_compile_commands_link = '.'

let g:cmake_vimspector_support = 1
let g:vimspector_enable_mappings = 'HUMAN'

let g:ycm_clangd_binary_path = '/usr/local/bin/clangd'

set termguicolors
set number
set so=999 " keep cursor in middle of screen

set clipboard^=unnamed,unnamedplus

map _c :CMakeSelectBuildType Debug<CR>
map _r :CMakeSelectBuildType Release<CR>
map _b :CMakeBuild<CR>
map _y :YcmShowDetailedDiagnostic<CR>
map _vr :VimspectorReset<CR>Y

" copy to clipboard with ctrl+c
vnoremap <silent> <C-c> "+y

" cut to clipboard with ctrl+x
vnoremap <silent> <C-x> "_d

" paste from clipboard with ctrl+v
vnoremap <silent> <C-v> c<ESC>"+p

" delete with s without clobbering up the yank register
xnoremap s "_d

" setlocal foldmethod=syntax

colorscheme gotham
