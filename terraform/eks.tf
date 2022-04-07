resource "aws_eks_cluster" "bitoex-cluster" {
  depends_on = [module.vpc]

  name     = "bitoex"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
  tags = {
    Name = "bitoex"
  }
}

resource "aws_eks_node_group" "bitoex-node" {
  cluster_name    = aws_eks_cluster.bitoex-cluster.name
  node_group_name = "bitoex-node"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = var.subnet_ids
  instance_types = [
    "t3a.small",
  ]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.bitoex-cluster.endpoint
}
