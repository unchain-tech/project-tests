#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/__tests__

# Copy original test code.
cp -r $PATH_TO_TEST_SOURCE_REPO/__tests__ $PATH_TO_SUBMISSION_REPO/

# Run test.
cd $PATH_TO_SUBMISSION_REPO
yarn install
yarn test