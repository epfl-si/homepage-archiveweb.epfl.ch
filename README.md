Resume
------

- Homepage of archiveweb.epfl.ch that displays the liste of archived websites.

Dev setup
---------

To retrieve the list of archived websites:

```bash
docker build -t archiveweb-apache .
```

Dev run
-------

```bash
docker run -d --name archive-homepage -p 8080:80 archiveweb-apache
```
This will start a server on http://localhost:8080

Deploy
------

* Deploy via FTP the following files in **'exopgesrv48:/var/www/vhosts/archiveweb.epfl.ch/htdocs/'**
  * index.html
  * index-fr.html
  * archived-websites.js


* Deploy via SCP the following script in **'exopgesrv48:/home/kis/bin'**:
  * fill-archivedwebsites-json.py


* Install cron jobs in kis user
  * To fill json archived websites:  
  `0 1 * * * sudo -u vftp /home/kis/bin/fill-archivedwebsites-json.py`
  * To get web2018 includes for homepage:  
  `0 2 * * * sudo -u vftp wget -P /var/www/vhosts/archiveweb.epfl.ch/htdocs/common/includes-web2018/ -N -nd -r -l 1 https://web2018.epfl.ch/download-me.html`


Developers
----------

  * [Olivier Bieler](https://github.com/obieler)
  * [William Belle](https://github.com/williambelle)

License
-------

Apache License 2.0

(c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2017-2018.

See the [LICENSE](LICENSE) file for more details.
