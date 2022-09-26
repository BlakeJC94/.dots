# Tab completion cycling
# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'
# Display a list of the matching files
bind "set show-all-if-ambiguous on"
# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"
bind "set completion-ignore-case on"
# set single column for completion options
# bind 'set completion-display-width 1'


