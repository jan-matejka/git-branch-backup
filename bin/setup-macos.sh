#! /bin/sh

set -eux

brew install boost dub dmd make


git clone https://github.com/roman-neuhauser/basex.git &&
( \
    cd basex && \
    git checkout -q ce548e9 && \
    ./configure && \
    make && \
    sudo make install
)

git clone https://github.com/roman-neuhauser/fake.git && \
(
  cd fake && \
  git checkout -q 9f5c1dd && \
  ./configure && \
  make && \
  sudo make install
)

git clone https://git.sr.ht/~rne/dram && \
(
  cd dram && \
  git checkout -q edfcabe && \
  make && \
  sudo make install
)

bd=/usr/local/bin
test -f $bd/fake
test -f $bd/dram
test -f $bd/dram.bin
test -f $bd/basexy
