{
  description = "kubectl-gs - The official Giant Swarm kubectl plug-in";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        kubectl-gs = pkgs.callPackage ./packages/kubectl-gs { inherit pkgs; };
      in
      rec {
        defaultPackage = kubectl-gs;
        apps.kubectl-gs = flake-utils.lib.mkApp { drv = kubectl-gs; };
        defaultApp = apps.kubectl-gs;

        devShell =
          pkgs.mkShell {
            buildInputs = [
              pkgs.nixpkgs-fmt
            ];
          };
      });
}
