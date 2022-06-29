resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.factorio_volume.id
  instance_id = aws_instance.factorio_server.id
}

resource "aws_ebs_volume" "factorio_volume" {
  availability_zone = "ap-northeast-1c"
  size = var.volume_size
  tags = {
    Name = "factorio_volume"
  }
}

resource "aws_instance" "factorio_server" {
  ami           = var.ec2_ami  # 無料枠対象のAMI
  instance_type = var.ec2_instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.factorio_sg.id
  ]
  subnet_id     = var.subnet_id
  root_block_device {
    volume_size = 8
  }

  tags          = {
    Name = "factorio_server"
  }

    user_data     = base64encode(<<-EOT
#!/bin/bash

sudo yum install -y docker
sudo systemctl start docker
sudo usermod -a -G docker ec2-user

sudo mount /dev/nvme1n1 /opt

sudo mkdir -p /opt/factorio
sudo chown 845:845 /opt/factorio
sudo docker run -d \
  -p 34197:34197/udp \
  -p 27015:27015/tcp \
  -v /opt/factorio:/factorio \
  --name factorio \
  --restart=always \
  factoriotools/factorio:1.1.59
EOT
  )
}
