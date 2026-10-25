variable "vpc_cidr" {
  description = "IPv4 address range for the SentinelOps VPC"
  type        = string
  default     = "10.0.0.0/16"
}