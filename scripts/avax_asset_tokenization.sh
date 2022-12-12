#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/contract/test

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/contract/test $PATH_TO_SUBMISSION_REPO/contract/test

# Run test.
cd $PATH_TO_SUBMISSION_REPO/contract
npm install
npx hardhat test
