" Run with settings for newer options and behavior. Must be declared first
" because it changes the behavior of other options.
set nocompatible

" Copy indent from current line when starting a new line. This option is reset
" when paste mode is toggled.
set autoindent

" Allows backspacing over autoindents, line breaks and start of inserts.
set backspace=indent,eol,start

" Enable backups.
set backup
set backupdir=~/.vim/backup/

" Sets the height of the command line on the bottom of the interface.
set cmdheight=3

" Highlight the column immediately after the textwidth. Gives a visual cue on
" character limits.
set colorcolumn=+1

" List of directory names for the swap file, separated with commas.
set directory=/var/tmp//,.

" Sets the character encoding used inside Vim.
set encoding=UTF-8

" Replace tabs with spaces.
set expandtab

" Number of commands and search patterns to keep in history.
set history=100

" Ignore case when searching
set ignorecase

" Do not dynamically find as you type
set incsearch

" Display each line with its relative line number.
set relativenumber

" Toggle to paste mode.
set pastetoggle=<F10>

" Display the cursor position on the lower right corner of the interface.
set ruler

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4

" Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase

" Be aware of brackets when indenting.
set smartindent

" Number of spaces that a <Tab> counts for while performing editing operatings, like inserting a <Tab> or using <BS>.
set softtabstop=4

" When a bracket is inserted, briefly jump to the matching one. The jump is
" only done if the match is visible on the screen.
set showmatch

" Number of spaces that a <Tab> in the file counts for.
set tabstop=4

" Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.
set textwidth=79

" Maximum number of changes that can be undone.
set undolevels=1000

" The swap file will be written to disk after this many characters are typed.
set updatecount=100

" The swap file will be written to disk after this many milliseconds of
" idleness.
set updatetime=10000

" Disable both the visual bell and beeping noise.
set vb t_vb=

" Allows extension of rectangles beyond end of line in visual mode.
set virtualedit+=block

set wildmenu " tab completion in command mode
set wildmode=list:longest

" Ignore the following file patterns. Intended to be used with Command-T to
" only display source files.
set wildignore=*.a,*.aac,*.ai,*.aif,*.aiff,*.als,*.apk,*.aup,*.avi,*.band,*.bmp,*.class,*.db,*.dex,*.dll,*.doc,*.dylib,*.eps,*.exe,*.flac,*.flv,*.gif,*.iso,*.itdb,*.itl,*.jar,*.jpeg,*.jpg,*.m4a,*.mid,*.mkv,*.mov,*.mp3,*.mp4,*.mpeg,*.mpg,*.o,*.ogg,*.otf,*.pdf,*.png,*.psd,*.pyc,*.pyo,*.rar,*.raw,*.so,*.tif,*.tiff,*.torrent,*.torrent,*.ttf,*.wav,*.wmv,*.woff,*.xcf,*.xls,*.zip,node_modules/**

" Enable syntax highlighting and search highlighting if colors are available.
" &t_Co is an empty value in the GUI version of MacVim, and therefore the has()
" variation is also included.
"
" See Also: :help has()
if &t_Co > 2 || has("gui_running")
    colorscheme desert
    syntax on
    set hlsearch
endif

" Enable indentation based on filetype.
filetype plugin indent on

" Highlight trailing spaces.
au Syntax * syn match Error /\s\+$\| \ze\t/
au Syntax * syn match Error /\t/

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

call pathogen#infect()
call pathogen#helptags()
