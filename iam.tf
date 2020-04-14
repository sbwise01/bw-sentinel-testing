resource "aws_iam_policy" "test-policy-10" {
  name = "test-policy-10"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid":      "Test",
            "Effect":   "Allow",
            "Action":   [ "s3:ListAllMyBuckets" ],
            "Resource": "*"
        }
    ]
}
EOF
}
