# CiecleCI による自動化

- Terraform によるインフラ構築 (tflint によるチェック含む)
- Ansible を用いた環境構築
- Serverspec によるインフラのテスト
- 上記を全て CircleCI にて行う

## 構成図

<img src="https://user-images.githubusercontent.com/102135163/196610259-8dae1142-b5b3-4882-88c5-ebea97fbab48.png" width="100%">

## CircleCI 上の設定

### 環境変数

<img src="https://user-images.githubusercontent.com/102135163/196611231-d43b96a7-dd08-43d8-b1dd-0ebc75d0f74b.png" width="100%">

### SSH Key

<img src="https://user-images.githubusercontent.com/102135163/196611229-6c63c953-a659-4624-bd1f-8b682a19b046.png" width="100%">

### Workflow

<img src="https://user-images.githubusercontent.com/102135163/196613960-d00498a8-51fc-4bf6-8a1f-2779470cdc71.png" width="100%">

## ディレクトリ構成

以前の課題も含めたリポジトリのため、関係ファイルだけ抜粋した構成は以下の通り

```
.
├── ansible.cfg
├── .circleci
│   └── config.yml
└── lecture12
    ├── terraform
    │   ├── dev/
    │   └── module/
    ├── ansible
    │   ├── roles/
    │   ├── playbook.yml
    │   └── inventory
    ├── spec
    │   ├── ec2/
    │   ├── config
    │   └── spec_helper.rb
    └── Rakefile

```

## 感想

ほとんど全てを今回の課題で初めて触りましたが、最初は各々の役割を理解するところからでした。役割を切り分けた上で、 CircleCI 上で変数や情報の受け渡しをどうするかという点が難しかったです。以前に docker を触っていたことが CircleCI の config を書く上でとても役に立ちました。

また、Ansible を通しての Rails の環境構築に一番時間がかかりました...。ruby のインストール方法や gem のバージョンを変えて導入時間を短くなるようにしています。

RDS のエンドポイントなどのリソース情報は、aws cli で取得して BASH_ENV を用いて変数を渡そうと考えていましたが、ベタ書きで書けるよう terraform 側で設定して構築しています。

## 今後の課題

- S3 を含めた構成にする
- 変数を活用してベタ書きを避ける
