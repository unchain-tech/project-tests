#!/bin/bash

clone_repo()
{
    URL=$1
    ACCESS_TOKEN=$2
    REPO_NAME=$3

    SCHEME=https://
    DOMAIN=${URL##$SCHEME}
    USER=x-access-token
    git clone $SCHEME$USER:$ACCESS_TOKEN@$DOMAIN $REPO_NAME
}
