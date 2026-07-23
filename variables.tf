variable "student_name" {
  description = "Your name, lowercase, no spaces (keeps your resources unique)"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.33"
}

variable "desired_nodes" {
  type    = number
  default = 2
}
variable "min_nodes" {
  type    = number
  default = 1
}
variable "max_nodes" {
  type    = number
  default = 3
}
