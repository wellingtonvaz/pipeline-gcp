terraform {
  backend "gcs" {
    bucket = "tf-statte-bucket"
    prefix = "terraform/state"
  }
}