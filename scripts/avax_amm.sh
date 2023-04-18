#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/packages/contract/test/AMM.ts

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/packages/contract/test/AMM.ts $PATH_TO_SUBMISSION_REPO/packages/contract/test/AMM.ts

# Run test.
cd $PATH_TO_SUBMISSION_REPO
npm install
npm run test
