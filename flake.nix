{
  description = "Dream2nix auto-generated nodejs packages";

  inputs = {
    dream2nix.url = "github:nix-community/dream2nix/fix-index-apps";
  };

  outputs = inp:
    (inp.dream2nix.lib.makeFlakeOutputsForIndexes {
      source = ./.;
      systems = ["x86_64-linux"];
      indexes = {
        libraries-io = {
          platform = "npm";
          number = 5000;
        };
      };
      packageOverrides = {
        "^.*$".disable-build = {
          buildScript = ":";
        };
      };
    })
    // {
      checks = inp.self.packages;
    };
}
