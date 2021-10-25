{ pkgs }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "1.44.0";

  vendorSha256 = "sha256-GDFXW8606eMRdzj+urdQ2xRFaFA/An4CZwsSvbgGMrI=";

  doCheck = false;

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-9KG/bjGWxlxV3OyciysTiJgZoHHn+UNMNf8c5pQDhcM=";
  };

  meta = with pkgs.lib; {
    description = "The official Giant Swarm kubectl plug-in";
    homepage = https://github.com/giantswarm/kubectl-gs;
    license = licenses.asl20;
  };
}
