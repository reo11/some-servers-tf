resource "aws_security_group" "minecraft_sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  },{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 25565
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 25565
  },{
    cidr_blocks      = []
    description      = ""
    from_port        = 25565
    ipv6_cidr_blocks = ["::/0",]
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 25565
  }]
}
