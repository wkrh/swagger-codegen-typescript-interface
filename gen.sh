#!/bin/sh

## for the first time:
# mvn package
# mvn dependency:copy-dependencies -D includeScope=runtime

# The following additional debug options are available for all codegen targets:
# -DdebugSwagger prints the OpenAPI Specification as interpreted by the codegen
# -DdebugModels prints models passed to the template engine
# -DdebugOperations prints operations passed to the template engine
# -DdebugSupportingFiles prints additional data passed to the template engine

java\
  -cp target/typescript-interface-swagger-codegen-1.0.0.jar:target/dependency/swagger-codegen-cli-2.3.1.jar\
  io.swagger.codegen.SwaggerCodegen\
  generate\
  -l typescript-interface\
  -o out\
  -i testdata/petstore_simple.yaml\
  $*
