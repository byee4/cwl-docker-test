#!/usr/bin/env bash

conda create -y -n cwl-docker-test;

source activate cwl-docker-test;

### Install CWL and helpers ###
pip install --ignore-installed six;
pip install cwlref-runner;
pip install cwltool==1.0.20180306140409;

### required by toil source ###
pip install cwltest;
pip install galaxy-lib==17.9.3;

### use development branch of toil, latest stable has some bugs with torque resource alloc ###
# pip install toil[all];
cd ${PWD}/bin;
git clone https://github.com/byee4/toil; # frozen fork of master
cd toil;
python setup.py install;
cd ../;
cd ../;

export PATH=${PWD}/bin:$PATH
export PATH=${PWD}/cwl:$PATH
export PATH=${PWD}/wf:$PATH
