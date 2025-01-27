{ inputs, ... }:
{
  modifications = final: prev: {
    # ags = prev.ags.overrideAttrs (previousAttrs: rec {
    #   version = "1.8.2";
    #   src = inputs.ags;
    #   cargoDeps = previousAttrs.cargoDeps.overrideAttrs {
    #     name = "${previousAttrs.pname}-${version}-vendor.tar.gz";
    #     inherit src;
    #     outputHash = "sha256-4PprZdTIcYa8y7FwQVrG0ZBg7N/Xe6HDt/z6ZmaHd5Y=";
    #   };
    # });

    # zellij = prev.zellij.overrideAttrs (previousAttrs: rec {
    #   version = "0.41.1";
    #   src = inputs.zellij;
    #   cargoDeps = previousAttrs.cargoDeps.overrideAttrs {
    #     name = "${previousAttrs.pname}-${version}-vendor.tar.gz";
    #     inherit src;
    #     outputHash = "sha256-RndehVhXZs181MpASYzheNK0TfikhGK05hLPQYkUtwM=";
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
