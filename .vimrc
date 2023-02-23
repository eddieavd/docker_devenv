if empty( glob( '~/.vim/autoload/plug.vim' ) )
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin( '~/.vim/plugged' )

Plug 'tpope/vim-fugitive'
Plug 'ilyachur/cmake4vim'
Plug 'puremourning/vimspector'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'puremourning/YouCompleteMe', { 'branch': 'semantic-tokens' }

" Plug 'valloric/YouCompleteMe'
" Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'bronson/vim-trailing-whitespace'
Plug 'mark2185/vim-alternator'
Plug 'rhysd/clever-f.vim'

Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'

call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:UltiSnipsExpandTrigger = '<CR>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

function! GitStatus()
        let [ a, m, r ] = GitGutterGetHunkSummary()
        return printf( '+%d ~%d -%d', a, m, r )
endfunction

set statusline+=%{GitStatus()}

set modelines=5
au BufRead,BufNewFile *.metal setfiletype metal

let g:cmake_compile_commands      =  1
let g:cmake_compile_commands_link = '.'

let g:cmake_vimspector_support   = 1
let g:vimspector_enable_mappings = 'HUMAN'

let g:cmake_variants =
    \{
    \   'debug': {
    \       'cmake_build_type' : 'Debug',
    \       'cmake_usr_args'   : ''
    \   },
    \   'release': {
    \       'cmake_build_type' : 'Release',
    \       'cmake_usr_args'   : ''
    \   }
    \}

let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'
let g:ycm_enable_semantic_highlighting = 1

let g:ycm_clangd_args = [ '-log=verbose', '-pretty', '--query-driver=/**/*' ]

" let g:ycm_clangd_binary_path = '/usr/local/bin/clangd'
" let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/usr/bin/clangd'
" let g:ycm_global_ycm_extra_conf = '/home/edo/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:airline#extensions#tabline#enabled = 1

" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1
" let g:cpp_posix_standard = 1
" let g:cpp_experimental_template_highlight = 1
" let g:cpp_concepts_highlight = 1

set undofile
set undolevels=1000                 " number of undos
set undoreload=10000                " number of lines to save for undo
set undodir=$HOME/.vim/tmp/undo     " undo files
set backupdir=$HOME/.vim/tmp/backup " backups
set directory=$HOME/.vim/tmp/swap   " swap files
set viminfofile=$HOME/.vim/tmp/viminfo  " vim history

" Make those folders automatically if they don't already exist.
if !isdirectory( expand( &undodir ) )
    call mkdir( expand( &undodir ), "p" )
endif
if !isdirectory( expand( &backupdir ) )
    call mkdir( expand( &backupdir ), "p" )
endif
if !isdirectory( expand( &directory ) )
    call mkdir( expand( &directory ), "p" )
endif

set updatetime=100 " YCM go brrrrrrrrr
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
set so=999 " keep cursor in middle of screen xexe
set ignorecase
set smartcase

set clipboard^=unnamed,unnamedplus

let mapleader=" "

nnoremap <leader>c :CMakeSelectBuildType debug<CR>
nnoremap <leader>r :CMakeSelectBuildType release<CR>
nnoremap <leader>b :CMakeBuild<CR>
nnoremap <leader>y :YcmShowDetailedDiagnostic<CR>
nnoremap <leader>t :bNext<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>al :Alternate<CR>
nnoremap <leader>ag :Ag<CR>
nnoremap <leader>vr :VimspectorReset<CR>Y

nnoremap <silent> <leader>s :source ~/.vimrc<CR>
nnoremap <silent> <leader>w :write<CR>
nnoremap          <leader>q :quit<CR>
nnoremap          <leader>yr :YcmCompleter RefactorRename<SPACE>
nnoremap          <leader>yd :YcmCompleter GetDoc<CR>
nnoremap          <leader>yg :YcmCompleter GoTo<CR>
nnoremap          <leader>fx :YcmCompleter FixIt<CR>

nnoremap <leader>va ggvG$

nmap <leader><leader> <F5>

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
" colorscheme elflord
" colorscheme lunaperche
" colorscheme pablo

" colorscheme afterglow
" colorscheme apprentice
" colorscheme focuspoint
" colorscheme hybrid

colorscheme mountaineer
" colorscheme orbital
" colorscheme paramount


set exrc
set secure

function! s:suponjibobu(...) abort
    let l:content = ''
    if a:0 == 1
        let l:content = a:1
    else
        let l:content = getreg('+')->trim('\n')
    endif
    let l:length = strlen(l:content)
    let l:output = ''
    for i in range(l:length)
        if i % 2 == 0
            let l:output .= l:content[i]
            continue
        endif
        if l:content[i] >= 'a'
            let l:output .= toupper(l:content[i])
        else
            let l:output .= tolower(l:content[i])
        endif
    endfor
    call setreg('+', l:output . ' :mocking-spongebob:')
endfunction

command! -nargs=? Suponjibobu call <SID>suponjibobu(<f-args>)
