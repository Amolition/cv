{
  description = "RenderCV Dev Shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells."${system}".default =
        with pkgs;
        mkShell {
          packages = [
            rendercv
          ];

          shellHook = ''
            rendercv --version
          '';
        };
    };
}
