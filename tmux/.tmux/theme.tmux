#!/bin/bash
dark0_hard="#1D2021"
dark00="#202223"
dark0="#282828"
dark0_soft="#32302F"
dark1="#3C3836"
dark2="#504945"
dark3="#665C54"
dark4="#7C6F64"
light0_hard="#F9F5D7"
light0="#FBF1C7"
light0_soft="#F2E5BC"
light1="#EBDBB2"
light2="#D5C4A1"
light3="#BDAE93"
light4="#A89984"
bright_red="#FB4934"
bright_green="#B8BB26"
bright_yellow="#FABD2F"
bright_blue="#83A598"
bright_purple="#D3869B"
bright_aqua="#8EC07C"
bright_orange="#FE8019"
neutral_red="#CC241D"
neutral_green="#98971A"
neutral_yellow="#D79921"
neutral_blue="#458588"
neutral_purple="#B16286"
neutral_aqua="#689D6A"
neutral_orange="#D65D0E"
faded_red="#9D0006"
faded_green="#79740E"
faded_yellow="#B57614"
faded_blue="#076678"
faded_purple="#8F3F71"
faded_aqua="#427B58"
faded_orange="#AF3A03"
gray="#928374"

# Change window screen colors
set-option -wg mode-style bg="#{bright_green}",fg="#{dark1}"

# Default statusbar colors
set-option -g status-style bg="#{dark0_hard}",fg="#{light4}"

# Default window title colors
set-option -wg window-status-style bg="#{dark1}",fg="#{dark4}"

# Colors for windows with activity
set-option -wg window-status-activity-style bg="#{dark1}",fg="#{light4}"

# Colors for windows with bells
set-option -wg window-status-bell-style bg="#{dark1}",fg="#{bright_orange}"

# Active window title colors
set-option -wg window-status-current-style bg="#{bright_orange}",fg="#{dark1}"

# Active window background
set -g window-active-style bg="#{dark0_hard}"
set -g window-style bg="#{dark00}"

# Pane border
set-option -g pane-border-lines heavy
set-option -g pane-active-border-style bg="#{dark0_hard}",fg="#{dark0_hard}"
set-option -g pane-border-style bg="#{dark00}",fg="#{dark00}"
# set-option -g pane-active-border-style bg="#{dark0_hard}",fg="#{light4}"
# set-option -g pane-border-style bg="#{dark0_hard}",fg="#{dark1}"

# Message info
set-option -g message-style bg="#{bright_green}",fg="#{dark1}"

# Writing commands inactive
set-option -g message-command-style bg="#{light4}",fg="#{dark1}"

# Pane number display
set-option -g display-panes-active-colour $bright_orange
# set-option -g display-panes-colour $dark1

# # Clock
# set-option -wg clock-mode-colour $bright_orange

# Copy mode highlighting
%if #{>=:#{version},3.2}
    set-option -wg copy-mode-match-style "bg=#{bright_yellow},fg=#{dark1}"
    set-option -wg copy-mode-current-match-style "bg=#{light4},fg=#{dark1}"
%endif

# Statusbar formatting
set-option -g status-position bottom

set-option -g status-left "\
#[bg=#{light4}, fg=#{dark1}]\
#{?client_prefix,#[bg=#{bright_blue}],#[bg=#{light4}]}\
 #{session_name} \
#[bg=#{dark0_hard},fg=#{light4},nobold,noitalics,nounderscore]\
#{?client_prefix,#[fg=#{bright_blue}],#[fg=#{light4}]}\
#[bg=#{dark0_hard}, fg=#{dark0_hard}]\
 \
"
set-option -wg window-status-current-format "\
#[bg=#{dark1},fg=#{dark0_hard},nobold,noitalics,nounderscore]\
#[bg=#{bright_blue}, fg=#{dark1}]\
#{?window_zoomed_flag,#[fg=#{dark1}],#[fg=#{dark1}]}\
 #{window_index} #{window_name} \
#[bg=#{dark0_hard}, fg=#{dark0_hard}]\
"
set-option -wg window-status-format "\
#[bg=#{dark2}, fg=#{light4},noitalics]\
#{?window_zoomed_flag,#[fg=#{light4} bold],#[fg=#{light4}]}\
 #{window_index} #{window_name} \
#[bg=#{dark0_hard},fg=#{dark1},noitalics]\
"

set-option -g status-right "\
#[fg=#{dark1} nobold, nounderscore, noitalics]\
#[bg=#{light4}, fg=#{dark1}]\
 %Y-%m-%d │ %H:%M \
"
