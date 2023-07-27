#!/bin/bash

# Remap tmux leader
unbind C-b
set -g prefix C-Space

# Copy mode <C-Space><Space>
bind Space copy-mode
bind -T copy-mode-vi i send -X cancel
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

# Goto last pane <C-space><C-space>
bind C-Space select-pane -l
# Goto last tab <C-space><Tab>
bind Tab last-window
# Navigate tree <C-space><CR>
bind Enter choose-tree
# Jump to session <C-space><BSpace>
bind BSpace splitw -v ~/.local/bin/tmux-sessionizer

# Source config <C-Space><S-Space>
bind S-Space source-file ~/.tmux.conf \; display-message 'Reloaded tmux config'
# Spotify session <C-space>;
bind \; new-session -s spotify ncspot \; rename-window ncspot

# Splits <C-Space>s, <C-Space>v
bind s split-window -v -c "#{pane_current_path}"
bind v split-window -h -c "#{pane_current_path}"
# Close pane <C-space>q
bind q kill-pane  # TODO replace default q
# Maximise pane <C-space>o
bind o resize-pane -Z  # TODO replace default o
# Move pane to new window <C-Space>T
bind T break-pane
# Vim-like navigate panes <C-Space>h/j/k/l
bind h       if -F '#{pane_at_left}'   '' 'select-pane -L'
bind j       if -F '#{pane_at_bottom}' '' 'select-pane -D'
bind k       if -F '#{pane_at_top}'    '' 'select-pane -U'
bind l       if -F '#{pane_at_right}'  '' 'select-pane -R'  # TODO replace default l
# Vim-like move panes <C-Space>H/J/K/L
bind H splitw -fhb \; swapp -t ! \; killp -t !
bind L splitw -fh  \; swapp -t ! \; killp -t !
bind J splitw -fv  \; swapp -t ! \; killp -t !
bind K splitw -fvb \; swapp -t ! \; killp -t !  # TODO replace default L

# Resize panes
bind -n 'M-Left'  resize-pane -L 8
bind -n 'M-Down'  resize-pane -D 4
bind -n 'M-Up'    resize-pane -U 4
bind -n 'M-Right' resize-pane -R 8

# Swap windows easily
bind -r P swap-window -t -1 \; previous-window
bind -r N swap-window -t +1 \; next-window

# Disable <C-space>+<arrow> accidental resizing
unbind -T prefix C-Left
unbind -T prefix C-Down
unbind -T prefix C-Up
unbind -T prefix C-Right

# Disable clock-mode (seriously why is this a default bind?)
unbind t

# Rebind arrows for navigation to disable repeatable bind
bind Left  select-pane -L
bind Down  select-pane -D
bind Up    select-pane -U
bind Right select-pane -R
