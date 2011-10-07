filetype off                  "filetypes off for pathogen

" pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set nu				                "line numbering on
syntax on                     "syntax colours on
filetype plugin indent on     "filetype detection on
set backspace=indent,eol,start  " allow backspacing in insert mode 
set showmatch                 "show matching brackets
set showcmd			              "show incomplete cmds down the bottom
set showmode                  "show current mode down the bottom
set incsearch                	"find the next match as we type the search
set hlsearch                 	"hilight searches by default
set nohlsearch                "Turn off highlighting when done searching
set ignorecase                "ignore case in searches
set smartcase                 "use case when case in search term
set autoindent                " 
set shiftwidth=2		          "number of spaces to use in each autoindent step
set tabstop=2                 "two tab spaces
set softtabstop=2             "number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                 "spaces instead of tabs for better cross-editor compatibility
set autoindent                "keep the indent when creating a new line
set smarttab                 	"use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set ruler                     "Show the line and column number of the cursor position
set wildmenu			            "make tab completion act more like bash
set wildmode=list:longest,full "tab complete to longest common string
set wildignore=*.bak,*~       "ignore these
set mouse-=a  			          "disable mouse automatically entering visual mode
set nowrap                    "wrap
set sidescroll=5
set textwidth=200
set backspace=2               "allow backspace in ins mode
set hidden                   	"allow hiding buffers with unsaved changes
set cmdheight=2              	"make the command line a little taller to hide "press enter to view more" text
set shortmess=atI             "turn off short message
set linebreak                 "break at word
"set backupdir=$HOME/.vim/backup
"set directory=$HOME/
set browsedir=current         " which directory to use for the file browser
" The current directory is the directory of the file in the current window.
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif

let mapleader = ","         	"remap leader to ',' which is much easier than '\'
"autocmd FocusLost * :wa       "force save on focus loss
autocmd bufwritepost .vimrc source $MYVIMRC " Source .vimrc when written
autocmd BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent !chmod a+x <afile> | endif                  "make exec if bash script

autocmd FileType html,htm set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType html,htm let b:closetag_html_style=1
autocmd FileType html,htm,xml source ~/.vim/bundle/closetag/plugin/closetag.vim
autocmd FileType html,htm,css,sass,scss source ~/.vim/bundle/css-syntax/unix/css.vim

" scss, sass syntax
au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.sass set filetype=sass

" Toggle spell checking.
:map <f7> :set spell!<cr>

" Toggle wrap
:map <F8> :set wrap!<cr>

" Toggle Indenting
:nnoremap <F6> :setl noai nocin nosi inde=<CR>

"turn off highlights with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> 
"strip whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>    
" easy file saving
map <C-s> :w<CR>
" ,ss toggles spell checking
map <LocalLeader>ss :setlocal spell!<cr>

"  strip trailing whitespace
map <LocalLeader>ks :%s/\s\+$//g<CR>

"  convert tabs to spaces
map <LocalLeader>kt :%s/\t/  /g<CR>

"  kill DOS line breaks
map <LocalLeader>kd :%s///g<CR>

" copy paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" copy to system clipboard
" vmap <C-c> "+y
" paste in NORMAL mode from system clipboard (at or after cursor)
"nmap <LocalLeader>V "+gP
"nmap <LocalLeader>v "+gp
" paste in INSERT mode from Vim's clipboard (unnamed register)
"imap ppp <ESC>pa
" paste in INSERT mode from system clipboard
"imap vv <ESC>"+gpa
" paste in COMMAND mode from Vim's clipboard (unnamed register)
"cmap ppp <C-r>"
" paste in COMMAND mode from system clipboard
"cmap vv <C-r>+

"tabs
set guitablabel=%N\ %t\ %M\ %r
" quick open new tab
map <LocalLeader>t :tabnew<CR>
" C-TAB and C-SHIFT-TAB cycle tabs forward and backward
nmap <C-tab> :tabnext<CR>
imap <C-tab> <C-o>:tabnext<CR>
vmap <C-tab> <C-o>:tabnext<CR>
nmap <C-S-tab> :tabprevious<CR>
imap <C-S-tab> <C-o>:tabprevious<CR>
vmap <C-S-tab> <C-o>:tabprevious<CR>

" colours
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_menu=0
call togglebg#map("<F5>")
colorscheme solarized
" export TERM="xterm-256color in .bashrc"
" not in .gvimrc so terminal vi is also colourized"
"
let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')

