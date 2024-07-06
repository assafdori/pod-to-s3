resource "aws_iam_openid_connect_provider" "oidc" {
	client_id_list = ["sts.amazonaws.com"]
	thumbprint_list = [data.tls_certificate.cert.certificates.0.sha1_fingerprint]
	url = data.tls_certificate.cert.url
}


data "tls_certificate" "cert" {
	url = aws_eks_cluster.cluster.identity[0].oidc[0].issuer
}


resource "aws_iam_role" "oidc" {	
	name = "${var.env}-oidc-role"
	assume_role_policy = data.aws_iam_policy_document.oidc_assume_role_policy.json
}


data "aws_iam_policy_document" "oidc_assume_role_policy" {
	statement {
		actions = ["sts:AssumeRoleWithWebIdentity"]
		effect = "Allow"


		condition {
			test = "StringEquals"
			variable = "${replace(aws_iam_openid_connect_provider.oidc.url, "https://", "")}:sub"
			values = ["system:serviceaccount:default:app"]
		}
		condition {
			test = "StringEquals"
			variable = "${replace(aws_iam_openid_connect_provider.oidc.url, "https://", "")}:aud"
			values = ["sts.amazonaws.com"]
		}

		principals {
			identifiers = [aws_iam_openid_connect_provider.oidc.arn]
			type = "Federated"
		}
	}
}



resource "aws_iam_policy" "pod-to-s3-policy" {
	name = "${var.env}-pod-to-s3-bucket"
	policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": 
			[
				"s3:*"
			],
			"Resource": "*"
		}
	]
}
EOF
}


resource "aws_iam_role_policy_attachment" "oidc" {
	role = aws_iam_role.oidc.name
	policy_arn = aws_iam_policy.pod-to-s3-policy.arn


}

