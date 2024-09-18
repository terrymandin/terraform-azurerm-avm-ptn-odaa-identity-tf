variable "enable_telemetry" {
  description = "Enable telemetry"
  type        = bool
  default     = false
}

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
