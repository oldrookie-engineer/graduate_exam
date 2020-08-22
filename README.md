# README

# ASAP BOX
![asap-box](images/asap-box.png)

## 概要

#### 前職(公務員)で役所のデータ管理が、非効率的だと感じていた実務経験を基に、紙媒体で保管している認可幼稚園情報の台帳などをデータベースで管理し、調べたい情報を素早く取得することができます。また、職員が行う認可業務の進捗管理も行い、タスク漏れを防ぐことができます。
## コンセプト

#### なる早情報探索アプリ

## 使用技術
#### ・Ruby 2.6.5 Rails 5.2.4
#### ・Rails 5.2.4
#### ・Rspec
#### ・jQuery
#### ・Vue.js
#### ・Bootstrap4
#### ・PostgreSQL
#### ・AWS(VPC,EC2,S3,ALB,Route53,ACM)
+ devise
+ メッセージ機能

### カリキュラム外などから１つ以上
+ google API
+ Vue.js

## 機能一覧

### ・ ユーザー登録機能
* [ ] #### ・名前、メールアドレス、パスワードは必須
### ・ ログイン機能(devise)
 ####  ・email、パスワードによる認証
 ####  ・ゲストログインによる認証も可
* [ ] 幼稚園一覧表示機能
* [ ] 幼稚園検索機能
* [ ] 幼稚園所在地スクロール機能
* [ ] 幼稚園登録機能
* [ ] 幼稚園編集機能
* [ ] 幼稚園削除機能
  * [ ] 幼稚園登録・編集・削除は、管理者のみ可能
* [ ] 幼稚園詳細情報表示機能
  * [ ] 詳細情報内の認可情報・担当者メモ・外観写真・アクセス・アーカイブはページ遷移なしで表示切替えできる
* [ ] 担当者メモ登録機能
* [ ] 担当者メモ削除機能
* [ ] アーカイブ編集機能
  * [ ] アーカイブ編集は、管理者のみ可能
* [ ] メッセージ機能(アーカイブの使用・返却報告)
* [ ] 申請状況表示機能
* [ ] 申請登録機能
* [ ] 申請削除機能
  * [ ] 申請の削除は、管理者のみ可能

## カタログ設計

<https://docs.google.com/spreadsheets/d/e/2PACX-1vSwvC58t34f2b3EupbpMhvoEK4YbyHlAmVDqRYsSziyaankqe1F-eVtNYuYrl7_x8qUSDQ5cvggECWp/pubhtml>

## テーブル定義

<https://docs.google.com/spreadsheets/d/e/2PACX-1vT9y4LZoY7PJuu28aY6jAa1zyqATxdasf6Tn6Wjvu4NLUyz72aTEfZYYDh9ehTO4197KzHDzw-ci3fN/pubhtml>

## 画面遷移図

<https://docs.google.com/spreadsheets/d/e/2PACX-1vQZmV3UB0-SfWuo24yEaYh5Hdnpv5Q9Nx7_Whh7FQpQJfly2JJNfAFLl2p462uQY07yUYJpZpk0n8K5/pubhtml?gid=0&single=true>

## 画面ワイヤーフレーム

<https://docs.google.com/spreadsheets/d/e/2PACX-1vSVcNq42wBWN9Q6NWiuFELkVaISA5nrj-KsbajAo2JaTvG5L9naN29ragspilV1eyXn7Wh0Iv9-zhPu/pubhtml>

## 使用Gem
#### ・devise
#### ・ransack
#### ・carrierwave
#### ・mini_magic
#### ・webpacker
#### ・geocoder
#### ・kaminari
#### ・letter_opener_web
#### ・bullet
#### ・fog-aws
