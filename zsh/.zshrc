# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git autojump )

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ------------------------------------------------------
DEFAULT_USER=$(whoami)
export PATH=/opt/homebrew/bin:$PATH

## syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Auto-completions
if type brew &>/dev/null; then
   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

   autoload -Uz compinit
   compinit
fi

## Auto-suggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH=/usr/local/bin/python3:$PATH
export PATH="/opt/homebrew/sbin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi



# Aliases
alias lc="colorls" # list with icon
alias lsi="logo-ls" # list with icon
alias lx="exa --icons" # list with icon
alias lxt="exa --icons -l --tree" # list with icon
alias cdh="cd ~"
# alias gco="git checkout $(git branch | fzf)"  #map git checkout open with fzf
# alias gcor="git checkout --track $(git branch --remote | fzf)"  #map git checkout open with fzf

# Enable tab completion for flags
source $(dirname $(gem which colorls))/tab_complete.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# ranger settings.
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# Fuzzy Finder
alias updatedb='sudo /usr/libexec/locate.updatedb'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND="fd --exclude={.wine,.git,.idea,.vscode,.sass-cache,node_modules,build,.local,.steam,.m2,.rangerdir,.ssh,.ghidra,.mozilla,} --type f --hidden --follow"

## Default
export FZF_DEFAULT_COMMAND='fd --type f --hidden'
export FZF_DEFAULT_OPTS="--no-height --layout=reverse --border --preview '~/bin/fzf-scope.sh {} '"

## CTRL_T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"

## ALT_C
export FZF_ALT_C_COMMAND="fd --type d . --hidden"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

## CTRL_R
export FZF_CTRL_R_OPTS="--height 30% --no-border --no-preview"

# fshow() function
# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --no-preview --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {} FZF-EOF"
}

function gitlog()
{
  git log --oneline $* | fzf -e --multi --preview="git show {+1}"
}

function gitcheckout()
{
  git checkout $(git branch -a) | fzf --preview="git log --oneline {1}"
}


## FZF keybindings
source /opt/homebrew/opt/fzf/shell/completion.zsh
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

# php
# export PATH="$PATH:/Applications/XAMPP/xamppfiles/bin"
export PATH="/Applications/XAMPP/xamppfiles/bin:$PATH"

# keybinds
bindkey -s '\er' "ranger^M"  #bind ALT+r to open ranger

# Launch app at startup.
neofetch
