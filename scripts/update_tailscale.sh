#!/bin/bash
if ! [[ "$(command -v tailscale)" ]]; then
    curl -fsSL https://tailscale.com/install.sh | sh
fi
