# Purpose

Firebase importer is a standalone project within the app project. Its whole purpose is to update the json documents in the data file to the Cloud Firestore in Firebase. 

## Install

npm install

## Usage

### Update data in firestore
Some configs are specific for an environment.

### app_translation
`npm run migrate import data/app_translation.json`

### Backup data from firestore
`npm run migrate export data/firestore-export.json`  
