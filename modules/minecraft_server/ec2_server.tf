resource "aws_instance" "minecraft_server" {
  ami           = var.ec2_ami  # 無料枠対象のAMI
  instance_type = var.ec2_instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.minecraft_sg.id
  ]
  subnet_id     = var.subnet_id
  root_block_device {
    volume_size           = var.volume_size
    delete_on_termination = var.delete_volume_on_termination
  }

  tags          = {
    Name = "minecraft_server"
  }

    user_data     = base64encode(<<-EOT
#!/bin/bash

sudo yum install -y docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user

docker run -d -e EULA=TRUE -p 25565:25565 -v ~/data:/data --name minecraft --restart always itzg/minecraft-server
EOT
  )
}
