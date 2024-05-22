resource "aws_instance" "default" {
  ami           = "ami-065eed752f466bb1c"
  instance_type = "t4g.nano" # $3.03/mnth

  tags = {
  }
}
