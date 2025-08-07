resource "aws_api_gateway_rest_api" "api" {
  name               = var.api_name
  binary_media_types = var.binary_media_types
  tags               = var.tags
}

# authentication (time-bound implementation)
resource "aws_api_gateway_authorizer" "lambda_auth" {
  name                             = "LambdaTokenAuthorizer"
  rest_api_id                      = aws_api_gateway_rest_api.api.id
  authorizer_uri                   = var.lambda_auth_invoke_arn
  authorizer_result_ttl_in_seconds = var.api_authorization_ttl
  type                             = var.api_authorization_type
  identity_source                  = var.api_authorization_identity_source
}

#resource "aws_api_gateway_resource" "resource" {
#  rest_api_id = aws_api_gateway_rest_api.api.id
#  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
#  path_part   = var.api_path_part
#}

#resource "aws_api_gateway_method" "method" {
#  rest_api_id   = aws_api_gateway_rest_api.api.id
#  resource_id   = aws_api_gateway_resource.resource.id
#  http_method   = var.api_http_method
#  authorization = var.api_authorization_method
#  authorizer_id = aws_api_gateway_authorizer.lambda_auth.id
#}

#resource "aws_api_gateway_integration" "lambda" {
#  rest_api_id             = aws_api_gateway_rest_api.api.id
#  resource_id             = aws_api_gateway_resource.resource.id
#  http_method             = aws_api_gateway_method.method.http_method
#  integration_http_method = var.integration_http_method
#  type                    = var.integration_type
#  uri                     = var.lambda_invoke_arn
#}

## if $lambda_name then
#resource "aws_lambda_permission" "api_gateway" {
#  statement_id  = "AllowExecutionFromAPIGatewayUpload"
#  action        = "lambda:InvokeFunction"
#  function_name = var.lambda_name
#  principal     = "apigateway.amazonaws.com"
#  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/*/*"
#}

#resource "aws_api_gateway_deployment" "deployment" {
#  rest_api_id = aws_api_gateway_rest_api.api.id
#
#  depends_on = [aws_api_gateway_integration.lambda]
#}

#resource "aws_api_gateway_stage" "stage" {
#  deployment_id = aws_api_gateway_deployment.deployment.id
#  rest_api_id   = aws_api_gateway_rest_api.api.id
#  stage_name    = var.stage_name
#}

#resource "aws_api_gateway_method_settings" "all" {
#  for_each    = var.api_routes
#  rest_api_id = aws_api_gateway_rest_api.api.id
#  stage_name  = var.stage_name
#  method_path = "${each.value.api_path_part}/${each.value.http_method}"

# observability
# hardening: basic example of controlling number of requests
# variablize
#  settings {
#    data_trace_enabled = true
#    metrics_enabled    = true
#    # logging_level        = "ERROR" # requires cloud watch setup
#    throttling_burst_limit = 10
#    throttling_rate_limit  = 1
#  }

#  depends_on = [aws_api_gateway_stage.stage]
#}
