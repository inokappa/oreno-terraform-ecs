#
# Define Service(as container start)
#
resource "aws_ecs_service" "kappa-sample1" {
  name = "kappa-sample1"
  cluster = "${aws_ecs_cluster.kappa-cluster.id}"
  task_definition = "${aws_ecs_task_definition.sample_app1.arn}"
  desired_count = 0
}

resource "aws_ecs_service" "kappa-sample2" {
  name = "kappa-sample2"
  cluster = "${aws_ecs_cluster.kappa-cluster.id}"
  task_definition = "${aws_ecs_task_definition.sample_app2.arn}"
  desired_count = 0
}

resource "aws_ecs_service" "kappa-registry" {
  name = "kappa-registry"
  cluster = "${aws_ecs_cluster.kappa-cluster.id}"
  task_definition = "${aws_ecs_task_definition.docker_registry.arn}"
  desired_count = 0
}

resource "aws_ecs_service" "dd-agent" {
  name = "dd-agent"
  cluster = "${aws_ecs_cluster.kappa-cluster.id}"
  task_definition = "${aws_ecs_task_definition.datadog_agent.arn}"
  desired_count = 1
}
