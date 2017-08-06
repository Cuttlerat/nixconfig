# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  hardware.pulseaudio.enable = true;

  networking.hostName = "rat"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  services.logind.extraConfig = "HandleLidSwitch=suspend\nHandleLidSwitchDocked=suspend" ;
  swapDevices = [
    { label = "swap"; }
  ];

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
   };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget

   nixpkgs.config = {
       allowUnfree = true;
   
       packageOverrides = pkgs: {
         neovim = pkgs.neovim.override {
           vimAlias = true;
       };
     };
   };
   
   environment.systemPackages = with pkgs; [
       apvlv
       wget
       firefox
       feh
       mpv
       copyq
       tdesktop
       termite
       termite.terminfo
       neovim
       pavucontrol
       dmenu2
       scrot
       screenfetch
       xclip
       copyq
       git
       htop
       pulseaudioLight
       rtorrent
       docker
       docker_compose
       xorg.xmodmap
       i3
       i3status
       i3lock
     ];

   fonts = {
     enableFontDir = true;
     enableGhostscriptFonts = true;
     fonts = with pkgs; [
       corefonts
       inconsolata
       ubuntu_font_family
       unifont
       terminus_font
       font-awesome-ttf
       powerline-fonts
     ];
   };
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
      enable = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      synaptics.enable = true;
      synaptics.twoFingerScroll = true;
      desktopManager.default = "none";
      desktopManager.xterm.enable = false;
      windowManager.default = "i3";
      windowManager.i3.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.extraUsers.rat = {
     isNormalUser = true;
     home = "/home/rat";
     extraGroups = [ "wheel" "networkmanager" ];
     uid = 1000;
   };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

}
