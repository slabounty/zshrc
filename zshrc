# This is my personal .zshrc. I have taken most of the prompt setup
# from the http://peepcode.com page on zsh prompt and just tweaked
# it all a bit to use the colors I want and to make it work relative
# to my .zsh directory setup.

# Prompt
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/.zsh/bin/git-cwd-info.rb)%{$reset_color%}'

# Set the term to xterm at 16 colors rather than the xterm-256color mode
# which tells it to use 256 colors. It is important that terminal themes
# intended for 16 colors are used in 16 color mode and themes intended
# for 256 colors are used in 256 color mode. Otherwise, the colors won't
# look correct. This also goes for Vim color schemes.
#
# Currently I have this set to xterm in 16 color mode as I have chosen
# to use the ir_black terminal theme and ir_black vim theme which are
# both intended for 16 color mode.
export TERM=xterm-256color

# Environment
export PATH="$HOME/bin:$HOME/android-sdk-macosx/tools:$HOME/android-sdk-macosx/platform-tools:/usr/local/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/${JAVA_HOME}"
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export APPEND_HISTORY
export INC_APPEND_HISTORY
export HIST_EXPIRE_DUPS_FIRST   # allow dups, but expire old ones when I hit HISTSIZE
export HIST_FIND_NO_DUPS        # don't find duplicates in history
export HIST_IGNORE_ALL_DUPS     # ignore duplicate commands regardless of commands in between
export HIST_IGNORE_DUPS         # ignore duplicate commands
export HIST_REDUCE_BLANKS       # leave blanks out
export HIST_SAVE_NO_DUPS        # don't save duplicates
export SHARE_HISTORY            # share history between sessions

# set the number of open files to be 1024
ulimit -S -n 1024

# Enable vi's normal mode for editing the command line after you hit escape.
set -o vi

# This is necessary for the Ctrl-s keyboard shortcut to make it through to Vim
stty -ixon

# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Colors
autoload -U colors
colors
setopt prompt_subst
# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Alias history to h
# alias h="history"
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

# Alias clear
alias c="clear"
alias ls="ls -G"

# Git aliases
alias g="git"
alias gcb="git branch | grep '^\*'"
alias gb="git branch"
alias gsb='for k in `git branch|perl -pe "s/^..//"`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'
alias gdi="git diff"
alias gdc="git diff --cached"
compdef _git gfp=git-push

# rgrep
function rgrep() { grep -r $2 --include=\*.{erb,rb,js,scss} $1 . }

# Bundle aliases
alias be='bundle exec'
alias bec='be cucumber'
alias ber='be rspec --color'
alias beg='be guard'
alias cber='COVERAGE=true ber'

# Zeus aliases
alias z='zeus'
alias zc='z cucumber'
alias zr='z rspec --color'

# Rails Test Reset
alias betr='RAILS_ENV=test bundle exec rake db:migrate:reset'

# My default editor settings
export EDITOR="vim"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
