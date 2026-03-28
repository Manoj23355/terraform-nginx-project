variable "region" {
    type = string
}

variable "ami" {
  description = "Ubuntu AMI"
  type = string
} 

variable "key_name" {
  description = "Existing AWS key pair name"
  type = string
}