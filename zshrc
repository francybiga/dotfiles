# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
#COMPLETION_WAITING_DOTS="true"

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
plugins=(git xcode zsh-autosuggestions)

# User configuration

#match_prev_cmd: Chooses the most recent match whose preceding history item matches the most recently executed command
#https://github.com/zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

SCRIPTS_PATH="/Users/francesco/Development/scripts"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$SCRIPTS_PATH:$SCRIPTS_PATH/ctagsScripts:$GOBIN:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
#Set UTF-8 Locale (needed for Powerline)
export LANG="it_IT.UTF-8"  
export LC_COLLATE="it_IT.UTF-8"  
export LC_CTYPE="it_IT.UTF-8"  
export LC_MESSAGES="it_IT.UTF-8"  
export LC_MONETARY="it_IT.UTF-8"  
export LC_NUMERIC="it_IT.UTF-8"  
export LC_TIME="it_IT.UTF-8"  
export LC_ALL=  

# PROMPTS

#Add the pip dir to $PATH (this was needed since the Powerline command wasn't found, see https://github.com/powerline/powerline/issues/685 for more info
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

#Start powerline daemon (this should make prompt more fast according to
#https://github.com/powerline/powerline/issues/1653)
powerline-daemon -q
# Powerline bash prompt
#. /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#old macs
#. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#. /usr/local/bin/powerline/bindings/zsh/powerline.zsh

# Newline after prompt
#NEWLINE=$'\n'
#PS1=$PS1$NEWLINE

# Pure prompt (https://github.com/sindresorhus/pure)
# Initialize the prompt system (if not so already) and choose pure:
autoload -U promptinit; promptinit
prompt pure

# Change the default prompt symbol color to green
PROMPT='%(?.%F{green}❯.%F{red}❯)%f '

# Show system time in prompt
# 247 is gray in xterm colors https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
PROMPT='%F{247}%* '$PROMPT

# For customizations check https://github.com/sindresorhus/pure/wiki
# Show exit code of all (piped) commands in RPROMPT
precmd_pipestatus() {
	RPROMPT="%F{247}${(j.|.)pipestatus}" 
}
add-zsh-hook precmd precmd_pipestatus

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#general aliases
alias hist='history'
alias hideDesktopIcons='defaults write com.apple.finder CreateDesktop false; killall Finder'
alias showDesktopIcons='defaults write com.apple.finder CreateDesktop true; killall Finder'
alias cdw='cd ~/Workspace' 
alias cdd='cd $HOME/Desktop'
alias cddw='cd $HOME/Downloads'

#swift aliases
#This fixes a problem with swift repl and homebrew python
#https://forums.swift.org/t/swift-repl-starts-with-error-when-homebrew-python-is-installed/12927/2
alias swift='PATH="/usr/bin:$PATH" swift'
alias sp='swift package'

#xcode aliases 
XCODE_PLUGINS='/Users/francesco/Library/Application Support/Developer/Shared/Xcode/Plug-ins'
alias cdxcplugins='cd $XCODE_PLUGINS'

#Fastlane aliases
#Handy alias to avoid typing "bundle exec" each time. See https://docs.fastlane.tools/getting-started/ios/setup/#use-a-gemfile 
alias fastlane='bundle exec fastlane'

#shortcuts for jumping to the main  app directory
APP=$HOME/Workspace/Prima
alias cdapp='cd $APP'

LEARNING='/Users/francesco/Library/Mobile Documents/com~apple~CloudDocs/Learning'
alias cdlearn='cd $LEARNING'

#use the MacVim version of Vim (installed with homebrew). The default one in high sierra doens't come with clibpoard support!
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vi='vim'
alias v='vim'

alias jessica='ssh Jessica@jessica.local'

#open a file in vim with readonly mode
alias vimr='vim -R'

#Colors and exclude dir on GNU Grep
ggrep='ggrep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

#how2 aliases
alias how2swift='how2 -l swift'
alias how2objc='how2 -l objective-c'
alias how2ios='how2 -l ios'
alias how2ruby='how2 -l ruby'
alias how2vim='how2 -l vim'
alias how2shell='how2 -l shell'
alias how2py='how2 -l python'

#git alias
alias gitPublishBranch='git push --set-upstream origin $(git_current_branch)'
alias gitCleanMergedBranches='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

#find aliases
#Find a text inside xib files (using find and grep)
alias findInXib='find . -name "*.xib" -print0 | xargs -0 grep'

#Docker aliases
alias dockImg='ruby ~/Development/dotfiles/zsh/betterdim.rb'
alias dockPs='ruby ~/Development/dotfiles/zsh/betterdps.rb'

#Virgilio aliases
alias vr="virgilio run -n"
alias vs="virgilio stop -n"
alias vb="virgilio bldimg -n"
alias vd="virgilio blddistr -n"
alias vc="virgilio command -n"

#define the env variable where Pods source file are placed (this is needed for "build.rb" to precompile pods)
export PODS='/Users/francesco/Workspace'

# cd into whatever is the forefront Finder window.
function cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

#NOTE: this should always be at THE END OF THE FILE (see https://github.com/zsh-users/zsh-syntax-highlighting)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
