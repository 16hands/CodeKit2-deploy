#!/bin/bash
## CodeKit 2 Deployment script
## Version 0.1 Carl Bowden carl@16hands.co.nz

## Point our log file to somewhere and setup our admin email
log=.ck-deploy.log


## Setup the server to mirror
remote=${1:-false}  #1st arg


## Setup the local directory / Our mirror
local=${PWD}

## Initialize some other variables
complete="false"
failures=0
status=1
pid=$$
backupfolder=$(date +%Y%m%d-%H%M:%S)

# insure all activily is local
cd $local

echo >> $log
echo >> $log
echo "`date +%x-%R` - $pid - Started Rsync Deploy with ${1} ${2} ${3}" >> $log


if [[ "$remote" == "false" ]]; then
        echo "       CodeKit2 Deploy --exit-- no remote/deploy target provided " | tee -a $log
        exit 1;
fi

# rsync -a -P --stats --backup --backup-dir=../.backup/$(date +%Y%m%d-%H%M:%S) 16h-wordpress carl@localhost:~/Documents/test

while [[ "$complete" != "true" ]]; do

        echo "rsync -a -P --stats --backup --backup-dir=../.backup/$backupfolder $local/ $remote/" >> $log
        rsync -a -P --exclude=".DS_Store" --stats --backup --backup-dir=../.backup/$backupfolder $local/ $remote/ >> $log
        status=$?

        complete="true"
done

exit 0