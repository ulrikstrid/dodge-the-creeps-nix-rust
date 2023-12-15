{ pkgs, lib, ... }:

{
  languages.rust = {
    enable = true;
    # https://devenv.sh/reference/options/#languagesrustchannel
    channel = "nightly";

    targets = [ "wasm32-unknown-emscripten" ];

    components = [ "rustc" "cargo" "clippy" "rustfmt" "rust-analyzer" "rust-src" ];
  };

  #pre-commit.hooks = {
  #  rustfmt.enable = true;
  #  clippy.enable = true;
  #};

  packages = [
    pkgs.godot_4
    pkgs.emscripten
  ] ++ lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk; [
    frameworks.Security
  ]);
}
