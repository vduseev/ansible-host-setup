" Required by Vundle to function
set nocompatible              " required
filetype off                  " required

"============================================================================
"=                            BASIC SETTING                                 =
"============================================================================

" UTF-8 support
set encoding=utf-8

" YouCompleteMe does not work with fish
set shell=/bin/bash

" show line numbers
set number
set relativenumber

" show the matching part of the pair for [] {} and ()
set showmatch

" Enable TrueColor 24-bit colors in Vim
"let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set t_ZH=[3m
set t_ZR=[23m
"set termguicolors

" Use same clipboard in Vim and in the system
" Note: MacOS X specific setting
"set clipboard=unnamed

" Set Leader key
let mapleader = ","

" Where to put new tab when doing screen split
set splitright

" enable syntax highlighting
syntax enable

" Makes text search case insensitive when query contains any capital letters 
set smartcase

"============================================================================
"=                            KEYS REMAPPING                                =
"============================================================================

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Split navigations
nnoremap <S-J> <C-W><C-J>
nnoremap <S-K> <C-W><C-K>
nnoremap <S-L> <C-W><C-L>
nnoremap <S-H> <C-W><C-H>

" Replacing word under cursor when pressing <Leader>s
" https://vim.fandom.com/wiki/Search_and_replace_the_word_under_the_cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"============================================================================
"=                          PLUGIN INITIALIZATION                           =
"============================================================================

" set the runtime path to include Vundle and initialize
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

"=== Status line
" Installed as a powerline-status pip package under Python 3.7.2 version
" using Pyenv.
" The vim executable itself is launched using a symlink in ~/.bin directiry
" to bash script in ~/.lib/bash directory. 
" The bash script initializes PYENV_VERSION variable to set the correct
" python version for vim, then calls the actual vim.
"silent! pyenv shell 3.7.2
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"silent! pyenv shell --unset

Plugin 'vim-airline/vim-airline'

"=== Directory tree

" Directory and file tree <leader>d
Plugin 'scrooloose/nerdtree'

"=== Miscellaneous 

" Commenter helper count<leader>cc [comment]
" and count<leader>cu [uncomment]
Plugin 'scrooloose/nerdcommenter'

" Quick search plugin
Plugin 'kien/ctrlp.vim'
 
" Starting screen with recent files nad cowsay
Plugin 'mhinz/vim-startify'

" Indent guides (helping lines)
" <Leader>ig
Plugin 'nathanaelkane/vim-indent-guides'

"=== Syntax support

" Heavy and smart completion engine
"Plugin 'Valloric/YouCompleteMe'

" Vim syntax veryfication engine, relies on backends
Plugin 'vim-syntastic/syntastic'

"=== Python

" Python indentation
Plugin 'vim-scripts/indentpython.vim'

" Python syntax veryfication backend
"Plugin 'nvie/vim-flake8'

" Extensive python syntax support for better highlighting
Plugin 'kh3phr3n/python-syntax'

"=== Color schemas

" Monokai color scheme for VIM
"Plugin 'crusoexia/vim-monokai'

Plugin 'vim-airline/vim-airline-themes'

"=== Hashicorp

" Terraform
"Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"============================================================================
"=                          PLUGIN CUSTOMIZATION                            =
"============================================================================

"*********************** THEMES ***************************
" Theme colors customization
set background=light
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_light = 'hard'
" let g:gruvbox_italic = 1
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

"********************** POWERLINE *************************
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"*********************** AIRLINE **************************
" Airline customization
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

"*********************** YCM ******************************
" Close autocomplete window when you're done with it
"let g:ycm_autoclose_preview_window_after_completion=1
" Map GoTo definition to Space+G
"map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"*********************** NERDTree *************************
map <leader>d :NERDTreeToggle<CR>
" Show hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.o$', '\~$', '\.swp$', '\.git$', '\.pyc$']

"*********************** PlantUML *************************
" PlanUML Syntax plugin customization
"let g:plantuml_executable_script='plantuml'

"*********************** Terraform ************************
"let g:terraform_align=1

"============================================================================
"=                     FILE EXTENSTION CUSTOMIZATIONS                       =
"============================================================================

" The proper PEP8 indentation for Python files
au BufNewFile,BufRead *.py
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  " \ set textwidth=4 |
  \ set expandtab |
  " \ set autoindent |
  \ set fileformat=unix

" YAML indentation
au BufNewFile,BufRead *.yml,*.yaml
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set expandtab |
  \ set fileformat=unix

" HTML indentation
au BufNewFile,BufRead *.html,*.css,*.json
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set expandtab |
  \ set fileformat=unix

" Bash indentation
au BufNewFile,BufRead *.sh,.vimrc,.bash_profile,.bashrc
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set expandtab |
  \ set fileformat=unix

" JavaScript indentation
au BufNewFile,BufRead *.js
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab |
  \ set fileformat=unix

" Treat Jekyll's include and layout files as liquid syntax
au BufNewFile,BufRead */_includes*,*/_layout*
  \ set filetype=liquid

" Terraform indentation
au BufNewFile,BufRead *.tf,*.tfvars,*.tfstate
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set expandtab |
  \ set fileformat=unix

" Enable spell checker for Markdown files
" 1) Add words to the vocabulary by hovering over them
" and typing zg command
" 2) Jump to the spell errors using ]s
au BufNewFile,BufRead *.md,*.markdown
  \ setlocal spell

au BufNewFile,BufRead *.puml,*.plantuml,*.pu
  \ set filetype=plantuml |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set expandtab |
  \ set fileformat=unix

au BufNewFile,BufRead *.py
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set expandtab |
  \ set fileformat=unix

" Flugging Unnecessary Whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"============================================================================
"                   AUTO-CREATING DIRECTORIES ON SAVE
"============================================================================

function! s:MakeNonExistingDir2(file, buf)
  " Regex here prevents from creation of directories like ftp://*
  " Also checks for non-empty bufftype (whatever the hell it means)
  if empty(getbufvar(a:buf, '&buftype')) && a:file !~# '\v^\w+\:\/'
    let dir = fnamemodify(a:file, ':h')
    " Do not create directory if it already exists
    if !isdirectory(dir)
      " Call mkdir -p dir
      call mkdir(dir, 'p')
    endif
  endif
endfunction

aug BWCCreateDir
  " Remove all existing autocommands in this group
  au!
  " Call function prior to write operation
  au BufWritePre *
    \ :call s:MakeNonExistingDir2(expand('<afile>'), +expand('<abuf>'))
aug END

" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required

