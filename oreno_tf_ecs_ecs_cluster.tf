#
# Create ECS cluster
#
resource "aws_ecs_cluster" "kappa-cluster" {
  name = "kappa-cluster"
}
