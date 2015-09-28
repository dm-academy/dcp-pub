#!/bin/bash

# ya hey look everyone Charlie's about the worst shell scripter you ever saw :-)
# don't go running this thing without a thorough understanding.
# (well, it probably wouldn't hurt you, but it'll certainly blow up all over the place.)
# MUST be run from aitm dir
# this builds the book as html and pdf, and pushes to the working and pages repos in one command.
# pdf currently disabled.
# yes this is really tightly coupled to my workstations.
# (but runs well from both a Linux and a Mac Air, I
# switch between them at least once a day)
# I am using my "adoc" toolchain (stolen from Pro Git) as a basis.
# https://github.com/CharlesTBetz/adoc
# two peer repos @ same level, one "aitm" and one "aitm-pages"
# making this collaborative will need some help.

# commit source
git add . -A && git commit -m "commit"
git push origin master

#build html
bundle exec rake book:build
mv aitm-student.html index.html  # hack, I should figure out the CLI parm for the rake command

# copy html & images to github pages
# dependent on successfully changing directories along relative paths. heaven help the person who runs this other than from the aitm dir.

cp -R images ../aitm-pages/
cp *.html ../aitm-pages/

cd ../aitm-pages   # ugly & brittle.
git pull # pull down previous html. never gets edited by hand.

git add . && git commit -m "commit"
git push origin gh-pages
cd ../aitm

# build pdf
# a2x --verbose -fpdf -dbook --fop --icons --icons-dir=$HOME/opt/asciidoc/images/icons aitm.adoc
#!/bin/bash


#cp *.pdf ../aitm-pages/
