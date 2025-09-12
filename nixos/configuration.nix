{
  config,
  pkgs,
  ...
}:
{
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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
    nameservers = [ "8.8.8.8" ];
    hostName = "collaps1ng";
    networkmanager = {
      enable = true;
      insertNameservers = [ "8.8.8.8" ];
    };
    extraHosts = ''
      0.0.0.0 internal-gitlab.local
    '';
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 1;
          to = 65535;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1;
          to = 65535;
        }
      ];
      extraCommands = '''';
    };
    wg-quick = {
      interfaces = {
        wg0.configFile = "/home/collaps1ng/.nixos/nixos/private/wg0.conf";
      };
    };
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  services = {
    # Enable CUPS to print documents.
    printing.enable = false;
    # Enable sound with pipewire.
    pulseaudio.enable = false;
    xserver = {
      xkb = {
        layout = "us,ru";
        variant = "qwerty,";
        options = "grp:win_space_toggle";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
      };
    };
  };

  environment.etc."sing-box/config.json" = {
    source = /home/collaps1ng/.nixos/nixos/private/sing-box.json;
    mode = "0700";
  };
  systemd.services = {
    NetworkManager-wait-online.enable = false;
    sing-box = {
      enable = true;
      # wantedBy = pkgs.lib.mkForce [];
      wantedBy = [ "multi-user.target" ];
      restartTriggers = [
        config.environment.etc."sing-box/config.json".source
      ];
      serviceConfig = {
        ExecStart = "${pkgs.sing-box}/bin/sing-box run -D /var/lib/sing-box -C /etc/sing-box";
        ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
        Restart = "on-failure";
        StateDirectory = "sing-box";
        StateDirectoryMode = "0700";
        RuntimeDirectory = "sing-box";
        RuntimeDirectoryMode = "0700";
      };
    };
  };

  security = {
    rtkit.enable = true;
    pki.certificateFiles = [ /ca.crt ];
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
