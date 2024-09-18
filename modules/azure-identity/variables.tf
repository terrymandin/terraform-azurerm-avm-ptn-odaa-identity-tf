variable "adbs_rbac" {
  type        = bool
  default     = false
  description = "Setup RBAC for ADB-S in Azure. Default is false."
}

variable "group_prefix" {
  type        = string
  default     = ""
  description = "Group name prefix in Azure"
}

variable "odbaa_built_in_role_assigned_groups" {
  type        = set(string)
  default     = []
  description = "Groups required Built-in Azure Role assigned"
}