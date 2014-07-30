# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

export PATH="/usr/local/heroku/bin:${PATH}"
export PATH="${HOME}/.cabal/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/Programs/base/bin:${PATH}"
export PATH="${HOME}/Programs/bin:${PATH}"

autoload -U colors && colors

export EDITOR="vim"
export SVN_EDITOR="vim"
export BROWSER="firefox"
export TERMINAL="urxvtcd"
export BIBINPUTS=".:${HOME}/Academia/biblio"

bindkey "^R" history-incremental-search-backward

alias ls='ls -h --color'

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

# load rc files
ZSHRCDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh/config.d
if [ -d "${ZSHRCDIR}" ]; then
  for RCFILE in ${ZSHRCDIR}/*; do
    source ${RCFILE}
  done
fi


