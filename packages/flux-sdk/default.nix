{ lib
, buildDotnetGlobalTool
, dotnetCorePackages
}:

buildDotnetGlobalTool {
  pname = "Papaltine.FluxSDK";
  version = "1.10.0";

  dotnet-sdk = dotnetCorePackages.sdk_10_0;
  dotnet-runtime = dotnetCorePackages.runtime_10_0;

  executables = [ "flux-sdk" ];

  nugetHash = "sha256-j7zUB6DITqeQxkyLweLJo16hBAWBty7uwhetWpT6mmg=";
}