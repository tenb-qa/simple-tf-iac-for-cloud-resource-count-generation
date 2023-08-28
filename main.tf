provider "aws" {
  region = "ca-central-1"
}

resource "aws_ami" "tcsqe-ami" {
  count = 1000
  name = format("tcsqe-ami%d", count.index + 1)

  ebs_block_device {
    device_name = format("tcsqe-ignoreMe-ebs%d", count.index + 1)
    encrypted   = false
  }
}
