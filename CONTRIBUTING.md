Contributing
============

Setup
-----

To retrieve the list of archived websites:

```bash
docker build -t archiveweb-apache .
```

Run
---

```bash
docker run -d --name archive-homepage -p 9191:80 archiveweb-apache
```

This will start a server on http://localhost:9191

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

Release
-------

1. Update the file [CHANGELOG.md](CHANGELOG.md)

2. Create a tag  
`git tag -a <version_number> -m "Web Archives - <version_number>"`  
`git push origin master --tags`

3. Create a release in GitHub ([here](https://github.com/epfl-idevelop/homepage-archiveweb.epfl.ch/releases))  
tag: <version_number>  
title: <version_number>  
description: -

License
-------

Apache License 2.0

(c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2017-2020.

See the [LICENSE](LICENSE) file for more details.
