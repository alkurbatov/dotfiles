# This file is a part of Dotfiles project
#
# Copyright (C) 2013-2023, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
#
# Dotfiles is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Dotfiles is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# Purprose:
# zsh configuration.

# Don't beep on errors
setopt No_Beep

# History parameters
# It is recommended to keep SAVEHIST == HISTSIZE
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zhistory

# Each line is added to the history as it is executed
setopt INC_APPEND_HISTORY

# Removes copies of lines still in the history list
setopt HIST_IGNORE_ALL_DUPS

# Drop empty strings from history
setopt HIST_REDUCE_BLANKS

# Remove no needed spaces (e.g. trailing)
setopt HIST_IGNORE_SPACE

# Expand PATH
typeset -U path

path=(~/work/bin)
path+=(~/.local/bin)

if [[ "${OSTYPE}" = darwin* ]]; then
    path+=("${HOMEBREW_PREFIX}/bin")
    path+=("${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin")
    path+=("${HOMEBREW_PREFIX}/opt/gnu-tar/libexec/gnubin")
    path+=("${HOMEBREW_PREFIX}/opt/openjdk/bin")
    path+=("${HOMEBREW_PREFIX}/opt/unzip/bin")
    path+=("${HOMEBREW_PREFIX}/opt/ruby/bin")
    path+=("$(gem environment gemdir)/bin")
fi

path+=(/usr/local/bin)
path+=(/usr/local/sbin)
path+=(/usr/bin)
path+=(/bin)
path+=(/usr/sbin)
path+=(/sbin)

# Well-known directories
cdpath+=(~/work/src)
cdpath+=(~/work/src/git.mts.ai)
cdpath+=(~/work/src/github.com)

# Load scripts
. ~/.zsh_aliases
. ~/.zsh_tools

# Tramp client (Emacs) sets TERM to dumb.
# It doesn't expect anything clever or beautiful if cmdline prompt.
if [[ $TERM == "dumb" ]]; then
    unsetopt zle
    PS1='$ '
    return
fi

# Collect terminal colors to use later (e.g. in PROMPT)
autoload -U colors && colors

# Allow to enter inside directory just using its name
setopt autocd

# Completition by Tab
autoload -Uz compinit
compinit

# When completing from the middle of the word,
# move the cursor to the end of the word
setopt always_to_end

# Spelling correction for commands
setopt correct

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init()
    {
        echoti smkx
    }

    function zle-line-finish()
    {
        echoti rmkx
    }

    zle -N zle-line-init
    zle -N zle-line-finish
fi

# Search in the commands history using arrow keys
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Enable bash-like incremental search
bindkey '^R' history-incremental-search-backward

# allow ctrl-a to move to the beginning of a line
bindkey '^a' beginning-of-line

# allow ctrl-e to move to the end of a line
bindkey '^e' end-of-line

# Mark ssh connection in cmdline prompt
if [ -n "${SSH_CLIENT}" ]; then
    text="ssh"
fi

# Enable prompt update on directory change
setopt prompt_subst

# Returns "*" if the current git branch is dirty.
function parse_git_dirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

# Returns "|stashed:N" where N is the number of stashed states (if any)
function parse_git_stash {
  local stash=`expr $(git stash list 2>/dev/null| wc -l)`

  if [ "${stash}" != "0" ]; then
    echo "|stashed:${stash}"
  fi
}

# Print git info
# Taken from:
# http://0xfe.blogspot.ru/2010/04/adding-git-status-information-to-your.html
git-prompt()
{
    local ref=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    if [ "${ref}" = "HEAD" ]; then
        ref="detached"
    fi

    if [ "${ref}" != "" ]; then
        echo "(${ref}$(parse_git_dirty)$(parse_git_stash)) "
    fi
}

# Format prompt
newline=$'\n'
PROMPT='%{$fg[blue]%}%2d%{$reset_color%} %{$fg[red]%}$(git-prompt)%{$reset_color%}%{$fg[yellow]%}%(1j.%j.)%{$reset_color%} $text${newline}> '

# Install zsh you-should-use plugin.
# $ git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.zsh/zsh-you-should-use
source ~/.zsh/zsh-you-should-use/you-should-use.plugin.zsh

# Install zsh fish-like syntax highlighting plugin
# $ git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Install zsh autosuggestions plugin
# $ git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions
# ! This plugin must be loaded the last.
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
