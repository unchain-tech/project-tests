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
PROJECT_ID
```

### 📓 全体像

テストは, codebuildというawsのマシン上にあるLinux環境で行います。  
以下のリンクにある図を参考にしてください。

https://app.diagrams.net/#G16k64Y8UUGiJgKQyOhEQ5q4LxUckUa79r

### 📓 テスト追加の方法

1. `start.sh`内にテストケースの用意
2. `scripts`ディレクトリ内にテストスクリプトを用意
3. dockerまたはローカル環境で実行確認
4. プルリク

例: 学習コンテンツ`AVAX-AssetTokenization`の場合。

**1** `start.sh`内にテストケースの用意

`start.sh`内に以下のコードと同様のテストケースが羅列されている箇所があります。  
そこに新しいテストケースを追加します。

```
    "503" )
        TEST_SOURCE_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git
        SCRIPT=avax_asset_tokenization.sh
        ;;
```

- `503`: project id
- `TEST_SOURCE_REPO_URL`: オリジナルのテストコードが入ったURL。以下TEST_SOURCE_REPO_URLと呼びます。(学習コンテンツの場合は完成形のリポジトリを想定）。
- `SCRIPT`: 実行するスクリプトのファイル名。(ファイル自体は次のステップで作成します）。

**2** `scripts`ディレクトリ内にテストスクリプトを用意

`scripts`ディレクトリ内に先ほど決めた名前でファイルを作成します。

スクリプト内に何を実行するのかを記述します。

このスクリプト実行時には既に2つのリポジトリがクローンされていて,  
スクリプト内では以下の環境変数によってそれぞれのリポジトリにアクセスできるので利用してください。

- `PATH_TO_SUBMISSION_REPO`: 提出されたレポジトリへのパス
- `PATH_TO_TEST_SOURCE_REPO`: オリジナルのテストコードが入ったリポジトリへのパス

⚠️ テスト実行に必要な依存ファイルのインストールに注意してください。  
[こちら](https://github.com/aws/aws-codebuild-docker-images/blob/master/ubuntu/standard/6.0/Dockerfile)にインストールが記載されているコマンドは実行環境に既にインストールされ, 使用できる（と思われます）。  
例えば`npm`で検索するとインストールしている箇所があるので, `npm`は使用できます。  
`rust`はないので, `rust`はスクリプト内でインストールする必要があります。  

> codebuildの実行環境は以下の手順で割り出しました。  
> - 過去のビルド記録に`aws/codebuild/standard:6.0`というdocker imageの使用記載があった。    
> - [こちら](https://docs.aws.amazon.com/ja_jp/codebuild/latest/userguide/build-env-ref-available.html)から該当するdocker imageのソースコードリンクを取得。

**3** dockerまたはローカル環境で実行確認

**docker**

codebuildで使用されているdocker imageをローカルでビルドするのは1時間以上かかったので断念しました。  

もし実行される場合は[こちら](https://github.com/aws/aws-codebuild-docker-images/tree/master/ubuntu/standard/6.0)のREADMEを参照して下さい。  

※ m1 macの場合, `docker build --platform linux/amd64 -t aws/codebuild/standard:6.0 .`でビルドを実行する必要があります。

**ローカル**

LinuxまたはmacOSなど, bashスクリプトが実行できれば, ローカルでもある程度動作確認ができると思います。

スクリプトを実行する前に以下の環境変数をセットする必要があります。

```
SUBMISSION_REPO_URL
SUBMITTER_PAT
SHIFTBASE_PAT
PROJECT_ID
```

環境変数をセットします。
```bash
# 本番では提出されたリポジトリのURLを指します。
# ここではテストが動くかの確認なので, TEST_SOURCE_REPO_URLと同じもので大丈夫です。
export SUBMISSION_REPO_URL=https://github.com/unchain-dev/AVAX-Asset-Tokenization.git

# 提出者のリポジトリをクローンするためのアクセストークンを指します。
# 学習コンテンツの場合, SUBMISSION_REPO_URLはpublicなはずなので, こちらは編集しなくて大丈夫です。このままexportしてください。
export SUBMITTER_PAT=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

# TEST_SOURCE_REPO_URLをクローンするためのアクセストークンを指します。
# 学習コンテンツの場合, TEST_SOURCE_REPO_URLはpublicなはずなので, こちらは編集しなくて大丈夫です。このままexportしてください。
export SHIFTBASE_PAT=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

# テスト対象のプロジェクトIDを指します。
export PROJECT_ID=503
```

このリポジトリ内にて, 以下のコマンドで`start.sh`を実行してください。  
⚠️ コマンド実行によりディレクトリ内が編集される可能性があります。 変更をコミットしていない場合は, ディレクトリごとコピーしてそちらで実行するなど対処してください。

```
bash start.sh
```

**4** プルリク

テスト実行が無事確認できたらプルリクしてください。
