variable "name" {
  description = "Droplet Name"
  type        = string
}

variable "region" {
  description = "Default Region"
  type        = string
  default     = "nyc3"
}

variable "user_data" {
  description = "User data passed to cloud-init"
  type        = string
  default     = ""
}

variable "block_storage_size" {
  description = "(Required) The size of the block storage volume in GiB. If updated, can only be expanded."
  default     = 5
}

variable "droplet_size" {
  description = "the size slug of a droplet size"
  default     = "micro"
}

variable "floating_ip" {
  description = "(Optional) Boolean to control whether floating IPs should be created."
  default     = false
}

variable "floating_ip_assign" {
  description = "(Optional) Boolean controlling whether floatin IPs should be assigned to instances with Terraform."
  default     = true
}

variable "image_name" {
  description = "The image name or slug to lookup."
  default     = "centos-7-x64"
}

variable "ssh_keys" {
  description = "(Optional) A list of SSH IDs or fingerprints to enable. Use curl with the DigitalOcean API, to retrieve them."
  default     = []
}

variable "tags" {
  description = "(Optional) A list of the tags to label this Droplet. A tag resource must exist before it can be associated with a Droplet."
  default     = []
}
