
# Enable unclutter if installed (hide mouse after inactivity)
if [ -x "$(command -v unclutter)" ]; then
    unclutter --timeout 4 --ignore-scrolling &
fi

# Disable mouse acceleration
for id in $(xinput list | grep "pointer" | cut -d '=' -f 2 | cut -f 1); do
    xinput --set-prop $id 'libinput Accel Profile Enabled' 0, 1 2>/dev/null
done
# Confirm this works:
# ```bash
# $ xinput list-props {1..50} 2>/dev/null | fgrep 'libinput Accel Profile Enabled ('
# ```
# - should read `0, 1`
