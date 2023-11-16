#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/src/test/test.ts

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/src/test/test.ts $PATH_TO_SUBMISSION_REPO/src/test/test.ts

# Run test.
cd $PATH_TO_SUBMISSION_REPO
yarn install
yarn test
