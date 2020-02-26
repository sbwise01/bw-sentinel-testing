variable "bucket_name" {}
variable "inventory_bucket_name" {}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "replica-bucket" {
  bucket = "${var.bucket_name}"
  region = "us-west-2"
}

resource "aws_s3_bucket_inventory" "bucket-inventory" {
  bucket                   = "${aws_s3_bucket.replica-bucket.id}"
  name                     = "inventory"
  included_object_versions = "All"
  schedule {
    frequency = "Weekly"
  }
  destination {
    bucket {
      format     = "CSV"
      bucket_arn = "arn:aws:s3:::${var.inventory_bucket_name}"
    }
  }
  optional_fields = ["Size", "LastModifiedDate", "StorageClass", "ETag", "IsMultipartUploaded", "ReplicationStatus", "EncryptionStatus"]
}
