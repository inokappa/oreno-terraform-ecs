## oreno-terraform-ecs

### required

- AWS access key
- AWS secret access key
- SSH key(for Container Instance)
- VPC Subnet ID
- Security Group
- IAM role(for Container Instance)

### terraform plan

```
terraform plan \
-var 'access_key=AK123456789123456789' \
-var 'secret_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' \
-var 'ssh_key_name=your_ssh_key_name' \
-var 'subnet=subnet-12345678' \
-var 'securiy_group=sg-12345678' \
-var 'iam_profile_name=your_iam_role_name'
```

### terraform apply

```
terraform apply \
-var 'access_key=AK123456789123456789' \
-var 'secret_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' \
-var 'ssh_key_name=your_ssh_key_name' \
-var 'subnet=subnet-12345678' \
-var 'securiy_group=sg-12345678' \
-var 'iam_profile_name=your_iam_role_name'
```

### description

- [terraform で Amazon ECS 環境を弄る](http://inokara.hateblo.jp/entry/2015/07/24/075231)
