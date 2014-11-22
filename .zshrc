autoload -U colors && colors

bindkey "^R" history-incremental-search-backward

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
setopt append_history 
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first 
setopt hist_ignore_dups 
setopt hist_ignore_space 
setopt hist_find_no_dups 
setopt hist_reduce_blanks 
setopt hist_verify 
setopt share_history

setopt PROMPT_SUBST PROMPT_PERCENT
export PROMPT_INFO="\$(vcs_super_info)\$(rbenv_info)\$(nodenv_info)"

# load rc files
# FIXME: run-parts --list...
ZSHRCDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/rc.d
if [ -d "${ZSHRCDIR}" ]; then
  for RCFILE in $(run-parts --list ${ZSHRCDIR}); do
    source ${RCFILE}
  done
fi

export PROMPT="%F{135}%n%f@%F{166}%m%f:%F{118}%~%f %F{026}%*%f, %F{021}%D%f \
${PROMPT_INFO}
%(!.#.$) "
