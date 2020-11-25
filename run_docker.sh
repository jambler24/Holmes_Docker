echo $PWD

CLEANPATH=$(sed 's/ /\\ /g' <<< $PWD)

BAMPATH=$PWD/bam_files
ANNOPATH=$PWD/annotations
REFPATH=$PWD/ref_genome
DBPATH=$PWD/database
VARPATH=$PWD/variant_files

docker pull jambler24/holmes_app:latest

docker run -it -p 8000:8000 \
     -v "$BAMPATH:/bam_files/" \
     -v "$ANNOPATH:/annotations/" \
     -v "$REFPATH:/ref_genome/" \
     -v "$DBPATH:/db/" \
     -v "$VARPATH:/variant_files/" \
     -e DJANGO_CONFIGURATION="prod" \
     jambler24/holmes_app:latest

