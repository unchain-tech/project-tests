#!/bin/bash

clone_submission_repo()
{
    URL=$1
    ACCESS_TOKEN=$2
    REPO_NAME=$3
    IS_DEV=$4

    echo $IS_DEV

    SCHEME=https://
    DOMAIN=${URL##$SCHEME}
    USER=x-access-token
    if [[ ("$IS_DEV" == "yes") && ("$IS_STARTER_PRESENT" = "yes")]]
    then
      echo "Starter project is present."
      git clone -b complete $SCHEME$USER:$ACCESS_TOKEN@$DOMAIN $REPO_NAME
    else
      echo "Starter project is not present."
      git clone $SCHEME$USER:$ACCESS_TOKEN@$DOMAIN $REPO_NAME
    fi
}

clone_test_source_repo()
{
    URL=$1
    ACCESS_TOKEN=$2
    REPO_NAME=$3
    IS_STARTER_PRESENT=$4

    SCHEME=https://
    DOMAIN=${URL##$SCHEME}
    USER=x-access-token
    if [ "$IS_STARTER_PRESENT" = "yes" ]; then
      echo "Starter project is present."
      git clone -b complete $SCHEME$USER:$ACCESS_TOKEN@$DOMAIN $REPO_NAME
    else
      echo "Starter project is not present."
      git clone $SCHEME$USER:$ACCESS_TOKEN@$DOMAIN $REPO_NAME
    fi
}
