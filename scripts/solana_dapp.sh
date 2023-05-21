#!/bin/bash

# Install dependencies.
# The import path is from start.sh

# Ubuntuの環境構築
sudo apt-get update && sudo apt-get install -y pkg-config build-essential libudev-dev libssl-dev
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1l-1ubuntu1.2_amd64.deb
sudo dpkg -i libssl1.1_1.1.1l-1ubuntu1.2_amd64.deb

source utils/install_rust.sh
install_rust

# solanaをインストールする
sh -c "$(curl -sSfL https://release.solana.com/v1.14.17/install)"
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

# anchor-cliをインストールする
cargo install --git https://github.com/project-serum/anchor --tag v0.26.0 anchor-cli --locked

# 1. プロジェクトをクローン後テストファイルを置き換える
# Clean existing test code.
rm -rf $PATH_TO_SUBMISSION_REPO/packages/contract/tests

# Copy original test code
cp -r $PATH_TO_TEST_SOURCE_REPO/packages/contract/tests $PATH_TO_SUBMISSION_REPO/packages/contract/tests

# 提出されたプロジェクトのディレクトリに移動＋必要なパッケージをインストール
cd $PATH_TO_SUBMISSION_REPO
yarn

# コントラクトのプロジェクトに移動
cd packages/contract

# 2. ローカルネットワークをバックエンドで起動させる + 立ち上げまで5秒間待つ
solana-test-validator -r --quiet & sleep 5

# 3. 新しいウォレットの作成と必要なSOLの取得
solana-keygen new -o fooKey.json --force --no-bip39-passphrase
solana config set --keypair fooKey.json && solana config set --url localhost
solana-keygen new -o target/deploy/myepicproject-keypair.json --force --no-bip39-passphrase

# 4. 必要なトークンの付与
solana airdrop 6

# 5. コントラクトのbuild, deploy, test
yarn build
yarn deploy
v=`solana address -k target/deploy/myepicproject-keypair.json`
sed -i -e "3s/^.*/declare_id!(\"$v\");/" ./programs/myepicproject/src/lib.rs
sed -i -e "6s/^.*/myepicproject = \"$v\"/" Anchor.toml

yarn build
yarn deploy
yarn test