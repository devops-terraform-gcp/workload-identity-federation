variable "pool_id" {
  type        = string
  description = "E.g: `example-pool`. The ID used for the pool, which is the final component of the pool resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp`- is reserved for use by Google, and may not be specified."
}

variable "project_id" {
  type        = string
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "pool_display_name" {
  type        = string
  default     = null
  description = "A display name for the provider. Cannot exceed 32 characters."
}

variable "pool_description" {
  type        = string
  default     = null
  description = "A description for the provider. Cannot exceed 256 characters."
}

variable "pool_disabled" {
  type        = bool
  default     = false
  description = "Whether the provider is disabled. You cannot use a disabled provider to exchange tokens. However, existing tokens still grant access."
}

variable "wif_providers" {
  type        = list(any)
  description = "Valid providers include aws or oidc"
}

variable "service_accounts" {
  type = list(object({
    name           = string
    attribute      = string
    all_identities = bool
    roles          = list(string)
  }))
}
