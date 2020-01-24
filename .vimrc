
set nocompatible               " be iMproved
set noro
filetype off                   " required!
syntax on                       " colors
set encoding=utf-8
" MacOS
" set guifont=DroidSansMono_Nerd_Font:h11
" Linux
" set guifont=DroidSansMono\ Nerd\ Font\ 11
set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly (light works the best for spacing)

let hostname = substitute(system('hostname'), '\n', '', '')
" PlugUpdate (update plugins)
" PlugUgrade (update plug itself)
" PlugInstall (install new plugs)
call plug#begin()
"  if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"  endif

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'                                " using netrw replacing nerdtree
" Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'                 " solar theme
Plug 'majutsushi/tagbar'                                " tag file structure
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'                             " writes to .tmux-status.conf for tmux
Plug 'edkolev/promptline.vim'                           " writes to .promptline.sh for bash
Plug 'ngmy/vim-rubocop'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-fugitive'                               " Gdiff, Gw
Plug 'airblade/vim-gitgutter'                           " git +/~ gutter
Plug 'Chiel92/vim-autoformat'                           " AutoFormat
Plug 'junegunn/fzf.vim'                                 " vim fzf integration
Plug 'ntpeters/vim-better-whitespace'                   " highlight whitespaces
Plug 'tpope/vim-obsession'                              " continuously updated session files
Plug 'tpope/tpope-vim-abolish'                          " use abolish as '%s' for %Subvert
Plug 'tpope/vim-obsession'                              " continuously updated session files
" Plug 'terryma/vim-multiple-cursors'
" Plug 'octol/vim-cpp-enhanced-highlight'                 " additional c++11/14/17 highlighting
Plug 'ludovicchabant/vim-lawrencium'                    " Mercurial alternative to fugitive
Plug 'mhinz/vim-signify'                                " alternative to gitgutter that supports git, mercurial, darcs, bazaar, subversion, cvs
Plug 'vim-scripts/groovyindent-unix'                    " Groovy syntax
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'tpope/vim-obsession'                              " continuously updated session files
" Plug 'msanders/snipmate.vim'
if hostname == "davidr-dev"
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'tag': 'v1.19' }    " Go plugin (:GoDef over type) Go 1.10
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'tag': 'v1.20' }    " Go plugin (:GoDef over type) Go 1.12
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }    " Go plugin (:GoDef over type)
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'ryanoasis/vim-devicons'                           " vim-devicons Must be last plugin.
" must have a powerline + nerdfont compatible (powerline extra)
" recommend adobe source code pro + nerd fonts source code pro
call plug#end()

" java support via coc via :CocInstall coc-java (installs jdt.ls)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

if hostname == "we-laptop84.local"
  " for homebrew fzf + fzf plugin
  set rtp+=/usr/local/opt/fzf
end

" NerdTree Toggle
" nmap <F6> :NERDTreeToggle<CR>
" Vinegar Toggle
nmap <F6> :Lexplore<CR>
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

" map leader to space key
let mapleader="\<space>"

let g:clang_complete_copen = 1
let g:vimrubocop_config = '~/app/.rubocop.yml'
let g:go_version_warning = 0
" go_fmt_options fixes the below error
" Error detected while processing function <SNR>73_fmt_autosave..go#fmt#Format..go#fmt#run..<SNR>115_fmt_cmd
let g:go_fmt_options = 0
let g:go_auto_type_info = 1

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
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" to get the symbols run below:
" echo $'\uE0C7'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty= '⚡'
let g:airline_theme='solarized'
let g:promptline_symbols = g:airline_symbols
let g:tmuxline_separators = g:airline_symbols
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
let g:airline#extensions#tmuxline#enabled = 0 " only enable once, then turn back to 0 once tmux-status.conf is written
" manually move #{cpu_fg_color} after the airline generated colors in the .tmux-status.conf
let g:tmuxline_preset = {
      \ 'a': '#S',
      \ 'b': '#F',
      \ 'c': '#W',
      \ 'win': ['#I', '#W'],
      \ 'cwin': ['#I', '#W'],
      \ 'x': '%a',
      \ 'y': ['%b %d', '%R', "#H #{cpu_fg_color}"],
      \ 'z': ['#{network_bandwidth}', '#{weather}', '#{cpu_bg_color} CPU: #{cpu_percentage}']}

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
" set clipboard=unnamed "sets the default copy register to be *
" set clipboard=unnamedplus "sets the default copy register to be +
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
set mouse=a

" filetypes
au BufRead,BufNewFile *.gradle set filetype=groovy
au BufNewFile,BufRead *.groovy  setf groovy
au BufNewFile,BufRead *.gradle  setf groovy

" Mapping fzf
map ; :Files<CR>
map ' :Rg<CR>

" ale configuration
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
" move previous and next ale erorr lines
nmap <leader>an <Plug>(ale_next_wrap)
nmap <leader>ap <Plug>(ale_previous_wrap)

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
" let g:cpp_no_function_highlight = 1
let c_no_curly_error=1

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

augroup HamlJS
  autocmd BufNewFile,BufRead *.hamljs set ft=haml
  autocmd BufNewFile,BufRead *.hamlbars set ft=haml
augroup END

autocmd BufNewFile,BufRead *.cmake.in set ft=cmake
autocmd BufNewFile,BufRead *.gradle.in set ft=gradle

let g:gitgutter_async = 1

" Fugitive
" Gstatus within nerdree to start the diff
" :G? - shows all mappings
" - will stage/unstage, = expand file, enter - open H editor, gO - open V split editor, dv - vimdiff
nnoremap <leader>gs :edit . \| Gstatus \| only<CR>

" Itegerate vim with ripgrep + fzf as defined here: https://github.com/junegunn/fzf.vim
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \              : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
