source /dev/stdin <<< "$(curl -ks https://raw.githubusercontent.com/yalmaty/mysetup/master/tools-helper.sh)"
source /dev/stdin <<< "$(curl -ks https://raw.githubusercontent.com/yalmaty/mysetup/master/git-helper.sh)"
source /dev/stdin <<< "$(curl -ks https://raw.githubusercontent.com/yalmaty/mysetup/master/vim-helper.sh)"

git_setup
tools_install_all
vim_setup
