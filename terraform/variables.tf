variable "aws_region" {
            description = "Ireland region for deployment"
            type        = string
            default     = "eu-west-1"
        }

        variable "instance_type" {
            description = "ec2 instance"
            type        = string
            default     = "t3.micro"
        }

    