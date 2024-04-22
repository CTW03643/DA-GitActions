variable "identifier" {
  default     = "qxz50zt" 
  description = "Variable to describe resources created by you"
}

variable "project_name" {
  default = "da7"
  description = "Name of the project"
}

locals {
  prefix = "${var.project_name}_${var.identifier}"
}
