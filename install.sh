git clone git@github.com:shen-my/my-zsh.git ~/.my-zsh

sed -i -e 's/^ZSH_THEME=.*/ZSH_THEME="juanghurtado"/g' ~/.zshrc

echo '
MY_ZSH=~/.my-zsh
source $MY_ZSH/my-zsh.sh' >> ~/.zshrc
