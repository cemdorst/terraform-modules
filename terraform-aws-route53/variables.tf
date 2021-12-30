variable "zone_name" {
  description = "Zone name"
  type        = string
}

variable "a_records" {
  description = "Records type A"
  type        = map(string)
}

variable "tags" {
  description = "Tags in all resources"
  type        = map(string)
  default     = { Env = "prod" }
}
