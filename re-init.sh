#!/bin/bash
# run from aitm directory.
# need this because whenever I switch editing
# aitm-pages gets all fouled up
# tried to fix by having a "git pull" command
# in commit.sh
# but it's not working
cd ..
rm -rf aitm-pages
git clone git@github.com:dm-academy/aitm.git aitm-pages
cd aitm-pages
git checkout gh-pages
