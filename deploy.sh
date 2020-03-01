#!/usr/bin/env bash

# Check setup
if [ ! -f "account.txt" ]; then
    echo "Please create a file called account.txt, containing your GCP login email."
    exit 1
fi
if [ ! -f "project.txt" ]; then
    echo "Please create a file called project.txt, containing your GCP project ID."
    exit 1
fi

# Variables
base=$PWD
bucket=gs://mamecloud.com

# Point to the GCP project
# If you need to authenticate, use "gcloud auth login"
gcloud config set account $(cat account.txt)
gcloud config set project $(cat project.txt)

gsutil rsync -R ./static $bucket
gsutil web set -m index.html $bucket
