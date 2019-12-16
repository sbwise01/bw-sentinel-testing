resource "aws_kms_key" "bw-sentinel" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  is_enabled              = true
  policy                  = "${data.aws_iam_policy_document.bw-sentinel-policy.json}"
}

data "aws_iam_policy_document" "bw-sentinel-policy" {
  statement {
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::238080251717:root",
        "arn:aws:iam::238080251717:user/brad"
      ]
    }
  }
}
