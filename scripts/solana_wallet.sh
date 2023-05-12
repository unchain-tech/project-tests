#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/test
rm -f $PATH_TO_SUBMISSION_REPO/components/**/index.test.js

# Copy original test code.
cp -r $PATH_TO_TEST_SOURCE_REPO/test $PATH_TO_SUBMISSION_REPO/
cp -r $PATH_TO_TEST_SOURCE_REPO/components/Airdrop/index.test.js $PATH_TO_SUBMISSION_REPO/components/Airdrop/
cp -r $PATH_TO_TEST_SOURCE_REPO/components/GenerateWallet/index.test.js $PATH_TO_SUBMISSION_REPO/components/GenerateWallet/
cp -r $PATH_TO_TEST_SOURCE_REPO/components/GetBalance/index.test.js $PATH_TO_SUBMISSION_REPO/components/GetBalance/
cp -r $PATH_TO_TEST_SOURCE_REPO/components/ImportWallet/index.test.js $PATH_TO_SUBMISSION_REPO/components/ImportWallet/
cp -r $PATH_TO_TEST_SOURCE_REPO/components/Transfer/index.test.js $PATH_TO_SUBMISSION_REPO/components/Transfer/

# Run test.
cd $PATH_TO_SUBMISSION_REPO
npm install
npm run test