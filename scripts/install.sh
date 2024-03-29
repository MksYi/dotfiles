#!/bin/bash

echo "
H4sICGUPilsAA3RpdGxlAK1Uyw3DIAy9s0IvGSFVIlURo3SG7OBDDkzQATtJS4ld/whJG8SFh40f
5j26rjlCd7n38RqHMU7j/Hws7+WcNzw4Y0NeJozCQTuUX6AbgwiAFQjsQDrTQqaqKfYtVaYpKC6w
BgKrZ3ODLtvkRQelWikd4rREALn/fZz6UhRD6GlwSzJ2GAAm1wLSJyZVCgBOrQ1FYD8z2wo30dBY
ajhOUAxX9SYfLjmJvXtoG+a0GC+jQnsdjsmkzFQDhLKkHMzhgR9PrTGGs/5CPsSC91O7a2tPXcrT
l8RFmvxLmNzHmV9XSN64pKbOTVKHN9Qji59IP75jHQ00A06kvtNYiX0aoO8BKINUNzoFaENLz//p
dhMCKGVmMiEi+c/86vJDGS8cKposxAcAAA==
" | base64 --decode | gzip -d

command="echo 'Asia/Taipei' > /etc/timezone &&
         apt-get update &&
         apt-get upgrade -y &&
         apt-get install -y git-core tmux vim build-essential python3 python3-pip pipx zsh fonts-powerline gdb ncdu &&
         wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

sudo sh -c "$command"

command="git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh &&
         ~/.oh-my-zsh/tools/install.sh"

sh -c "$command"

files='zshrc
       vimrc'
for file in `echo $files | tr ' ' '\n'`; do
    ln -sf ~/.dotfiles/$file ~/.$file
done

ln -sf ~/.dotfiles/theme/astro.zsh-theme ~/.oh-my-zsh/themes/astro.zsh-theme

folders='Service
		 Tools
		 bin
		 Share
		 tmp'

for folder in `echo $folders | tr ' ' '\n'`; do
	mkdir ~/$folder
done
