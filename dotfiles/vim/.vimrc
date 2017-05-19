"Vundle vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
let g:ycm_confirm_extra_conf = 0

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'mxw/vim-jsx'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'wavded/vim-stylus'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'maksimr/vim-jsbeautify'
call vundle#end()
filetype plugin indent on
filetype plugin on



" neobundle config
source ~/.vim/neobundle.vim

" neocomplete config
source ~/.vim/neocomplete.vim

" custom key mappings
source ~/.vim/key_mappings.vim

"NeoBundleLazy 'facebook/vim-flow', {
            "\ 'autoload': {
            "\     'filetypes': 'javascript'
            "\ },
            "\ 'build': {
            "\     'mac': 'npm install -g flow-bin',
            "\     'unix': 'npm install -g flow-bin'
            "\ }}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint', 'flow']

"let g:flow#autoclose = 1
"let g:flow#timeout = 2
"let g:flow#errjmp = 1

let g:gitgutter_max_signs = 500  " default value

color jellybeans

" gvim
if has('gui_running')
	set guioptions-=L
	set guioptions-=r
	set guioptions-=T
	set guioptions-=m
  set guifont=hermit\ 12
  set background=dark
  color material-theme
endif

" vimfiler settings
let g:vimfiler_as_default_explorer = 1

syntax on

"autocmd FileType javascript setlocal omnifunc=tern#Complete

" numbers
"autocmd FocusLost   * :set number
"autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertEnter * :IndentGuidesEnable
autocmd InsertLeave * :set relativenumber
set relativenumber
" cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode(

"Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme="badwolf"

" Rainbows
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" CommandT
set wildignore+=node_modules/**,_build/**,deps/**

" Cursor
if has('gui_running')
    au WinLeave * set nocursorline nocursorcolumn
    au WinEnter * set cursorline cursorcolumn
    set cursorline cursorcolumn
endif

set tabstop=2
set shiftwidth=2
set expandtab
set shell=/bin/sh

" Whitespace remove
au BufWritePre * :%s/\s\+$//e
"

au Syntax * syn match TrailingWhitespace /\s\+$/
match TrailingWhitespace /\s\+$/


"
" FUNCTIONS
"
function! JSFormat()
    " Preparation: save last search, and cursor position.
    let l:win_view = winsaveview()
    let l:last_search = getreg('/')
    let fileWorkingDirectory = expand('%:p:h')
    let currentWorkingDirectory = getcwd()
    execute ':lcd' . fileWorkingDirectory
    execute ':silent' . '%!esformatter'
    if v:shell_error
        undo
        "echo "esformatter error, using builtin vim formatter"
        " use internal formatting command
        execute ":silent normal! gg=G<cr>"
    endif
    " Clean up: restore previous search history, and cursor position
    execute ':lcd' . currentWorkingDirectory
    call winrestview(l:win_view)
    call setreg('/', l:last_search)
endfunction
set backspace=indent,eol,start
