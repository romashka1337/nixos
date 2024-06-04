{
  services.xserver = {
    enable = true;
    windowManager.herbstluftwm.enable = true;

    layout = "us";
    xkbVariant = "";

    libinput = {
      enable = true;
      touchpad.accelProfile = "flat";
    };

    deviceSection = ''Option "TearFree" "True"'';
  };
}
