set nocompatible
filetype off "filetypes off for pathogen
silent! runtime bundle/pathogen/autoload/pathogen.vim
" pathogen
silent! call pathogen#infect()
silent! call pathogen#helptags()
" Filetypes
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif
" Backups
set nobackup
if has("writebackup")
    set nowritebackup
endif
" syntax
if has("syntax")
    syntax enable
    if has("folding")
        set fillchars=diff:\ ,fold:\ ,vert:\
    endif
endif
" Commands
if has("cmdline_info")
 set ruler
 set showcmd			            "show incomplete cmds down the bottom
 set showmode
endif
"Formatting
set expandtab
set nojoinspaces
set shiftround
set shiftwidth=2		          "number of spaces to use in each autoindent step
set softtabstop=1             "number of spaces to skip or insert when <BS>ing or <Tab>ing
set tabstop=1
set backspace=indent,eol,start  " allow backspacing in insert mode 
set modelines=0
set shortmess=atI          "turn off short message
" Wildmenu
if has("wildmenu")
 set wildmenu 			            "make tab completion act more like bash
 set wildmode=list:longest,full "tab complete to longest common string
" set wildmode=longest,list
 set wildignore=*.bak,*~        "ignore these
 set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
 set wildignore+=.DS_Store,.git,.hg,.svn
 set wildignore+=*~,*.swp,*.tmp
 set wildmenu
endif
" look and feel
set nu				                "line numbering on
set showmatch             "show matching brackets
"search
set incsearch            	"find the next match as we type the search
set hlsearch             	"hilight searches by default
set nohlsearch            "Turn off highlighting when done searching
set ignorecase            "ignore case in searches
set smartcase             "use case when case in search term
" indents
set autoindent            " 
set expandtab             "spaces instead of tabs for better cross-editor compatibility
set autoindent            "keep the indent when creating a new line
set smarttab             	"use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
" gui
set mouse-=a  		          "disable mouse automatically entering visual mode
set nowrap                "wrap
" Windows
if has("windows")
 set laststatus=1
 set splitbelow
 if has("vertsplit")
  set splitright
  endif
 silent! set showtabline=1
endif
set sidescroll=5
set textwidth=200
set backspace=2            "allow backspace in ins mode
set hidden                	"allow hiding buffers with unsaved changes
set cmdheight=2           	"make the command line a little taller to hide "press enter to view more" text
if has("linebreak")
 set linebreak             "break at word
 set showbreak=...
endif
"backup
"set backupdir=$HOME/.vim/backup
"set directory=$HOME/
set browsedir=current      " which directory to use for the file browser
" The current directory is the directory of the file in the current window.
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif
let mapleader = ","       	"remap leader to ',' which is much easier than '\'
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
" Toggle line numbers
:map <F9> :set nu!<cr>
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
let g:solarized_contrast="normal" 
"let g:solarized_contrast="high"
let g:solarized_visibility="normal"
"let g:solarized_visibility="high"
let g:solarized_menu=0
let g:solarized_bold=0
call togglebg#map("<F5>")
colorscheme solarized
"colorscheme sahara
" export TERM="xterm-256color in .bashrc"
" not in .gvimrc so terminal vi is also colourized"
" fix number colour
highlight LineNr term=bold cterm=bold ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=NONE
" path
let &cdpath = ',' . substitute(substitute($CDPATH, '[, ]', '\\\0', 'g'), ':', ',', 'g')
"complete
set complete=.,b,u,]
imap <Tab> <C-P>
"unicode & Encoding
set fileformats=unix,dos,mac
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
if has('gui_running')
 set guioptions-=T " remove the toolbar
 set lines=40 " 40 lines of text instead of 24,
else
 set background=light
 hi Normal ctermfg=white
endif
