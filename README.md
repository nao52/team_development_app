# Ruby on Railsを用いたチーム開発を行います！

これは、学習のためRuby on Railsを用いてチーム開発を行うためのアプリケーションです。
アプリケーションの内容は未定です。

# 使用技術

### バックエンド
* Ruby 3.1.4
* Rails 7.0.8

### テスト
* Rspec

# セットアップ

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、Dockerを使った環境構築を行います。

Dockerを使った環境準備(イメージのビルド)
```
$ docker compose build
```

railsサーバーの起動(バックグラウンドでのコンテナの立ち上げとrailsサーバーの起動)
```
docker compose up -d
```

コンテナ内に入る(rails・bundlerのコマンドはコンテナ内で実行します)
```
docker compose exec web bash
```

### 以下はコンテナ内で実行する

データベースの作成(コンテナ内で実行してください)
```
rails db:create
```

テーブルの作成
```
$ rails db:migrate
```

テストデータの作成
```
$ rails db:seed
```