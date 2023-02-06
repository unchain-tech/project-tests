#!/bin/bash

# Install dependencies.
# The import path is from start.sh
source utils/install_rust.sh
install_rust

# File name.
SUBMISSION_LIB=$PATH_TO_SUBMISSION_REPO/lib.rs
TEST_LIB=$PATH_TO_TEST_SOURCE_REPO/lib.rs

# Clean existing test code in submission file.
# Remove lines after "cfg(test)".
sed -i "" '/cfg(test)/,$d' $SUBMISSION_LIB

# Extract test code.
# Remove lines before "cfg(test)".
sed -n -i "" '/cfg(test)/,$p' $TEST_LIB

# Append test code to submission file.
cat $TEST_LIB >> $SUBMISSION_LIB

# Run test.
cd $PATH_TO_SUBMISSION_REPO
cargo +nightly-2022-08-15 test -- --nocapture
