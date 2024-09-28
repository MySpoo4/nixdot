{ inputs, ... }:
{
  modifications = final: prev: {
    # zellij = prev.zellij.overrideAttrs (previousAttrs: rec {
    #   version = "0.41.0";
    #   src = inputs.zellij;
    #   cargoDeps = previousAttrs.cargoDeps.overrideAttrs {
    #     name = "${previousAttrs.pname}-${version}-vendor.tar.gz";
    #     inherit src;
    #     outputHash = "sha256-0O+9Om4JA4YQW+gkoQW3t1ZaTSv3N5Tv/xP2ri3Sc2Q=";
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
