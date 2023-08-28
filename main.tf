provider "aws" {
  region = "ca-central-1"
}

resource "aws_ami" "tcsqe-ami" {
  count = 1000

  name = format("tcsqe-ignoreMe-ami%d", count.index + 1)

  ebs_block_device {
    device_name = format("tcsqe-ignoreMe-ebs%d", count.index + 1)
    encrypted   = false
  }
}

resource "aws_ami_launch_permission" "tcsqe-ami-permission1" {
  for_each = aws_ami.tcsqe-ami
  image_id = each.value.id
  # Allow multiple
  account_id = "536274239938"
}

resource "aws_ami_launch_permission" "tcsqe-ami-permission2" {
  for_each = aws_ami.tcsqe-ami
  image_id = each.value.id
  # Allow multiple
  account_id = "748423932433"
}

resource "aws_ami_launch_permission" "tcsqe-ami-permission3" {
  for_each = aws_ami.tcsqe-ami
  image_id = each.value.id
  # Allow multiple
  account_id = "987710583002"
}
