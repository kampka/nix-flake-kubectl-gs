{ pkgs }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "1.41.0";

  vendorSha256 = "sha256-Dl6A2mkY/jsVGlzSu3LVK0DcggQpbqhzv4OIsPfIWvg=";

  doCheck = false;

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-kB+Hz2JpSgplbxHFvDWabGPZPY2fhLZo6BUSEmROy3c=";
  };

  meta = with pkgs.lib; {
    description = "The official Giant Swarm kubectl plug-in";
    homepage = https://github.com/giantswarm/kubectl-gs;
    license = licenses.asl20;
  };
}
