#!/bin/bash

set -eux

clone_repo()
{
    SCHEME=https://
    URL=$1
    DOMAIN=${URL##https://}
    USER=x-access-token
    PAT=$2
    git clone $SCHEME$USER:$PAT@$DOMAIN
}

get_repo_name()
{
    URL=$1
    BASENAME=$(basename $URL)
    REPO_NAME=${BASENAME%.*}
    echo $REPO_NAME
}

export PATH_TO_SUBMISSION_REPO=$PWD/$(get_repo_name $SUBMISSION_REPO_HTTPS_URL)
clone_repo $SUBMISSION_REPO_HTTPS_URL $SUBMITTER_PAT

case "$TEST_TYPE" in
    "STARPASS_SNS" )
        TEST_CODE_REPO_HTTPS_URL=https://github.com/shiftbase-inc/STARPASS-starter-project.git
        export PATH_TO_TEST_CODE_REPO=$PWD/$(get_repo_name $TEST_CODE_REPO_HTTPS_URL)
        clone_repo $TEST_CODE_REPO_HTTPS_URL $SHIFTBASE_PAT
        bash starpass_sns.sh
        ;;
    * ) echo no match ;;
esac

# Exit with last status.
exit $?