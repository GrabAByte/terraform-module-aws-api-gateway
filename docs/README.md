<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_authorizer.lambda_auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_authorizer) | resource |
| [aws_api_gateway_deployment.deployment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_integration.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.method](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method_settings.all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_settings) | resource |
| [aws_api_gateway_resource.resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_lambda_permission.api_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_authorization_identity_source"></a> [api\_authorization\_identity\_source](#input\_api\_authorization\_identity\_source) | The API Authorization Identity Source | `string` | `"method.request.header.Authorization"` | no |
| <a name="input_api_authorization_method"></a> [api\_authorization\_method](#input\_api\_authorization\_method) | The API Authroization Method | `string` | `"CUSTOM"` | no |
| <a name="input_api_authorization_ttl"></a> [api\_authorization\_ttl](#input\_api\_authorization\_ttl) | The Auth Method TTL in seconds | `number` | `300` | no |
| <a name="input_api_authorization_type"></a> [api\_authorization\_type](#input\_api\_authorization\_type) | The API Authorization type | `string` | `"TOKEN"` | no |
| <a name="input_api_http_method"></a> [api\_http\_method](#input\_api\_http\_method) | The API HTTP Method | `string` | `"POST"` | no |
| <a name="input_api_name"></a> [api\_name](#input\_api\_name) | The name of the API | `string` | n/a | yes |
| <a name="input_api_path_part"></a> [api\_path\_part](#input\_api\_path\_part) | The API path part | `string` | `"upload"` | no |
| <a name="input_binary_media_types"></a> [binary\_media\_types](#input\_binary\_media\_types) | The applicable binary media types to accept | `list(any)` | n/a | yes |
| <a name="input_integration_http_method"></a> [integration\_http\_method](#input\_integration\_http\_method) | The Integration HTTP Method | `string` | `"POST"` | no |
| <a name="input_integration_type"></a> [integration\_type](#input\_integration\_type) | The Integration platform provider | `string` | `"AWS_PROXY"` | no |
| <a name="input_lambda_auth_invoke_arn"></a> [lambda\_auth\_invoke\_arn](#input\_lambda\_auth\_invoke\_arn) | The ARN for invoking the Authenticating Lambda function | `string` | n/a | yes |
| <a name="input_lambda_invoke_arn"></a> [lambda\_invoke\_arn](#input\_lambda\_invoke\_arn) | The ARN for invoking the Main lambda function | `string` | n/a | yes |
| <a name="input_lambda_name"></a> [lambda\_name](#input\_lambda\_name) | The name of the main lambda function | `string` | n/a | yes |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | The stage name for API resource | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The project tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_invoke_url"></a> [invoke\_url](#output\_invoke\_url) | n/a |
<!-- END_TF_DOCS -->