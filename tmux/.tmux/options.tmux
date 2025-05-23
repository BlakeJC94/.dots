#!/usr/bin/env bash

# Enable 256 color support
#set -g default-terminal "tmux-256color"
set -g default-terminal "xterm-256color"
set -as terminal-features ",gnome*:RGB"
#set -as terminal-overrides ",gnome*:Tc"
set -ag terminal-overrides ",xterm-256color:Tc"
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colors
# tmux colors

# Free up index 0 to move tabs to front
set -g base-index 1

# automatically renumber tmux windows
set -g renumber-windows on

# More responsive ESC
set -sg escape-time 20

set -g focus-events on

set -g set-titles on
set -g set-titles-string "#T"

# Use login shell (sources bashrc)
#set-option -g default-shell "/usr/bin/env bash"
# set-option -g default-command bash

# Mouse stuff
set -g mouse off

# Set vi-mode copy keybinds
setw -g mode-keys vi

# Set statusbar update interval
set-option -g status-interval 1

# Set tab names to auto-refresh to base dir names
set-option -g automatic-rename on
set-option -g automatic-rename-format "#((git -C #{pane_current_path} rev-parse --path-format=absolute --git-common-dir --abbrev-ref HEAD 2>/dev/null || echo #{s|/home/blake|~|:pane_current_path}) | sed 's|/\.git||' | sed 's|.*/||' | paste -s -d ':' | sed '/^$/d')"

# Window separators
set-option -wg window-status-separator " "

# Monitor window changes
set-option -wg monitor-activity on
set-option -wg monitor-bell on

# More characters for session name
set -g status-left-length 64

