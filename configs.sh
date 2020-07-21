# export PS1='\[\e[35m\]\w\[\e[0m\]
# \$ '

typeset +H _current_dir="%{$fg_bold[blue]%}%~%{$reset_color%} "

PROMPT='$(_user_host)${_current_dir}
%{%(!.%F{red}.%F{white})%}▶%{$reset_color%} '

RPROMPT='${_return_status}'

LS_COLORS='tw=30:ow=34:'
export LS_COLORS

export GIT_EDITOR=vim

ulimit -c unlimited
umask 022
