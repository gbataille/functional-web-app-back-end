with import (fetchTarball {
   url = https://github.com/nixos/nixpkgs/archive/a3b6b49eac9.tar.gz;
   sha256 = "1za2mvmc9nlxb91syd608fjrkm53rm658nflracy1js1a3nlaj06";
}) {};
haskellPackages.developPackage {
  root = ./.;
}
