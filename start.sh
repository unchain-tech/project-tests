#!/bin/bash

# e: Exit if a command fails.
# u: Treats unset or undefined variables as an error.
# x: Prints out command arguments during execution.
set -eux

# SHELLOPTS: Apply options for child process.
export SHELLOPTS

clone_repo()
{
    SCHEME=https://
    URL=$1
    DOMAIN=${URL##$SCHEME}
    USER=x-access-token
    PAT=$2
    git clone $SCHEME$USER:$PAT@$DOMAIN
}

extract_github_repo_name()
{
    GITHUB_URL=$1
    BASENAME=$(basename $GITHUB_URL) # extract reponame.git
    REPO_NAME=${BASENAME%.*} # remove .git
    echo $REPO_NAME
}

run_test()
{
    TEST_SOURCE_REPO_URL=$1
    SCRIPT=$2

    # Prepare submission repository
    clone_repo $SUBMISSION_REPO_URL $SUBMITTER_PAT
    export PATH_TO_SUBMISSION_REPO=$PWD/$(extract_github_repo_name $SUBMISSION_REPO_URL)

    # Prepare test code repository
    clone_repo $TEST_SOURCE_REPO_URL $SHIFTBASE_PAT
    export PATH_TO_TEST_SOURCE=$PWD/$(extract_github_repo_name $TEST_SOURCE_REPO_URL)

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
    * ) echo "No match test case" ;;
esac

# Run test.
run_test $TEST_SOURCE_REPO_URL scripts/$SCRIPT
