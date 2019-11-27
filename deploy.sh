#!/bin/bash

# Exit with nonzero exit code if anything fails
set -e 

# Start by building the sources into the dist folder
sh build.sh

# Push the content of that folder to gh-pages
cd dist
git init .
git checkout -b gh-pages
git add -A
git commit -m "Publish to gh-pages"
git remote add origin git@github.com:doctor-g/kapow.git
git push --force -u origin gh-pages
