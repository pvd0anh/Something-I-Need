cd /tmp
apt update
apt upgrade
apt-get install net-tools
apt install pciutils
apt install tmux
apt-get install build-essential libssl-dev
apt install curl
apt-get install neovim


wget https://github.com/Kitware/CMake/releases/download/v3.20.0/cmake-3.20.0.tar.gz
tar -zxvf cmake-3.20.0.tar.gz
cd cmake-3.20.0
./bootstrap
make
make install
cd ..

apt install software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt install python3.7

apt install python3-pip
curl -O https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
chmod +x Anaconda3-2021.05-Linux-x86_64.sh
./Anaconda3-2019.03-Linux-x86_64.sh
