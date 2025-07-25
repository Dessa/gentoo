# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=RJBS
DIST_VERSION=0.101344
inherit perl-module

DESCRIPTION="Moose types that check against Perl syntax"

SLOT="0"
KEYWORDS="amd64 ~arm64 x86"

RDEPEND="
	dev-perl/MooseX-Types
	dev-perl/Params-Util
	>=virtual/perl-version-0.820.0
"
BDEPEND="
	${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.780.0
	test? (
		>=virtual/perl-Test-Simple-0.960.0
	)
"
