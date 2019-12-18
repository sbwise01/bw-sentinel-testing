#resource "aws_kms_key" "bw-sentinel" {
#  description             = "This key is used to encrypt bucket objects"
#  deletion_window_in_days = 7
#  enable_key_rotation     = true
#  is_enabled              = true
#  policy                  = "${data.aws_iam_policy_document.bw-sentinel-policy.json}"
#}
#
#resource "aws_kms_grant" "bw-sentinel" {
#  name              = "bw-sentinel"
#  key_id            = "${aws_kms_key.bw-sentinel.key_id}"
#  grantee_principal = "arn:aws:iam::238080251717:role/TF_PROVISIONER"
#  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
#}
#
#resource "aws_kms_grant" "bw-sentinel-2" {
#  name              = "bw-sentinel-2"
#  key_id            = "${aws_kms_key.bw-sentinel.key_id}"
#  grantee_principal = "arn:aws:iam::238080251717:role/FogOps"
#  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
#}

#data "aws_iam_policy_document" "bw-sentinel-policy" {
#  statement {
#    actions   = ["kms:*"]
#    resources = ["*"]
#
#    principals {
#      type        = "AWS"
#      identifiers = [
#        "arn:aws:iam::238080251717:root",
#        "arn:aws:iam::238080251717:user/brad"
#      ]
#    }
#  }
#}

#resource "aws_kms_key" "bw-sentinel-2" {
#  description             = "This key is used to encrypt bucket objects"
#  deletion_window_in_days = 7
#  enable_key_rotation     = true
#  is_enabled              = true
#  policy                  = "${data.aws_iam_policy_document.bw-sentinel-policy.json}"
#}
#
#resource "aws_kms_grant" "bw-sentinel-3" {
#  name              = "bw-sentinel-3"
#  key_id            = "${aws_kms_key.bw-sentinel-2.key_id}"
#  grantee_principal = "arn:aws:iam::238080251717:role/TF_PROVISIONER"
#  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
#}
#
#resource "aws_kms_grant" "bw-sentinel-4" {
#  name              = "bw-sentinel-4"
#  key_id            = "${aws_kms_key.bw-sentinel-2.key_id}"
#  grantee_principal = "arn:aws:iam::238080251717:role/FogOps"
#  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
#}
#
#resource "aws_kms_grant" "bw-sentinel-5" {
#  name              = "bw-sentinel-5"
#  key_id            = "${aws_kms_key.bw-sentinel-2.key_id}"
#  grantee_principal = "arn:aws:iam::238080251717:role/eksworkshop-admin"
#  operations        = ["Encrypt", "Decrypt", "GenerateDataKey"]
#}
