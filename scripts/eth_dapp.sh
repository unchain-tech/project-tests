#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/packages/contract/scripts/run.js

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/packages/contract/scripts/run.js $PATH_TO_SUBMISSION_REPO/packages/contract/scripts/run.js

# Run test.
cd $PATH_TO_SUBMISSION_REPO
yarn install
yarn contract test
