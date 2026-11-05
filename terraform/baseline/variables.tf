variable "aws_region" {
  description = "AWS region used by the project"
  type        = string
  default     = "ap-southeast-1"
}

variable "ami_id" {
  description = "Amazon Machine Image identifier for the EC2 instance"
  type        = string
  default     = "ami-032598fcc7e9d1c7a"

  validation {
    condition     = startswith(var.ami_id, "ami-")
    error_message = "The AMI identifier must begin with ami-."
  }
}

variable "instance_type" {
  description = "EC2 instance type used by the baseline configuration"
  type        = string
  default     = "t3.micro"
}