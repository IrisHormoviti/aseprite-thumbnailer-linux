#!/bin/bash
set -e

echo "-- Aseprite Thumbnailer setup script --"
echo
echo "This script registers the aseprite MIME type, and copies thumbnailer scripts to their proper location."
echo

ASE_PATH="$1"

if [ -z "$ASE_PATH" ]; then
	echo "You will to provide an aseprite binary."
	echo "This can be an AppImage, or if installed through Steam, the 'aseprite' file in the folder that opens with 'Browse local files' through Steam."
	echo
	echo "You can drag the aseprite file on to the terminal if you want."
	echo
	read -r -p "Enter path to your Aseprite binary: " ASE_PATH
fi

ASE_PATH="${ASE_PATH/#\~/$HOME}"

if [ ! -f "$ASE_PATH" ] && [ ! -L "$ASE_PATH" ]; then
	echo "Error: Binary not found at '$ASE_PATH'"
	exit 1
fi

echo
echo "Starting install..."

# Ensure destination directories exist
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/thumbnailers
mkdir -p ~/.local/share/mime/packages

# Symlink Aseprite binary
echo "Linking Aseprite binary to ~/.local/bin/aseprite..."
ln -sf "$(realpath "$ASE_PATH")" ~/.local/bin/aseprite

# Copy configuration files from current directory
echo "Installing thumbnailer files..."
cp -f aseprite.xml ~/.local/share/mime/packages/aseprite.xml
cp -f aseprite.thumbnailer ~/.local/share/thumbnailers/aseprite.thumbnailer
cp -f aseprite-thumbnailer ~/.local/bin/aseprite-thumbnailer
chmod +x ~/.local/bin/aseprite-thumbnailer

# Rebuild caches
echo "Updating MIME database and clearing thumbnail cache..."
update-mime-database ~/.local/share/mime
kbuildsycoca6 2>/dev/null || kbuildsycoca5 2>/dev/null || true
rm -rf ~/.cache/thumbnails/*

echo "Installation complete. Restart your file manager to view thumbnails."
