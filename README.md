# Klebsiella datasets
Repository for downloading datasets and preprocessing scripts

## Pathogen watch
Information on how to get *K. pneumoniae* datasets can be found here: [https://cgps.gitbook.io/pathogenwatch/public-data-downloads](https://cgps.gitbook.io/pathogenwatch/public-data-downloads) I've also made a R-script that downloads all Kp data apart from the FASTAs. It is in the scripts folder.

To use the download script on mac or linux you need wget installed. For windows you need wininet.

### Preprocessing PW

I've created two scripts, one which dichotomizes the 17 acquired resistance gene columns by presense/absense and another which uses the same 17 columns to create a wide data frame.

## Institut Pasteur
The data can be exported here: [https://bigsdb.pasteur.fr/cgi-bin/bigsdb/bigsdb.pl?db=pubmlst_klebsiella_isolates&page=plugin&name=Export](https://bigsdb.pasteur.fr/cgi-bin/bigsdb/bigsdb.pl?db=pubmlst_klebsiella_isolates&page=plugin&name=Export)

Select "List all" for Isolates and "All" for Provenance fields and Classification schemes. Under Schemes select "Antibiotic resistance".

## Patric / BV-BRC

