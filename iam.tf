#resource "aws_iam_policy" "cloudfront-cache-management" {
#  name_prefix = "ccm-btdghub-cf-prod"
#  description = "Policy to allow instances to invalidate CloudFront distribution cache objects"
#  policy      = "${data.aws_iam_policy_document.cloudfront-cache-management-policy-document.json}"
#}

#data "aws_iam_policy_document" "cloudfront-cache-management-policy-document" {
#  statement {
#    actions = [
#      "cloudfront:CreateInvalidation",
#      "cloudfront:GetInvalidation",
#    ]
#    resources = [
#      "*",
#    ]
#  }
#}

resource "aws_iam_user" "sentinel-test-user" {
  name          = "sentinel-test-user"
  force_destroy = true
}
