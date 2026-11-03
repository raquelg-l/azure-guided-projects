variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-gp-static-website"
}

variable "location" {
  description = "Azure region (restricted on the student subscription)"
  type        = string
  default     = "germanywestcentral"
}

variable "storage_account_name" {
  description = "Globally unique storage account name (3-24 lowercase letters and digits)"
  type        = string
  default     = "stgpstaticsitergl13"
}

# Is nice to use variables to avoid hardcoding values in the Terraform configuration and to make changes easier