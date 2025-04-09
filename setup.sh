#!/bin/bash

# Extract distribution ID (like ubuntu, fedora, centos) from /etc/os-release
if [ -f /etc/os-release ]; then
  . /etc/os-release
  distro_id=$(echo "$ID" | tr '[:upper:]' '[:lower:]')
else
  echo "Cannot determine Linux distribution."
  exit 1
fi

echo "Detected distribution: $distro_id. Packages to verify: [UFW, Apache2, Mariadb-Server, Docker]"

packages=("mariadb-server" "ufw" "apache2")

# Function to check if a package is installed and install/upgrade it
installPackages() {

    for pkg in "${packages[@]}"; do

        case "$distro_id" in

        ubuntu|debian)
            echo "Checking package: $pkg (Ubuntu/Debian)"
            if dpkg -l | grep -q "$pkg"; then
                echo "$pkg is installed. Updating..."
                sudo apt-get install --only-upgrade -y "$pkg"
            else
                echo "$pkg is NOT installed. Installing..."
                sudo apt-get install -y "$pkg"
            fi
            ;;

        fedora)
            echo "Checking package: $pkg (Fedora)"
            if rpm -q "$pkg"; then
                echo "$pkg is installed. Updating..."
                sudo dnf upgrade -y "$pkg"
            else
                echo "$pkg is NOT installed. Installing..."
                sudo dnf install -y "$pkg"
            fi
            ;;

        centos|rhel)
            echo "Checking package: $pkg (CentOS/RHEL)"
            if rpm -q "$pkg"; then
                echo "$pkg is installed. Updating..."
                sudo yum upgrade -y "$pkg"
            else
                echo "$pkg is NOT installed. Installing..."
                sudo yum install -y "$pkg"
            fi
            ;;

        *)
            echo "Unsupported or unknown distribution: $distro_id"
            ;;
        esac

    done

}

#Сalling packages installation alonng with Docker based on the detected destribution
case "$distro_id" in

ubuntu|debian)

    installPackages

    echo "Checking Docker..."
    if apt list --installed 2>/dev/null | grep -q docker-ce; then
        echo "Docker is installed. Updating..."
        sudo apt-get install --only-upgrade -y docker-ce
    else
        echo "Docker is NOT installed. Installing..."

        # 1. Update the apt package index
        sudo apt-get update

        # 2. Install packages to allow apt to use a repository over HTTPS
        sudo apt-get install -y \
            ca-certificates \
            curl \
            gnupg \
            lsb-release

        # 3. Add Docker’s official GPG key
        sudo mkdir -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
            sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

        # 4. Set up the Docker stable repository
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
        https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

        # 5. Update the package index again
        sudo apt-get update

        # 6. Install Docker Engine and related components
        sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    fi
    sudo apt autoremove -y # Clean up unnecessary packages
    ;;

fedora)

    # Install or upgrade packages
    installPackages

    echo "Checking Docker..."
    if dnf list installed docker-ce; then
        echo "Docker is installed. Updating..."
        sudo dnf install -y docker-ce
    else
        echo "Docker is NOT installed. Installing..."

        # 1. Add Docker’s official GPG key
        sudo mkdir -p /etc/yum/repos.d/
        curl -fsSL https://download.docker.com/linux/fedora/gpg | \
            sudo tee /etc/yum.repos.d/docker.repo > /dev/null

        # 2. Set up the Docker repository
        echo "[docker-ce]
        name=Docker CE
        baseurl=https://download.docker.com/linux/fedora/\$releasever/$basearch/stable
        enabled=1
        gpgcheck=1
        gpgkey=https://download.docker.com/linux/fedora/gpg" | sudo tee /etc/yum.repos.d/docker.repo

        # 3. Install Docker Engine and related components
        sudo dnf install -y docker-ce docker-ce-cli containerd.io

        # Start Docker service
        sudo systemctl start docker
        sudo systemctl enable docker
    fi
    sudo dnf autoremove -y # Clean up unnecessary packages
    ;;

centos|rhel)

    installPackages

    echo "Checking Docker..."
    if yum list installed docker-ce; then
        echo "Docker is installed. Updating..."
        sudo yum install -y docker-ce
    else
        echo "Docker is NOT installed. Installing..."

        # 1. Add Docker’s official GPG key
        sudo mkdir -p /etc/yum.repos.d/
        curl -fsSL https://download.docker.com/linux/centos/gpg | \
            sudo tee /etc/yum.repos.d/docker.repo > /dev/null

        # 2. Set up the Docker repository
        echo "[docker-ce]
        name=Docker CE
        baseurl=https://download.docker.com/linux/centos/\$releasever/$basearch/stable
        enabled=1
        gpgcheck=1
        gpgkey=https://download.docker.com/linux/centos/gpg" | sudo tee /etc/yum.repos.d/docker.repo

        # 3. Install Docker Engine and related components
        sudo yum install -y docker-ce docker-ce-cli containerd.io

        # Start Docker service
        sudo systemctl start docker
        sudo systemctl enable docker
    fi
    sudo yum autoremove -y # Clean up unnecessary packages
    ;;

  *)
    echo "Unsupported or unknown distribution: $distro_id"
    ;;
esac
