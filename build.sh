#!/usr/bin/env sh

DEPLOY_PATH="$HOME/Library/Application Support/Dash/DocSets/Slim Framework"
FILE_NAME="Slim Framework.docset"

# Clean the previous run of this script
echo "Cleaning"
rm -r "$FILE_NAME/Contents/Resources/Documents/"
mkdir -p "$FILE_NAME/Contents/Resources/Documents/"

# Download the latest version of the Slim Framework documentation
echo "Downloading"
./webarchiver -url http://docs.slimframework.com -output index.webarchive

# Put everything in place
echo "Setting up bundle"
cp index.webarchive "$FILE_NAME/Contents/Resources/Documents/"
cp Info.plist "$FILE_NAME/Contents"
cp icon.png "$FILE_NAME"
python ./sqlite.py

# Deploy the documentation in its official location
echo "Deploying"
rm -r "$DEPLOY_PATH"
mkdir -p "$DEPLOY_PATH"
cp -r "$FILE_NAME" "$DEPLOY_PATH"

open "$DEPLOY_PATH"

echo "Documentation created. You should double-click on the"
echo "Slim Framework.docset file to add it to Dash."
echo "Done."

