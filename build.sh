#!/usr/bin/env sh

FILE_NAME="Slim Framework.docset"
URL="http://docs.slimframework.com"
WEBARCHIVE="index.webarchive"
DEPLOY_PATH="$HOME/Library/Application Support/Dash/DocSets/Slim Framework"

# Clean the previous run of this script
echo "Cleaning"
rm -r "$FILE_NAME/Contents/Resources/Documents/"
mkdir -p "$FILE_NAME/Contents/Resources/Documents/"

# Download the latest version of the Slim Framework documentation
echo "Downloading"
./webarchiver -url $URL -output $WEBARCHIVE

# Put everything in place
echo "Setting up bundle"
cp $WEBARCHIVE "$FILE_NAME/Contents/Resources/Documents/"
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

