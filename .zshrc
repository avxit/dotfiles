# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=""

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Spaceship Theme Options
SPACESHIP_PROMPT_ORDER=(
  time
  user
  dir
  host
  git
  node
  exec_time
  line_sep
  vi_mode
  jobs
  exit_code
  char
)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
export UPDATE_ZSH_DAYS=3

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  history-substring-search
  zsh-autosuggestions
  ssh-agent
  git
  brew
  fasd
  fzf
  yarn
  zsh-syntax-highlighting
  chrome-unsafe
)

zstyle :omz:plugins:ssh-agent identities id_rsa

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

# Application environments
export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/gcp-config"
export GEM_HOME="$HOME/.gem"
export N_PREFIX="$HOME/.n"
export GOROOT="$HOME/.go"
export GOPATH="$HOME/projects/go"

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Increase ulimit
ulimit -n 512

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias afk="open -a /System/Library/CoreServices/ScreenSaverEngine.app"
alias c="clear"
alias flush_dns="sudo killall -HUP mDNSResponder"
alias lah="ls -lah"

# ssh
alias ssh_gcp_k8s="ssh nguyentdh@104.248.156.96"
alias ssh_gcp_prod="ssh nguyentdh@178.128.126.171"
alias ssh_teika="ssh deploy@178.128.23.229"
alias ssh_teika_prod="ssh deploy@104.248.146.190"

# kubectl
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias kgp="kubectl get po"
alias kgs="kubectl get svc"
alias kgd="kubectl get deploy"
alias kgsec="kubectl get secrets"
alias kga="kubectl get all"
alias kgpa="kubectl get po -A"
alias kgsa="kubectl get svc -A"
alias kgda="kubectl get deploy -A"
alias kgseca="kubectl get secret -A"
alias kgaa="kubectl get all -A"
alias kgpwide="kubectl get po -o wide"
alias kgswide="kubectl get svc -o wide"
alias kgdwide="kubectl get deploy -o wide"
alias kdp="kubectl delete pods"
alias kds="kubectl delete svc"
alias kdd="kubectl delete deploy"
alias ksd="kubectl scale deploy"
alias kl="kubectl logs"
alias kl1h="kubectl logs --since 1h"
alias kl1m="kubectl logs --since 1m"
alias kl1s="kubectl logs --since 1s"
alias klf="kubectl logs -f"
alias klf1h="kubectl logs --since 1h -f"
alias klf1m="kubectl logs --since 1m -f"
alias klf1s="kubectl logs --since 1s -f"
alias kpf="kubectl port-forward"
alias keit="kubectl exec -it"
alias k9="k9s --readonly"

# npx
alias spj="npx sort-package-json"
alias rdt="npx react-devtools"
alias rn="npx react-native"
alias rnios="npx react-native run-ios"
alias rnand="npx react-native run-android"

# pnpm
alias p="pnpm"

# trans
alias tev="trans en:vi"

# g
alias gvm="$GOPATH/bin/g"

# Custom functions

# prettierd path/to/dir
prettierd () {
  npx prettier --write "$@/**/*.{js,jsx,ts,tsx,json,css,scss,md}"
}

# yarn start:
ystc () {
  yarn start:$@
}

# curl result time
curlt () {
    curl -w @- -o /dev/null -s "$@" << EOF
   time_namelookup: %{time_namelookup}\n
      time_connect: %{time_connect}\n
   time_appconnect: %{time_appconnect}\n
  time_pretransfer: %{time_pretransfer}\n
     time_redirect: %{time_redirect}\n
time_starttransfer: %{time_starttransfer}\n
                    --------\n
        time_total: %{time_total}\n
EOF
}

# fasd with fzf
fz() {
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

# react-native init
rninit () {
    npx react-native init $@ --template react-native-template-typescript
}
