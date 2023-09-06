provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAT5UHXU7PEY6YUYL3"
  secret_key = "DFYD2ugOxwdc4ysVrjYo77yC/W+q7x7HgLDBUM7Z"
}



# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0df7a207adb9748c7 "
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleEC2Instance"
  }
}