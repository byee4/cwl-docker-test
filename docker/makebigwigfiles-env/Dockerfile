################## BASE IMAGE ######################

FROM continuumio/miniconda:latest

################## METADATA ######################

LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="CLIPper"
LABEL software.version="0.2.1"
LABEL about.summary="A tool to detect CLIP-seq peaks."
LABEL about.home="http://www.htslib.org/"
LABEL about.documentation="https://github.com/YeoLab/clipper/wiki/CLIPper-Home"
LABEL about.license_file=""
LABEL about.license=""
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Brian Yee <brian.alan.yee@gmail.com>

RUN conda install -y -c bioconda \
    python=2.7 \
    ucsc-bedgraphtobigwig=357 \
    ucsc-bedsort=357 \
    samtools=1.5 \
    bedtools=2.26 \
    pybedtools=0.7.10

RUN mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/YeoLab/makebigwigfiles && \
    cd makebigwigfiles && \
    python setup.py install;

RUN echo $PATH

ENV PATH /opt/makebigwigfiles:$PATH

WORKDIR /data/

CMD ["makebigwigfiles"]
