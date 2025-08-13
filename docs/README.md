<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.4 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.13.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.4 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.13.1 |

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
| [null_resource.previous](https://registry.terraform.io/providers/hashicorp/null/3.2.4/docs/resources/resource) | resource |
| [time_sleep.wait_180_seconds](https://registry.terraform.io/providers/hashicorp/time/0.13.1/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_authorization_identity_source"></a> [api\_authorization\_identity\_source](#input\_api\_authorization\_identity\_source) | The API Authorization Identity Source | `string` | `"method.request.header.Authorization"` | no |
| <a name="input_api_authorization_ttl"></a> [api\_authorization\_ttl](#input\_api\_authorization\_ttl) | The Auth Method TTL in seconds | `number` | `300` | no |
| <a name="input_api_authorization_type"></a> [api\_authorization\_type](#input\_api\_authorization\_type) | The API Authorization type | `string` | `"TOKEN"` | no |
| <a name="input_api_key_source"></a> [api\_key\_source](#input\_api\_key\_source) | The name of the API key source | `string` | `"AUTHORIZER"` | no |
| <a name="input_api_name"></a> [api\_name](#input\_api\_name) | The name of the API | `string` | n/a | yes |
| <a name="input_api_routes"></a> [api\_routes](#input\_api\_routes) | n/a | `map(any)` | n/a | yes |
| <a name="input_binary_media_types"></a> [binary\_media\_types](#input\_binary\_media\_types) | The applicable binary media types to accept | `list(any)` | n/a | yes |
| <a name="input_lambda_auth_invoke_arn"></a> [lambda\_auth\_invoke\_arn](#input\_lambda\_auth\_invoke\_arn) | The ARN for invoking the Authenticating Lambda function | `string` | n/a | yes |
| <a name="input_lambda_names"></a> [lambda\_names](#input\_lambda\_names) | The name of the main lambda function | `list(string)` | `[]` | no |
| <a name="input_method_settings"></a> [method\_settings](#input\_method\_settings) | n/a | <pre>object({<br/>    data_trace_enabled     = bool<br/>    throttling_burst_limit = number<br/>    throttling_rate_limit  = number<br/>  })</pre> | <pre>{<br/>  "data_trace_enabled": false,<br/>  "throttling_burst_limit": 100,<br/>  "throttling_rate_limit": 200<br/>}</pre> | no |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | The stage name for API resource | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The project tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_routes"></a> [api\_routes](#output\_api\_routes) | n/a |
| <a name="output_api_url"></a> [api\_url](#output\_api\_url) | n/a |
<!-- END_TF_DOCS -->