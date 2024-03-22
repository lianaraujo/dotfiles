# .zshrc

# spaceship prompt

source $(brew --prefix)/opt/spaceship/spaceship.zsh
#autoload -U promptinit; promptinit
#prompt spaceship

# autocompletion

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# history

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/zsh_history

# general settings

setopt autocd
stty stop undef
setopt interactive_comments

# PATHS

export PATH="$PATH:$HOME/.local/src/flutter/bin"
export PATH="$PATH:$HOME/src"
export PATH="$PATH:$HOME/.local/bin"
#export PATH="$HOME/.emacs.d/bin:$PATH"
#export PATH="$HOME/snap/dwarffortress/82:$PATH"

# carai

export EDITOR=/usr/bin/vim

#custom functions

cara() {
	echo 'my ass'
}

fcd() {
	cd "$(find -type d | fzf)"
}

#open() {
#	argument="${1:-"$(find -type f | fzf)"}"
#	xdg-open "$argument"
#}

extract () {
   if [ -f "$1" ] ; then
      case "$1" in
           *.tar.gz)    tar xvzf "$1";;
           *.tar.xz)    tar xvf "$1";;
           *.tar.bz2)   tar xvjf "$1";;
           *.gz)        gunzip "$1"  ;;
           *.bz2)       bunzip2 "$1" ;;
           *.rar)       unrar x "$1" ;;
           *.tgz)       tar xvzf "$1";;
           *.tar)       tar xvf "$1" ;;
           *.zip)       unzip "$1"   ;;
           *.tbz2)      tar xvjf "$1";;
           *.Z)         uncompress "$1"  ;;
           *.7z)        7z x $1;;
           *) echo "could not extract such file format '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

daydiff () {
  echo $((($(date +%s) - $(date --date="$1" +%s))/(60*60*24)))
}

# commands alias

alias g='git'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -al --color=auto'
alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"

alias v="nvim"

# config alias

alias cfv="vim ~/.config/nvim/init.vim"
alias cfz="nvim ~/.zshrc"
alias cfh="nvim ~/.config/herbstluftwm/autostart"
alias cfy="nvim ~/.config/yabai/yabairc"
alias cfx="nvim ~/.config/skhd/skhdrc"
alias cfp="nvim ~/.cache/plants/data"

# cd alias

alias D="cd ~/Downloads"

alias met="cd ~/docs/procs/metrobi/"
alias meta="cd ~/docs/procs/metrobi/admin_dashboard"
alias metd="cd ~/docs/procs/metrobi/customer_dashboard"
alias metm="cd ~/docs/procs/metrobi/driver_app"
alias mets="cd ~/docs/procs/metrobi/metrobi-api"
alias metl="cd ~/docs/procs/metrobi/leads"

alias p='sudo pacman'
#alias update="sudo apt update && sudo apt upgrade -y && sudo apt clean && sudo apt autoclean && sudo apt autoremove -y"

# NVM

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# flutter shit

export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

# Android Studio

#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
#export PATH=$PATH:~/android-studio/bin

#[ -d "$HOME/Android/Sdk" ] && ANDROID_SDK=$HOME/Android/Sdk || ANDROID_SDK=$HOME/Android/Sdk
#echo "export ANDROID_SDK=$ANDROID_SDK" >> ~/`[[ $SHELL == *"zsh" ]] && echo '.zshenv' || echo '.bash_profile'`

# test token
export GITHUB_PERSONAL_TOKEN="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"

# plugins

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fpath=($fpath "/home/diurno/.zfunctions")

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
