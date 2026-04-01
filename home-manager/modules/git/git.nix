{
  programs.git = {
    enable = true;
    settings = {
      credential.helper = "store";
      user = {
        name = "roman";
        email = "roman@entersight.ru";
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
