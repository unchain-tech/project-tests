#!/bin/bash

# Install dependencies.
# The import path is from start.sh
source utils/install_rust.sh
install_rust

# File name.
SUBMISSION_LIB=$PATH_TO_SUBMISSION_REPO/packages/contract/src/lib.rs
TEST_LIB=$PATH_TO_TEST_SOURCE_REPO/packages/contract/src/lib.rs

# Clean existing test code in submission file.
# Remove lines after "cfg(all(test, not(target_arch = "wasm32")))".
sed -i '/cfg(all(test, not(target_arch = "wasm32")))/,$d' $SUBMISSION_LIB

# Extract test code.
# Remove lines before "cfg(all(test, not(target_arch = "wasm32")))".
sed -n -i '/cfg(all(test, not(target_arch = "wasm32")))/,$p' $TEST_LIB

# Append test code to submission file.
cat $TEST_LIB >> $SUBMISSION_LIB

# Run test.
cd $PATH_TO_SUBMISSION_REPO/packages/contract
cargo test
