
{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    profiles.default = {
      id = 0;
      name = "default";
      path = "default";
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
    };
  };

  home.file.".mozilla/firefox/default/chrome".source =
    ./firefox/chrome;
}
