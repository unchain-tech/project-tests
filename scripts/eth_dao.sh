#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/test/test.ts

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/test/test.ts $PATH_TO_SUBMISSION_REPO/test/test.ts

# make .env.local file and add valueable
cd $PATH_TO_SUBMISSION_REPO
touch .env.local
echo -e "PRIVATE_KEY=$PRIVATE_KEY\nWALLET_ADDRESS=$WALLET_ADDRESS\nALCHEMY_API_URL=$ALCHEMY_API_URL" > .env.local

# Run test.
yarn install
yarn test
