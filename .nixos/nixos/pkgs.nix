{ config, pkgs, ...}: {

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # CLI Tools
    vim
    git
    tmux
    tree
    tldr
    bat
    ripgrep
    fd
    fzf
    jq
    # Network and files
    wget
    curl
    unzip
    stow
    # Monitors
    nvtop
    btop
    iotop
    iftop
    # Applications
    ncspot
    wezterm
    # Misc
    zathura
    fortune
    drawing
    xclip
    jetbrains-mono
  ];

}
