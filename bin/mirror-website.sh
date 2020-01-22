#!/usr/bin/env sh

# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2020.
# See the LICENSE file for more details.

die() {
  echo $* >&2
  exit 1
}

[ -n "$1" ] || die "Please provide a url."

wget -p -k -E -m -e robots=off -w 1 --no-parent -q --show-progress $1
