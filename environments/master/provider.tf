terraform {
	required_providers {
		google = {
    	source  = "hashicorp/google"
    	version = "~> 4.35.0"
		}
  }
}

provider "google" {
  project = "br-chek-prod"
  credentials = file("access.json")
}
