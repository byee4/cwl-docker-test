#!/usr/bin/env bash

conda create -y -n cwl-docker-test;

source activate cwl-docker-test;

conda install samtools;

export PATH=${PWD}/bin:$PATH
export PATH=${PWD}/cwl:$PATH
