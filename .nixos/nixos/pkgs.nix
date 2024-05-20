{ config, pkgs, ...}: {

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # CLI Tools
    vim
    git
    tree
    tldr
    # Network
    wget
    curl
    # Monitors
    # nvtop
    btop
    iotop
    iftop
    # Misc
    unzip
    zathura
    fortune
    stow
    drawing
    xclip
    jetbrains-mono
  ];

}
