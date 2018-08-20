# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/mdoetschkidder/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="bullet-train"
#ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode) 

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
export DIVVY_CODE="$HOME/code/divvy/" # Root code dir
export DIVVY_VENV="$HOME/DIVVY_VIRTUALENV" # Virtualenv
export DIVVY_DEV="$HOME/code/divvy/divvy-dev/" # Root code dir
# export DIVVY_LIB="$HOME/code/divvy/libcloud-divvy/" 
alias dvrun="${DIVVY_CODE}/divvy-dev/run.pl" # Run script

export DIVVY="$HOME/code/divvy"
export DIVVY_SRC="$DIVVY/divvy-dev/Divvy"

alias dvdocs="vex divvy sphinx-build -b html -E -a $DIVVY_SRC/docs/source $DIVVY_SRC/docs/html && open $DIVVY_SRC/docs/html/index.html"
alias ir="vex divvy pip install -r $DIVVY_SRC/requirements.txt"
alias dv="vex divvy python $DIVVY_SRC/src/python/divvycloud.py"
alias dvjs='dv scheduler'
alias dvh='dv harvester'
alias dvlh='dv long_harvester'
alias dvp='dv processor'
alias dvo='dv ondemand'
alias dvis='dv webserver'
alias dvuh='dv worker -q harvester -q harvester-long'
alias dvwk='dv worker -q on-demand -q processor -q harvester-long -q harvester'
alias dviss='pushd .;cd ~/code/divvy/divvy-dev/Divvy/; yarn install; yarn run nowatch; popd'
alias im="vex divvy python $DIVVY_SRC/src/python/DivvyCodeGen2.py"
# alias dvutqf="pushd .; vex divvy; cd ~/code/divvy/divvy-dev/Divvy/src/python; python -m unittest discover --start-directory tests/unit/query_filters; exit; popd"

alias pyclean="autoflake --remove-all-unused-imports --remove-unused-variables --in-place *.py ; autopep8 --in-place --max-line-length=109 *.py ; docformatter --in-place --pre-summary-newline --make-summary-multi-line *.py"
alias pycleanr="autoflake --remove-all-unused-imports --remove-unused-variables --in-place --recursive *.py ; autopep8 --in-place --recursive --max-line-length=109 *.py ; docformatter --in-place --pre-summary-newline --make-summary-multi-line --recursive *.py"

# VIM keybindings
bindkey -v
export KEYTIMEOUT=1

LC_CTYPE=en_US.UTF-8
export LC_CTYPE

alias config='/usr/bin/git --git-dir=/Users/mdoetschkidder/.cfg/ --work-tree=/Users/mdoetschkidder'
