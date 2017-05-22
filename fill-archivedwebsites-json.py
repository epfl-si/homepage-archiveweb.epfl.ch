#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Fill a json file of archived websites (folders found in /var/www/vhosts/archivedweb.epfl.ch/htdocs/)
import json
import os, time

def listdirs(folder):
    return [d for d in os.listdir(folder) if os.path.isdir(os.path.join(folder, d))]

print 'Run fill-archivedwebsites-json.py...'

directories = listdirs('/var/www/vhosts/archiveweb.epfl.ch/htdocs/')

if 'common' in directories:
    directories.remove('common')

websites_list = json.dumps(directories)

print 'Number of archived websites = ', len(directories)

file = open('/var/www/vhosts/archiveweb.epfl.ch/htdocs/archived-websites.json','w')
file.write(websites_list)
file.close()

print 'Success!'
