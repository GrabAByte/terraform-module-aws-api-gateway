output "api_url" {
  value = aws_api_gateway_stage.stage.invoke_url
}

output "api_routes" {
  value = [for r in aws_api_gateway_resource.resource : r.path_part]
}
