export PROMPT='%{$GREEN_BOLD%}%n@%m%{$WHITE%}:%{$YELLOW%}%~%u%{$RESET_COLOR%} $(git_prompt_info)
%{$BLUE%}>%{$RESET_COLOR%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

unset RPROMPT

export GIT_EDITOR=vim

ulimit -c unlimited
umask 022

setopt noincappendhistory
setopt nosharehistory
