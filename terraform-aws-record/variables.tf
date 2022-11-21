variable "zone_id" {
  description = "Zone ID"
  type        = string
  nullable    = false
}

variable "name" {
  description = "Record name"
  type        = string
  nullable    = false
}

variable "type" {
  description = "Record type"
  type        = string
  nullable    = false
}

variable "ttl" {
  description = "Record type"
  type        = string
  default     = "300"
}

variable "items" {
  description = "Record items"
  type        = list(string)
  nullable    = false
}
