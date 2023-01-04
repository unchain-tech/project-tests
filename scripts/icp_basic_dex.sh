#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/scripts/test.sh

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/scripts/test.sh $PATH_TO_SUBMISSION_REPO/scripts/test.sh

# Run test.
cd $PATH_TO_SUBMISSION_REPO
git submodule update --init --recursive

dfx stop
rm -rf .dfx
dfx start --clean --background

bash ./scripts/test.sh
dfx stop