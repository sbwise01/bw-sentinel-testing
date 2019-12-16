#resource "aws_kms_key" "bw-sentinel" {
#  description             = "This key is used to encrypt bucket objects"
#  deletion_window_in_days = 7
#}
#
#resource "aws_s3_bucket" "bw-sentinel" {
#    bucket = "bw-sentinel"
#    region = "us-east-1"
#
#    server_side_encryption_configuration {
#        rule {
#          apply_server_side_encryption_by_default {
#            kms_master_key_id = "${aws_kms_key.bw-sentinel.arn}"
#            # Good algorithm
#            sse_algorithm = "aws:kms"
#            # Bad algorithm
#            #sse_algorithm = "AES256"
#         }
#       }
#    }
#}
#
#resource "aws_s3_bucket_policy" "airbnb-brad-internal-only" {
#    bucket = "${aws_s3_bucket.bw-sentinel.id}"
#    policy = "${data.aws_iam_policy_document.bw-sentinel-policy.json}"
#}
#
## Bad policy
#data "aws_iam_policy_document" "bw-sentinel-policy" {
#  statement {
#    effect    = "Allow"
#    actions   = ["s3:*"]
#    resources = [
#      "arn:aws:s3:::bw-sentinel/*",
#      "arn:aws:s3:::bw-sentinel"
#    ]
#
#    principals {
#      type        = "*"
#      identifiers = ["*"]
#    }
#  }
#}

# Good Policy
#data "aws_iam_policy_document" "bw-sentinel-policy" {
#  statement {
#    effect    = "Deny"
#    actions   = ["s3:*"]
#    resources = [
#      "arn:aws:s3:::bw-sentinel/*",
#      "arn:aws:s3:::bw-sentinel"
#    ]
#
#    principals {
#      type        = "*"
#      identifiers = ["*"]
#    }
#
#    condition {
#      test     = "Bool"
#      variable = "aws:SecureTransport"
#      values   = ["false"]
#    }
#  }
#}
