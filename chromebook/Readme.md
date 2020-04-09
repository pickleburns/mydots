# Setup
* update container `sudo apt-get update` and `sudo apt-get upgrade`
* install screen `sudo apt-get install screen`

## Node Dev
* install nodejs (https://github.com/nodesource/distributions)
```
# Using Debian, as root
curl -sL https://deb.nodesource.com/setup_13.x | bash -
apt-get install -y nodejs

# use `sudo` on Ubuntu or run this as root on debian
apt-get install -y build-essential
```
* mkdir ~/.node
* set path for local "global" npm (https://topaxi.codes/use-npm-without-root-or-sudo-rights/)
```
# add to your ~/.npmrc file.
prefix = ~/.node  

# Add bin and node_modules to $PATH and $NODE_PATH variables in ~/.profile file.

PATH="$HOME/.node/bin:$PATH"  
NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"  

# Optionally update the $MANPATH variable for npm packages which ship man pages.
# Add the following line to your ~/.profile file.

MANPATH="$HOME/.node/share/man:$MANPATH" 
```

## npm packages for VIm (npm install each)
* prettier
* eslint
* eslint-plugin-prettier
* eslint-config-prettier

## Ruby Dev
* install ruby `sudo apt-get install ruby`
* mkdir ~/.gems
* set local gem_home (https://stackoverflow.com/questions/16098757/specify-gem-installation-directory)
```
# .profile
export GEM_HOME="$HOME/projects/shared/gems/ruby/1.8/gems"
export GEM_PATH="$GEM_HOME:/var/lib/ruby/gems/1.8"
```

## VIm
* mkdir ~/.tmp

## Other VIm Links:
https://www.vimfromscratch.com/articles/vim-for-javascript-and-react-in-2019/

https://medium.com/@jimeno0/eslint-and-prettier-in-vim-neovim-7e45f85cf8f9

