#!/bin/bash

# TODO: 現状テストコードが同じファイル内にあるためテストコードのコピーができてない, 別ファイルにできるかsaitoさんに聞く
# Clean existing test code.
# rm -rf $PATH_TO_SUBMISSION_REPO/contract/test

# Copy original test code
# cp -r $PATH_TO_TEST_SOURCE_REPO/contract/test $PATH_TO_SUBMISSION_REPO/contract/test

# Run test.
cd $PATH_TO_SUBMISSION_REPO/contract
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
cargo test
