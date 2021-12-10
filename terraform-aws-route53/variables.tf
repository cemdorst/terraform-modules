variable "zone_name" {
  description = "Zone name"
  type        = string
}

variable "tags" {
  description = "Tags in all resources"
  type        = map(string) 
  default     = { Env = "prod" }
}
