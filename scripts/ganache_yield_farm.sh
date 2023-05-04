#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/test

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/test $PATH_TO_SUBMISSION_REPO/test

# Run test.
cd $PATH_TO_SUBMISSION_REPO
yarn install

truffle develop & 
sleep 3
truffle test

