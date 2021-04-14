{ pkgs ? import <unstable> {} }:

let
  shellname = "drag";
  mach-nix = import (
  builtins.fetchGit {
      url = "https://github.com/DavHau/mach-nix/";
      ref = "2.0.0";
    }
  );

  mods = mach-nix.mkPython {
    python = pkgs.python38;
    requirements = ''
      pandas
      matplotlib
      arcade
    '';
  };
  myRust = with pkgs; [ rustc cargo rustfmt ];
in
  pkgs.mkShell {
    name = shellname;
    buildInputs = [
      mods
      myRust
      pkgs.nim
    ];
    shellHook = ''
      export NIX_SHELL_NAME='${shellname}'
      alias p='python3'
      alias nc='nim c main.nim'
      alias n='./main.nim'
    '';
  }

