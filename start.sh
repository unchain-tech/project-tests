#!/bin/bash

# e: Exit if a command fails.
# u: Treats unset or undefined variables as an error.
# x: Prints out command arguments during execution.
set -eux

#****************     SETTINGS     *******************************************************

# PROJECT_ID of STARPASS projects (555~557) is randomly selected from not in use.
case "$PROJECT_ID" in
    "101" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ETH-dApp.git
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
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ETH-NFT-Game.git
        SCRIPT=eth_nft_game.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "105" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ETH-Yield-Farm.git
        SCRIPT=eth_yield_farm.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "106" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ETH-DAO.git
        SCRIPT=eth_dao.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "201" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/Polygon-Generative-NFT.git
        SCRIPT=polygon_generative_nft.sh
        IS_STARTER_PRESENT="yes"
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
    "204" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/Polygon-Whitelist-NFT.git
        SCRIPT=polygon_whitelist_nft.sh
        IS_STARTER_PRESENT="no"
        ;;
    "301" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/Solana-dApp.git
        SCRIPT=solana_dapp.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "302" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/Solana-NFT-Drop.git
        SCRIPT=solana_nft_drop.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "303" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/Solana-Online-Store.git
        SCRIPT=solana_online_store.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "304" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/Solana-Wallet.git
        SCRIPT=solana_wallet.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "401" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/NEAR-Election-dApp.git
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
        IS_STARTER_PRESENT="no"
        ;;
    "404" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/NEAR-MulPay.git
        SCRIPT=near_mulpay.sh
        IS_STARTER_PRESENT="no"
        ;;
    "501" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/AVAX-Messenger.git
        SCRIPT=avax_messenger.sh
        IS_STARTER_PRESENT="no"
        ;;
    "502" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/AVAX-AMM.git
        SCRIPT=avax_amm.sh
        IS_STARTER_PRESENT="no"
        ;;
    "503" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/AVAX-Asset-Tokenization.git
        SCRIPT=avax_asset_tokenization.sh
        IS_STARTER_PRESENT="no"
        ;;
    "504" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/AVAX-Subnet.git
        SCRIPT=avax_subnet.sh
        IS_STARTER_PRESENT="no"
        ;;
    "555" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code.git
        SCRIPT=starpass_soc.sh
        IS_STARTER_PRESENT="no"
        ;;
    "556" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code.git
        SCRIPT=starpass_gov.sh
        IS_STARTER_PRESENT="no"
        ;;
    "557" )
        TEST_SOURCE_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code.git
        SCRIPT=starpass_med.sh
        IS_STARTER_PRESENT="no"
        ;;
    "601" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ICP-Static-Site.git
        SCRIPT=icp_static_site.sh
        IS_STARTER_PRESENT="no"
        ;;
    "602" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ICP-Basic-DEX.git
        SCRIPT=icp_basic_dex.sh
        IS_STARTER_PRESENT="no"
        ;;
    "603" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ICP-Encrypted-Notes.git
        SCRIPT=icp_encrypted_notes.sh
        IS_STARTER_PRESENT="yes"
        ;;
    "701" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/ASTAR-SocialFi.git
        SCRIPT=astar_socailfi.sh
        IS_STARTER_PRESENT="no"
        ;;
    "801" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-tech/XRPL-NFT-Maker.git
        SCRIPT=xrpl_nft_maker.sh
        IS_STARTER_PRESENT="yes"
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
clone_submission_repo $SUBMISSION_REPO_URL $SUBMITTER_PAT $SUBMISSION_REPO_NAME ${IS_DEV:-"no"}
clone_test_source_repo $TEST_SOURCE_REPO_URL $SHIFTBASE_PAT $TEST_SOURCE_REPO_NAME $IS_STARTER_PRESENT # SHIFTBASE_PAT is for private repositories.

source utils/run_test.sh
run_test scripts/$SCRIPT $SUBMISSION_REPO_NAME $TEST_SOURCE_REPO_NAME

#****************     END TEST     *******************************************************