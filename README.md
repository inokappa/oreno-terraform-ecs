## oreno-terraform-ecs
[![wercker status](https://app.wercker.com/status/b7f38c2f7e8bb854acf0b679b3b250ed/s/master "wercker status")](https://app.wercker.com/project/bykey/b7f38c2f7e8bb854acf0b679b3b250ed)

### required

- AWS access key
- AWS secret access key
- SSH key(for Container Instance)
- VPC Subnet ID
- Security Group
- IAM role(for Container Instance)
- S3 Bucket(for docker-registry)
- Datadog API Key(for Datadog Agent)

### terraform plan

```
terraform plan \
-var 'access_key=AK123456789123456789' \
-var 'secret_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' \
-var 'ssh_key_name=your_ssh_key_name' \
-var 'subnet=subnet-12345678' \
-var 'securiy_group=sg-12345678' \
-var 'iam_profile_name=your_iam_role_name' \
-var 's3_bucket_name=your-s3-bucket-name' \
-var 'datadog_api_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```

### terraform apply

```
terraform apply \
-var 'access_key=AK123456789123456789' \
-var 'secret_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' \
-var 'ssh_key_name=your_ssh_key_name' \
-var 'subnet=subnet-12345678' \
-var 'securiy_group=sg-12345678' \
-var 'iam_profile_name=your_iam_role_name' \
-var 's3_bucket_name=your-s3-bucket-name'\
-var 'datadog_api_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```

### terraform destroy

Caution : s3 bucket `force_destroy = "true"` so when you run the destroy s3 bucket will be removed.

```
terraform destroy \
-var 'access_key=AK123456789123456789' \
-var 'secret_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' \
-var 'ssh_key_name=your_ssh_key_name' \
-var 'subnet=subnet-12345678' \
-var 'securiy_group=sg-12345678' \
-var 'iam_profile_name=your_iam_role_name' \
-var 's3_bucket_name=your-s3-bucket-name' \
-var 'datadog_api_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```

### description

- [terraform で Amazon ECS 環境を弄る](http://inokara.hateblo.jp/entry/2015/07/24/075231)
- [terraform で Amazon ECS 環境を弄る（2）〜 docker-registry でプライベートリポジトリ環境を一気通貫で作る 〜](http://inokara.hateblo.jp/entry/2015/07/25/103130)
