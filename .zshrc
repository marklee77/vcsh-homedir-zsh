# disable XON/XOFF flow control (Ctrl-S/Ctrl-Q)
stty -ixon

autoload -U colors && colors

# history search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# completions
autoload -U compinit && compinit
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_RUNTIME_DIR}/zshcache"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

alias ls='ls -h --color=auto'

# prompt
source ~/.config/zsh/zsh-vcs-prompt/zshrc.sh
ZSH_VCS_PROMPT_ENABLE_CACHING='true'
if [ "${ZSH_VCS_PROMPT_GIT_FORMATS[-1]}" != " " ]; then
  ZSH_VCS_PROMPT_GIT_FORMATS+=' '
fi
if [ "${ZSH_VCS_PROMPT_GIT_ACTION_FORMATS[-1]}" != " " ]; then
  ZSH_VCS_PROMPT_GIT_ACTION_FORMATS+=' '
fi
if [ "${ZSH_VCS_PROMPT_VCS_FORMATS[-1]}" != " " ]; then
  ZSH_VCS_PROMPT_VCS_FORMATS+=' '
fi
if [ "${ZSH_VCS_PROMPT_VCS_ACTION_FORMATS[-1]}" != " " ]; then
  ZSH_VCS_PROMPT_VCS_ACTION_FORMATS+=' '
fi

# history
setopt extended_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_find_no_dups
unsetopt hist_reduce_blanks
setopt hist_verify
setopt hist_no_store
setopt hist_no_functions
setopt share_history

setopt PROMPT_SUBST PROMPT_PERCENT
export PROMPT_INFO="\$(vcs_super_info)"

# load rc files
ZSHRCDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/rc.d
if [ -d "${ZSHRCDIR}" ]; then
  for RCFILE in $(run-parts --list ${ZSHRCDIR}); do
    source ${RCFILE}
  done
fi

if [ -n "$SSH_TTY" ]; then
export PROMPT="%F{055}%n%f@%F{245}%m%f:%F{green}%~%f \
%F{cyan}%*%f, %F{blue}%D%f \
${PROMPT_INFO}
%F{red}%(!.#.$)%f "
else
export PROMPT="%F{magenta}%n%f@%F{yellow}%m%f:%F{green}%~%f \
%F{cyan}%*%f, %F{blue}%D%f \
${PROMPT_INFO}
%(!.#.$) "
fi

typeset -U PATH
