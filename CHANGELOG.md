Changelog
=========

### v2.2.1 / 2022-12-05

  - Add extra package `docker` to the suitcase
  - Update Trivy from 0.29.2 to 0.35.0
  - Update nginx from 1.22.0 to 1.22.1
  - Update hadolint from 2.9.3 to 2.12.0
  - Disable hadolint rule DL3018 (pin version)
  - Disables the use of cookies to track connections
  - Force pull when the image already exist

### v2.2.0 / 2022-08-29

  - Add script to archive association
  - Add restart option and regroup config
  - Improve ansible config for docker images
  - Clean requirements

### v2.1.2 / 2022-08-23

  - Set `ansible_python_interpreter`
  - Fix shebang in `find-and-replace-string.py`
  - Fix paragraph in banner
  - Improve documentation for release and deploy

### v2.1.1 / 2022-07-19

  - Check for Keybase being present
  - Fix push condition to ghcr

### v2.1.0 / 2022-07-18

  - Add GitHub Actions build
  - Add hadolint linter
  - Build and push image in ghcr
  - Deploy images with Ansible

### v2.0.0 / 2022-07-13

  - Add archive date in banner
  - Add Ansible to handle infra on OpenShift
  - Use folder instead of host to navigate archive
  - Upgrade Docker environnement

### v1.3.3 / 2022-02-01

  - Fix text position in banner

### v1.3.2 / 2021-02-04

  - Fix archive-wp-lab script

### v1.3.1 / 2020-10-05

  - Add support of Feather icons

### v1.3.0 / 2020-03-09

  - Add script to deploy useful `bin` and `htdocs` files
  - Add GitHub Actions to create the release
  - Update links of GitHub organization to epfl-si
  - Fix padding in banner
  - Format robots.txt

### v1.2.1 / 2020-03-04

  - Clean folder structure

### v1.2.0 / 2020-02-04

  - Add scripts to archive an EPFL lab
  - Add robots.txt

### v1.1.0 / 2020-01-27

  - Add simple script to mirror a website
  - Improve layout of banner
  - Fix language order

### v1.0.1 / 2020-01-20

  - Add `CONTRIBUTING.md`
  - Add 4 spaces indent for Python in `.editorconfig`
  - Ignore folders `fonts` and `cdn-cgi`
