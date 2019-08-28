# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/ganxin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"
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
plugins=(
  git 
  autojump
  zsh-autosuggestions
)

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# ros
source /opt/ros/kinetic/setup.zsh
#source ~/ROS/DroidAI_ws/devel/setup.zsh
#source ~/ROS/articulated_vehicle/devel/setup.zsh
#履带车仿真
#source ~/ROS/ipc/devel/setup.zsh
#工控机远程
#source ~/ROS/ipc_real/devel/setup.zsh
#export ROS_MASTER_URI=http://10.42.0.79:11311
#export ROS_HOSTNAME=ganxin-ThinkPad-T430
#export ROS_IP=10.42.0.1
#履带车bag
#source ~/ROS/ipc_test_n/devel/setup.zsh
#履带车hector
source ~/ROS/ipc_test_hector/devel/setup.zsh


# 加入自动高亮插件
source /home/ganxin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 配置自动补全zsh-autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6' 
#更改颜色
bindkey ',' autosuggest-accept 
#更换快捷键

#安装了trash-cli插件，代替rm命令，被删除的文件会放入垃圾桶
#alias rm="trash"

#防止 copy 的时候覆盖已存在的文件, 带上 i 选项，文件已存在的时候，会提示，需要确认才能 copy#
#alias cp="cp -i"
alias cp2ros="rm -rf ~/ROS/ipc_real/src&&cp -r ~/git_resource/ipc_real/ipc/src ~/ROS/ipc_real "
alias cp2git="rm -rf ~/git_resource/ipc_real/ipc/src&&cp -r ~/ROS/ipc_real/src ~/git_resource/ipc_real/ipc "

#cat 某个文件，可以在终端直接输出文件内容，bat 相比 cat 增加了行号和颜色高亮

#ctrl+z 在vim 和 zsh终端之间切换 （默认是ctrl+z：vim到zsh，‘fg’是zsh到vim）
setopt no_nomatch
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
