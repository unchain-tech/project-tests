#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/test/test.ts

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/test/test.ts $PATH_TO_SUBMISSION_REPO/test/test.ts

# make .env.local file and add valueable
cd $PATH_TO_SUBMISSION_REPO
touch .env.local
cd ..
cp -r .env.local $PATH_TO_SUBMISSION_REPO/.env.local

# Run test.
cd $PATH_TO_SUBMISSION_REPO
yarn install
yarn test
