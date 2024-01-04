# zmodload zsh/zprof

#
# Prompt.
# https://github.com/sindresorhus/pure
#
autoload -U promptinit; promptinit
PURE_GIT_DOWN_ARROW=↓
PURE_GIT_UP_ARROW=↑
# PURE_PROMPT_SYMBOL=🦑
prompt pure
zstyle :prompt:pure:git:stash show yes
export CLICOLOR=1

CASE_SENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

# Skips forward/back a word with opt-arrow.
bindkey '^[f' forward-word
bindkey '^[b' backward-word

#
# History.
#
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

#
# Changing directories.
#
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

#
# Completion.
#
autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C

setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Highlights the current autocomplete option.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Better SSH/SCP/Rsync Autocomplete.
h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:(ssh|scp|rsync|slogin):*' hosts $h
fi

if [[ $(uname -m) == 'arm64' ]]; then
  PATH_HOMEBREW=/opt/homebrew
else
  PATH_HOMEBREW=/usr/local
fi

source $PATH_HOMEBREW/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PATH_HOMEBREW/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source <(kubectl completion zsh)

#
# Others.
#
setopt prompt_subst

source ~/.exports
source ~/.aliases
source ~/.private

# zprof
