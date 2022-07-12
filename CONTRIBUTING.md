Contributing
============

Prerequisites
-------------

* Access to our Keybase `/keybase/team/epfl_archiveweb` directory.
* Access to EPFL's OpenShift and namespace `blogs-wiki-prod`.

Help
-----

```bash
make help
```

Build / Run
-----------

```bash
make build
make up
```

This will start a server on http://localhost:8080

Deploy
------

```bash
./ansible/archivewebsible --prod
```

Release
-------

1. Update the file [CHANGELOG.md](CHANGELOG.md)

2. Create a tag  
`git tag -a <version_number> -m "Web Archives - <version_number>"`  
`git push origin master --tags`
