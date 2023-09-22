#!/bin/bash

# Install dependencies.
# The import path is from start.sh
source utils/install_dfx.sh
install_dfx

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/scripts/test.sh

# Copy original test code.
cp -r $PATH_TO_TEST_SOURCE_REPO/scripts/test.sh $PATH_TO_SUBMISSION_REPO/scripts/test.sh

# Run test.
cd $PATH_TO_SUBMISSION_REPO
bash ./scripts/test.sh
