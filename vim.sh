function vim_clean_all {
  echo "Deleting ${HOME}/.vim"
  rm -rf ${HOME}/.vim
  echo "Deleting ${HOME}/.vimrc"
  rm -f ${HOME}/.vimrc
}

function vim_plugin_pathogen_install {
  echo "Installing VIM plugin Pathogen" 
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  echo "Done"
}

function vim_plugin_nerdtree_install {
  echo "Installing VIM plugin Nerdtree" 
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
  echo "Done"
}

function vim_plugin_jellybeans_install {
  echo "Installing VIM plugin Jellybeans" 
  git clone https://github.com/nanotech/jellybeans.vim.git /tmp/jellybeans
  mkdir -p "${HOME}/.vim/colors"
  mv /tmp/jellybeans/colors/jellybeans.vim ~/.vim/colors/
  rm -rf /tmp/jellybeans
  echo "Done"
}

function vim_plugin_tcomment_install {
  echo "Installing VIM plugin Tcomment" 
  git clone https://github.com/tomtom/tcomment_vim.git ~/.vim/bundle/tcomment
  echo "Done"
}

function vim_plugin_neocomplete_install {
  echo "Installing VIM plugin Neocomplete"
  git clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/bundle/neocomplete
  echo "Done"
}

function vim_plugin_vimgo_install {
  echo "Installing VIM plugin Vim-go"
  git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
  echo "Done"
}

function vim_plugin_ansible_install {
  echo "Installing VIM plugin vim-ansible-yaml"
  git clone git://github.com/chase/vim-ansible-yaml.git ~/.vim/bundle/vim-ansible-yaml
  echo "Done"
}

function vim_plugin_puppet_install {
  echo "Installing VIM plugin vim-puppet"
  git clone https://github.com/rodjek/vim-puppet.git ~/.vim/bundle/puppet
  echo "Done"
}

function vim_config {
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
let loaded_netrwPlugin = 1
let g:go_fmt_command = "goimports"
"let b:goimports_vendor_compatible =1
let g:neocomplete#enable_at_startup = 1


execute pathogen#infect()
:filetype plugin on
:command WQ wq
:command Qa wq
:command Wq wq
:command W w
:command Q q
:command! -bar -bang Q quit<bang>
let g:NERDTreeWinPos="left"
let NERDTreeWinSize=26
let NERDTreeShowHidden=1

autocmd vimenter * if !argc() | NERDTree | endif
" closes vim if there is no active windows left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" if argc() > 0 && argv(0) != "."
"     autocmd vimenter * NERDTree
"     autocmd vimenter * wincmd p
" endif

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
EOF
}

function vim_setup {
  vim_clean_all
  vim_plugin_pathogen_install
  vim_plugin_nerdtree_install
  vim_plugin_jellybeans_install
  vim_plugin_tcomment_install 
  vim_plugin_neocomplete_install 
  vim_plugin_vimgo_install 
  vim_plugin_ansible_install 
  vim_plugin_puppet_install
  vim_config
}


