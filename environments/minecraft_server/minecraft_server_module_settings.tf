module "minecraft_server" {
  source = "../../modules/minecraft_server"

  ec2_instance_type            = "t4g.small"
  ec2_ami                      = "ami-0548e5d1cef315c7f"
  minecraft_image_tag          = "latest"
  server_url_prefix            = "minecraft-server"
  delete_volume_on_termination = true
}
