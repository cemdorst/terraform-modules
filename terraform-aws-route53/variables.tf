variable "zone_name" {
  description = "Zone name"
  type        = string
  default     = ""
}

variable "zone_id" {
  description = "Zone ID"
  type        = string
  default     = ""
}

variable "a_records" {
  description = "Records type A"
  type        = map(string)
  default     = {}
}

variable "aaaa_records" {
  description = "Records type AAAA"
  type        = map(string)
  default     = {}
}

variable "cname_records" {
  description = "Records type CNAME"
  type        = map(string)
  default     = {}
}

variable "txt_records" {
  description = "Records type TXT"
  type        = map(list(string))
  default     = {}
}

variable "caa_records" {
  description = "Records type CAA"
  type        = map(list(string))
  default     = {}
}

variable "tags" {
  description = "Tags in all resources"
  type        = map(string)
  default     = { Env = "prod" }
}
