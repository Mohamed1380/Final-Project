terraform {
  backend "gcs" {
    bucket  = "my-abdelhady"
    prefix  = "terraform/state"
  }
}