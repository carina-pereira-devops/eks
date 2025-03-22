terraform {
  backend "s3" {
    bucket = "arquivo-de-estado"
    key = "eks.tfstate"
  }
}
