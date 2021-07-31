
# Enable unclutter if installed (hide mouse after inactivity)
if [ -x "$(command -v unclutter)" ]; then
    unclutter --timeout 4 --ignore-scrolling &
fi
