variable "ec2_instance_type" {
  description = "instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_ami" {
  description = "ami"
  type        = string
  default     = "ami-02c3627b04781eada"
}

variable "minecraft_image_tag" {
  # https://hub.docker.com/r/itzg/minecraft-server/tags
  description = "minecraft image tag"
  type        = string
  default     = "latest"
}

variable "volume_size" {
  type        = number
  description = "ec2 volume size"
  default     = 20
}

variable "key_name" {
  description = "key_name"
  type        = string
  default     = "minecraft-key"
}

variable "server_url_prefix" {
  description = "server_url_prefix"
  type        = string
  default     = "minecraft"
}

variable "hosted_zone_id" {
  description = "hosted_zone_id"
  type        = string
  default     = "Z01584752K5G4ULO1FKKC"
}

variable "subnet_id" {
  description = "subnet_id"
  type        = string
  default     = "subnet-cf112b94"
}

variable "vpc_id" {
  description = "vpc_id"
  type        = string
  default     = "vpc-2d96994a"
}

variable "delete_volume_on_termination" {
  description = "delete_volume_on_termination"
  type        = bool
  default     = true
}
