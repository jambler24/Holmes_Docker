FROM ubuntu:xenial

RUN apt-get update --fix-missing -qq && apt-get install -y -q \
    curl \
    locales \
    libncurses5-dev  \
    libncursesw5-dev \
    libbz2-dev \
    liblzma-dev \
    build-essential \
    pkg-config \
    zlib1g-dev \
    bzip2 \
    default-jre \
    git-core \
    bc \
    python \
    python3 \
    python-tk \
    wget \
    python3-pip \
    python-pip \
    && apt-get clean \
    && apt-get purge


# install SAMtools
RUN curl -fksSL https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 | tar xj && \
    cd samtools-1.3.1 && \
    make all all-htslib && make install install-htslib

# install VCFtools
RUN curl -fksSL https://github.com/vcftools/vcftools/releases/download/v0.1.14/vcftools-0.1.14.tar.gz | tar xz && \
    cd vcftools-0.1.14 && \
    ./configure; make; make install

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -U \
Django==1.11.0 \
gunicorn==19.6.0 \
beautifulsoup4 \
html5lib==1.0b8 \
requests \
django-tables2 \
networkx \
numpy \
pandas \
scipy \
pysam \
matplotlib \
GenGraph \
biopython \
static-ranges



# Install BCFTools - Not working "cram/cram_io.c:57:19: fatal error: bzlib.h: No such file or directory"
#RUN git clone git://github.com/samtools/htslib.git; cd htslib && make && make install
#RUN git clone git://github.com/samtools/bcftools.git; cd bcftools; autoheader && autoconf && ./configure --enable-libgsl --enable-perl-filters; make

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# create root directory for our project in the container
RUN mkdir /holmes

RUN cd holmes; git clone https://github.com/jambler24/Holmes.git

# Copy the current directory contents into the container at /holmes
#ADD ./holmes_core/ /holmes/

#EXPOSE 8000

#CMD ls holmes
#CMD python holmes/manage.py makemigrations && python holmes/manage.py migrate && holmes/start.sh

