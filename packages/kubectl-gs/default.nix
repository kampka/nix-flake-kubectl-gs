{ pkgs }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "1.43.0";

  vendorSha256 = "sha256-NDOEWGXtv0hUB03QoR/R+3cVDNTlxoS94P5B8n8sZkM=";

  doCheck = false;

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-6P3WpGmR+N6d4n0BXpqxgab3chhkrb6UMfPDGFYeO9s=";
  };

  meta = with pkgs.lib; {
    description = "The official Giant Swarm kubectl plug-in";
    homepage = https://github.com/giantswarm/kubectl-gs;
    license = licenses.asl20;
  };
}
