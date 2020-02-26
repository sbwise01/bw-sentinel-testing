resource "aws_s3_bucket" "brad-wise-main-region-data2" {
  bucket = "brad-wise-main-region-data2"
  region = "us-east-1"
}

module "brad-wise-dr-region-data2" {
  source                = "./modules/bucket"
  bucket_name           = "brad-wise-dr-region-data2"
  inventory_bucket_name = aws_s3_bucket.brad-wise-main-region-data2.id
}

