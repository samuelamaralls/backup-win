output "name" {
    value = aws_eks_node_group.main.node_group_name
  
}

output "labels" {
    value = var.labels 
}