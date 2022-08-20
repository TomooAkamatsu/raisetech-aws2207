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
