# このレポジトリについて

学習コンテンツ/STARPASS の提出物に対するテストを管理するレポジトリです。

codebuild上で動く想定です。

`start.sh`の実行 -> codebuild上で設定された`$TEST_CASE`に該当するテストレポジトリとテストスクリプトの選択・実行を行います。

# テスト追加に必要なフロー

- start.sh内にテストケースの用意
- scriptsディレクトリ内にテストスクリプトを用意
- ローカル環境でテストの実行確認
```
export SUBMISSION_REPO_URL=
export TEST_REPO_URL=
export SUBMITTER_PAT=
export SHIFTBASE_PAT=
export TEST_CASE=

cd このレポジトリ
bash start.sh
```