#!/usr/bin/env sh

# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2020.

die() {
  echo $* >&2
  exit 1
}

[ -n "$1" ] || die "Please provide the name of a lab."

LAB_NAME=$1
LAB_URL=https://www.epfl.ch/labs/${LAB_NAME}/
LAB_PATH=www.epfl.ch/labs/${LAB_NAME}

WP_THEME_PATH=wp-content/themes/wp-theme-2018

ICONS_PATH=${WP_THEME_PATH}/assets/icons
ICONS_URL=${LAB_URL}${ICONS_PATH}/icons.svg
FEATHER_URL=${LAB_URL}${ICONS_PATH}/feather-sprite.svg

LOGO_PATH=${WP_THEME_PATH}/assets/svg/
LOGO_URL=https://www.epfl.ch/${LOGO_PATH}/epfl-logo.svg

ARCHIVE_URL=https://archiveweb.epfl.ch

ICONS_BF="window.svgPath = \"${ICONS_URL}\""
ICONS_AF="window.svgPath = \"${ARCHIVE_URL}/${LAB_NAME}.epfl.ch/${ICONS_PATH}/icons.svg\""

FEATHER_BF="window.featherSvgPath = \"${FEATHER_URL}\""
FEATHER_AF="window.featherSvgPath = \"${ARCHIVE_URL}/${LAB_NAME}.epfl.ch/${ICONS_PATH}/feather-sprite.svg\""

ARCHIVES_DIR=archives

rm -fr $ARCHIVES_DIR
mkdir $ARCHIVES_DIR
cd $ARCHIVES_DIR

mirror-website.sh "${LAB_URL}"

wget -q --show-progress ${ICONS_URL} -P ${LAB_PATH}/${ICONS_PATH}
wget -q --show-progress ${FEATHER_URL} -P ${LAB_PATH}/${ICONS_PATH}
wget -q --show-progress ${LOGO_URL} -P ${LAB_PATH}/${LOGO_PATH}

echo "\nReplacing icons url"
find-and-replace-string.py "${ICONS_BF}" "${ICONS_AF}"

echo "\nReplacing feather icons url"
find-and-replace-string.py "${FEATHER_BF}" "${FEATHER_AF}"

echo "\nReplacing path fonts"
find-and-replace-string.py "../../../../../../fonts/" "/fonts/"

echo "\nReplacing EPFL logo url"
replace-epfl-logo-url.sh

mv www.epfl.ch/labs/${LAB_NAME} ${LAB_NAME}.epfl.ch

rm -fr www.epfl.ch
