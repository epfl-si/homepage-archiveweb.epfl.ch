Contributing
============

Setup
-----

Clone repository

```bash
git clone git@github.com:epfl-si/homepage-archiveweb.epfl.ch.git
```

Export `bin` folder to `PATH` and environment variables

```bash
export PATH=$PATH:/path/to/homepage-archiveweb.epfl.ch/bin

export ARCHIVE_WEB_SSH_USER=...
export ARCHIVE_WEB_FTP_USER=...
export ARCHIVE_WEB_FTP_PASS=...
```

To retrieve the list of archived websites:

```bash
docker build -t archiveweb-apache .
```

Run
---

This will start a server on http://localhost:9191

```bash
docker run -d --name archive-homepage -p 9191:80 archiveweb-apache
```

To archive a lab

```bash
archive-wp-lab.sh <lab name>
```

To archive a site

```bash
archive-generic-site.sh <website url>
```

Examples :

```bash
archive-wp-lab.sh fsl
archive-wp-lab.sh tis

archive-generic-site.sh https://hobelblog.epfl.ch
```

Deploy
------

To deploy useful `bin` and `htdocs` files:

```bash
deploy-archive-web.sh
```

Release
-------

1. Update the file [CHANGELOG.md](CHANGELOG.md)

2. Create a tag  
`git tag -a <version_number> -m "Web Archives - <version_number>"`  
`git push origin master --tags`

License
-------

Apache License 2.0

(c) ECOLE POLYTECHNIQUE FEDERALE DE LAUSANNE, Switzerland, VPSI, 2017-2020.

See the [LICENSE](LICENSE) file for more details.
