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
Plug 'valloric/YouCompleteMe'
Plug 'puremourning/vimspector'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

function! GitStatus()
        let [ a, m, r ] = GitGutterGetHunkSummary()
        return printf( '+%d ~%d -%d', a, m, r )
endfunction

set statusline+=%{GitStatus()}

let g:cmake_compile_commands      =  1
let g:cmake_compile_commands_link = '.'

let g:cmake_vimspector_support = 1
let g:vimspector_enable_mappings = 'HUMAN'

" let g:ycm_clangd_binary_path = '/usr/local/bin/clangd'
" let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/usr/bin/clangd'
" let g:ycm_global_ycm_extra_conf = '/home/edo/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

let g:airline#extensions#tabline#enabled = 1

" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1
" let g:cpp_posix_standard = 1
" let g:cpp_experimental_template_highlight = 1
" let g:cpp_concepts_highlight = 1

set updatetime=100
" set list
" set listchars=tab:>-         " show tabs as >--------
set tabstop=8     " columns a tab counts for
set softtabstop=8 " columns a tab inserts in insert mode
set shiftwidth=8  " columns inserted during reindent
set shiftround    " always indent by multiple of shiftwidth
set textwidth=0 wrapmargin=0 " stop vim inserting newline automatically
set expandtab
set termguicolors
set number
set relativenumber
set so=999 " keep cursor in middle of screen

set clipboard^=unnamed,unnamedplus

map _c :CMakeSelectBuildType Debug<CR>
map _r :CMakeSelectBuildType Release<CR>
map _b :CMakeBuild<CR>
map _y :YcmShowDetailedDiagnostic<CR>
map _vr :VimspectorReset<CR>Y
map _x nr<TAB>
map _t :bNext<CR>
map _d :bdelete<CR>
map _n :NERDTree<CR>
map _l :Lines<CR>
map _f :GFiles<CR>

" copy to clipboard with ctrl+c
vnoremap <silent> <C-c> "+y

" cut to clipboard with ctrl+x
vnoremap <silent> <C-x> "_d

" paste from clipboard with ctrl+v
vnoremap <silent> <C-v> c<ESC>"+p

" delete with s without clobbering up the yank register
xnoremap s "_d

" setlocal foldmethod=syntax

" colorscheme gotham
colorscheme elflord
