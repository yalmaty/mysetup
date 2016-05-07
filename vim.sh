function vim::clean::all {
  echo "Deleting ${HOME}/.vim"
  rm -rf ${HOME}/.vim
  echo "Deleting ${HOME}/.vimrc"
  rm -f ${HOME}/.vimrc
}

function vim::plugin::pathogen::install {
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

function vim::plugin::nerdtree::install {
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
}

function vim::plugins::install::all {
  vim::clean:all
  vim::plugin::pathogen::install
  vim::plugin::nerdtree::install
}

function vim::config {
cat > "${HOME}/.vimrc" << EOF
set nu
set number
set nocompatible
set showcmd
set autoindent
set ruler
set wrap
set smarttab
set showmatch
set hlsearch
set incsearch
set smartcase
set ignorecase
set expandtab
set complete=.,i
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete
" set cursorline
set nobackup
set noswapfile
set history=5000
set tabstop=2
set shiftwidth=2
set softtabstop=2
set undolevels=100
set laststatus=2
set sidescroll=5
"set clipboard=unnamed
set background=dark
"colorscheme railscasts
"colorscheme vividchalk
colorscheme jellybeans
"colorscheme solarized


execute pathogen#infect()
:filetype plugin on
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command! -bar -bang Q quit<bang>

if argc() > 0
    autocmd vimenter * NERDTree
    autocmd VimEnter * wincmd p
endif

"""" Pathogen settings """"""""""""""""""""""""""""""""""""""""""""""""""""""""
" speedup pathogen loading by temporarily disabling file type detection
filetype off

" add all plugins in ~/.vim/bundle/ to runtimepath (vim-pathogen)
if filereadable(\$HOME."/.vim/autoload/pathogen.vim")
    call pathogen#infect()
    call pathogen#helptags()
endif

" turn on syntax highlighting
if !exists("syntax_on")
    syntax on
endif

" turn file type detection back on
filetype plugin indent on

let g:NERDTreeWinPos="right"
let NERDTreeWinSize=26
EOF
}
