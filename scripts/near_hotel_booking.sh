#!/bin/bash

# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/contract/tests

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/contract/tests $PATH_TO_SUBMISSION_REPO/contract/tests

# Run test.
cd $PATH_TO_SUBMISSION_REPO/contract
cargo test --test integration_test
