#
# Define task
#
resource "aws_ecs_task_definition" "sample_app1" {
  family = "sample_app1"
  container_definitions = "${file("task-definitions/foo.json")}"
}

resource "aws_ecs_task_definition" "sample_app2" {
  family = "sample_app2"
  container_definitions = "${file("task-definitions/bar.json")}"
}
