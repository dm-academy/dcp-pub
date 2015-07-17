#!/bin/bash

#build html
bundle exec rake book:build

# build pdf
a2x --verbose -fpdf -dbook --fop --icons --icons-dir=$HOME/opt/asciidoc/images/icons aitm.adoc
