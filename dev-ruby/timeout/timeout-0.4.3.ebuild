# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 ruby33 ruby34"

RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="timeout.gemspec"

inherit ruby-fakegem

DESCRIPTION="Provides a framework for message digest libraries"
HOMEPAGE="https://github.com/ruby/timeout"
SRC_URI="https://github.com/ruby/timeout/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~arm64-macos ~ppc-macos ~x64-macos ~x64-solaris"
IUSE="test"

ruby_add_bdepend "test? ( dev-ruby/test-unit dev-ruby/test-unit-ruby-core )"

all_ruby_prepare() {
	sed -e 's/__dir__/"."/' \
		-e 's/__FILE__/"'${RUBY_FAKEGEM_GEMSPEC}'"/' \
		-e 's/git ls-files -z/find * -print0/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
