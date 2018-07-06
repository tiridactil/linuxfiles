home=${readlink ~}

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=${home}/.oh-my-zsh
export REMOTEUSER=${USER}

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || [ -n "$SSH_CONNECTION" ]; then
	ZSH_THEME="bureau"
else
	ZSH_THEME="powerlevel9k/powerlevel9k"
	source ${home}/.zshrc.pl9k
fi

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
fpath=(${home}/local/completion $fpath)
export VULKAN_SDK="${home}/software/vulkan/VulkanSDK/1.0.65.0/x86_64"
export PATH="${home}/local/bin:${VULKAN_SDK}/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export C_INCLUDE_PATH="${home}/local/include"
export CPLUS_INCLUDE_PATH="${home}/local/include"
export LD_LIBRARY_PATH="${home}/local/lib:${VULKAN_SDK}/lib:${LD_LIBRARY_PATH}"
export VK_LAYER_PATH="${VULKAN_SDK}/etc/explicit_layer.d"
# export MANPATH="/usr/local/man:$MANPATH"

export CXX='clang++'

#My custom tools for cleaning headers
export IWYU_HOME=${home}/software/clang-hdr-clean

source $ZSH/oh-my-zsh.sh

# Export the ssh authentication address on startup so it can be used by cron
touch ${home}/.cron_ssh_auth
chmod 600 ${home}/.cron_ssh_auth
env | grep SSH_AUTH_SOCK > ${home}/.cron_ssh_auth
echo 'export SSH_AUTH_SOCK' >> ${home}/.cron_ssh_auth

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source ~/.alias

#Load nvm (node version manager for node js)
#export NVM_DIR="${home}/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#nvm use --delete-prefix v6.9.5 --silent

# run tmux
[[ $- != *i* ]] && return
if [ -n "$TMUX" ]; then
else
	exec tmux -u
fi
