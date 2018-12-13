
set nocompatible               " be iMproved
set noro
filetype off                   " required!
syntax on                       " colors
set encoding=utf-8

let hostname = substitute(system('hostname'), '\n', '', '')
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
if v:version < 800
  Plug 'vim-syntastic/syntastic'                          " Syntactic checking
else
  Plug 'w0rp/ale'
endif
Plug 'tpope/vim-obsession'                              " continuously updated session files

if hostname == "davidr-dev"
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }    " Go plugin (:GoDef over type)
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif
Plug 'ryanoasis/vim-devicons'                           " vim-devicons Must be last plugin.
" must have a powerline + nerdfont compatible (powerline extra)
" recommend adobe source code pro + nerd fonts source code pro

" testing rounded separators (extra-powerline-symbols):
" let g:airline_left_sep = "\uE0B4"
" let g:airline_right_sep = "\uE0B6"
" flames
" let g:airline_left_sep = "\uE0C0"
" let g:airline_right_sep = "\uE0C2"

" blocks
let g:airline_left_sep = "\uE0C6"
let g:airline_right_sep = "\uE0C7"



call plug#end()

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" to update, run :PluginUpdate
" when adding new Plugin, run :PluginInstall
" Plugin 'Rip-Rip/clang_complete'  -- replacing clang_complete with youcompleteme
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'vim-scripts/a.vim'
"Plugin 'Align'
"Plugin 'vim-scripts/Colour-Sampler-Pack'
"Plugin 'vim-scripts/guicolorscheme.vim'
"Plugin 'vim-scripts/c.vim'
" Plugin 'fholgado/minibufexpl.vim'
"Plugin 'msanders/snipmate.vim'
"Plugin 'tpope/tpope-vim-abolish'               " use abolish as '%s' for %Subvert
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
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

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
      \ 'z': '#{cpu_bg_color} CPU: #{cpu_percentage} '}

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
" set clipboard=unnamed
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

" Mapping fzf
map ; :Files<CR>

if v:version < 800
  " Syntastic config start
  let g:airline#extensions#syntastic#enabled = 1
  let airline#extensions#syntastic#error_symbol = 'E:'
  let airline#extensions#syntastic#stl_format_err = '%E{[%e(#%fe)]}'
  let airline#extensions#syntastic#warning_symbol = 'W:'
  let airline#extensions#syntastic#stl_format_warn = '%W{[%w(#%fw)]}'
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  " let g:syntastic_quiet_messages = 1
  let g:syntastic_aggregate_errors = 1
  let g:syntastic_ruby_checkers = ['rubocop', 'mri']
  " default in active mode.
  let g:syntastic_mode_map = { "mode": "active", "active_filetypes": ["c"], "passive_filetypes": ["ruby"] }
  nmap <F9> :SyntasticCheck<CR>
  " Syntastic config end
endif

" map leader to space key
let mapleader="\<space>"

if v:version >= 800
  let g:ale_sign_column_always = 1
  let g:airline#extensions#ale#enabled = 1
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'
  " move previous and next ale erorr lines
  nmap <leader>an <Plug>(ale_next_wrap)
  nmap <leader>ap <Plug>(ale_previous_wrap)
endif

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
