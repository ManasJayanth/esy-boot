mk-src-dir:
	mkdir -p sources;

ocaml__AT__4__DOT__12__DOT__0__AT__d41d8cd9: mk-src-dir
	curl --silent -o sources/ocaml__AT__4__DOT__12__DOT__0__AT__d41d8cd9.tar https://registry.npmjs.org/ocaml/-/ocaml-4.12.0.tgz
	echo "2a979f37535faaded8aa3fdf82b6f16f2c71e284 *sources/ocaml__AT__4__DOT__12__DOT__0__AT__d41d8cd9.tar" | shasum -a 1 -c
	mkdir -p sources/ocaml__AT__4__DOT__12__DOT__0__AT__d41d8cd9
	tar --strip-components=1 -xf sources/ocaml__AT__4__DOT__12__DOT__0__AT__d41d8cd9.tar -C sources/ocaml__AT__4__DOT__12__DOT__0__AT__d41d8cd9

__AT__opam__s__dune__AT__opam__COLON__2__DOT__8__DOT__5__AT__01003f12: mk-src-dir
	curl --silent -o sources/__AT__opam__s__dune__AT__opam__COLON__2__DOT__8__DOT__5__AT__01003f12.tar https://opam.ocaml.org/cache/sha256/79/79011283fb74c7a27eb17ad752efbcc39b39633cbacc8d7be97e8ea869443629
	echo "79011283fb74c7a27eb17ad752efbcc39b39633cbacc8d7be97e8ea869443629 *sources/__AT__opam__s__dune__AT__opam__COLON__2__DOT__8__DOT__5__AT__01003f12.tar" | shasum -a 256 -c
	mkdir -p sources/__AT__opam__s__dune__AT__opam__COLON__2__DOT__8__DOT__5__AT__01003f12
	tar --strip-components=1 -xf sources/__AT__opam__s__dune__AT__opam__COLON__2__DOT__8__DOT__5__AT__01003f12.tar -C sources/__AT__opam__s__dune__AT__opam__COLON__2__DOT__8__DOT__5__AT__01003f12

__AT__esy-ocaml__s__substs__AT__0__DOT__0__DOT__1__AT__d41d8cd9: mk-src-dir
	curl --silent -o sources/__AT__esy-ocaml__s__substs__AT__0__DOT__0__DOT__1__AT__d41d8cd9.tar https://registry.npmjs.org/@esy-ocaml/substs/-/substs-0.0.1.tgz
	echo "59ebdbbaedcda123fc7ed8fb2b302b7d819e9a46 *sources/__AT__esy-ocaml__s__substs__AT__0__DOT__0__DOT__1__AT__d41d8cd9.tar" | shasum -a 1 -c
	mkdir -p sources/__AT__esy-ocaml__s__substs__AT__0__DOT__0__DOT__1__AT__d41d8cd9
	tar --strip-components=1 -xf sources/__AT__esy-ocaml__s__substs__AT__0__DOT__0__DOT__1__AT__d41d8cd9.tar -C sources/__AT__esy-ocaml__s__substs__AT__0__DOT__0__DOT__1__AT__d41d8cd9

fetch-sources: ocaml__AT__4__DOT__12__DOT__0__AT__d41d8cd9 __AT__opam__s__dune__AT__opam__COLON__2__DOT__8__DOT__5__AT__01003f12 __AT__esy-ocaml__s__substs__AT__0__DOT__0__DOT__1__AT__d41d8cd9
	 echo "Fetched"
