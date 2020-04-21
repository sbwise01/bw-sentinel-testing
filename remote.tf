data "terraform_remote_state" "buckets" {
  backend = "s3"

  config = {
    bucket  = "bw-terraform-state-us-east-1"
    key     = "brad-vault"
    region  = "us-east-1"
  }
}
