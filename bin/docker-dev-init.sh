wget -P /usr/local/apache2/htdocs/common/includes-web2018/ -N -nd -r -l 1 https://web2018.epfl.ch/download-me.html
wget -P /usr/local/apache2/htdocs/ https://archiveweb.epfl.ch/archived-websites.json
httpd -D FOREGROUND
