"-----------------------vim-plug----BEGIN
" Automatic installation of vim-Plug if not installed yet
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" ---------------------------

" ---------------------------
" https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
" ---------------------------
Plug 'sainnhe/sonokai'
" ---------------------------
Plug 'sheerun/vim-polyglot'
" ---------------------------
" Markdown-preview.nvim
" https://github.com/iamcco/markdown-preview.nvim
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" ---------------------------

" ---------------------------
" Initialize plugin system
" ---------------------------
call plug#end()
"-----------------------vim-plug----END

execute pathogen#infect()

syntax on
filetype plugin indent on
set path+=**
set wildmenu

"-------- Settings for Ctrlp.vim (https://github.com/ctrlpvim/ctrlp.vim)
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
" 'c' - the directory of the current file.
" 'a' - the directory of the current file, unless it is a subdirectory of the cwd
" 'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn

"------------ lightline options--------------BEGIN
" for vim git bash
if !has('gui_running')
  set t_Co=256
endif
" set color of lightline
let g:lightline = {
            \ 'colorscheme': 'one',
            \ }
" for gvim on MS Windows
set laststatus=2
"------------ lightline options--------------END

"------------------shortcuts--------------------BEGIN

nmap <C-PageDown> :bn<CR>
nmap <C-PageUp> :bp<CR>

"------------------shortcuts--------------------BEGIN

"-------------NERDTree command and option -----------------BEGIN
" Locate the focused file in the tree with <Leader> + t:
nmap <leader>t :NERDTreeFind<CR>
"nmap <C-b> :Vexplore<CR>
nmap <C-b> :NERDTreeToggle<CR>
"-------------NERDTree command and option -----------------END

"------------Netrw: vim native directory browser ------BEGIN
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"------------Netrw: vim native directory browser ------BEGIN
"
" ---------Options for vim-multiple-cursors---BEGIN
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-d>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-d>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-u>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" ---------Options for vim-multiple-cursors---END
"
" ---------Options for syntastic---BEGIN

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ---------Options for syntastic---END

"----------------- Miscellaneous personal options------------------
nnoremap <silent><c-s> :<c-u>:update<c-r>
set mouse=a "active la souris par défaut
"
colorscheme sonokai
"colorscheme monokai
"colorscheme Tomorrow-Night
"colorscheme gruvbox
set bg=dark

set number relativenumber " Ajoute les numéros de ligne relatifs
" les réglages suivants active relativenumber sur le buffer actif
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

map é ~" remplace la touche tilde par la touche é afin de changer la casse

set cursorline "active la mise en évidence de la ligne active
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab "transforme les tabulations en espace
set smartcase
set smartindent

set noswapfile
set undodir=~/.vim/undodir
set undofile

set encoding=utf-8 "encode le fichier courant en utf-8
set fileencoding=utf-8 "encode le fichier courant en utf-8 au moment de l'enregistrement

:set guioptions-=m  "remove menu bar of gvim
:set guioptions-=T  "remove toolbar of gvim
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
set hlsearch "met en surbrillance les résultats de recherche
set incsearch "active la recherche incrémentale par défaut
let mapleader=" " "ajoute la barre d'espace comme touche leader dans le but d'éviter les conflits
map <leader>s :source ~/.vim/vimrc<CR> " recharge vimrc pour l'appliquer à la session vim active
nnoremap <Leader><Leader> :e#<CR>  " bascule sur le dernier buffer affiché
autocmd BufWritePre * :%s/\s\+$//e "supprime les espaces inutiles à la fin de chaque ligne

" -------------------------------------------
" Option for vim-markdown
" -------------------------------------------
let g:vim_markdown_folding_disabled = 1

" -------------------------------------------
" Option for ALE (Asynchronous Lint Engine)
" -------------------------------------------
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" Allow ALE to run fixers to format the code in a Vim buffer
" let g:ale_fixers['javascript'] = ['eslint']

" Fix files automatically on save
let g:ale_fix_on_save = 1
" -------------------------------------------
" -------------------------------------------
set grepprg=ack " Recherche avec ack, une alternative de grep (https://beyondgrep.com/)

" -------------------------------------------
"  NERDCommenter settings
" -------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
noremap <C-S-/> :NERDCommenterToggle<CR>

" --------------------------------------------
" vim-javascript (via vim-polyglot)
" --------------------------------------------
let g:javascript_plugin_jsdoc = 1 "  Enables syntax highlighting for JSDocs. Default Value: 0

" You can customize concealing characters, if your font provides the glyph you want, by defining one or more of the following variables:
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" You can enable concealing within VIM with:
" set conceallevel=1

" OR if you wish to toggle concealing you may wish to bind a command such as
" the following which will map <LEADER>l (leader is usually the \ key but in $MYVIMRC it is 'space bar') to toggling conceal mode:
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
" --------------------------------------------
