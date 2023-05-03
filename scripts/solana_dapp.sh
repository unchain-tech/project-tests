#!/bin/bash

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

# 2. ローカルネットワークをバックエンドで起動させる
solana-test-validator -r --quiet &

# 立ち上げまで5秒間待つ
sleep 5

# 3. 新しいウォレットの作成と必要なSOLの取得
solana-keygen new -o fooKey.json --force --no-bip39-passphrase
solana config set --keypair fooKey.json && solana config set --url localhost
solana-keygen new -o target/deploy/myepicproject-keypair.json --force --no-bip39-passphrase

# 4. コントラクトのbuild, deploy, test
yarn build
v=$(solana-keygen pubkey target/deploy/myepicproject-keypair.json)
sed -i '' -e "3s/^.*/declare_id!(\"$v\");/" ./programs/myepicproject/src/lib.rs
sed -i '' -e "6s/^.*/myepicproject = \"$v\"/" Anchor.toml

yarn build
# Run test.
anchor run test


sed -i "" "13s/^.*/wallet = \"fooKey.json\"/" Anchor.toml
solana airdrop 6
yarn build
yarn deploy
v=`solana address -k target/deploy/myepicproject-keypair.json`
sed -i "" "3s/^.*/declare_id!(\"$v\");/" programs/myepicproject/src/lib.rs && sed -i "" "6s/^.*/myepicproject = \"$v\"/" Anchor.toml
yarn build
yarn deploy
yarn test