Resume
------

Tool for display the archived websites on the homepage of archiveweb.epfl.ch.

Installation
------------

* Deploy via FTP the following files in **'exopgesrv48:/var/www/vhosts/archiveweb.epfl.ch/htdocs/'**
  * index.html
  * index-fr.html
  * archived-websites.js


* Deploy via SCP the following script in **'exopgesrv48:/home/kis/bin'**:
  * fill-archivedwebsites-json.py


* Install a cronjob in kis user
  * command: `sudo -u vftp /home/kis/bin/fill-archivedwebsites-json.py`

Developer
---------
* [Olivier Bieler](https://github.com/obieler)

License
-------

Apache License 2.0

(c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2017-2018.

See the [LICENSE](LICENSE) file for more details.
