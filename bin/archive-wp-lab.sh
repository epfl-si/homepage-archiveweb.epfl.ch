#!/usr/bin/env sh

# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2020.
# See the LICENSE file for more details.

die() {
  echo $* >&2
  exit 1
}

[ -n "$1" ] || die "Please provide the name of a lab."

LAB_NAME=$1
LAB_URL=https://www.epfl.ch/labs/${LAB_NAME}/
LAB_PATH=www.epfl.ch/labs/${LAB_NAME}

ICONS_PATH=wp-content/themes/wp-theme-2018/assets/icons
ICONS_URL=${LAB_URL}${ICONS_PATH}/icons.svg

LOGO_PATH=wp-content/themes/wp-theme-2018/assets/svg/
LOGO_URL=${LAB_URL}${LOGO_PATH}/epfl-logo.svg

ARCHIVE_URL=https://archiveweb.epfl.ch

ICONS_BF="window.svgPath = \"${ICONS_URL}\""
ICONS_AF="window.svgPath = \"${ARCHIVE_URL}/${LAB_NAME}.epfl.ch/${ICONS_PATH}/icons.svg\""

ARCHIVES_DIR=archives

rm -fr $ARCHIVES_DIR
mkdir $ARCHIVES_DIR
cd $ARCHIVES_DIR

mirror-website.sh "${LAB_URL}"

wget -q --show-progress ${ICONS_URL} -P ${LAB_PATH}/${ICONS_PATH}
wget -q --show-progress ${LOGO_URL} -P ${LAB_PATH}/${LOGO_PATH}

echo "\nReplacing icons url"
find-and-replace-string.py "${ICONS_BF}" "${ICONS_AF}"

echo "\nReplacing EPFL logo url"
replace-epfl-logo-url.sh

mv www.epfl.ch/labs/${LAB_NAME} ${LAB_NAME}.epfl.ch

rm -fr www.epfl.ch