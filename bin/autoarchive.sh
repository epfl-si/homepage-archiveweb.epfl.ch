#!/bin/sh
# echo "set ssl:verify-certificate no" >> ~/.lftp/rc

die() {
  echo $* >&2
  exit 1
}

[ -f .env ] &&  source .env

[ -n "$FTPPASS" ] || die "Please set FTPPASS env variable for archiveweb@archiveweb.epfl.ch (in .env file will also work)"
[ -n "$1" ] || die "Please provide a website name (I will append .epfl.ch)"

if [ ! -d ~/.lftp  ] ; then
  echo "set ssl:verify-certificate no" >> ~/.lftp/rc
fi

s=$1
h=${s}.epfl.ch

host $h | grep -q 128.178.222.20 || die "Site $h is not hosted on Jahia"

wget -p -k -E -m -e robots=off -w 2 --no-parent https://$h
lftp -u archiveweb,$FTPPASS -e "set ssl:verify-certificate no; mirror -R $h htdocs/$h; exit" archiveweb.epfl.ch

ssh kis@exopgesrv48.epfl.ch "sudo -u vftp /home/kis/bin/archiveWebsite.py $h && sudo /usr/sbin/apachectl configtest && sudo /usr/sbin/apachectl restart"

na="https://network.epfl.ch/epnet/sre.pl/name?adip=128.178.222.74&oldip=128.178.222.20&alias=$s"
echo "Open the following address with browswer and submit the form for 'Moving a CNAME (alias)'"
echo $na
[ "$(uname)" == "Darwin" ] && open -a safari "$na"
 
echo "Check if everything looks nice on the archive: http://archiveweb.epfl.ch/$h"
[ "$(uname)" == "Darwin" ] && open -a safari "http://archiveweb.epfl.ch/$h"

echo "Then, pass the ticket back to SI_WWW_SUIVI_SITE. The directory $h can now be deleted."
