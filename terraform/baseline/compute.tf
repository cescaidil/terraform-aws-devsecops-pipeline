resource "aws_instance" "baseline" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.baseline_ec2.name
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.baseline.id]
  associate_public_ip_address = false

  ebs_optimized = true
  monitoring    = true

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "disabled"
  }

  root_block_device {
    encrypted             = true
    volume_type           = "gp3"
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name = "cp-project-baseline-instance"
  }
}