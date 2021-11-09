{ pkgs }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "1.46.0";

  vendorSha256 = "sha256-HGA5fsT7/I6z2EnXikHmAMqlDzcn6cQDnwEezCakkFs=";

  doCheck = false;

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-jn/Yq0ee8Dgr1j5XWt3PBvALPywgf9HcZGyqfwRygmU=";
  };

  meta = with pkgs.lib; {
    description = "The official Giant Swarm kubectl plug-in";
    homepage = https://github.com/giantswarm/kubectl-gs;
    license = licenses.asl20;
  };
}
