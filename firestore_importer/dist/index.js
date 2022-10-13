#!/usr/bin/env node
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var admin = require("firebase-admin");
var args = require("commander");
var _ = require("lodash");
// Firebase App Initialization
var serviceAccount = require("../credentials.json");
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});
var importCollection = require("./importCollection");
var exportCollection = require("./exportCollection");
// Help Descriptions
var rootDescription = [
    'Import/Export JSON data to/from a Firestore Database'
].join('\n').replace(/^/gm, '  ');
var rootHelp = [
    '',
    'For command specific help try:',
    '  fire-migrate import -h',
    '  fire-migrate export -h',
    ''
].join('\n').replace(/^/gm, '  ');
var importDescription = [
    'Import JSON data to a Firestore collection',
    '  Optionally converts Excel or CSV to JSON before import.'
].join('\n').replace(/^/gm, '  ');
;
var importHelp = [
    '', 'Examples:', '',
    '  fire-migrate import --dry-run test.json myCollection',
    '  fire-migrate import --merge test.INDEX.csv myCollection',
    '  fire-migrate i -m --id docid test.xlsx myCollection',
    ''
].join('\n').replace(/^/gm, '  ');
var exportDescription = 'Export Firestore collection(s) to a JSON file';
var exportHelp = [
    '', 'Examples:', '',
    '  fire-migrate export --verbose --no-subcolls myCollectionRootLevel.json myCollection',
    '  fire-migrate export users-posts.json users posts',
    '  fire-migrate e -v firestore-dump.xlsx',
    ''
].join('\n').replace(/^/gm, '  ');
// Some option helper functions
function parseChunk(v) {
    return _.clamp(v, 1, 500);
}
// Base options
args.version('0.1.0')
    .description(rootDescription)
    .on('--help', function () {
    console.log(rootHelp);
});
// Import options
args.command('import')
    .alias('i')
    .description(importDescription)
    .arguments('<file> [collections...]')
    .option('-i, --id [field]', 'Field to use for Document IDs', 'doc_id')
    .option('-a, --auto-id [str]', 'Document ID token specifying auto generated Document ID', 'Auto-ID')
    .option('-m, --merge', 'Merge Firestore documents. Default is Replace.')
    .option('-k, --chunk [size]', 'Split upload into batches. Max 500 by Firestore constraints.', parseChunk, 500)
    .option('-p, --coll-prefix [prefix]', '(Sub-)Collection prefix', 'collection')
    .option('')
    .option('-d, --dry-run', 'Perform a dry run, without committing data. Implies --verbose.')
    .option('-v, --verbose', 'Output document insert paths')
    .action(function (file, collections, options) {
    importCollection.execute(file, collections, options);
}).on('--help', function () {
    console.log(importHelp);
});
// Export options
args.command('export <file> [collections...]')
    .alias('e')
    .description('Export Firestore collection(s) to a JSON/XLSX/CSV file')
    .option('-n, --no-subcolls', 'Do not export sub-collections.')
    .option('-p, --coll-prefix [prefix]', 'Collection prefix', 'collection')
    .option('-i, --id-field [id]', 'Field name to use for document IDs', 'doc_id')
    // .option('')
    // .option('-x, --separator [/]', 'Collection/Document path separator', '/' )
    .option('')
    .option('-v, --verbose', 'Output traversed document paths')
    .action(function (file, collections, options) {
    exportCollection.execute(file, collections, options);
}).on('--help', function () {
    console.log(exportHelp);
});
args.parse(process.argv);
//# sourceMappingURL=index.js.map