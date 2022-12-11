#!/bin/bash

# e: Exit if a command fails.
# u: Treats unset or undefined variables as an error.
# x: Prints out command arguments during execution.
set -eux

# SHELLOPTS: Apply above options for child processes.
export SHELLOPTS

# Name for the repository to be cloned.
# To avoid name conflicts because the following two repositories may be the same during test simulation.
SUBMISSION_REPO_NAME=submission
TEST_SOURCE_REPO_NAME=test_source

clone_repo()
{
    SCHEME=https://
    URL=$1
    DOMAIN=${URL##$SCHEME}
    USER=x-access-token
    PAT=$2
    REPO_NAME=$3
    git clone $SCHEME$USER:$PAT@$DOMAIN $REPO_NAME
}

run_test()
{
    TEST_SOURCE_REPO_URL=$1
    SCRIPT=$2

    # Prepare submission repository
    clone_repo $SUBMISSION_REPO_URL $SUBMITTER_PAT $SUBMISSION_REPO_NAME
    export PATH_TO_SUBMISSION_REPO=$PWD/$SUBMISSION_REPO_NAME

    # Prepare test code repository
    clone_repo $TEST_SOURCE_REPO_URL $SHIFTBASE_PAT $TEST_SOURCE_REPO_NAME
    export PATH_TO_TEST_SOURCE=$PWD/$TEST_SOURCE_REPO_NAME

    # Run
    chmod 755 $SCRIPT
    bash $SCRIPT
}

# List test resources corresponding to TEST_CASE.
case "$TEST_CASE" in
    "STARPASS_SNS" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-starter-project.git
        SCRIPT=starpass_sns.sh
        ;;
    "STARPASS_GOV" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-starter-project.git
        SCRIPT=starpass_gov.sh
        ;;
    "STARPASS_MED" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-starter-project.git
        SCRIPT=starpass_med.sh
        ;;
    "AVAX_ASSET_TOKENIZATION" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git
        SCRIPT=avax_asset_tokenization.sh
        ;;
    * ) echo "No match test case" ;;
esac

# Run test.
run_test $TEST_SOURCE_REPO_URL scripts/$SCRIPT
