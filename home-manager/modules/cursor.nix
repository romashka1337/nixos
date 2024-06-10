{pkgs, ...}: {
  home = {
    pointerCursor = let
      getFrom = url: hash: name: {
        inherit name;
        gtk.enable = true;
        x11.enable = true;
        size = 24;
        package = pkgs.runCommand "moveUp" {} ''
          mkdir -p $out/share/icons
          ln -s ${pkgs.fetchzip {
            inherit url hash;
          }} $out/share/icons/${name}
        '';
      };
    in
      getFrom
      "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.0/Fuchsia-Pop.tar.gz"
      "sha256-BvVE9qupMjw7JRqFUj1J0a4ys6kc9fOLBPx2bGaapTk="
      "Fuchsia-Pop";
  };
}
