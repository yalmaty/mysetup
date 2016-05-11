source ~/.git-prompt.sh
export PATH=$PATH:${HOME}/packer
export PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]\$(__git_ps1) -> \[\033[0m\]"
