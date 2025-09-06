{
  description = "Reed's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    alejandra.url = "github:kamadorueda/alejandra/4.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # makes inputs avaiable to all modules
      specialArgs = {inherit inputs;};
      modules = [
        ./configuration.nix
      ];
    };
  };
}
