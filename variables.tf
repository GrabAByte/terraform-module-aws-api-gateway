variable "api_name" {
  type        = string
  description = "The name of the API"
}

variable "api_routes" {
  type = map(any)
}

# variable "api_routes" {
#   type = map(object({
#     api_path_part      = string
#     stage_name         = string
#     binary_media_types = list(string)
#     lambda_auth_url    = string
#     lambda_invoke_url  = string
#     lambda_name        = string
#   }))
# }

#variable "api_authorization_method" {
#  type        = string
#  description = "The API Authroization Method"
#}

variable "api_authorization_ttl" {
  type        = number
  description = "The Auth Method TTL in seconds"
  default     = 300
}

variable "api_authorization_type" {
  type        = string
  description = "The API Authorization type"
  default     = "TOKEN"
}

variable "api_authorization_identity_source" {
  type        = string
  description = "The API Authorization Identity Source"
  default     = "method.request.header.Authorization"
}

variable "api_http_method" {
  type        = string
  description = "The API HTTP Method"
  default     = "POST"
}

#variable "api_path_part" {
#  type        = string
#  description = "The API path part"
#  default     = "upload"
#}

variable "binary_media_types" {
  type        = list(any)
  description = "The applicable binary media types to accept"
}

#variable "integration_http_method" {
#  type        = string
#  description = "The Integration HTTP Method"
#  default     = "POST"
#}

#variable "integration_type" {
#  type        = string
#  description = "The Integration platform provider"
#  default     = "AWS_PROXY"
#}

variable "lambda_auth_invoke_arn" {
  type        = string
  description = "The ARN for invoking the Authenticating Lambda function"
}

#variable "lambda_invoke_arn" {
#  type        = string
#  description = "The ARN for invoking the Main lambda function"
#}

variable "lambda_names" {
  type        = list(any)
  default     = []
  description = "The name of the main lambda function"
}

variable "stage_name" {
  type        = string
  description = "The stage name for API resource"
}

variable "tags" {
  type        = map(any)
  description = "The project tags"
}
