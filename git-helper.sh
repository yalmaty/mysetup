function git_setup {
  rm ~/.gitconfig
  echo "Creating .gitconfig"
  cat > "${HOME}/.gitconfig" << EOF
[http]
	sslVerify = true

[credential "https://github.com"]
	username = yalmaty

[core]
	editor = vim
	quotepath = false
	
[color]
	ui = true

[color "branch"]
	current = yellow bold
	local = green bold
	remote = cyan bold

[color "diff"]
	meta = yellow bold
	frag = magenta bold
	old = red bold
	new = green bold
	whitespace = red reverse

[color "status"]
	added = green bold
	changed = yellow bold
	untracked = red bold

[alias]
	st = status -s
	ci = commit -a
	ck = checkout
	d = diff

[url "https://github.com/"]
	insteadOf = git://github.com/

[user]
	name = yalmaty

[credential]
	helper = cache --timeout=24000
EOF
  echo "Done"
}
