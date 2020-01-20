#! /usr/bin/env python
# -*- coding: utf-8 -*-

# Script for archiving a website on archiveweb.epfl.ch
import os

import sys
import re

dev = False

VHOSTS_DIR = '/var/www/vhosts/%s'

# It's the configuration file of the vhost archiveweb.epfl.ch
# because it's from there that the redirect will be made
# CONFIGURATION_FILE = '/var/www/vhosts/www15.epfl.ch/conf/archive.conf'     OLD LOCATION -> kissrv79
CONFIGURATION_FILE = '/var/www/vhosts/archiveweb.epfl.ch/private/archiveweb.conf'

if dev:
    CONFIGURATION_FILE = '/opt/projects/phphosting/trunk/bin/archive.conf'

host = None

configuration = open(CONFIGURATION_FILE, 'r')
configuration_content = configuration.read()

hostname_pattern = "^(?=.{1,255}$)[0-9A-Za-z-](?:(?:[0-9A-Za-z-]|\b-){0,61}[0-9A-Za-z-])?(?:\.[0-9A-Za-z-](?:(?:[0-9A-Za-z-]|\b-){0,61}[0-9A-Za-z-])?)*\.?$"
hostname_regex = re.compile(hostname_pattern)


def check_host(host):

    if len(host) < 1:
        print("Please type something :")
        return False

    if not hostname_regex.match(host):
        print("Hostname is invalid, try again :")
        return False

    index = configuration_content.find('http://%s' % host)

    if index != -1:
        print("The hostname %s is already defined, try again :" % host)
        return False

    if os.path.isdir(VHOSTS_DIR % host):
        print("The hostname %s has already a dedicated vhost, try again :" % host)
        return False

    return True


def get_apache_directives():

    global host

    conf = """
# https://%s
ServerAlias %s
RewriteCond %%{HTTP_HOST} ^%s$
RewriteRule ^(.*) https://archiveweb.epfl.ch/%s/ [R,L,NS]"""

    conf = conf % (host, host, host, host)

    return conf


def update_configuration_file():

    configuration_file_write = open(CONFIGURATION_FILE, 'w')

    apache_directives = "#NEW_SITE_PLACEHOLDER#\n" + get_apache_directives()

    new_content = configuration_content.replace(
        "#NEW_SITE_PLACEHOLDER#", apache_directives)

    configuration_file_write.write(new_content)

    configuration_file_write.close()


def main():

    global host

    # hostname
    if len(sys.argv) > 1:
        host = sys.argv[1]
        if not check_host(host):
            print("Invalid host %s" % host)
            exit(1)
    else:
        print("Hostname (e.g. enac.epfl.ch)?")
        while not host:
            host = sys.stdin.readline().strip().lower()

            if not check_host(host):
                host = None

    print("Final host: %s" % host)
    update_configuration_file()

    print("Configuration file updated, remember to launch this command when you are finished :\n")

    print("sudo /usr/sbin/apachectl configtest && sudo /usr/sbin/apachectl restart")


main()
