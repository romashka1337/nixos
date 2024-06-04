{pkgs, ...}: {
  home = {
    pointerCursor = let
      getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 8;
        package = pkgs.runCommand "moveUp" {} ''
          mkdir -p $out/share/icons
          ln -s ${pkgs.fetchzip {
            url = url;
            hash = hash;
          }} $out/share/icons/${name}
        '';
      };
    in
      getFrom
      "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.0/Fuchsia-Pop.tar.gz"
      "sha256-BvVE9qupMjw7JRqFUj1J0a4ys6kc9fOLBPx2bGaapTk="
      "Fuchsia-Pop";
    # pointerCursor = {
    #   package = pkgs.vanilla-dmz;
    #   name = "Vanilla-DMZ";
    #   size = 24;
    #   gtk.enable = true;
    #   x11 = {
    #     enable = true;
    #     defaultCursor = true;
    #   };
    # };
  };
}
