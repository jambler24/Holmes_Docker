FROM python:3.7.1

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
    sqlite3 \
    postgresql \
    postgresql-contrib \
    postgresql-client \
    && apt-get clean \
    && apt-get purge

# install nginx
RUN apt-get update && apt-get install nginx vim -y --no-install-recommends

# install SAMtools
RUN curl -fksSL https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 | tar xj && \
    cd samtools-1.3.1 && \
    make all all-htslib && make install install-htslib

# install VCFtools
RUN curl -fksSL https://github.com/vcftools/vcftools/releases/download/v0.1.14/vcftools-0.1.14.tar.gz | tar xz && \
    cd vcftools-0.1.14 && \
    ./configure; make; make install

RUN mkdir /deps

#ADD ./holmes_django/requirements.txt /deps/
ADD ["./Docker_things/requirements.txt", "/deps/"]

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -Ur /deps/requirements.txt


# Install BCFTools - Not working "cram/cram_io.c:57:19: fatal error: bzlib.h: No such file or directory"
#RUN git clone git://github.com/samtools/htslib.git; cd htslib && make && make install
#RUN git clone git://github.com/samtools/bcftools.git; cd bcftools; autoheader && autoconf && ./configure --enable-libgsl --enable-perl-filters; make

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1


# create root directory for our project in the container
RUN mkdir /holmes

# Copy the current directory contents into the container at /holmes
#COPY ./holmes_django/ /holmes/
COPY ["./holmes_django/", "/holmes/"]

WORKDIR /holmes/holmes_core

# Create the DB?


#RUN python3 manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'adminpass')"


EXPOSE 8000

ENV DJANGO_SUPERUSER_PASSWORD=admin
ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_EMAIL=admin@test.com

#CMD ls holmes
CMD python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py ensure_adminuser --username=admin --email=this@that.com --password=admin && python3 manage.py runserver 0.0.0.0:8000

#RUN [ "python3 holmes/manage.py", "holmes/start.sh" ]


#docker run -i jambler24/holmes_app /bin/bash