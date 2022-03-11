{ pkgs, makeWrapper, ... }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "2.3.1";

  vendorSha256 = "sha256-OuJVvls4VnW9wrBdXH4AQ9PbhaBRUr1Vu7pPozpnjPA=";

  doCheck = false;

  nativeBuildInputs = [ makeWrapper ];

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-dQeLAtwEP8TmObh1c36bP4KZf0/0PSaIsYa28JrPvIU=";
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
