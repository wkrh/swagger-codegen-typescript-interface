# Swagger Codegen for the typescript-interface library

Swagger Codegen for the typescript-interface library that generates simple typescript interfaces.

## build & run

Use Maven to build.

```sh
mvn package
```

Get dependencies for runnig.

```sh
mvn dependency:copy-dependencies -D includeScope=runtime
```

Generate typesciprt interface of sample API definition.

``` sh
java\
  -cp target/typescript-interface-swagger-codegen-1.0.0.jar:target/dependency/swagger-codegen-cli-2.3.1.jar\
  io.swagger.codegen.SwaggerCodegen\
  generate\
  -l typescript-interface\
  -o out\
  -i testdata/petstore_simple.yaml
```
