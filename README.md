# 📓 このレポジトリについて

学習コンテンツ/STARPASS の提出物に対するテストを管理・実行するレポジトリです。

以下のコマンドでテストを開始します。

```
bash start.sh
```

テストの実行には以下の環境変数が必要です。

```
SUBMISSION_REPO_URL
SUBMITTER_PAT
PROJECT_ID
```

例:

```bash
# STARPASS
SUBMISSION_REPO_URL=https://github.com/shiftbase-inc/STARPASS-test-code
SUBMITTER_PAT=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
PROJECT_ID=555

# AVAX-AssetTokenization
SUBMISSION_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git
SUBMITTER_PAT=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
PROJECT_ID=503
```

# 📓 全体像

テストは, codebuild という aws のマシン上にある Linux 環境で行います。  
以下のリンクにある図を参考にしてください。

https://app.diagrams.net/#G16k64Y8UUGiJgKQyOhEQ5q4LxUckUa79r

# 📓 テスト追加方法

1. `start.sh`内にテストケースの用意
2. `scripts`ディレクトリ内にテストスクリプトを用意
3. docker またはローカル環境で実行確認
4. プルリク

**例: 学習コンテンツ`AVAX-AssetTokenization`の場合** 💁

### 1.`start.sh`内にテストケースの用意 🦎

`start.sh`内に以下のコードと同様のテストケースが羅列されている箇所があります。  
そこに新しいテストケースを追加します。

```
    "503" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git
        TEST_SOURCE_ACCESS_TOKEN=
        SCRIPT=avax_asset_tokenization.sh
        ;;
```

- `503`: project id
- `TEST_SOURCE_REPO_URL`: オリジナルのテストコードが入った URL（学習コンテンツの場合は完成形のリポジトリを想定）。
- `TEST_SOURCE_ACCESS_TOKEN`: `TEST_SOURCE_REPO_URL`のクローン時に使用するトークンです。Public リポジトリの場合は空白です。
- `SCRIPT`: 実行するスクリプトのファイル名。ファイル自体は次のステップで作成します。

### 2.`scripts`ディレクトリ内にテストスクリプトを用意 🦎

`scripts`ディレクトリ内に先ほど決めた名前でファイルを作成します。

スクリプト内に何を実行するのかを記述します。

このスクリプト実行時には既に 2 つのリポジトリがクローンされていて,  
スクリプト内では以下の環境変数によってそれぞれのリポジトリにアクセスできるので利用してください。

- `PATH_TO_SUBMISSION_REPO`: 提出されたレポジトリへのパス
- `PATH_TO_TEST_SOURCE_REPO`: オリジナルのテストコードが入ったリポジトリへのパス

⚠️ テスト実行に必要な依存ファイルのインストールに注意してください。  
[こちら](https://github.com/aws/aws-codebuild-docker-images/blob/master/ubuntu/standard/6.0/Dockerfile)にインストールが記載されているコマンドは実行環境に既にインストールされ, 使用できるはずです。  
例えば`npm`で検索するとインストールしている箇所があるので, `npm`は使用できます。  
`rust`はないので, `rust`はスクリプト内でインストールする必要があります。

> codebuild の実行環境は以下の手順で割り出しました。
>
> - 過去のビルド記録に`aws/codebuild/standard:6.0`という docker image の使用記載があった。
> - [こちら](https://docs.aws.amazon.com/ja_jp/codebuild/latest/userguide/build-env-ref-available.html)から該当する docker image のソースコードリンクを取得。

### 3.docker またはローカル環境で実行確認 🦎

**docker**

codebuild で使用されている docker image をローカルでビルドするのは 1 時間以上かかったので断念しました。

もし実行される場合は[こちら](https://github.com/aws/aws-codebuild-docker-images/tree/master/ubuntu/standard/6.0)の README を参照して下さい。

※ m1 mac の場合, `docker build --platform linux/amd64 -t aws/codebuild/standard:6.0 .`でビルドを実行する必要があります。

**ローカル**

Linux または macOS など, bash スクリプトが実行できれば, ローカルでもある程度動作確認ができると思います。

スクリプトを実行する前に以下の環境変数をセットする必要があります。

```bash
# 本番では, 提出されたリポジトリのURLを指します。
# ここではテストが動くかの確認なので, TEST_SOURCE_REPO_URLと同じもので大丈夫です。
export SUBMISSION_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git

# 本番では, 提出者のリポジトリをクローンする際に使用するアクセストークンを指します。
# 先ほど指定したSUBMISSION_REPO_URLがpublicな場合は関係ないので以下のコマンドをそのまま実行してください。privateの場合は適切なアクセストークンを設定してください。
export SUBMITTER_PAT=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

export PROJECT_ID=503
```

このリポジトリ内にて, 以下のコマンドで`start.sh`を実行してください。  
⚠️ コマンド実行によりディレクトリ内が編集される可能性があります。 変更をコミットしていない場合は, ディレクトリごとコピーしてそちらで実行するなど対処してください。

```
bash start.sh
```

### 4.プルリク 🦎

テスト実行が無事確認できたらプルリクしてください。
