Changelog
=========

### v3.3.0 / 2026-02-25

  - Simplify Dockerfile
  - Update link to documentation
  - Update Node.js to 24
  - Update nginx to 1.28.2
  - Update actions/checkout to v6
  - Update Elements to 5.7.0
  - Fix banner style

### v3.2.3 / 2025-06-12

  - Tweak cpu
  - Optimize CronJob execution
  - Remove epfl-logo script  
  - Update nginx to 1.28.0

### v3.2.2 / 2025-04-02

  - Add labels and annotations for Topology view
  - Simplify `ansible_python_interpreter`
  - Update nginx to 1.26.3
  - Update Node.js to 22
  - Update Elements to 5.2.0
  - Fix assets path for labs
  - Fix status badge

### v3.2.1 / 2024-11-26

  - Add label version for Deployment
  - Add VS Code extension for hadolint

### v3.2.0 / 2024-11-19

  - Add VS Code extension for nginx
  - Improve Ansible tags
  - Clean Ansible and Kubernetes Objects
  - Remove test environment

### v3.1.0 / 2024-11-04

  - Add Ansible-lint in VS Code
  - Add VS Code recommended extensions
  - Rewrite nginx restart
  - Remove local https
  - Update CONTRIBUTING for OpenShift 4

### v3.0.0 / 2024-10-29

  - Migrate to OpenShift 4

### v2.4.1 / 2024-10-07

  - Update docker image tagging strategy
  - Update Trivy to 0.56.1
  - Update nginx to 1.26.2
  - Update Elements to 5.0.1
  - Fix epfl_si.ansible-module-openshift name

### v2.4.0 / 2024-07-09

  - Rewrite archivewebsible
  - Simplify hosts structure
  - Update Node.js to 20
  - Update Elements to 4.9.1
  - Update docker/login-action to v3
  - Update actions/checkout to v4
  - Update nginx-unprivileged to 1.26.1

### v2.3.1 / 2023-11-02

  - Update Elements to 4.5.1
  - Migrate to Docker Compose v2

### v2.3.0 / 2023-06-15

  - Update nginx-unprivileged to 1.24.0
  - Update Web2018 to v6.3.0

### v2.2.3 / 2023-03-29

  - Update WordPress version from 5.5 to 6.1
  - Update Web2018 to 6.2.2

### v2.2.2 / 2023-02-09

  - Update Web2018 to 6.2.0
  - Update Header light
  - Update docker/login-action to v2

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
