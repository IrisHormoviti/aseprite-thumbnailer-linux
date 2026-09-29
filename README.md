# Aseprite Thumbnailer for Linux
> [!NOTE]
> This has only been tested with Dolphin, I don't know how well it works with other file managers

This thumbnailer basically just relies on the Aseprite CLI interface, and uses shell scripts. 
It does not need any compiling, which makes it easier to setup than some other solutions.

I made this because I was using an immutable distro, and didn't want to deal with build dependencies for something so simple.

## Install
### 1. Clone the repository
Download the code as a zip and extract it, or use the following command
```sh
# Go to a temporary path you want to download this project to
# I don't want you dumping this on your home folder :>
cd ~/Downloads
# Clone this project
git clone https://github.com/IrisHormoviti/aseprite-thumbnailer-linux
```
### 2. Run `setup.sh`
This can be done by opening a terminal and running: 
```sh
# Go to the folder where you cloned the project
cd aseprite-thumbnailer-linux
# Run setup script
sh setup.sh
```
In dolphin, you might also be able to right click `setup.sh` and select "Run in Konsole"
### 3. Enter the path to your Aseprite binary
Instructions on how to do so will be displayed on your terminal.
Type or paste the path and press enter.
### 4. Enable previews
If using Dolphin, go to the menu > Configure > Configure Dolphin... > Interface > Previews, then enable "Aseprite Sprite".
