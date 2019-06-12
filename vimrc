execute pathogen#infect()
syntax on
filetype plugin indent on
set path+=**
set wildmenu
" Option for Ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
"
" Activation NASTRAN files syntax
autocmd BufNewFile,BufRead *.bdf set syntax=nastran
autocmd BufNewFile,BufRead *.ecd set syntax=nastran
autocmd BufNewFile,BufRead *.dat set syntax=nastran
autocmd BufNewFile,BufRead *.nas set syntax=nastran
autocmd BufNewFile,BufRead *.axs set syntax=nastran
autocmd BufNewFile,BufRead *.stm set syntax=nastran
autocmd BufNewFile,BufRead *.ses set syntax=tcl
"-------------vim-airline options--------END
"let g:airline#extensions#tabline#enabled = 1
"-------------vim-airline options--------END

"------------ lightline options--------------BEGIN
" for vim git bash
if !has('gui_running')
  set t_Co=256
endif

" for gvim on MS Windows
set laststatus=2
"------------ lightline options--------------END

"------------------shortcuts--------------------BEGIN

"nmap <C-n> :bn<CR>
"nmap <C-p> :bp<CR>

"------------------shortcuts--------------------BEGIN

"-------------NERDTree command and option -----------------BEGIN
" Locate the focused file in the tree with <Leader> + t:
nmap <leader>t :NERDTreeFind<CR>
nmap <C-k><C-b> :NERDTreeToggle<CR>
"-------------NERDTree command and option -----------------END

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

set mouse=a
"
colorscheme Tomorrow-Night
"colorscheme gruvbox
set bg=dark
set number " Ajoute les numéros de ligne

map é ~
" remplace la touche tilde par la touche é afin de changer la casse

set cursorline "active la mise en évidence de la ligne active
set expandtab "transforme les tabulations en espace
set encoding=utf-8 "encode le fichier courant en utf-8
set fileencoding=utf-8 "encode le fichier courant en utf-8 au moment de l'enregistrement

"set guifont=Lucida_Console:h10
set guifont=Consolas:h10
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
":set lines=999 columns=999
set hlsearch "met en surbrillance les résultats de recherche
let mapleader=" " "ajoute une touche principale dans le but d'éviter les conflits
map <leader>s :source ~/.vim/vimrc<CR>
nnoremap <Leader><Leader> :e#<CR>
autocmd BufWritePre * :%s/\s\+$//e "supprime les espaces inutile à la fin de chaque ligne

" Toggle slash and/or backslah in the current line or selected lines
function! ToggleSlash(independent) range
  let from = ''
  for lnum in range(a:firstline, a:lastline)
    let line = getline(lnum)
    let first = matchstr(line, '[/\\]')
    if !empty(first)
      if a:independent || empty(from)
        let from = first
      endif
      let opposite = (from == '/' ? '\' : '/')
      call setline(lnum, substitute(line, from, opposite, 'g'))
    endif
  endfor
endfunction
command! -bang -range ToggleSlash <line1>,<line2>call ToggleSlash(<bang>1)
noremap <silent> <F8> :ToggleSlash<CR>

" Copy current file path
command! Copyfile let @*=substitute(expand("%:p"), '/', '\', 'g')
:map <Leader>cf :Copyfile<CR>
