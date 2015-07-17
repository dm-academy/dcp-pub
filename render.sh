#!/bin/bash

#build html
bundle exec rake book:build
mv aitm.html index.html
cp -R images ../aitm-pages/
cp *.html ../aitm-pages/
cp *.pdf ../aitm-pages/


# build pdf
a2x --verbose -fpdf -dbook --fop --icons --icons-dir=$HOME/opt/asciidoc/images/icons aitm.adoc
