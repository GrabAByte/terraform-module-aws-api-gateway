variable "api_name" {
  type        = string
  description = "The name of the API"
}

variable "api_key_source" {
  type        = string
  description = "The name of the API key source"
  default     = "AUTHORIZER"
}

variable "api_routes" {
  type        = map(any)
  description = "A map containing each route/resource foor the API and its configuration"
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
  description = "The name of the main lambda function"
  default     = []
}

variable "method_settings" {
  type = object({
    data_trace_enabled     = bool
    throttling_burst_limit = number
    throttling_rate_limit  = number
  })
  description = "The caching, logging and throttling configurations for the API method"
  default = {
    data_trace_enabled     = false
    throttling_burst_limit = 100
    throttling_rate_limit  = 200
  }
}

variable "stage_name" {
  type        = string
  description = "The stage name for API resource"
}

variable "tags" {
  type        = map(any)
  description = "The project tags"
}
