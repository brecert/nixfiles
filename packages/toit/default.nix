{ lib
, stdenv
}:

stdenv.mkDerivation rec {
  pname = "toit";
  version = "2.0.0";

  src = fetchTarball {
    url = "https://github.com/toitlang/toit/releases/download/v${version}/toit-linux-x64.tar.gz";
    sha256 = "sha256-/orJCPefsg2v5htjaypdV975Vrf+SB6SAFVyZ6pz4pE=";
  };

  installPhase = ''
    runHook preInstall

    cp -r . $out

    runHook postInstall
  '';
}