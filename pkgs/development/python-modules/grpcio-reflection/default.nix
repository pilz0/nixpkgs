{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  grpcio,
  protobuf,
}:

# This package should be updated together with the main grpc package and other
# related python grpc packages.
# nixpkgs-update: no auto update
buildPythonPackage rec {
  pname = "grpcio-reflection";
  version = "1.71.0";
  pyproject = true;

  src = fetchPypi {
    pname = "grpcio_reflection";
    inherit version;
    hash = "sha256-UVBOl3BX/6vmbR7VVVexXpacQrs6HyjuRdcw3V+YO7U=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "grpcio"
    "protobuf"
  ];

  dependencies = [
    grpcio
    protobuf
  ];

  pythonImportsCheck = [ "grpc_reflection" ];

  # no tests
  doCheck = false;

  meta = with lib; {
    description = "Standard Protobuf Reflection Service for gRPC";
    homepage = "https://pypi.org/project/grpcio-reflection";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ happysalada ];
  };
}
