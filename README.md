[![Build Status](https://travis-ci.org/jambler24/Holmes_Docker.svg?branch=master)](https://travis-ci.org/jambler24/Holmes_Docker)

# Holmes_Docker

Welcome to the Holmes repository for getting the platform set up.

Holmes allows researchers and clinicians to conduct QC and reporting on panels in an intuitive interface with a simple setup process.

The Holmes interface is a web page, as most users are familiar with the navigation. By running in Docker, Holmes is able to run on many different environments with minimal setup.

## Functionality
Holmes allows users to:

- Panel based analysis
    - Add panels based on lists of gene names or from provided bed files
    - Associate bam and vcf files to panels
    - Avoid incidental findings be restricting analysis to specific regions

- Quality control for panels
    - Check if target regions in a panel have sufficient coverage
    - Calculate the percentage of a target region with coverage above a set threshold

- Variant analysis and reporting
    - Find variants in the regions defined by the panel
    - Report information on the effect of the mutation, and any clinical implications (based on information available 
    on databases including clinvar and SnpEff)

## Installation 

### 1. Install Docker
For windows, Download Docker from here and follow the instructions

https://docs.docker.com/docker-for-windows/install/

### 2. Get the required files 

Download the scripts by clicking on the "Download or clone" button, and selecting "Download zip".

Move the downloaded file to a folder you would like to work from. This is where the database and folders will be created.

### 5. Start the web server

If you are using Windows, double-click on run_holmes.bat

For Mac / Linux, run the run_docker.sh file

### 5. Open Holmes in your browser

In your web browser, go to: 

http://0.0.0.0:8000

or 

http://127.0.0.1:8000

## Holmes stack

Holmes is a Django web app in a Docker container.

This means no installation required except for Docker, it works on any platform that can run Docker, and it can be deployed as a web app with a few changes.

By using a browser based front end, Holmes can take advantage of the vast amount of interactive plotting libraries available. 

### Availability 

Available on Docker hub:
https://hub.docker.com/repository/docker/jambler24/holmes_app

Source code:
https://github.com/jambler24/Holmes

