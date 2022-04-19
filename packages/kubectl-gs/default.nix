{ pkgs, makeWrapper, ... }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "2.7.8";

  vendorSha256 = "sha256-W9Cp5chmyJcq7NR4f1qx1vLWefVJQBFv+rCaXwjpuo8=";

  doCheck = false;

  nativeBuildInputs = [ makeWrapper ];

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-lD4lrfXiZ/rtfqBisWqPGv0b8/m79aWZWW10SuOjiB8=";
  };

  postFixup = ''
    wrapProgram $out/bin/kubectl-gs --add-flags "--disable-version-check"
  '';

  meta = with pkgs.lib; {
    description = "The official Giant Swarm kubectl plug-in";
    homepage = https://github.com/giantswarm/kubectl-gs;
    license = licenses.asl20;
  };
}
