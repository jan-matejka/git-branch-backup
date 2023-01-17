#! /bin/sh

set -eux

SELF=${##*/}

die() {
  printf -->&2 "%s: %s" $SELF "$1"
  exit 1
}

while [ $# -gt 0 ]; do
case "${1:?}" in
os-setup)

printf "APT::Install-Recommends \"0\";" > /etc/apt/apt.conf.d/no-install-recommends

;; install-build)
# The install-build is to build runtime dependencies of git-branch-backup and it's testsuite since
# there are no packages.

# basics
x="git make"
# git-clone over https
x="$x ca-certificates"
# basex
x="$x libboost-dev g++"
# dram
x="$x dub"

apt-get install -y $x

;; update)

apt-get update -y
apt-get upgrade -y

;; install-sources)

git clone https://github.com/roman-neuhauser/basex.git &&
( \
    cd basex && \
    git checkout -q ce548e9 && \
    ./configure --with-boost=/usr && \
    make && \
    make install
)

git clone https://github.com/roman-neuhauser/fake.git && \
(
  cd fake && \
  git checkout -q 9f5c1dd && \
  ./configure && \
  make && \
  make install
)

git clone https://git.sr.ht/~rne/dram && \
(
  cd dram && \
  git checkout -q edfcabe && \
  make && \
  make install
)

bd=/usr/local/bin
test -f $bd/fake
test -f $bd/dram
test -f $bd/dram.bin
test -f $bd/basexy

;; install-runtime)
# The install-runtime "target" is actually runtime and build dependencies for git-branch-backup.

# basics
x="make"
# dram
x="$x libphobos2-ldc-shared94"
# git-branch-backup
x="$x zsh git"
# required to clone the git-branch-backup sources (atm by actions/checkout@v3 )
x="$x ca-certificates"
# man pages
x="$x python3-docutils"

apt-get install -y $x

;; cleanup)
rm -rf /var/cache/apt/* /var/lib/apt/*

;; *)
   die "invalid operand: $1"
esac

shift;
done
