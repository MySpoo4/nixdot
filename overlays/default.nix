{ inputs, ... }:
{
  modifications = final: prev: {
    # zellij = prev.zellij.overrideAttrs (previousAttrs: rec {
    #   version = "0.41.0";
    #   src = inputs.zellij;
    #   cargoDeps = previousAttrs.cargoDeps.overrideAttrs {
    #     name = "${previousAttrs.pname}-${version}-vendor.tar.gz";
    #     inherit src;
    #     outputHash = "sha256-FPYnYQwNu5QilY9ju2zd7M8unNQSrG4AkOwYg2BBvUc=";
    #   };
    # });

    # termusic = prev.termusic.overrideAttrs (previousAttrs: rec {
    #   version = "0.9.1";
    #   src = inputs.termusic;
    #   cargoDeps = previousAttrs.cargoDeps.overrideAttrs {
    #     name = "${previousAttrs.pname}-${version}-vendor.tar.gz";
    #     inherit src;
    #     outputHash = "sha256-4PprZdTIcYa8y7FwQVrG0ZBg7N/Xe6HDt/z6ZmaHd5Y=";
    #   };
    # });
  };
}
