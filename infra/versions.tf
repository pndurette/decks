terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.76.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "pierrenick"

    workspaces {
      name = "decks"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}