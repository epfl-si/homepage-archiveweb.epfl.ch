#! /usr/bin/env python3

# Fill a json file of archived websites (folders found in /svc0176_archive_web_app/archiveweb/)
import json
import os

def listdirs(folder):
    return [d for d in os.listdir(folder) if os.path.isdir(os.path.join(folder, d))]

print('Run fill-archivedwebsites-json.py...')

directories = listdirs('/svc0176_archive_web_app/archiveweb/')

directories_to_remove = ['common', 'templates', 'fonts', 'cdn-cgi']

directories[:] = [item for item in directories if item not in directories_to_remove]

websites_list = json.dumps(directories)

print('Number of archived websites = ', len(directories))

file = open('/svc0176_archive_web_app/archiveweb/archived-websites.json','w')
file.write(websites_list)
file.close()

print('Success!')
