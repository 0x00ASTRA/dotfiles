# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export ANDROID_HOME="/opt/android-sdk"
#export NDK_HOME="/opt/android-ndk"

export PATH="$ANDROID_HOME/tools:$PATH"



# --------------------------------{ ASTRA ]-----------------------------------------------

# add zigmod to PATH ( Package manager for zig )
export PATH="$PATH:$HOME/Zig/zigmod/zig-out/bin/"

# Unreal Engine
alias unreal-editor="/opt/unreal-engine/Engine/Binaries/Linux/UnrealEditor"
alias ue=unreal-editor

function obsidian() {
    cd $HOME/Obsidian
    ./*.AppImage
}

# Open WebUI
function open-webui() {
    ollama serve &
    $HOME/Open-WebUI/.venv/bin/open-webui serve
}
alias owu=open-webui

# vscodium
alias code=codium


# eza (replace ls)
function ls() {
    eza --icons "$@"
}
  
function la() {
    eza -l --icons --total-size -o "$@"
}

#  ZSH Auto-Complete
plugins=( 
    git
    zsh-autosuggestions
    
)

# Scripts
export PATH="$PATH:$HOME/.scripts/"

# Kerbal Space Program
export KSP_PATH="$HOME/KSP_linux"

function ksp() {
    cd $KSP_PATH
    "$KSP_PATH/run.sh"
}


# Fix Brave Browser SingletonLock
function unfuck-brave() {
    rm -rf $HOME/.config/BraveSoftware/Brave-Browser/SingletonLock
    echo "Brave is now officially unfucked! Proceed..."
}

alias ub=unfuck-brave
alias fix-brave=unfuck-brave
alias unlock-brave=unfuck-brave

# Python venv
function activate-venv() {
    source .venv/bin/activate
}

function venv() {
    python3 -m venv .venv
    activate-venv
}

alias activenv=activate-venv
alias avenv=activate-venv
# ---------------------------------------------------------------------------------------- 

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
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

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias vim=nvim
unalias ls 2>/dev/null
unalias la 2>/dev/null

alias aarch64-ld="/home/astraeus/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-elf/aarch64-none-elf/bin/ld"
alias aarch64-objcopy="/home/astraeus/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-elf/aarch64-none-elf/bin/objcopy"
alias aarch64-objdump="/home/astraeus/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-elf/aarch64-none-elf/bin/objdump"
alias aarch64-as="/home/astraeus/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-elf/aarch64-none-elf/bin/as"

# bun completions
[ -s "/home/astraeus/.bun/_bun" ] && source "/home/astraeus/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"$
export BRAVE_PASSWORD_STORE=basic
