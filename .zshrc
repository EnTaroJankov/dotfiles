# The following lines were added by compinstall
zstyle :compinstall filename '/home/jankov/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install

# Startof custom alias added by jankov

# dotfiles setup inspired by https://news.ycombinator.com/item?id=11071754
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin

# Path to your oh-my-zsh installation.
export ZSH="/home/jankov/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# export CLICOLOR=1
# CHECK LS MAN PAGE
# export LSCOLORS=DxFxCxDxBxegedabagacad

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias vzp="vim ~/.zshrc"
alias szp="source ~/.zshrc"
alias vbp='vim ~/.bash_profile'
alias sbp='source ~/.bash_profile'
alias vvp='vim ~/.vimrc'
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cl="clear; ls -lrt"
# CD / NAVIGATION  
alias cdh='cd ~/Hound'
alias cdm='cd ~/.m2/'
alias mvntmp='mvn clean install -Djava.io.tmpdir=/tmp'

# Python ShortCut
alias py='python3'
alias python='python3'
alias pip='pip3'

# Gerrit alias
alias gpom='git push origin HEAD:refs/for/master'
# Print out git tree in command line
alias gitTree='git log --oneline --graph --color --all --decorate'
# git checkout -p <file-to-selectively-revert-to-head>

# Helper function to calculate sha256 digest
function maj() {
  echo -n $1 | openssl dgst -sha256
}

# Keytool Commands
# Adding an individual cert to a an existing Keystore
# keytool -import -alias example-alias -file example.pem -keystore keystore.jks -storepass changeit

# Processing Git Repo information examples
# Example: Print name of git repo in all subdirectories
# for d in ./*/ ; do (cd "$d" && git remote -v | grep fetch | cut -f 2 | cut -f 1 -d ' ' | rev | cut -f1 -d '/' | rev | cut -f 1 -d '.'); done;
#
# Cut Command to get git ssh repo name
# git remote -v | grep fetch | cut -f 2 | cut -f 1 -d ' '
#
# Double Reverse to cut last delimiter
# git remote -v | grep fetch | cut -f 2 | cut -f 1 -d ' ' | rev | cut -f1 -d '/' | rev | cut -f 1 -d '.'
#
#
# Recursively search current directory case-insensitive
function greps() {
  grep -iHR "$1" ./
}

# Decrypt base64 string
function based() {
  echo -n "$1" | base64 -D
}

# Decrypt all GPG encoded files with passphrase $GPG_PASSPHRASE
function gpgdall() {
  for file in ./*gpg; do
    gpg --batch --yes --passphrase $GPG_PASSPHRASE --use-embedded-filename -d $file;
  done
}

function apply_kube_secrets() {
  for secret in ./*yml; do kubectl apply -f $secret; done
}

# Kubectl functions and aliases
alias kga='kubectl get all'
alias kgc='kubectl config get-contexts'
alias kgs='kubectl get secrets'
alias kscm='kubectl config use-context minikube'

function kda () {
  kubectl delete all -l app=$1
}

# Helm aliases and functions
alias hpc='helm package charts'

function hid() {
  helm install --generate-name --dry-run --debug -f charts/values/dev.yaml $1 > dryrun.txt
}
function hir() {
  helm install --generate-name --debug -f charts/values/dev.yaml $1
}
#
# Recursive find and replace of strings excluding git dirs and binaries specific to macOS (BSD SED -i is different)
# https://stackoverflow.com/questions/1583219/how-to-do-a-recursive-find-replace-of-a-string-with-awk-or-sed
# grep -Irl SearchExample . --exclude-dir=.git | xargs sed -i "" -e 's/SearchExample/ReplaceExample/g'
# for repo in $repos; do cd $repo; grep -Irl pod_name . --exclude-dir=.git | xargs sed -i "" -e 's/pod_name/pod/g';cd ..; done;

# Find files by widcard and exec shell command on them and search for output with grep regex for size of files in GB
# find /example/*.tar -mtime +365 -exec du -hs {} \; | grep -e '[0-9]*G[[:blank:]]'

# Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source auto-completion
source <(kubectl completion zsh)

source <(helm completion zsh)

source <(minikube completion zsh)
