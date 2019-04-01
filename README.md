# Holmes_Docker
The docker install files for Holmes

For windows, Download Docker from here and follow the instrustions

https://docs.docker.com/docker-for-windows/install/

Go to https://github.com/jambler24/Holmes_Docker

Download the Dockerfile and docker-compose.yml by clicking on the "Download or clone" button, and selecting "Download zip".

Move the downloaded file to a folder you would like to work from. 

Create 3 folders in that folder named "annotations", "bam_files", and "ref_genome"

Place the bam files, allong with their index files, into the bam_files folder.

Place the reference genome fasta file into the ref_genome folder.

Place the annotation files in the annotations folder. (gff, bed)

In command line, run the command:

`docker-compose build`

This will build the docker container. You only need to do this once.

To start the web server, type:

`docker-compose up`

and go to http://0.0.0.0:8000 in your web browser. 

