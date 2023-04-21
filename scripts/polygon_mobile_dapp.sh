#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/packages/contract/test

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/packages/contract/test $PATH_TO_SUBMISSION_REPO/packages/contract/test

cd $PATH_TO_SUBMISSION_REPO
yarn

cd packages/contract
touch .secret

# Run test.
truffle develop & truffle test