#! /usr/bin/env python
# -*- coding: utf-8 -*-
# Fill a json file of archived websites (folders found in /var/www/vhosts/archivedweb.epfl.ch/htdocs/)
import json
import os, time

def listdirs(folder):
    return [d for d in os.listdir(folder) if os.path.isdir(os.path.join(folder, d))]

print 'Run fill-archivedwebsites-json.py...'

directories = listdirs('/var/www/vhosts/archiveweb.epfl.ch/htdocs/')

directories_to_remove = ['common', 'templates', 'fonts', 'cdn-cgi']

directories[:] = [item for item in directories if item not in directories_to_remove]

websites_list = json.dumps(directories)

print 'Number of archived websites = ', len(directories)

file = open('/var/www/vhosts/archiveweb.epfl.ch/htdocs/archived-websites.json','w')
file.write(websites_list)
file.close()

print 'Success!'
