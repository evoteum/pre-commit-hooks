variable "adipiscing_network" {
  type        = string
  description = "Name of the networking layer for adipiscing."
}

variable "amet_id" {
  type        = string
  description = "Identifier used for amet operations."
}

variable "consectetur_url" {
  type        = string
  description = "Service endpoint for consectetur delivery."
}

variable "dolor_queue_url" {
  type        = string
  description = "Queue endpoint for dolor messages."
}

variable "eiusmod_security_group" {
  type        = string
  description = "Security group identifier for eiusmod."
}

variable "elit_resource_name" {
  type        = string
  description = "Name assigned to elit-managed resource."
}

variable "incididunt_subnet_id" {
  type        = string
  description = "Subnet identifier for incididunt access."
}

variable "lorem_log_group" {
  type        = string
  description = "Group name used by the lorem logging service."
  default     = "log-group-lorem"
}

variable "sed_volume_name" {
  type        = string
  description = "Name of the volume for sed persistence."
}

variable "tempor_database_password" {
  type        = string
  description = "Sensitive password for tempor database."
  sensitive   = true
}
