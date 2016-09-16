#.bashrc

export PS1='\[\033[1;34m\][\u@\h:\w]\$\[\033[0m\] '
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export PYTHONSTARTUP='.pythonrc.py'
export PATH="/Users/mdk/Library/Android/sdk/platform-tools:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
alias ls='ls -G'
alias ll='ls -al'

alias unity_moab='unlink /Applications/Unity; ln -s /Applications/Unity_moab /Applications/Unity'
alias unity_dk='unlink /Applications/Unity; ln -s /Applications/UniTim_463 /Applications/Unity'
alias unity_cur='readlink /Applications/Unity'

export ANDROID_HOME='/Users/mdk/Library/Android/sdk'
