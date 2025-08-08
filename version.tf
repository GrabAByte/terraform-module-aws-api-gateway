terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.13.1"
    }
  }

  # ubuntu 22.04 used as github runner as it has terraform baked
  # 1.11 latest version available on this build
  required_version = ">= 1.11"
}
