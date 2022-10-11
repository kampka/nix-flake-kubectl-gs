{ pkgs, makeWrapper, ... }:

pkgs.buildGoModule rec {
  pname = "kubectl-gs";
  version = "2.24.0";

  vendorSha256 = "sha256-YyRy8ThwWgMFTeG4PkI1H7o7OWYSxq40HOw00Bvp+Uk=";

  doCheck = false;

  nativeBuildInputs = [ makeWrapper ];

  src = pkgs.fetchFromGitHub {
    owner = "giantswarm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-KiZyeOCoZ9n+fLjUILNWe/rydhq+uHND7A7QQsAnl/0=";
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
