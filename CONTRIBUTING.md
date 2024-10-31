Contributing
============

Prerequisites
-------------

- Groups `vra_p_svc0041`.
- Keybase `epfl_archiveweb`.
- Access to ghcr.io via a personal access tokens (PATs).

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

This will start a server on [localhost:8080](http://localhost:8080).

Release
-------

1. Update the file [CHANGELOG.md](CHANGELOG.md)
2. Bump the tag in the inventory.
3. Create the tag  
`git tag -a <version_number> -m "Web Archives - <version_number>"`  
`git push origin master --tags`

Deploy
------

```bash
./ansible/archivewebsible --prod
```
