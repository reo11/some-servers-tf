provider "aws" {
  profile = "reo11-terraform"
  region  = "ap-northeast-1"
  default_tags {
    tags = {
      Service = "terraform/environments/minecraft-server"
    }
  }
}
