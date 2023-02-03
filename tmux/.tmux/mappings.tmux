#!/bin/bash

# Remap tmux leader
unbind C-b
set -g prefix C-z
bind z send-keys C-z

# Copy mode <C-z><C-z>
bind C-z copy-mode
bind -T copy-mode-vi i send -X cancel
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

# Disable <C-z>+<arrow> accidental resizing
unbind -T prefix C-Left
unbind -T prefix C-Down
unbind -T prefix C-Up
unbind -T prefix C-Right

# Rebind arrows for navigation to disable repeatable bind
bind Left  select-pane -L
bind Down  select-pane -D
bind Up    select-pane -U
bind Right select-pane -R

# Resize panes
bind -n 'M-Left'  resize-pane -L 8
bind -n 'M-Down'  resize-pane -D 4
bind -n 'M-Up'    resize-pane -U 4
bind -n 'M-Right' resize-pane -R 8

# Move panes
bind 'S-Left'  splitw -fhb \; swapp -t ! \; killp -t !
bind 'S-Down'  splitw -fh  \; swapp -t ! \; killp -t !
bind 'S-Up'    splitw -fv  \; swapp -t ! \; killp -t !
bind 'S-Right' splitw -fvb \; swapp -t ! \; killp -t !

# Launchers
bind G splitw -v ~/.local/bin/tmux-sessionizer
bind Z source-file ~/.tmux.conf \; display-message 'Reloaded tmux config'
bind \; new-session ncspot \; rename-window ncspot \; rename-session spotify
bind BSpace command-prompt "find-window '%%'"
bind Enter choose-window
bind Tab last-window

# Swap windows easily
bind -r P swap-window -t -1 \; previous-window
bind -r N swap-window -t +1 \; next-window

# Vim-like wincmd table <C-z><C-w> (Or <C-z>w)
bind w switch-client -T wincmd
bind C-w switch-client -T wincmd

# Panes/splits
bind -T wincmd v split-window -h -c "#{pane_current_path}"
bind -T wincmd s split-window -v -c "#{pane_current_path}"
bind -T wincmd q kill-pane
bind -T wincmd o resize-pane -Z
bind -T wincmd T break-pane
bind -T wincmd p select-pane -t '!'

# select-pane
bind -T wincmd h       if -F '#{pane_at_left}'   '' 'select-pane -L'
bind -T wincmd j       if -F '#{pane_at_bottom}' '' 'select-pane -D'
bind -T wincmd k       if -F '#{pane_at_top}'    '' 'select-pane -U'
bind -T wincmd l       if -F '#{pane_at_right}'  '' 'select-pane -R'
# bind -T wincmd 'Left'  if -F '#{pane_at_left}'   '' 'select-pane -L'
# bind -T wincmd 'Down'  if -F '#{pane_at_bottom}' '' 'select-pane -D'
# bind -T wincmd 'Up'    if -F '#{pane_at_top}'    '' 'select-pane -U'
# bind -T wincmd 'Right' if -F '#{pane_at_right}'  '' 'select-pane -R'
# swap-pane
bind -T wincmd H splitw -fhb \; swapp -t ! \; killp -t !
bind -T wincmd L splitw -fh  \; swapp -t ! \; killp -t !
bind -T wincmd J splitw -fv  \; swapp -t ! \; killp -t !
bind -T wincmd K splitw -fvb \; swapp -t ! \; killp -t !
