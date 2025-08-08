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

resource "aws_api_gateway_resource" "resource" {
  for_each    = var.api_routes
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = each.key
}

# TODO: perform terraform plan to see what this is called
resource "aws_api_gateway_method" "method" {
  for_each      = var.api_routes
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.resource["${each.key}"].id
  http_method   = each.value.http_method
  authorization = each.value.api_authorization_method
  authorizer_id = aws_api_gateway_authorizer.lambda_auth.id
}

resource "aws_api_gateway_integration" "lambda" {
  for_each                = var.api_routes
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.resource["${each.key}"].id
  http_method             = aws_api_gateway_method.method["${each.key}"].http_method
  integration_http_method = each.value.integration_http_method
  type                    = each.value.integration_type
  uri                     = each.value.lambda_invoke_arn
}

#if $lambda_name then
resource "aws_lambda_permission" "api_gateway" {
  count         = length(var.lambda_names)
  statement_id  = "AllowExecutionFromAPIGatewayUpload"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_names[count.index]
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.api.execution_arn}/*/*"
}

resource "null_resource" "previous" {}
# add sleep for method creation

resource "time_sleep" "wait_90_seconds" {
  depends_on      = [null_resource.previous]
  create_duration = "90s"
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  depends_on  = [time_sleep.wait_90_seconds]
}

resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = var.stage_name
}

# resource "aws_api_gateway_method_settings" "all" {
#   for_each    = var.api_routes
#   rest_api_id = aws_api_gateway_rest_api.api.id
#   stage_name  = var.stage_name
#   method_path = "${each.key}/${each.value.http_method}"

#   depends_on = [aws_api_gateway_stage.stage]
# }
