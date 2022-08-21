# 第 5 回課題

- EC2 上に組み込みサーバーでサンプルアプリケーションのデプロイ
- ELB の追加
- S3 の追加
- 構成図の作成
- サーバーアプリケーションを分けて動くかチャレンジ

## 組み込みサーバで起動

ALB の DNS 名から接続
<img src="https://user-images.githubusercontent.com/102135163/185722882-cfe4fd7d-592f-48a7-b356-e56daf0fb489.gif" width="80%">

## アップロードした画像が S3 に保存されていることを確認

ActiveStorage を用いてアップロードした画像が S3 に保存されるように機能を追加
<img src="https://user-images.githubusercontent.com/102135163/185722876-53a1915c-a077-419c-9d4d-045af580b945.gif" width="80%">

## 構成図

<img src="https://user-images.githubusercontent.com/102135163/185725426-11751911-f501-4737-8fd2-8fd152b4cf7e.png" width="80%">

## Nginx と Unicorn で起動

無事 S3 との接続が上手くいきました！！
Nginx の設定ファイルの proxy_set_header の設定が足りていませんでした。
<img src="https://user-images.githubusercontent.com/102135163/185800009-25617c0a-9961-4ded-8e33-23dfd4a98df7.gif" width="80%">

## 自動起動設定

「reboot -> 接続 -> 起動確認」のスクリーンショット

<img src="https://user-images.githubusercontent.com/102135163/185800087-8d3ff661-136e-4c67-9122-b60c3baa4ccc.png" width="80%">
