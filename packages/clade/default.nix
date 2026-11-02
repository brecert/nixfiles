{ lib
, stdenv
, stdenvNoCC
, autoPatchelfHook
, qt5
, tibleiz
, python3
}:

stdenv.mkDerivation rec {
  pname = "clade";
  version = "0.10";

  src = fetchTarball {
    url = "https://tibleiz.net/download/clade-${version}-src.tar.gz";
    sha256 = "sha256-r33zT/MvZ022EJev811mZoCDA9NRX3Qx2gHwBoRUIuI=";
  };

  nativeBuildInputs = [
    qt5.wrapQtAppsHook
    tibleiz.copper
    python3
  ];

  buildInputs = [
    qt5.qtbase
  ];

  makeFlags = ["with-local-libs"];

  postPatch = ''
    substituteInPlace Makefile lib/std/Makefile lib/ui/Makefile \
      --replace-fail 'prefix = /usr/local' "prefix = $out"

    substituteInPlace lib/ui/Makefile \
      --replace-fail 'QINC=/usr/include/x86_64-linux-gnu/qt5' "QINC=${lib.getDev qt5.qtbase}/include"

    substituteInPlace lib/ui/bin/copper-ui-genres \
      --replace-fail '/usr/bin/env python3' ${python3.interpreter}
  '';

  meta = with lib; {
    description = "Folding text editor for Linux and Windows";
    mainProgram = "clade";
    longDescription = ''
      Clade is a folding text editor for Linux and Windows, designed to hierarchically structure any kind of text file and especially source code.
      It makes navigation through source code faster and easier.

      Clade is the successor of Code Browser, it drops links but it adds multi-cursor, line numbers and handles high resolution better on Windows.
    '';
    homepage = "https://tibleiz.net/clade/";
    license = licenses.gpl2;
    platforms = platforms.linux;
  };
}