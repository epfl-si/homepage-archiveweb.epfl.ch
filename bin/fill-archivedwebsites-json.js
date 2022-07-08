#! /usr/bin/env node

const fs = require('fs');

const ARCHIVED_WEBSITES_PATH = '/public';
const ARCHIVED_WEBSITES_FILE = '/public/archived-websites.json';

// Folders to ignore
const toIgnore = new Set([
  '.snapshot',
  'cdn-cgi',
  'common',
  'fonts',
  'templates'
]);

const getDirectories = function(source) {
  return fs.readdirSync(source, { withFileTypes: true })
    .filter(dirent => dirent.isDirectory())
    .filter(dirent => !toIgnore.has(dirent.name))
    .map(dirent => dirent.name)
};

const getArchivedWebsitesContent = function(file) {
  try {
    const dataString = fs.readFileSync(file, 'utf8');
    return JSON.parse(dataString);
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
}

const buildArchivedWebsites = function(list, content) {
  const archivedWebsites = {};

  for (let i = 0; i < list.length; i++) {
    archivedWebsites[list[i]] = '';
    if (content[list[i]] !== undefined) {
      archivedWebsites[list[i]] = content[list[i]];
    } else {
      archivedWebsites[list[i]] = new Date().toISOString().split('T')[0];
    }
  }

  return archivedWebsites;
}

const writeArchivedWebsitesInJson = function(obj) {
  try {
    fs.writeFileSync(
      ARCHIVED_WEBSITES_FILE,
      JSON.stringify(obj, null, 2)
    );
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
}

// Do
writeArchivedWebsitesInJson(
  buildArchivedWebsites(
    getDirectories(ARCHIVED_WEBSITES_PATH),
    getArchivedWebsitesContent(ARCHIVED_WEBSITES_FILE)
  )
);
