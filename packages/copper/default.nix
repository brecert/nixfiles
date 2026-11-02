{ lib
, gcc13Stdenv
, makeWrapper
, libllvm
, getopt
, libffi
, libtinfo
, gcc13
}:

gcc13Stdenv.mkDerivation rec {
  pname = "copper";
  version = "11.1";

  src = fetchTarball {
    url = "https://tibleiz.net/download/copper-${version}-src.tar.gz";
    sha256 = "sha256-xAuim/W0IJqIFj0U0yXuTUWS1onSY8Y4APGZAqWZkFQ=";
  };

  nativeBuildInputs = [
    makeWrapper
    libllvm
    libffi
    libtinfo
  ];

  buildInputs = [
    getopt
  ];

  postPatch = ''
    patchShebangs ./scripts/copper
    substituteInPlace Makefile lib/std/Makefile \
      --replace-fail 'prefix = /usr/local' "prefix = $out"
  '';

  postFixup = ''
    wrapProgram $out/bin/copper \
      --prefix PATH : ${lib.makeBinPath [ getopt gcc13 ]} \
      --set-default COPPER_BINDIR "$out/bin/" \
      --set-default COPPER_INCLUDE "-I $out/share/copper/include" \
      --set-default COPPER_LIBRARY "-L $out/lib"
  '';

  meta = with lib; {
    description = "Programming language that can be used as a replacement to C";
    mainProgram = "copper";
    homepage = "https://tibleiz.net/copper/";
    license = licenses.bsd2;
    platforms = platforms.linux;
  };
}
