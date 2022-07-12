#!/usr/bin/env sh

# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2020.

die() {
  echo $* >&2
  exit 1
}

[ -n "$1" ] || die "Please provide a url."

ARCHIVES_DIR=archives

rm -fr $ARCHIVES_DIR
mkdir $ARCHIVES_DIR
cd $ARCHIVES_DIR

mirror-website.sh "$1"
