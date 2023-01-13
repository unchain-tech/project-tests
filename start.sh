#!/bin/bash

# e: Exit if a command fails.
# u: Treats unset or undefined variables as an error.
# x: Prints out command arguments during execution.
OPTIONS=eux
set -$OPTIONS

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
    export PATH_TO_TEST_SOURCE_REPO=$PWD/$TEST_SOURCE_REPO_NAME

    # Run
    chmod 755 $SCRIPT
    bash -$OPTIONS $SCRIPT
}

# List test resources corresponding to PROJECT_ID.
# PROJECT_ID of star-pass (555~557) is randomly selected from not in use.
case "$PROJECT_ID" in
    "402" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/near-hotel-booking-dapp.git
        SCRIPT=near_hotel_booking.sh
        ;;
    "403" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/NEAR-Bike-Sharing.git
        SCRIPT=near_bike_sharing.sh
        ;;
    "503" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git
        SCRIPT=avax_asset_tokenization.sh
        ;;
    "555" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code
        SCRIPT=starpass_sns.sh
        ;;
    "556" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code
        SCRIPT=starpass_gov.sh
        ;;
    "557" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code
        SCRIPT=starpass_med.sh
        ;;
    "602" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/icp_basic_dex.git
        SCRIPT=icp_basic_dex.sh
        ;;
    * ) echo "No match test case"
        exit 1
        ;;
esac

# Run test.
run_test $TEST_SOURCE_REPO_URL scripts/$SCRIPT
