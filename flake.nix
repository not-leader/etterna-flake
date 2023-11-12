{
  description = "A very basic flake";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: 
    let 
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
     {
      packages.x86_64-linux.etterna = pkgs.callPackage ./etterna { };

      packages.x86_64-linux.default = self.packages.x86_64-linux.etterna;
      };
}
