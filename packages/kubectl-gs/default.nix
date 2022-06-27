{ pkgs, makeWrapper, ... }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "2.15.0";

  vendorSha256 = "sha256-R+DbrP4wriIE2szTVzEyULsEKiQsPTSIGBLmZim8Wc8=";

  doCheck = false;

  nativeBuildInputs = [ makeWrapper ];

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-IuAkWgufunvpQzym/7IL+tJd94vemRUadV60jYqEmac=";
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
