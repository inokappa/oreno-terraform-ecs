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

resource "aws_ecs_task_definition" "docker_registry" {
  family = "docker_registry"
  # container_definitions = "${file("task-definitions/registry.json")}"
  container_definitions = <<EOF
[
  {
    "environment": [
        {
            "name": "REGISTRY_STORAGE",
            "value": "s3"
        },
        {
            "name": "REGISTRY_STORAGE_S3_ROOTDIRECTORY",
            "value": "/"
        },
            {
            "name": "REGISTRY_STORAGE_S3_REGION",
            "value": "ap-northeast-1"
        },
        {
            "name": "REGISTRY_STORAGE_S3_BUCKET",
            "value": "${var.s3_bucket_name}"
        }
    ],
    "name": "registry",
    "image": "registry:2.0",
    "cpu": 0,
    "memory": 256,
    "portMappings": [
      {
          "containerPort": 5000,
          "hostPort": 5000
      }
    ],
    "command": [
    ],
    "essential": true
  }
]
EOF
}

resource "aws_ecs_task_definition" "datadog_agent" {
  family = "datadog_agent"
  container_definitions = <<EOF
[
  {
    "environment": [
        {
            "name": "API_KEY",
            "value": "${var.datadog_api_key}"
        }
    ],
    "mountPoints": [
        {
            "sourceVolume": "/var/run/docker.sock",
            "containerPath": "/var/run/docker.sock",
            "readOnly": false
        },
        {
            "sourceVolume": "/host/proc/mounts",
            "containerPath": "/proc/mounts",
            "readOnly": true
        },
        {
            "sourceVolume": "/host/sys/fs/cgroup",
            "containerPath": "/sys/fs/cgroup/",
            "readOnly": true
        }
    ],
    "name": "dd-agent",
    "image": "datadog/docker-dd-agent",
    "cpu": 0,
    "memory": 256,
    "portMappings": [],
    "command": [
    ],
    "essential": true
  }
]
EOF
}
