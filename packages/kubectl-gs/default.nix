{ pkgs, makeWrapper, ... }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "2.25.0";

  vendorSha256 = "sha256-6PQVMKWPgBGKGt2iiBB0CWy/u+itjJGxIXDSd3BerUI=";

  doCheck = false;

  nativeBuildInputs = [ makeWrapper ];

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Qywlq/Eqi44CTraboCoJx50khrtF/dzolj9kZgfEm8Y=";
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
