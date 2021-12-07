# If you come from bash you might have to change your $PATH.
#Loads the Starship Prompt
fpath=(~/.daml/zsh $fpath)
eval "$(starship init zsh)"

#Loads z for jumping between folders
. /opt/homebrew/etc/profile.d/z.sh
bindkey -v

# Docker Aliases
alias doup="docker-compose up"
alias dodown="docker-compose down"
alias dorestart="docker-compose down --volumes && docker build . && docker-compose up"

# General Aliases
alias ..="cd .."
alias ~=" cd ~"
alias v="nvim"
alias ~="cd ~"
alias alconf="nvim ~/.alacritty.yml"
alias vv="vim"
alias l="colorls -la --sd"
alias ld="colorls -d --sd"
alias lf="colorls -f --sd"
alias la="colorls -lA --sd"
alias zrc="nvim ~/.zshrc"
alias vrc="nvim ~/.vimrc"
alias nrc="nvim ~/.config/nvim/init.vim"  
alias c="clear"
alias kbssh="ssh -t root@68.183.80.200"
alias szrc="source ~/.zshrc"

#Brew Aliases
alias bu="brew upgrade && brew update && brew cleanup"
alias bl="brew ls"
alias bi="brew install"
alias bic="brew install --cask"
alias br="brew uninstall"
alias brc="brew uninstall --cask"

# Git Aliases
alias gs="git status"
alias gpa="git push -u origin --all"
alias gpm="git push -u origin master"
alias gpd="git push -u origin develop"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gmd="git checkout master && git merge develop && git push -u origin master"
alias ga="git add ."
alias gst="git stash"
alias gstd="git stash drop"
alias gstp="git stash pop"
alias gcm="git commit -m"

# TMUX aliases - Delete it if you don't use tmux.
alias mxn="tmux -2 new -s"
alias mxk="tmux kill-session -t"
alias mxl="tmux ls"
alias mxa="tmux -2 a -t"
alias mxconf="v ~/.tmux.conf"
alias mxsrc="tmux source ~/.tmux.conf"

# Node Aliases
alias ns="npm run serve"
alias buildstage="npm run buildstage"
alias buildprod="npm run buildprod"

export EDITOR='nvim'

# Load NVM into shell
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Load Zsh Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
eval "$(rbenv init - zsh)"
