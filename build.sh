#!/usr/bin/env sh

# Clean the previous run of this script
echo "Cleaning"
rm -r Slim\ Framework.docset/Contents/Resources/Documents/
mkdir -p Slim\ Framework.docset/Contents/Resources/Documents/

# Download the latest version of the Slim Framework documentation
echo "Downloading"
./webarchiver -url http://docs.slimframework.com -output index.webarchive

# Put everything in place
echo "Setting up bundle"
cp index.webarchive Slim\ Framework.docset/Contents/Resources/Documents/
cp Info.plist Slim\ Framework.docset/Contents
python ./sqlite.py

# Deploy the documentation in its official location
echo "Deploying"
rm -r ~/Library/Application\ Support/Dash/DocSets/Slim\ Framework
mkdir -p ~/Library/Application\ Support/Dash/DocSets/Slim\ Framework
cp -r Slim\ Framework.docset ~/Library/Application\ Support/Dash/DocSets/Slim\ Framework

open ~/Library/Application\ Support/Dash/DocSets/Slim\ Framework

echo "Documentation created. You should double-click on the"
echo "Slim Framework.docset file to add it to Dash."
echo "Done."

