provider "google" {
  project = "br-chek-prod"
}

terraform {
	required_providers {
		google = {
	    version = "~> 4.35.0"
		}
  }
}
