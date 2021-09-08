data "aws_ami" "amazon_linux" {
    owners = ["amazon"]
    most_recent = true

    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

data "aws_availability_zones" "example" {
  all_availability_zones = true

  filter {
    name   = "opt-in-status"
    values = ["not-opted-in", "opted-in"]
  }
}

output "zones" {
  value = aws_availability_zones.example.id
}