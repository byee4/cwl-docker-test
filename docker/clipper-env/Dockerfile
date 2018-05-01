################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

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

USER biodocker

RUN conda install -y -c bioconda \
pysam=0.6 \
numpy=1.5.1 \
scipy=0.11.0 \
matplotlib=1.1.0 \
pybedtools=0.5 \
scikit-learn=0.6.1 \
HTSeq=0.6.1

RUN mkdir -p /opt; \
    cd /opt && \
    git clone git://github.com/YeoLab/clipper.git && \
    cd clipper && \
    python setup.py install

WORKDIR /data/

CMD ["clipper"]