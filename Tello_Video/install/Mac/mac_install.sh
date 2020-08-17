
#!/bin/sh



echo 'Compiling and Installing the Tello Video Stream module'

echo 'You might need to enter your password'

# go to /sample_code folder
cd ..
cd ..

# install Homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update



# install pip

#sudo easy_install pip

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py

# install cmake

brew install cmake



# install dependencies

brew install boost

brew install boost-python

#need to fake it as ffmpeg package by manupilating the /usr/local/Cellar and /usr/local/opt folders, i.e. also install ffmpeg@4 from source
brew install ffmpeg@2.8 --build-from-source 

brew install tcl-tk

sudo pip install numpy --ignore-installed

sudo pip install matplotlib --ignore-installed

sudo pip install pillow --ignore-installed

#for python 2, opencv-python 3.4.5.20 tested ok
sudo pip install opencv-python==3.4.5.20 --ignore-installed



# pull and build h264 decoder library

cd h264decoder


mkdir build

chown tkingkwun:staff build

cd build

cmake -DBoost_NO_BOOST_CMAKE=ON ..

make



# copy source .so file to tello.py directory

cp libh264decoder.so ../../



echo 'Compilation and Installation Done!'
