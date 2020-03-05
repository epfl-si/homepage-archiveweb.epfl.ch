#!/usr/bin/env bash

# (c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2020.
# See the LICENSE file for more details.

die() {
  echo $* >&2
  exit 1
}

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

ask_for_confirmation() {
  printf "Deploy on the 'production' server (y/n) "
  read -n 1
  printf "\n"
}

# lftp installed?
[ -n "$(command -v lftp)" ] || die \
  "lftp command not found. sudo apt install lftp"

# ssh user and password defined?
[ -n "$ARCHIVE_WEB_SSH_USER" ] || die \
  "Please set ARCHIVE_WEB_SSH_USER env variable"

# ftp user and password defined?
[ -n "$ARCHIVE_WEB_FTP_USER" ] || die \
  "Please set ARCHIVE_WEB_FTP_USER env variable"

[ -n "$ARCHIVE_WEB_FTP_PASS" ] || die \
  "Please set ARCHIVE_WEB_FTP_PASS env variable"

# lftp config exists?
if [ ! -d ~/.lftp  ] ; then
  mkdir ~/.lftp/
  echo "set ssl:verify-certificate no" >> ~/.lftp/rc
fi

# Ask before deploy
ask_for_confirmation
if answer_is_yes; then

  # Copy frontend file
  lftp -u $ARCHIVE_WEB_FTP_USER,$ARCHIVE_WEB_FTP_PASS -e \
    "put -O htdocs/common/ homepage/common/warning.svg; \
     put -O htdocs/ homepage/archived-websites.js; \
     put -O htdocs/ homepage/index.fr.html; \
     put -O htdocs/ homepage/index.html; \
     put -O htdocs/ homepage/robots.txt; \
     exit" archiveweb.epfl.ch

  # Copy backend file
  scp bin/fill-archivedwebsites-json.py bin/archiveWebsite.py \
    $ARCHIVE_WEB_SSH_USER@exopgesrv48.epfl.ch:~/bin
else
  printf "\nAborting.\n"
fi
