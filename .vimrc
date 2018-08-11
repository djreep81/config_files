
set nocompatible               " be iMproved
set noro
filetype off                   " required!
syntax on                       " colors
set encoding=utf-8

" PlugUpdate (update plugins)
" PlugUgrade (update plug itself)
" PlugInstall (install new plugs)
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'                 " solar theme
Plug 'majutsushi/tagbar'                                " tag file structure
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ngmy/vim-rubocop'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-fugitive'                               " Gdiff, Gw
Plug 'airblade/vim-gitgutter'                           " git +/~ gutter
Plug 'Chiel92/vim-autoformat'                           " AutoFormat
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }      " Go plugin
call plug#end()

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" to update, run :PluginUpdate
" when adding new Plugin, run :PluginInstall
" Plugin 'tpope/vim-fugitive'
" Plugin 'Rip-Rip/clang_complete'  -- replacing clang_complete with youcompleteme
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/nerdtree'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'majutsushi/tagbar'
" Plugin 'vim-scripts/a.vim'
"Plugin 'Align'
"Plugin 'vim-scripts/Colour-Sampler-Pack'
"Plugin 'vim-scripts/guicolorscheme.vim'
"Plugin 'vim-scripts/c.vim'
" Plugin 'fholgado/minibufexpl.vim'
"Plugin 'Chiel92/vim-autoformat'
"Plugin 'msanders/snipmate.vim'
" Plugin 'Lokaltog/vim-powerline' " -- replacing with vim-airline
" Plugin 'bling/vim-airline'      " -- vim-airline moved git and split themes
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'edkolev/tmuxline.vim'
"use abolish as '%s' for %Subvert
"Plugin 'tpope/tpope-vim-abolish'
"Plugin 'ngmy/vim-rubocop'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"call vundle#end()

" NerdTree Toggle
nmap <F6> :NERDTreeToggle<CR>
"ctl t toggles nerdtree
"nmap <silent> <c-t> :NERDTreeToggle<CR>
"start nerdtree at startup of vim
"au VimEnter *  NERDTree

syntax enable
set background=dark
" only use for mac
" let g:solarized_termcolors=256 
set t_Co=256
colorscheme solarized

let g:clang_complete_copen = 1
let g:vimrubocop_config = '~/app/.rubocop.yml'
let g:go_version_warning = 0

"These settings will result in spaces being used for all indentation
set expandtab
set shiftwidth=2
set softtabstop=2

"File type based indentation
filetype plugin indent on

"astyle setup for vim-autoformat cpp files
"let g:formatdef_notused_cpp = '"--mode=c --style=attach -UpcHxdCSK".(&expandtab ? "s".&shiftwidth : "t")  '
"let g:formatdef_prev_cpp= '"--mode=c --style=attach -s2A2UpcHxdS".(&expandtab ? "s".&shiftwidth : "t") '
"astyle for cegui
"let g:formatdef_cegui = '"--mode=c --style=attach -s4A1wKfxpcUz2".(&expandtab ? "s".&shiftwidth : "t")  '
"
" s2 = 2 space indent, S = ident switch, xG half indent = pub;priv;prot,
" p = padding around operators, xd pad first param, H = padding after if;for;while,
" U = remove space padding, xe = del empty lines in function, W1 = align reference by type,
" xj = remove unneccessary brackets, c = convert-tabs to spaces, xy = close-templates
" O = keep-one-line-blocks temp fix for braced init lists for now. wait for newer astyle above 2.05.1
" let g:formatdef_astyle_cpp = '"astyle --mode=c --style=attach -s2SpxGpxdHUW1xjcxyO".(&expandtab ? "s".&shiftwidth : "t")'
" let g:formatdef_astyle_c = '"astyle --mode=c --style=attach -s2SxGpxdHUW1xjcxyO".(&expandtab ? "s".&shiftwidth : "t")'
let g:formatdef_astyle_cpp = '"astyle --mode=c --style=attach -s2SpxGpxdHUW1xjcxyOn"'
let g:formatdef_astyle_c = '"astyle --mode=c --style=attach -s2SxGpxdHUW1xjcxyOn"'
let g:formatters_c = ['astyle_c']
let g:formatters_cpp = ['astyle_cpp']

" to replicate astyle in command line for all .h and .cpp files in directory
" find . -regex '.*\.\(c\|cpp\|h\)$' -print | xargs astyle --mode=c --style=attach -s2SpxGpxdHUW1xjcxyOn
" NOTE:  the 'n' on the end of the options represents change tabs to spaces
" to do diff on all the changes
" git ls-files -m | xargs git diff
" to add all changes to git
" git ls-files -m | xargs git add

noremap <F7> :Autoformat<CR>

" Powerline symbols (now Airline)
" Must install powerline fonts to add proper charachters (even for airline) as described below
" http://powerline.readthedocs.org/en/latest/installation/linux.html#fonts-installation
" let g:Powerline_symbols = 'fancy'
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Tagbar to display functions/methods/etc
nmap <F8> :TagbarToggle<CR>

" Minibufexplorer mapping to jump between buffers
map <C-P> :bp<cr>
map <C-N> :bn<cr>

" maps keys to switch quickly between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" maps keys to increase/decrease window size with + or - keys
map + <c-w>+
map - <c-w>-

" http://vim.wikia.com/wiki/Remove_unwanted_spaces
" on save (:w) all trailing whitespaces will be removed per line
"autocmd FileType c,cpp,h,hpp,txt,cmake autocmd BufWritePre <buffer> :%s/\s\+$//e

" http://stackoverflow.com/questions/9166328/how-to-copy-selected-lines-to-clipboard-in-vim
" using registers to copy between vim instances
set clipboard=unnamedplus

set mouse=a

" YCM configuration
let g:ycm_confirm_extra_conf = 0
"this file should be copied into each project or follow https://jonasdevlieghere.com/a-better-youcompleteme-config
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" let g:ycm_server_python_interpreter
let g:ycm_python_binary_path = '/usr/bin/python'
" after vundle update of YouCompleteMe you must rebuild
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
" Use the below to force using clang completer
" ./install.py --clang-completer --system-libclang

" filetypes
au BufRead,BufNewFile *.gradle set filetype=groovy
au BufNewFile,BufRead *.groovy  setf groovy
au BufNewFile,BufRead *.gradle  setf groovy
