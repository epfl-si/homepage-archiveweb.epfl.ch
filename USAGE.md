USAGE
=====

Setup
-----

Export `bin` folder to `PATH`

```bash
export PATH=$PATH:/path/to/homepage-archiveweb.epfl.ch/bin
```

Run
---

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
