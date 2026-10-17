{ lib
, stdenv
, fetchFromGitHub
, cmake
, pkg-config
, qt6
, kdePackages
}:

stdenv.mkDerivation rec {
  pname = "nm-tray";
  version = "0.5.1";

  src = fetchFromGitHub {
    owner = "palinek";
    repo = pname;
    rev = version;
    sha256 = "sha256-C6qBHxwNeS8ri1Q+G201G4gvYxw8KAgfIoDEsaF8W9M=";
  };

  nativeBuildInputs = [ cmake pkg-config qt6.qttools qt6.wrapQtAppsHook ];

  buildInputs = [ qt6.qtbase kdePackages.networkmanager-qt ];

  meta = with lib; {
    description = "Simple Network Manager frontend written in Qt";
    mainProgram = "nm-tray";
    homepage = "https://github.com/palinek/nm-tray";
    license = licenses.gpl2Plus;
    platforms = platforms.linux;
  };
}