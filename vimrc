set clipboard=unnamed         "all yanking/deleting operations automatically copy to the system clipboard
set nocompatible              " be iMproved, required
filetype off                  " required

"Powerline status line
set rtp+=/usr/local/bin/powerline/bindings/vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
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
Plugin 'Valloric/YouCompleteMe'

"Fugitive git wrapper
Plugin 'tpope/vim-fugitive'

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

"Swift syntax
"Plugin 'kballard/vim-swift'

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

"use ruby syntax highlighting for Podfile
au BufRead,BufNewFile Podfile set filetype=ruby

"use ruby syntax highlighting for Fastlane configuration files
au BufRead,BufNewFile Fastfile set filetype=ruby
au BufRead,BufNewFile Deliverfile set filetype=ruby
au BufRead,BufNewFile Appfile set filetype=ruby
au BufRead,BufNewFile MatchFile set filetype=ruby

"disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

