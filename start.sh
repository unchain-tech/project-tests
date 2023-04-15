#!/bin/bash

# e: Exit if a command fails.
# u: Treats unset or undefined variables as an error.
# x: Prints out command arguments during execution.
set -eux

#****************     SETTINGS     *******************************************************

# PROJECT_ID of STARPASS projects (555~557) is randomly selected from not in use.
case "$PROJECT_ID" in
    "101" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ETH-dApp
        SCRIPT=eth_dapp.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "102" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ETH-NFT-Collection.git
        SCRIPT=eth_nft_collection.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "103" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ETH-NFT-Maker.git
        SCRIPT=eth_nft_maker.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "104" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ETH-NFT-Game
        SCRIPT=eth_nft_game.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "105" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ETH-Yield-Farm.git
        SCRIPT=ganache_yield_farm.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "201" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/Polygon-Generative-NFT.git
        SCRIPT=polygon_generative_nft.sh
        IS_STARTER_PRESENT="no"
        ;;
    "202" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/Polygon-ENS-Domain.git
        SCRIPT=polygon_ens_domain.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "203" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/Polygon-Mobile-dApp.git
        SCRIPT=polygon_mobile_dapp.sh
        IS_STARTER_PRESENT="no"
        ;;
    "401" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/near-election-dapp.git
        SCRIPT=near_election_dapp.sh
        IS_STARTER_PRESENT="no"
        ;;
    "402" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/NEAR-Hotel-Booking-dApp.git
        SCRIPT=near_hotel_booking_dapp.sh
        IS_STARTER_PRESENT="no"
        ;;
    "403" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/NEAR-BikeShare.git
        SCRIPT=near_bikeshare.sh
        ;;
    "404" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/near-mulpay-contract.git
        SCRIPT=near_mulpay.sh
        IS_STARTER_PRESENT="no"
        ;;
    "501" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/AVAX-Messenger.git
        SCRIPT=avax_messenger.sh
        ;;
    "502" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/AVAX-Amm.git
        SCRIPT=avax_amm.sh
        ;;
    "503" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/AVAX-Asset-Tokenization.git
        SCRIPT=avax_asset_tokenization.sh
        ;;
    "504" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/AVAX-Subnet.git
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
    "601" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ICP-Static-Site.git
        SCRIPT=icp_static_site.sh
        IS_STARTER_PRESENT="no"
        ;;
    "602" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/icp_basic_dex.git
        SCRIPT=icp_basic_dex.sh
        IS_STARTER_PRESENT="no"
        ;;
    "701" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ASTAR-SocialFi.git
        SCRIPT=astar_socailfi.sh
        IS_STARTER_PRESENT="no"
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
clone_submission_repo $SUBMISSION_REPO_URL $SUBMITTER_PAT $SUBMISSION_REPO_NAME $IS_DEV
clone_test_source_repo $TEST_SOURCE_REPO_URL $SHIFTBASE_PAT $TEST_SOURCE_REPO_NAME $IS_STARTER_PRESENT # SHIFTBASE_PAT is for private repositories.

source utils/run_test.sh
run_test scripts/$SCRIPT $SUBMISSION_REPO_NAME $TEST_SOURCE_REPO_NAME

#****************     END TEST     *******************************************************
