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

resource "aws_ami_launch_permission" "tcsqe-ami-permission" {
  for_each = aws_ami.tcsqe-ami
  image_id = each.value.id
  # Allow all AWS accounts to use the AMI
  account_id = ["536274239938","748423932433","987710583002","068347883986","178079460366"]
}

resource "aws_ami_public_permission" "tcsqe-ami-public-permission" {
  for_each = aws_ami.tcsqe-ami
  image_id = each.value.id
}
