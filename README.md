# README

# ASAP BOX
![asap-box](https://user-images.githubusercontent.com/62285033/91673462-2aca0000-eb6f-11ea-976e-58f0816e5e8d.png)
## URL
<https://www.asap-box.work>
## 概要

#### 前職(公務員)で役所のデータ管理が、非効率的だと感じていた実務経験を基に、大量に紙媒体で保管している認可幼稚園情報の台帳などをデータベースで管理し、調べたい情報を素早く探し出すことができます。また、職員が行う認可業務の進捗管理も行い、タスク漏れを防ぐことができます。

## 使用技術
#### ・Ruby 2.6.5
#### ・Rails 5.2.4
#### ・Rspec
#### ・jQuery
#### ・Vue.js
#### ・Bootstrap4
#### ・PostgreSQL
#### ・AWS(VPC,EC2,S3,ALB,Route53,ACM)
#### ・Nginx(webサーバー)
#### ・Unicorn(アプリケーションサーバー)

## ER図
![ER図](https://user-images.githubusercontent.com/62285033/91547329-b751a400-e95e-11ea-93c7-c6e888a30b7f.png)

## サービス構成図
![サービス構成図](https://user-images.githubusercontent.com/62285033/91557494-862d9f80-e96f-11ea-9825-de04bce251c3.png)

## 機能一覧

### 1 ユーザー登録機能
#### ・名前、メールアドレス、パスワードは必須
### 2 ログイン機能(devise)
#### ・email、パスワードによる認証
#### ・ゲストログインによる認証も可
### 3 幼稚園登録機能
#### ・認可した幼稚園の概要、最寄駅、認可情報を登録
#### ・住所を入力すると、Google Maps APIと連携して、アクセスマップが幼稚園詳細情報内に表示される
#### ・幼稚園の外観を画像アップロードできる
### 4 幼稚園一覧表示機能
#### ・CRUD機能
#### ・詳細はユーザー閲覧可能
#### ・編集、削除は管理者のみ可能
### 5 幼稚園検索機能
#### ・幼稚園名、住所で一覧から検索可能
### 6 幼稚園詳細情報表示機能
#### ・認可情報・担当者メモ、アクセス、外観写真を表示
#### ・ページ遷移なしでタブ表示切替えできる
### 7 担当者メモ一覧表示機能
#### ・vueを使用した非同期による担当者メモの登録、削除が可能
#### ・リアルタイム検索も可能
### 8 申請認可書類登録機能
#### ・幼稚園から申請された認可書類の概要を登録
### 9 申請認可書類一覧表示機能
#### ・CRUD機能(ユーザーも編集、削除可能)
#### ・申請処理状況を把握できる
### 10 申請認可書類検索機能
#### ・幼稚園名、申請認可名、申請処理者名で一覧から検索可能
### 11 申請書類の処理状況アラーム機能
#### ・処理期限が迫っている、もしくは過ぎている案件をアラームで表示
#### ・申請処理者名で検索することで、担当者ごとにアラーム対象のリストが表示される
### 12 アーカイブ登録機能
#### ・幼稚園から申請された認可書類の概要を登録
### 13 アーカイブ一覧表示機能
#### ・CRUD機能
#### ・編集、削除は管理者のみ可能
#### ・アーカイブの使用状況を確認できる
### 14 アーカイブ検索機能
#### ・幼稚園名、申請認可名で一覧から検索可能
### 15 メッセージ機能
#### ・ユーザーがアーカイブの使用・返却報告を管理者あてにメッセージで送る。管理者がメッセージを確認し、使用状況(使用可・使用不可)を編集する。
#### ・メッセージの受信有無をletter_openerで管理者が確認し、未読を防ぐ。
### 16 タスクチェック機能
#### ・ユーザーのプロフィールと現在の申請処理件数を確認することができる。
#### ・管理者のみユーザー別の申請処理件数を確認することができ、特定のユーザーに業務量の偏りがないかチェックできる。
### 17 グラフ機能
#### ・ユーザー別の申請処理件数を円グラフで視覚的に把握できる。

## [カタログ設計][1]

[1]:<https://docs.google.com/spreadsheets/d/e/2PACX-1vSwvC58t34f2b3EupbpMhvoEK4YbyHlAmVDqRYsSziyaankqe1F-eVtNYuYrl7_x8qUSDQ5cvggECWp/pubhtml>

## [テーブル定義][2]

[2]:<https://docs.google.com/spreadsheets/d/e/2PACX-1vT9y4LZoY7PJuu28aY6jAa1zyqATxdasf6Tn6Wjvu4NLUyz72aTEfZYYDh9ehTO4197KzHDzw-ci3fN/pubhtml>

## [画面遷移図][3]

[3]:<https://docs.google.com/spreadsheets/d/e/2PACX-1vQZmV3UB0-SfWuo24yEaYh5Hdnpv5Q9Nx7_Whh7FQpQJfly2JJNfAFLl2p462uQY07yUYJpZpk0n8K5/pubhtml?gid=0&single=true>

## [画面ワイヤーフレーム][4]

[4]:<https://docs.google.com/spreadsheets/d/e/2PACX-1vSVcNq42wBWN9Q6NWiuFELkVaISA5nrj-KsbajAo2JaTvG5L9naN29ragspilV1eyXn7Wh0Iv9-zhPu/pubhtml>

## 使用Gem
#### ・devise
#### ・ransack
#### ・carrierwave
#### ・mini_magic
#### ・webpacker
#### ・Geocoder
#### ・kaminari
#### ・letter_opener_web
#### ・bullet
#### ・fog-aws
#### ・chartkick
#### ・chartable

## 使用API
#### ・Google Maps API
