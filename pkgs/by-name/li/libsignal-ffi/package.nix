{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  runCommand,
  xcodebuild,
  protobuf,
  boringssl,
  darwin,
}:
let
  # boring-sys expects the static libraries in build/ instead of lib/
  boringssl-wrapper = runCommand "boringssl-wrapper" { } ''
    mkdir $out
    cd $out
    ln -s ${boringssl.out}/lib build
    ln -s ${boringssl.dev}/include include
  '';
in
rustPlatform.buildRustPackage rec {
  pname = "libsignal-ffi";
  # must match the version used in mautrix-signal
  # see https://github.com/mautrix/signal/issues/401
  version = "0.64.1";

  src = fetchFromGitHub {
    fetchSubmodules = true;
    owner = "signalapp";
    repo = "libsignal";
    rev = "v${version}";
    hash = "sha256-36z8Tgf3w0ZDLOS7hMTeVbZLiq/M/es6+sL8rEWtps4=";
  };

  buildInputs = lib.optional stdenv.hostPlatform.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  nativeBuildInputs = [
    protobuf
    rustPlatform.bindgenHook
  ] ++ lib.optionals stdenv.hostPlatform.isDarwin [ xcodebuild ];

  env.BORING_BSSL_PATH = "${boringssl-wrapper}";
  env.NIX_LDFLAGS = "-lstdc++";

  # The Cargo.lock contains git dependencies
  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "boring-4.13.0" = "sha256-+0LeCN4YtHe84GzkMZog8gCTvrzVNoAYXv04jQXZaUo=";
      "intmap-2.0.0" = "sha256-PGlkaZl+DYS4QkpJFfUf+2unVKwd9vLNF0N+/YFg8qE=";
      "curve25519-dalek-4.1.3" = "sha256-bPh7eEgcZnq9C3wmSnnYv0C4aAP+7pnwk9Io29GrI4A=";
    };
  };

  cargoBuildFlags = [
    "-p"
    "libsignal-ffi"
  ];

  meta = with lib; {
    description = "C ABI library which exposes Signal protocol logic";
    homepage = "https://github.com/signalapp/libsignal";
    license = licenses.agpl3Plus;
    maintainers = with maintainers; [ niklaskorz ];
  };
}
