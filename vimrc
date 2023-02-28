set clipboard=unnamed         "all yanking/deleting operations automatically copy to the system clipboard
set nocompatible              " be iMproved, required
filetype off                  " required

"Powerline status line
set rtp+=/usr/local/bin/powerline/bindings/vim
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
" Always show statusline
set laststatus=2
"Get rid of the default mode indicator
set noshowmode 
"Avoid mode switch delay
set timeoutlen=1000 ttimeoutlen=0

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"YouCompleteMe
Plugin 'ycm-core/YouCompleteMe'

"YCM will auto-close the preview window after the user leaves insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1 
"Fugitive git wrapper
Plugin 'tpope/vim-fugitive'

"Autotag (automatically update ctags file on file save)
"Plugin 'craigemery/vim-autotag'

"Syntax and indent files for Swift (https://github.com/keith/swift.vim)
Plugin 'keith/swift.vim'

"Swift syntax (from  https://github.com/apple/swift/tree/master/utils/vim)
"Disabled because dosn't seem to work well for indentation
"Plugin 'file:///Users/francescobigagnoli/.vim/vim-swift'

"Auto Pairs: Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'

"CtrlP
"Plugin 'kien/ctrlp.vim'

"Markdown syntax, mapping rules and matching
"https://github.com/plasticboy/vim-markdown
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

"Abolish.vim - A plugin for working with variants of a word.
"https://github.com/tpope/vim-abolish
"Plugin 'abolish.vim'

"Instant Markdown
"Plugin 'instant-markdown.vim'

"Nerdtree 
"Plugin 'scrooloose/nerdtree'

"GitGutter
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

set showcmd		"The bottom line in your editor will show you information about the current command going on"
"set relativenumber
set number

syntax on		"Enable syntax highlighting

set re=1 "Force using the old regex engine, this improves performances while using ruby syntax

"set synmaxcol=128 "Disable syntax highlight after 128 column (to improve scroll performances)
"syntax sync minlines=256 "Syntax highlight minlines 256 (to improve scroll performances)
:let ruby_no_expensive = 1 "(to improve scroll performances)
filetype on		"Enable filetype detection
filetype indent on	"Enable filetype-specific indenting
filetype plugin on	"Enable filetype-specific plugins

:set tabstop=4 shiftwidth=4 expandtab "no tabs in the source file, all tab characters are 4 space characters

"Automatically set fold level to each opened
:set foldlevelstart=1

"Open a vertical help with the :Help and :H command
command -nargs=* -complete=help Help vertical belowright help <args>
command -nargs=* -complete=help H vertical belowright help <args>

"Search
:set hlsearch       "highlight search results
"Double tap ESC to remove search highlighting
:nnoremap <silent><esc> :noh<CR>
:nnoremap <esc>^[ <esc>^[

"color Theme
set background=dark
colorscheme Tomorrow-Night-Eighties
"line number color
hi LineNr  ctermfg=white

"zsh ex command autocoplete style
set wildmenu
set wildmode=full

"raise history limit
set history=200

"reduce time before buffer is written to swap (makes gitgutter updates instant)
set updatetime=100

"use ruby syntax highlighting for Podfile
au BufRead,BufNewFile Podfile set filetype=ruby

"use ruby syntax highlighting for Fastlane configuration files
au BufRead,BufNewFile Fastfile set filetype=ruby
au BufRead,BufNewFile Deliverfile set filetype=ruby
au BufRead,BufNewFile Appfile set filetype=ruby
au BufRead,BufNewFile MatchFile set filetype=ruby

"use ruby syntax highlighting for gems configuration files
au BufRead,BufNewFile Gemfile set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby   "config file for guard gem

"Make the backspace work like in most other programs
set backspace=indent,eol,start

"Add python tags file for *.py files, to generate this file run the
"'ctagsPythonGen' script
au Filetype python set tags+=~/Development/tags/python.tags

"Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

"Enable mouse for all (a) modes
:set mouse=a

" Line numbers: automatic switch between relative in NORMAL and absolute in
" INSERT and when editor doens't have focus
" https://jeffkreeftmeijer.com/vim-number/
":set number
":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
":  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
":augroup END

