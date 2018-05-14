# Swagger Codegen for the todox-client library

## 概要
これは自分のクライアント用のライブラリをSwaggerで生成するためのひな型プロジェクトです。
あなたの独自ロジックを入れていくことのできる基本構造を提供します。
変更を行うまでは動きません。 (訳注: でも何もしないでも一応動きます。)

## Swaggerってなに?
Swaggerの目的はREST APIの標準的な定義を特定の言語に依らず行うことで、
これによって人間とコンピューターのいずれもがソースコードやドキュメントを
読んだりネットワークトラフィックを解析しなくてもAPIの能力が分かるようになります。
Swaggerによって適切に定義されていれば、利用者は最小限の実装でAPIを理解し利用することができます。
プログラミングにおけるインターフェースと同じように、サービス呼び出し時の当て推量をなくすことができます。

[OpenAPI-Spec](https://github.com/OAI/OpenAPI-Specification)にSwaggerプロジェクトについての更なる情報があります。
他の言語への対応ライブラリもここにあります。

## このコードはどうやって使うの?
現時点で下記のような感じのクライアント用のコードが生成されています。

```
.
|- README.md    // このファイル
|- pom.xml      // ビルド用スクリプト
|-- src
|--- main
|---- java
|----- io.swagger.codegen.TodoxClientGenerator.java // 生成機
|---- resources
|----- todox-client // テンプレート
|----- META-INF
|------ services
|------- io.swagger.codegen.CodegenConfig
```

最低でも下記のファイルを編集する必要があるでしょう。

`TodoxClientGenerator.java`

および下記フォルダの中のテンプレート:

`src/main/resources/todox-client`

編集したら、プロジェクト内で下記コマンドを実行します:

```
mvn package
```

(ビルド結果は)targetディレクトリ内に単一のjarファイルとして出力されます。
このjarをswagger-codegenと組み合わせて使います:

```
java -cp /path/to/swagger-codegen-cli.jar:/path/to/your.jar io.swagger.codegen.Codegen -l todox-client -i /path/to/swagger.yaml -o ./test
```


Now your templates are available to the client generator and you can write output values

## で、どう編集すればいいの?

`TodoxClientGenerator.java`の中にたくさんコメントが書いてあります。
コードをもっと読んでみるのが一番です。
`TodoxClientGenerator`がどのように`CodegenConfig`を実装しているか見てください。
このクラスはオーバーライド可能な全ての値を含んでいます。

テンプレートではコード生成の為の多くの値が使用可能です。
コマンド実行時にデバッグ用のフラグを指定すればどのような値が使用可能か表示されます。

```
# 次に示すデバッグオプションが全部の生成対象について使用可能です。
# -DdebugSwagger はcodegenによって解釈されたOpenAPI Specificationを表示します
# -DdebugModels はテンプレート・エンジンに渡されるモデルを表示します
# -DdebugOperations はテンプレート・エンジンに渡されるoperationsを表示します
# -DdebugSupportingFiles はテンプレート・エンジンに渡される追加データを表示します

java -DdebugOperations -cp /path/to/swagger-codegen-cli.jar:/path/to/your.jar io.swagger.codegen.Codegen -l todox-client -i /path/to/swagger.yaml -o ./test
```

例えば上記コマンドはoperationについての情報を出力します。この情報を`api.mustache`ファイル内で使用可能ということです。
