
#!/bin/bash

# Configuration
VERSION="1.1.11"
INSTALL_DIR="/opt/ventoy"
WRAPPER="/usr/local/bin/ventoy"

# Function to ask for confirmation
confirm_and_run() {
    local DESC=$1
    local CMD=$2
    echo -e "\n---------------------------------------------------"
    echo -e "ACTION: $DESC"
    echo -e "COMMAND: $CMD"
    read -p "Confirm execution? (y/n): " choice
    case "$choice" in 
      y|Y ) 
        eval "$CMD"
        ;;
      * ) 
        echo "Skipping step."
        ;;
    esac
}

echo "Ventoy Headless Debian Setup Script"
echo "This script will prepare Ventoy as a global command."

# 1. Update and Dependencies
confirm_and_run "Update system and install wget/tar" \
    "sudo apt update && sudo apt install -y wget tar util-linux"

# 2. Download
confirm_and_run "Download Ventoy v$VERSION" \
    "wget https://github.com/ventoy/Ventoy/releases/download/v$VERSION/ventoy-$VERSION-linux.tar.gz"

# 3. Extract
confirm_and_run "Extract the archive" \
    "tar -xvf ventoy-$VERSION-linux.tar.gz"

# 4. Move and Setup Global Wrapper
# Note: Using printf with escaped variables for the wrapper logic
WRAPPER_LOGIC="printf \"#!/bin/bash\\ncd $INSTALL_DIR && ./Ventoy2Disk.sh \\\"\\\$@\\\"\\n\""

confirm_and_run "Move to $INSTALL_DIR and create global wrapper" \
    "sudo mv ventoy-$VERSION $INSTALL_DIR && sudo bash -c '$WRAPPER_LOGIC > $WRAPPER' && sudo chmod +x $WRAPPER"

echo -e "\n---------------------------------------------------"
echo "Setup Complete!"
echo "You can now run Ventoy from anywhere using: sudo ventoy"
echo -e "\nTo install to your USB drive, run:"
echo "sudo ventoy -i -s -g /dev/sda"

