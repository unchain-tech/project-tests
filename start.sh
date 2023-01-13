#!/bin/bash

# e: Exit if a command fails.
# u: Treats unset or undefined variables as an error.
# x: Prints out command arguments during execution.
OPTIONS=eux
set -$OPTIONS

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

run_test()
{
    SCRIPT=$1
    SUBMISSION_REPO_NAME=$2
    TEST_SOURCE_REPO_NAME=$3

    export PATH_TO_SUBMISSION_REPO=$PWD/$SUBMISSION_REPO_NAME
    export PATH_TO_TEST_SOURCE_REPO=$PWD/$TEST_SOURCE_REPO_NAME

    chmod 755 $SCRIPT
    bash -$OPTIONS $SCRIPT
}

# List test resources corresponding to PROJECT_ID.
# PROJECT_ID of star-pass (555~557) is randomly selected from not in use.
case "$PROJECT_ID" in
    "402" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/near-hotel-booking-dapp.git
        TEST_SOURCE_ACCESS_TOKEN=
        SCRIPT=near_hotel_booking.sh
        ;;
    "403" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/NEAR-Bike-Sharing.git
        TEST_SOURCE_ACCESS_TOKEN=
        SCRIPT=near_bike_sharing.sh
        ;;
    "503" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git
        TEST_SOURCE_ACCESS_TOKEN=
        SCRIPT=avax_asset_tokenization.sh
        ;;
    "555" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-starter-project.git
        TEST_SOURCE_ACCESS_TOKEN=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
        SCRIPT=starpass_soc.sh
        ;;
    "556" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-starter-project.git
        TEST_SOURCE_ACCESS_TOKEN=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
        SCRIPT=starpass_gov.sh
        ;;
    "557" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-starter-project.git
        TEST_SOURCE_ACCESS_TOKEN=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
        SCRIPT=starpass_med.sh
        ;;
    "602" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/icp_basic_dex.git
        TEST_SOURCE_ACCESS_TOKEN=
        SCRIPT=icp_basic_dex.sh
        ;;
    * ) echo "No match PROJECT_ID"
        exit 1
        ;;
esac

if [ -z $TEST_SOURCE_ACCESS_TOKEN ]; then
    # If the environment variable is not set, a dummy is set.
    TEST_SOURCE_ACCESS_TOKEN=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
fi

# 

# To avoid name conflicts because the following two repositories may be the same during test simulation.
SUBMISSION_REPO_NAME=submission
TEST_SOURCE_REPO_NAME=test_source

clone_repo $SUBMISSION_REPO_URL $SUBMITTER_PAT $SUBMISSION_REPO_NAME

clone_repo $TEST_SOURCE_REPO_URL $TEST_SOURCE_ACCESS_TOKEN $TEST_SOURCE_REPO_NAME

run_test scripts/$SCRIPT $SUBMISSION_REPO_NAME $TEST_SOURCE_REPO_NAME
