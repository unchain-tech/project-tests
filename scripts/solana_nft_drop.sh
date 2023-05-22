#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/__tests__

# Copy original test code.
cp -r $PATH_TO_TEST_SOURCE_REPO/__tests__ $PATH_TO_SUBMISSION_REPO/
# Copy if .env.test file does not exist.
if [ ! -f ${PATH_TO_SUBMISSION_REPO}/.env.test ]; then
  cp -r $PATH_TO_TEST_SOURCE_REPO/.env.test $PATH_TO_SUBMISSION_REPO/
fi

# Run test.
cd $PATH_TO_SUBMISSION_REPO
yarn install
yarn test