""""""""""""""""""""""""""""""""""""""
" Looks
""""""""""""""""""""""""""""""""""""""

" To undo, type :set nu!
:set nu

" http://unix.stackexchange.com/questions/88879/vim-better-colors-so-comments-arent-dark-blue
if has("gui_running")
else
	:color koehler
endif
:syntax on
if has("win32")
	:set guifont=Consolas:h9
endif

" Whitespace
set nowrap                      " don't wrap lines
set shiftwidth=4                 " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mâ‡‰
set tabstop=8              
set softtabstop=4               

" Delimiter
:set colorcolumn=100
:highlight ColorColumn guibg=Gray

" Highlight TODO, FIXME, NOTE, etc.
if has("autocmd")
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
  endif
endif

set hlsearch                    " highlight search matches

""""""""""""""""""""""""""""""""""""""
" Filetype-specific
""""""""""""""""""""""""""""""""""""""

" TODO make .py file specific
" Abbreviations
abb pdb import pdb; pdb.set_trace()
abb lmd :tabe dataset_classes/lang_model.py
abb fmd :tabe dataset_classes/financial_model.py

" TODO make below different for python etc (now only tex)
" map <F5> :w !compile.bat<CR>


""""""""""""""""""""""""""""""""""""""
" Functionality
""""""""""""""""""""""""""""""""""""""

" Searching
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set lazyredraw					" Don't redraw while executing macros (good performance config)

set scrolloff=3					" Minimum lines to keep above and below cursor


""""""""""""""""""""""""""""""""""""""
" Keyboard shortcuts
""""""""""""""""""""""""""""""""""""""

let mapleader = ","

nmap <leader>c :nohlsearch<CR>	" Clear highlights with comma-c
vnoremap // y/<c-r>"<cr>		" Visual mode pressing // searches for the item

vnoremap < <gv  				" better indentation
vnoremap > >gv  				" better indentation

noremap H ^						"Jump to start and end of line using the home row keys

"Use normal clipboard-copy (http://stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-using-vim)
set clipboard=unnamed
vmap <C-c> "*y
map <C-v> "*p

" Standard windows keys (Select all, save, undo)
map <C-a> ggvG
map <C-s> :w<cr>
map <C-z> u

" Easier find and replace
map <F3> :%s/search/replace/g


""""""""""""""""""""""""""""""""""""""
" Vundle plugins
""""""""""""""""""""""""""""""""""""""

if has("win32")

	set nocompatible              " be iMproved, required
	filetype off                  " required
	" set the runtime path to include Vundle and initialize
	set rtp+=~/vimfiles/bundle/Vundle.vim/
	let path='~/vimfiles/bundle'
	call vundle#begin(path)
	Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
	
	" Plugins
	Plugin 'pep8'
	Plugin 'flake8-vim'
	Plugin 'taglist.vim' " Requires exuberant ctags (in Path)
	
	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	" Put your non-Plugin stuff after this line
	
	" Brief help
	" :PluginList       - lists configured plugins
	" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
	" :PluginSearch foo - searches for foo; append `!` to refresh local cache
	" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
	"
	" see :h vundle for more details or wiki for FAQ
	
	
	""" PluginSettings
	"" Flake https://github.com/andviro/flake8-vim
	" Disable automatic checks
	let g:PyFlakeOnWrite = 0
	let g:PyFlakeMaxLineLength = 80
	
	nnoremap <silent> <F8> :TlistToggle<CR>
endif
