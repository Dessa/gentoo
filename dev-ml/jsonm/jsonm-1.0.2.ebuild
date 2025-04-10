# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit findlib

DESCRIPTION="Non-blocking streaming JSON codec for OCaml"
HOMEPAGE="https://erratique.ch/software/jsonm"
SRC_URI="https://erratique.ch/software/jsonm/releases/${P}.tbz"

LICENSE="ISC"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~riscv ~x86"

RDEPEND=">=dev-ml/uutf-1.0.0:=
	dev-lang/ocaml:=
	dev-ml/uchar:="
DEPEND="${RDEPEND}
	dev-ml/topkg
	dev-ml/ocamlbuild
	dev-ml/findlib"

src_compile() {
	ocaml pkg/pkg.ml build || die
}

src_install() {
	# Can't use opam-installer here as it is an opam dep...
	findlib_src_preinst

	local nativelibs=""
	use ocamlopt && nativelibs="$(echo _build/src/${PN}.cm{x,xa,xs,ti} _build/src/${PN}.a)"
	ocamlfind install ${PN} _build/pkg/META _build/src/${PN}.mli _build/src/${PN}.cm{a,i} ${nativelibs} || die

	use ocamlopt && newbin _build/test/jsontrip.native jsontrip
	dodoc CHANGES.md TODO.md README.md
}
