#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/test

# Copy original test code
cp -r $PATH_TO_TEST_CODE_REPO/test $PATH_TO_SUBMISSION_REPO/test

# Run test. Test sns temporarily.
cd $PATH_TO_SUBMISSION_REPO
yarn
yarn test:sns

# Exit with last status.
exit $?