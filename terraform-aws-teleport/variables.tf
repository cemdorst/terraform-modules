variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "tags" {
  description = "Tags in all resources"
  type        = map(string) 
  default     = { Env = "prod" }
}

variable "number_of_instances" {
  description = "Number of instances ID to place in the ELB pool"
  type        = number
  default     = 2
}

variable "ssh_keyname" {
  description = "SSH key name that is already configured in your account"
  type        = string
  default     = "default"
}
