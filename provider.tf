terraform {
  required_version = ">= 1.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.5"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.5"
    }
    gsuite = {
      source  = "deviavir/gsuite"
      version = "~> 0.1.12"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "google" {
  billing_project       = "tf-state-00"
  user_project_override = true
}
provider "google-beta" {
  billing_project       = "tf-state-00"
  user_project_override = true
}
provider "gsuite" {
  impersonated_user_email = var.admin_email

  oauth_scopes = [
    "https://www.googleapis.com/auth/admin.directory.group",
    "https://www.googleapis.com/auth/admin.directory.group.member",
  ]
}

terraform {
  backend "gcs" {
    bucket = "tf-state-00-v1"
    prefix = "terraform/state/projects/service-projects/xxx-xxx"
  }
}

