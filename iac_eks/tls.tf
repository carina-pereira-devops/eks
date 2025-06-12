    resource "aws_iam_policy" "oidc_policy" {
      name = "oidc-trust-policy"
      description = "IAM policy to trust the EKS OIDC issuer"
      policy = jsonencode({
        version = "2012-10-17"
        statement = [
          {
            effect = "Allow"
            action = [
              "sts:AssumeRoleWithWebIdentity",
            ]
            principal = {
              "Federated" = local.cluster_name.identity.oidc.issuer
            }
            condition = {
              "StringEquals" = {
                "sts.amazonaws.com:aud" = "sts.amazonaws.com"
              }
              "StringLike" = {
                "${local.cluster_name.identity.oidc.issuer}:sub" = "${local.cluster_name.identity.oidc.groups_claim}/*"
              }
            }
          }
        ]
      })
    }