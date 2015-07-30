#
# Define task
#
resource "aws_ecs_task_definition" "datadog_agent" {
  family = "datadog_agent"
  volume {
    name = "docker"
    host_path = "/var/run/docker.sock"
  }
  volume {
    name = "mounts"
    host_path = "/proc/mounts"
  }
  volume {
    name = "cgroup"
    host_path = "/cgroup/"
  }
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
            "sourceVolume": "docker",
            "containerPath": "/var/run/docker.sock",
            "readOnly": false
        },
        {
            "sourceVolume": "mounts",
            "containerPath": "/host/proc/mounts",
            "readOnly": true
        },
        {
            "sourceVolume": "cgroup",
            "containerPath": "/host/sys/fs/cgroup",
            "readOnly": true
        }
    ],
    "name": "dd-agent",
    "image": "datadog/docker-dd-agent",
    "cpu": 0,
    "memory": 256,
    "portMappings": [
    ],
    "command": [
    ],
    "essential": true
  }
]
EOF
}
