{...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/main.nix
  ];

  virtualisation.docker = {
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot = {
    kernel.sysctl."net.ipv4.conf.all.forwarding" = "1";
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Enable networking
  networking = {
    hostName = "collaps1ng";
    networkmanager.enable = true;
    extraHosts = ''
        0.0.0.0 internal-gitlab.local
      #  0.0.0.0 beta-adm.fermerskiyostrovok.ru
      #  0.0.0.0 test-admin-api.fermerskiyostrovok.ru
      #  0.0.0.0 beta.fermerskiyostrovok.ru
      #  0.0.0.0 test-api.fermerskiyostrovok.ru
      #  0.0.0.0 stage-paint-butto-fsdycs.fermerskiyostrovok.ru
      #  0.0.0.0 s3.fermerskiyostrovok.ru
    '';
    # Open ports in the firewall.
    firewall = {
      enable = false;
      allowedTCPPorts = [10000 9999 9876];
      # extraCommands = ''
      #   iptables -P FORWARD ACCEPT
      # '';
    };
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  services = {
    # Enable CUPS to print documents.
    printing.enable = false;
    # Enable sound with pipewire.
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
    openssh.enable = true;
  };

  security = {
    rtkit.enable = true;
    pki.certificateFiles = [/ca.crt];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "24.05"; # Did you read the comment?
}
