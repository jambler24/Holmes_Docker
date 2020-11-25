
docker pull jambler24/holmes_app

SET BAMPATH=%CD%\bam_files
SET ANNOPATH=%CD%\annotations
SET REFPATH=%CD%\ref_genome
SET DBPATH=%CD%\database
SET VARPATH=%CD%\variant_files

docker run -it -p 8000:8000 \
     -v "%BAMPATH%:/bam_files/" \
     -v "%ANNOPATH%:/annotations/" \
     -v "%REFPATH%:/ref_genome/" \
     -v "%DBPATH%:/db/" \
     -v "%VARPATH%:/variant_files/" \
     -e DJANGO_CONFIGURATION="prod" \
     jambler24/holmes_app:latest

start "" http://0.0.0.0:8000
