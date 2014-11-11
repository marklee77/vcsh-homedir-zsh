export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

export PATH="/usr/local/heroku/bin:${PATH}"
export PATH="${HOME}/.cabal/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

autoload -U colors && colors

export EDITOR="vim"
export SVN_EDITOR="vim"
export BROWSER="firefox"
export TERMINAL="urxvtcd"
export BIBINPUTS=".:${HOME}/Academia/biblio"

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

setopt PROMPT_SUBST PROMPT_PERCENT
export PROMPT="%F{135}%n%f@%F{166}%m%f:%F{118}%~%f %F{026}%*%f, %F{021}%D%f \
\$(vcs_super_info)\$(pyenv_info)\$(rbenv_info)\$(nodenv_info)
%(!.#.$) "
#export PROMPT="%F{135}%n%f@%F{166}%m%f:%F{118}%~%f %F{026}%*%f, %F{021}%D%f \
#\$(vcs_super_info)
#%(!.#.$) "

# ===== History
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history # save timestamp of command and duration
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt hist_verify # don't execute, just expand history
setopt share_history # imports new commands and appends typed commands to history

# load rc files
ZSHRCDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/rc.d
if [ -d "${ZSHRCDIR}" ]; then
  for RCFILE in ${ZSHRCDIR}/*; do
    source ${RCFILE}
  done
fi

# for some reason this doesn't seem to take in .xsession...
#if [ -n "${DISPLAY}" ]; then
#    for VARVAL in $(gnome-keyring-daemon --components=ssh,gpg,secrets,pkcs11 --start); do
#        export ${VARVAL}
#    done
#fi
