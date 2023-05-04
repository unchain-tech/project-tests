#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/src/__test__
rm -rf $PATH_TO_SUBMISSION_REPO/src/components/NftMinter/index.test.jsx

# Copy original test code.
cp -r $PATH_TO_TEST_SOURCE_REPO/src/__test__ $PATH_TO_SUBMISSION_REPO/src/
cp -r $PATH_TO_TEST_SOURCE_REPO/src/components/NftMinter/index.test.jsx $PATH_TO_SUBMISSION_REPO/src/components/NftMinter/

# Run test.
cd $PATH_TO_SUBMISSION_REPO
npm install
npm run test:all