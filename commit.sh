#!/bin/bash

# this really feels ugly & brittle.
# dependent on successfully changing directories along relative paths.

# commit to repo
git pull
git add . -A && git commit -m "commit"
git push origin master

# push to pages.
cd ../aitm-pages
git pull
sleep 5
git add . && git commit -m "commit"
git push origin gh-pages
cd ../aitm
