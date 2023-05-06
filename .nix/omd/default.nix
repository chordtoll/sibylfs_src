{ }:
let 
    pkgs = import <nixpkgs> {};
    stdenv = pkgs.stdenv;
    fetchurl = pkgs.fetchurl;
    ocaml = pkgs.ocaml-ng.ocamlPackages_4_01_0.ocaml;
    op = pkgs.ocaml-ng.ocamlPackages_4_01_0;
in stdenv.mkDerivation {
    name = "ocaml_omd";
  
    src = fetchurl {
      url = https://github.com/pw374/pw374.github.io/raw/oldmaster/distrib/omd/omd-1.2.6.tar.gz;
      sha256 = "4164fe538149e51e19c2bd786f5f817b7c2f6ba9d1376965d2e43d93d745aeb6";
    };

    buildInputs = [ ocaml op.findlib op.ocamlbuild ]; 
 
    configurePhase="
    mkdir -p $out/bin
    export bindir=$out/bin
    make configure
";

    installPhase = "
       mkdir -p $out/lib/ocaml/4.01.0/site-lib/
       make install
";

    createFindlibDestdir = true;

}
