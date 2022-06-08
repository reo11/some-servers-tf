resource "aws_instance" "sample_server" {
  ami           = "ami-081ce1b631be2b337"  # 無料枠対象のAMI
  instance_type = var.ec2_instance_type
  tags          = {
    Name = "sample_server"
  }
}
