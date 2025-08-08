variable "api_name" {
  type        = string
  description = "The name of the API"
}

variable "api_routes" {
  type = map(any)
}

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

variable "binary_media_types" {
  type        = list(any)
  description = "The applicable binary media types to accept"
}

variable "lambda_auth_invoke_arn" {
  type        = string
  description = "The ARN for invoking the Authenticating Lambda function"
}

variable "lambda_names" {
  type        = list(string)
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
