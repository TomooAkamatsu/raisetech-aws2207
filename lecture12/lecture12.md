# Terraform での構築

- Terraform v1.3.2
- AWS provider v3.0

## 構成図

<img src="https://user-images.githubusercontent.com/102135163/194688872-c2cac54d-fb4a-4de2-ba23-da9548d93f01.png" width="80%">

## ハマった点

### ディレクトリ構成

何が良いかわからず調べていましたが、現場や環境毎に考え方があるように思えたので、正解は無いという結論です。

### 変数の取り扱い

module 間の変数の受け渡しや tfvars ファイルの扱いなどに戸惑いました。現段階では dev 環境のみということもあり、tfvars は用いずに書いています。
