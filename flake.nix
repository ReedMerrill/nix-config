{
  description = "Reed's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    ...
    } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # makes inputs avaiable to all modules
      specialArgs = {inherit inputs;};
      modules = [
        ./nixos/configuration.nix
      ];
    };
  };
}
