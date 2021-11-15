#!/bin/sh

# start ddev, create project, build container
ddev start

# install all packages via composer
ddev composer install

# import basic database
ddev import-db -f boersenblatt.sql.gz

# reindex all documents (DB -> Solr)
ddev typo3 kitodo:reindex -a -p 1 -s dlfCore0

