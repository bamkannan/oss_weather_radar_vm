#!/usr/bin/env bash
set -x

# Vagrant provision script for installing wradlib
export PATH="/home/vagrant/miniconda/bin:$PATH"

# Install wradlib depencies from conda packages
sudo apt-get install -qq libfontconfig1
conda install --yes h5py netcdf4 numpydoc gdal

# Install wradlib from source
cd ~
mkdir tmp
cd tmp
sudo apt-get install -qq unzip
conda install --yes setuptools
wget --no-check-certificate http://bitbucket.org/wradlib/wradlib/get/default.zip
unzip default.zip
cd wradlib-wradlib*
python setup.py install
cd ~
rm -r tmp