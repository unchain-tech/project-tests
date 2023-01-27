#!/bin/bash

# e: Exit if a command fails.
# u: Treats unset or undefined variables as an error.
# x: Prints out command arguments during execution.
set -eux

#****************     SETTINGS     *******************************************************

# PROJECT_ID of STARPASS projects (555~557) is randomly selected from not in use.
case "$PROJECT_ID" in
    "401" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/near-election-dapp.git
        SCRIPT=near-election-dapp.sh
        ;;
    "402" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/near-hotel-booking-dapp.git
        SCRIPT=near_hotel_booking.sh
        ;;
    "403" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/NEAR-Bike-Sharing.git
        SCRIPT=near_bike_sharing.sh
        ;;
    "501" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Messenger.git
        SCRIPT=avax_messenger.sh
        ;;
    "502" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Amm.git
        SCRIPT=avax_amm.sh
        ;;
    "503" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git
        SCRIPT=avax_asset_tokenization.sh
        ;;
    "504" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Subnet.git
        SCRIPT=avax_subnet.sh
        ;;
    "555" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code.git
        SCRIPT=starpass_soc.sh
        ;;
    "556" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code.git
        SCRIPT=starpass_gov.sh
        ;;
    "557" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code.git
        SCRIPT=starpass_med.sh
        ;;
    "602" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/icp_basic_dex.git
        SCRIPT=icp_basic_dex.sh
        ;;
    * ) echo "No match PROJECT_ID"
        exit 1
        ;;
esac

#****************     END SETTINGS     ****************************************************

#****************     TEST     *******************************************************

# To avoid name conflicts because the following two repositories may be the same during test simulation.
SUBMISSION_REPO_NAME=submission
TEST_SOURCE_REPO_NAME=test_source

source utils/clone_repo.sh
clone_repo $SUBMISSION_REPO_URL $SUBMITTER_PAT $SUBMISSION_REPO_NAME
clone_repo $TEST_SOURCE_REPO_URL $SHIFTBASE_PAT $TEST_SOURCE_REPO_NAME # SHIFTBASE_PAT is for private repositories.

source utils/run_test.sh
run_test scripts/$SCRIPT $SUBMISSION_REPO_NAME $TEST_SOURCE_REPO_NAME

#****************     END TEST     *******************************************************
