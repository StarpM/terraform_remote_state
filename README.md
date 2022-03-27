# Terraform remote state on AWS S3 and dynamo DB lock

this is my dummy init for all my S3 resources

## How to apply

Once your local aws configuration is setted (default location '~/.aws/credentials')  

to create your remote state stack use 

```
terraform init
terraform apply
```

## Usage in your different terraform projects

you can add to your différent terraform managed project the following s3 module :  
```
terraform {
  required_version = ">= 1.1"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "$YOUR_BUCKET_NAME"
    region         = "$YOUR_REGION"
    encrypt        = true
    acl            = "private"
    key            = "$YOUR_STATE_PREFIX_KEY"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}
```
