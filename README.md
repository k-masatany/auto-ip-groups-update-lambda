# Auto IP address groups updater

## Description

AWS サービスに割り当てられる IP アドレスが更新される度、自動的に指定したセキュリティグループを更新するための　Lambda 関数です。

- IP アドレスの範囲に関するドキュメント
  - https://docs.aws.amazon.com/ja_jp/general/latest/gr/aws-ip-ranges.html
- 元になったソースコード
  - https://github.com/aws-samples/aws-cloudfront-samples/tree/master/update_security_groups_lambda

## Deploy

※ SNS の都合上、 `us-east-1` で構築する必要があります。

デフォルトで EC2 の IP を開放するようになっていますが、環境変数 SERVICE に別の値を入れることで、 CloudFront 等にも対応できます、

1. .env.example を参考に .env を作成
2. sam package を実行
3. sam deploy を実行

## Usage

更新対象としたいセキュリティグループに、下記のタグを付けます。

- Name: autoupdate_target
- AutoUpdate: true
- Protocol: http（またはhttps）

SNSの通知を待っていたらしばらく更新されないので、最初に一度手動で Lambda を叩くといいと思います。
