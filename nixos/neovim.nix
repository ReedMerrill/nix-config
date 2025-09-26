{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim

    # formatters
    alejandra

    # Language Servers
    emmet-ls
  ];
}
