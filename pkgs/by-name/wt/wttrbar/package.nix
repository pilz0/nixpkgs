{
  lib,
  fetchFromGitHub,
  rustPlatform,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "wttrbar";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "bjesus";
    repo = "wttrbar";
    rev = version;
    hash = "sha256-+M0s6v9ULf+D2pPOE8KlHoyV+jBMbPsAXpYxGjms5DY=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-sv9hSTmq5J6s0PPBMJgaMUWBaRk0/NJV41nNDIj6MoY=";

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Simple but detailed weather indicator for Waybar using wttr.in";
    homepage = "https://github.com/bjesus/wttrbar";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ khaneliman ];
    mainProgram = "wttrbar";
  };
}
