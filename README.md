#### 📓 このレポジトリについて

学習コンテンツ/STARPASS の提出物に対するテストを管理・実行するレポジトリです。

以下のコマンドでテストを開始します。

```
bash start.sh
```

テストの実行には以下の環境変数が必要です。

```
SUBMISSION_REPO_URL
SUBMITTER_PAT
SHIFTBASE_PAT
TEST_CASE
```

### 📓 全体像

テストは, codebuildというawsのマシン上にあるLinux環境で行います。  
以下のリンクにある図を参考にしてください。

https://app.diagrams.net/#G16k64Y8UUGiJgKQyOhEQ5q4LxUckUa79r

### 📓 テスト追加の方法

1. `start.sh`内にテストケースの用意
2. `scripts`ディレクトリ内にテストスクリプトを用意
3. ローカル環境で実行確認
4. プルリク

例:
学習コンテンツ`AVAX-AssetTokenization`の場合。

🐦 `start.sh`内に以下を追加。

- テストケース名。(任意の名前。ここでは`AVAX_ASSET_TOKENIZATION`。)
- オリジナルのテストコードが入ったURL。以下TEST_SOURCE_REPO_URLと呼びます。(学習コンテンツの場合は完成形のリポジトリを想定。ここでは[こちらのリンク先](https://github.com/unchain-dev/AVAX-Asset-Tokenization.git)。)
- 実行するスクリプトのファイル名。(任意の名前。ファイル自体は次のステップで作成します。ここでは`avax_asset_tokenization.sh`。)

```
    "AVAX_ASSET_TOKENIZATION" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git
        SCRIPT=avax_asset_tokenization.sh
        ;;
```

🐦 `scripts`ディレクトリ内に先ほど決めた名前でファイルを作成します(ここでは`avax_asset_tokenization.sh`)。

`avax_asset_tokenization.sh`内に何を実行するのかを記述します。

このスクリプト実行時には既に2つのリポジトリがクローンされていて, 以下の環境変数によってそれぞれアクセスできるので利用してください。

- `PATH_TO_SUBMISSION_REPO`: 提出されたレポジトリへのパス
- `PATH_TO_TEST_SOURCE_REPO`: オリジナルのテストコードが入ったリポジトリへのパス

`avax_asset_tokenization.sh`内では以下の内容を行っています。

1. `PATH_TO_SUBMISSION_REPO`内のテストコードを削除
2. `PATH_TO_TEST_SOURCE_REPO`内のオリジナルのテストコードを`PATH_TO_SUBMISSION_REPO`内へコピー
3. `PATH_TO_TEST_SOURCE_REPO`内でテストコマンドの実行

⚠️ `yarn install`など, テスト実行に必要なものがある場合はテスト実行前にインストール作業を記述してください。  
`npm`, `yarn`はビルトインで使えることを確認しました。  
その他macのターミナルで使用できるコマンドは大体使用できると思います。

🐦 ローカル環境で実行確認をしてください。

環境変数をセットします。
```bash
export SUBMISSION_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git
# 本番では提出されたリポジトリのURLを指します。
# ここではテストが動くかの確認なので, TEST_SOURCE_REPO_URLと同じもので大丈夫です。

export SUBMITTER_PAT=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
# 提出者のリポジトリをクローンするためのトークンです。
# 学習コンテンツの場合, SUBMISSION_REPO_URLはpublicなはずなので, こちらは編集しなくて大丈夫です。このままexportしてください。

export SHIFTBASE_PAT=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
# TEST_SOURCE_REPO_URLをクローンするためのトークンです。
# 学習コンテンツの場合, TEST_SOURCE_REPO_URLはpublicなはずなので, こちらは編集しなくて大丈夫です。このままexportしてください。

export TEST_CASE=AVAX_ASSET_TOKENIZATION
# 先ほど追加したテストケースの名前を記述してください。
```

このリポジトリ内にて, 以下のコマンドで`start.sh`を実行してください。  
⚠️ コマンド実行によりディレクトリ内が編集される可能性があります。 変更をコミットしていない場合は, ディレクトリごとコピーしてそちらで実行するなど対処してください。

```
bash start.sh
```

🐦 テスト実行が無事確認できたらプルリクしてください。