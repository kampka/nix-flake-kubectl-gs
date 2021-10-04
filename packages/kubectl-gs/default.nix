{ pkgs }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "1.40.0";

  vendorSha256 = "sha256-CEUVp824mzK6EeRty4l/EgHOwu6CwaSrOVZjEhjl3Co=";

  doCheck = false;

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-RzU7HI6cpZDsMKxJL/3KmxlaISJgEN/kvwnSczIxQ1o=";
  };

  meta = with pkgs.lib; {
    description = "The official Giant Swarm kubectl plug-in";
    homepage = https://github.com/giantswarm/kubectl-gs;
    license = licenses.asl20;
  };
}
