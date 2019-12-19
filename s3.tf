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

resource "aws_s3_bucket" "bw-sentinel-1" {
    bucket = "bw-sentinel-1"
    region = "us-east-1"
}

resource "aws_s3_bucket_policy" "bw-sentinel-1-policy" {
    bucket = "${aws_s3_bucket.bw-sentinel-1.id}"
    policy = "${data.aws_iam_policy_document.bw-sentinel-1-policy.json}"
}

data "aws_iam_policy_document" "bw-sentinel-1-policy" {
  statement {
    effect    = "Allow"
    actions   = [
      "s3:PutObjectACL",
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::bw-sentinel-1/*",
      "arn:aws:s3:::bw-sentinel-1"
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket" "bw-sentinel-2" {
    bucket = "bw-sentinel-2"
    region = "us-east-1"
}

resource "aws_s3_bucket_policy" "bw-sentinel-2-policy" {
    bucket = "${aws_s3_bucket.bw-sentinel-2.id}"
    policy = "${data.aws_iam_policy_document.bw-sentinel-2-policy.json}"
}

data "aws_iam_policy_document" "bw-sentinel-2-policy" {
  statement {
    effect    = "Allow"
    actions   = [
      "s3:PutObjectACL",
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::bw-sentinel-2/*",
      "arn:aws:s3:::bw-sentinel-2"
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

#resource "aws_s3_bucket" "bw-sentinel-3" {
#    bucket = "bw-sentinel-3"
#    region = "us-east-1"
#}
