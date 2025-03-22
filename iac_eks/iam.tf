# Policy
data "aws_iam_policy" "required-policy" {
  name = "AmazonEKSClusterAdminPolicy"
}
# Role
resource "aws_iam_role" "eks_role" {
  name = "eksrole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::535002861869:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach
resource "aws_iam_role_policy_attachment" "attach-eks" {
  role       = aws_iam_role.eks_role.name
  policy_arn = data.aws_iam_policy.required-policy.arn
}

