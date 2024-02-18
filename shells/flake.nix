{
  description = "shell templates";
  outputs = { self, ... }: {
    templates = {
      rust = {
        path = ./rust;
        description = "rust project";
      };
    };
  };
}
