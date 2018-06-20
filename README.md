Resume
------

Tool for display the archived websites on the homepage of archiveweb.epfl.ch.

Setup
-----

To retrieve the list of archived websites:

```bash
wget https://archiveweb.epfl.ch/archived-websites.json
```

Run
---

This will start a server on http://localhost:8000

```bash
python -m SimpleHTTPServer
```

or

```bash
python3 -m http.server
```

Deploy
------

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
