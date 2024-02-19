{ self, ... }:

{
  templates = {
    rust = {
      path = ./rust;
      description = "rust shell flake";
    };
  };
}
