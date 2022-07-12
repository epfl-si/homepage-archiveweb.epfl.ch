#!/usr/bin/env sh

# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2020.

LOGO_BF="epfl-logo.svg%3Frefresh=now"
LOGO_AF="epfl-logo.svg"

find-and-replace-string.py "${LOGO_BF}" "${LOGO_AF}"
