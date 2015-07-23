resource "aws_ecs_cluster" "kappa-cluster" {
  name = "kappa-cluster"
}

resource "aws_ecs_task_definition" "sample_app1" {
  family = "sample_app1"
  container_definitions = "${file("task-definitions/foo.json")}"
}

resource "aws_ecs_task_definition" "sample_app2" {
  family = "sample_app2"
  container_definitions = "${file("task-definitions/bar.json")}"
}

resource "aws_ecs_task_definition" "docker_registry" {
  family = "docker_registry"
  container_definitions = "${file("task-definitions/registry.json")}"
}

resource "aws_ecs_service" "kappa-sample1" {
  name = "kappa-sample1"
  cluster = "${aws_ecs_cluster.kappa-cluster.id}"
  task_definition = "${aws_ecs_task_definition.sample_app1.arn}"
  desired_count = 1
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
  desired_count = 1
}
