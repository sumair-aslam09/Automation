provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIFIURHCJNRKJFI5UH"
  secret_key = "DFYD2ugJRNROJDIVHIZ"
}



# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0df7a207adb9748c7 "
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleEC2Instance"
  }
}
