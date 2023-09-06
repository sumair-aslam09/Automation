# Use the latest Ubuntu as the base image
FROM ubuntu:20.04

# Set the timezone to Asia/Dubai
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt install -y tzdata
# Install necessary packages
RUN apt-get update -y && \
    apt-get install python3.9 -y 
    #python 
    #python3-pip 
    #unzip \
    #&& apt-get clean

# Install Terraform
RUN apt-get install -y wget unzip && \
   wget https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_linux_amd64.zip && \
   unzip terraform_0.14.11_linux_amd64.zip && \
   mv terraform /usr/local/bin/ && \
    rm terraform_0.14.11_linux_amd64.zip

# Install Ansible
RUN apt-get install -y ansible

# Create directories for Python, Terraform, and Ansible
RUN mkdir /python && \
    mkdir /terraform && \
    mkdir /ansible

# Copy your files into the respective directories
COPY generate.py /python/
COPY main.tf /terraform/
COPY ansible.yaml /ansible/
COPY infra-provision.sh /root/

# Set the working directory to /root
WORKDIR /root

# Define a command to execute after container creation
CMD ["/root/infra-provision.sh"]
