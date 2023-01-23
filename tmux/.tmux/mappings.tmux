#!/bin/bash

# Remap tmux leader
unbind C-b
set -g prefix C-z
bind z send-keys C-z

# Mode
bind C-z copy-mode
bind -T copy-mode-vi i send -X cancel
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

# Reload
bind Z source-file ~/.tmux.conf \; display-message 'Reloaded tmux config'

# Launchers
bind-key \; new-session ncspot \; rename-window ncspot \; rename-session spotify
bind-key G splitw -v ~/.local/bin/tmux-sessionizer
bind BSpace command-prompt "find-window '%%'"
bind Enter choose-window

# Windows
bind c new-window -c "#{pane_current_path}"
bind C new-window
bind T break-pane
bind , command-prompt -I "#W" "rename-window '%%'"  # TODO remove
bind Tab last-window
# bind , previous-window
# bind . next-window
bind p previous-window
bind n next-window
# bind -r < swap-window -t -1 \; previous-window
# bind -r > swap-window -t +1 \; next-window
bind -r P swap-window -t -1 \; previous-window
bind -r N swap-window -t +1 \; next-window

# Panes/splits
# bind y next-layout
bind v split-window -h -c "#{pane_current_path}"
bind s split-window -v -c "#{pane_current_path}"
bind q kill-pane

# Disable <C-z>+<arrow> accidental resizing
unbind -T prefix C-Up
unbind -T prefix C-Down
unbind -T prefix C-Left
unbind -T prefix C-Right

# select-pane
bind 'Left'  if -F '#{pane_at_left}'   '' 'select-pane -L'
bind h       if -F '#{pane_at_left}'   '' 'select-pane -L'
bind 'Down'  if -F '#{pane_at_bottom}' '' 'select-pane -D'
bind j       if -F '#{pane_at_bottom}' '' 'select-pane -D'
bind 'Up'    if -F '#{pane_at_top}'    '' 'select-pane -U'
bind k       if -F '#{pane_at_top}'    '' 'select-pane -U'
bind 'Right' if -F '#{pane_at_right}'  '' 'select-pane -R'
bind l       if -F '#{pane_at_right}'  '' 'select-pane -R'
# resize-pane
bind -n 'M-Left'  resize-pane -L 8
bind -n 'M-Down'  resize-pane -D 4
bind -n 'M-Up'    resize-pane -U 4
bind -n 'M-Right' resize-pane -R 8
# swap-pane
bind H splitw -fhb \; swapp -t ! \; killp -t !
bind L splitw -fh  \; swapp -t ! \; killp -t !
bind J splitw -fv  \; swapp -t ! \; killp -t !
bind K splitw -fvb \; swapp -t ! \; killp -t !
bind 'S-Left'  splitw -fhb \; swapp -t ! \; killp -t !
bind 'S-Down'  splitw -fh  \; swapp -t ! \; killp -t !
bind 'S-Up'    splitw -fv  \; swapp -t ! \; killp -t !
bind 'S-Right' splitw -fvb \; swapp -t ! \; killp -t !
