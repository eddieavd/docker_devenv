# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/usr/local/Qt-6.3.1/bin:$PATH
export PATH=/opt/homebrew/opt/qt@5/bin:$PATH

#export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -Wl,-rpath,/opt/homebrew/opt/llvm/lib":$LDFLAGS

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="gnzh"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vim'  #  mvim by default
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
# alias vim='/usr/local/bin/vim'

function mcdir() {
    mkdir -p $1 && cd $1
}

function sponge() {
    args=$@
    vim +":Suponjibobu $args" +q!
}

# fuzzy cd
alias fcd="cd \"\$(fd -t d --full-path . | fzf || echo .)\""

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'

alias imgcat='$HOME/Documents/dev/script/imgcat.sh'
alias imgls='$HOME/Documents/dev/script/imgls.sh'
alias divider='$HOME/Documents/dev/script/divider.sh'

alias cat='bat'

alias python='python3'

# alias cpp_create='$HOME/Documents/dev/cpp/cpp_create/release/v1.0.0/create_project'
alias cpp_create='$HOME/Documents/dev/cpp/cpp_create/cmake-build-release/create_project'

alias cppfront='$HOME/Documents/dev/cpp/cppfront/master/build/cppfront'

# alias amalgam='$HOME/Documents/dev/cpp/amalgam/exe/amalgam'
alias alamgam='python3 $HOME/Documents/dev/py/cpp_amalgam/cpp-amalgamate/cpp-amalgamate/amalgamate.py'

alias drot='ssh drot'
alias sfdrotp='sftp drot'

alias halo_policija='ssh drot'

alias docker-ide='docker run --rm -it -u$(id -u):$(id -g)                    \
        --detach-keys="ctrl-z,z"                                              \
        --name docker-ide                                                      \
        --mount type=bind,source=$HOME/.oh-my-zsh,target=/home/edo/.oh-my-zsh   \
        --mount type=bind,source=$HOME/.ssh,target=/home/edo/.ssh                \
        --mount type=bind,source=$HOME/.vim,target=/home/edo/.vim                 \
        --mount type=bind,source=$HOME/.zshrc,target=/home/edo/.zshrc              \
        --mount type=bind,source=$HOME/.vimrc,target=/home/edo/.vimrc               \
        --mount type=bind,source=$HOME/docs,target=/home/edo/docs                    \
        --mount type=bind,source=$HOME/etc/passwd,target=/etc/passwd                  \
        --mount type=bind,source=$HOME/etc/group,target=/etc/group                     \
        --network host                                                                  \
        --privileged                                                                     \
        -w/home/edo'

alias docker-ide-old='docker run --rm -it -u$(id -u):$(id -g)                 \
	--detach-keys="ctrl-z,z"                                              \
	-v $HOME/.oh-my-zsh:/home/edo/.oh-my-zsh                              \
	-v $HOME/.ssh:/home/edo/.ssh                                          \
	-v $HOME/.vim:/home/edo/.vim                                          \
	-v $HOME/.zshrc:/home/edo/.zshrc                                      \
	-v $HOME/.vimrc:/home/edo/.vimrc                                      \
	-v $HOME/.docker-home:/home/edo                                       \
	-v $HOME/.gitconfig:/home/edo/.gitconfig                              \
	-v $HOME/Documents/dev:/home/edo/dev                                  \
	-v /etc/passwd:/etc/passwd:ro                                         \
	-v /private/etc/group:/etc/group:ro                                   \
	--network host                                                        \
	--privileged                                                          \
	-w/home/edo'

alias docker-ide-root='docker run --rm -it -u0:0               \
        --detach-keys="ctrl-z,z"                               \
        -v /home/eavdagic/.oh-my-zsh:/root/.oh-my-zsh          \
        -v /home/eavdagic/.ssh:/root/.ssh                      \
        -v /home/eavdagic/.vim:/root/.vim                      \
        -v /home/eavdagic/.zshrc:/root/.zshrc                  \
        -v /home/eavdagic/.vimrc:/root/.vimrc                  \
        -v /home/eavdagic/docs:/root/docs                      \
        -v /home/eavdagic/etc/passwd:/etc/passwd:ro            \
        -v /home/eavdagic/etc/group:/etc/group:ro              \
        --network host                                         \
        --privileged                                           \
        -w/root'

export PATH="/opt/homebrew/opt/bison/bin:$PATH"
