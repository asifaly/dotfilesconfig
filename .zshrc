# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH=$HOME/.daml/bin:$PATH
#fpath=(~/.daml/zsh $fpath)
KEYTIMEOUT=1
autoload -U promptinit; promptinit
prompt pure

# Example aliases
alias ~="cd ~"
alias alconf="nvim ~/.alacritty.yml"
alias vim="nvim"
alias v="vim"
alias l="ls -lapG"
alias ls="ls -lapG"
alias bu="brew upgrade && brew update && brew cleanup"
alias gs="git status"
alias gpa="git push -u origin all"
alias gpm="git push -u origin master"
alias gpd="git push -u origin develop"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gmd="git checkout master && git merge develop && git push -u origin master"
alias ga="git add ."
alias gsh="git stash"
alias gshd="git stash drop"
alias gshp="git stash pop"
alias gcom="git commit -m"
alias zrc="vim ~/.zshrc"
alias zimrc="vim ~/.zimrc"
alias vrc="vim ~/.vimrc"
alias ns="npm run serve"
alias buildstage="npm run buildstage"
alias buildprod="npm run buildprod"
alias c="clear"
alias mxn="tmux -2 new -s"
alias mxk="tmux kill-session -t"
alias mxl="tmux ls"
alias mxa="tmux -2 a -t"
alias mxconf="v ~/.tmux.conf"
alias mxsrc="tmux source ~/.tmux.conf"
alias kbssh="ssh -t root@68.183.80.200"
alias szrc="source ~/.zshrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

eval "$(rbenv init -)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
. /usr/local/etc/profile.d/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --follow --glob "!.git/*"'

# fd() {
#   local dir
#   dir=$(find ${1:-.} -path '*/\.*' -prune \
#                   -o -type d -print 2> /dev/null | fzf +m) &&
#   cd "$dir"
# }

# fh() {
#   eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
# }
