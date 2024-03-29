# Inception

Inceptionは42Schoolsの課題の一つで、Dockerを利用してウェブサーバを立てるプロジェクトです。このプロジェクトでは、以下の要素を含むウェブサーバのセットアップと運用を行います。

### 主な特徴

- `make`コマンドによる簡単なセットアップ
- Nginx, Wordpress, Mariadbを接続したコンテナの稼働
- 追加機能としてRedisキャッシュ、Adminer、FTPサーバ、IRCサーバの設定と稼働

`tsudo.42.fr`からサイトにアクセスできます。
各種設定は `srcs/.env`ファイルで指定できます。

## 目次

- [セットアップ](#セットアップ)
- [使用方法](#使用方法)
- [注意](#注意)

## セットアップ

1. `/etc/hosts`ファイルに以下の行を追加します。これにより、`tsudo.42.fr`と入力すると、`localhost`にアクセスできます。
```
127.0.0.1 tsudo.42.fr
```

2. リポジトリの`Makefile`があるディレクトリを`make`コマンドで実行します。

## 使用方法

セットアップが完了したら、ブラウザから`tsudo.42.fr`にアクセスしてください。

Wordpressでの投稿「Various Pages」に、各種ページへのリンクが記載された静的ページへのリンクがあります。

## 注意

42Schoolsでの課題要件と外れるため、以下の注意があります。
- Docker secretsは使用していません。
- ローカルでの実行を前提としています。

このリポジトリにはライセンスを現時点では設定していません。
