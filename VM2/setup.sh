# setup.sh
#!/bin/bash

#Avoid interactive prompts
export DEBIAN_FRONTEND=noninteractive
echo "postfix postfix/main_mailer_type select Internet Site" | sudo debconf-set-selections
sudo apt-get install -y postfix


# Update package lists
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Clean up unnecessary packages
sudo apt autoremove -y
sudo apt clean

echo "System update complete!"