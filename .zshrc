# If you come from bash you might have to change your $PATH.
eval "$(starship init zsh)"

# Docker Aliases
alias doup="docker-compose up"
alias dodown="docker-compose down"
alias dorestart="docker-compose down --volumes && docker build && docker-compose up"

# General Aliases
alias ..="cd .."
alias v="vim"
alias ~="cd ~"
alias alconf="vim ~/.alacritty.yml"
alias vv="nvim"
alias l="ls -lapG"
alias ls="ls"
alias la="ls -a"
alias bu="brew upgrade && brew update && brew cleanup"
alias zrc="vim ~/.zshrc"
alias vrc="vim ~/.config/nvim/init.vim"
alias c="clear"
alias kbssh="ssh -t root@68.183.80.200"
alias szrc="source ~/.zshrc"

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

# TMUX aliases
alias mxn="tmux -2 new -s"
alias mxk="tmux kill-session -t"
alias mxl="tmux ls"
alias mxa="tmux -2 a -t"
alias mxconf="v ~/.tmux.conf"
alias mxsrc="tmux source ~/.tmux.conf"

# Rails Aliases
#alias fs="foreman start"
#alias rc="rails c"
#alias bi="bundle install"
#alias rdbm="rails db:migrate"
#alias rdbs="rails db:setup"
#alias rdbr="rails db:rollback"
#alias rgs="rails g scaffold"
#alias rds="rails d scaffold"
#alias rgm="rails g model"
#alias rdm="rails d model"
#alias rgc="rails g controller"
#alias rdc="rails d controller" 

# Node Aliases
alias ns="npm run serve"
alias buildstage="npm run buildstage"
alias buildprod="npm run buildprod"

export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
