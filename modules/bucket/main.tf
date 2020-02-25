variable "bucket_name" {}
variable "inventory_bucket_name" {}
variable "destroy_resources" {
  default     = false
  description = "Flag for destroying all module resources.  Apply this change 1st before removing module block from parent."
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "replica-bucket" {
  count  = "${var.destroy_resources ? 0 : 1}"
  bucket = "${var.bucket_name}"
  region = "us-west-2"
}

resource "aws_s3_bucket_inventory" "bucket-inventory" {
  count                    = "${var.destroy_resources ? 0 : 1}"
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
