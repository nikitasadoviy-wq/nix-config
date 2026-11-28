{ pkgs, fastInstall ? false, ... }:
{
  home.packages = with pkgs;
    if fastInstall then [
      nixd shfmt nixfmt
    ] else [
      nixd shfmt treefmt nixfmt
      gcc gdb gef cmake gnumake valgrind llvmPackages_20.clang-tools
      python3 python312Packages.ipython
    ];
}