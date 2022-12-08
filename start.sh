#!/bin/bash

set -eux

clone_repo()
{
    SCHEME=https://
    URL=$1
    DOMAIN=${URL##$SCHEME}
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

run_test()
{
    TEST_SOURCE_REPO_URL=$1
    SCRIPT=$2

    # Prepare submission repository
    export PATH_TO_SUBMISSION_REPO=$PWD/$(get_repo_name $SUBMISSION_REPO_URL)
    clone_repo $SUBMISSION_REPO_URL $SUBMITTER_PAT

    # Prepare test code repository
    export PATH_TO_TEST_SOURCE=$PWD/$(get_repo_name $TEST_SOURCE_REPO_URL)
    clone_repo $TEST_SOURCE_REPO_URL $SHIFTBASE_PAT

    # Run
    chmod 755 $SCRIPT
    bash $SCRIPT
}

case "$TEST_CASE" in
    "STARPASS_SNS" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-starter-project.git
        SCRIPT=starpass_sns.sh
        ;;
    * ) echo "No match test case" ;;
esac
    run_test $TEST_SOURCE_REPO_URL $SCRIPT

# Exit with last status.
exit $?