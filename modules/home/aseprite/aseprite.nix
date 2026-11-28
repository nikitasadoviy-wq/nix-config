
{ pkgs, disableAseprite ? false, ... }:

{
  home.packages =
    if disableAseprite then
      [ ]
    else
      [ pkgs.aseprite ];
}
