export PROMPT='%{$GREEN_BOLD%}%n@%m%{$WHITE%}:%{$YELLOW%}%~%u%{$RESET_COLOR%}
%{$BLUE%}>%{$RESET_COLOR%} '

unset RPROMPT

export GIT_EDITOR=vim

ulimit -c unlimited
umask 022

setopt noincappendhistory
setopt nosharehistory
