#!/usr/bin/bash

read -r -p "Enter the client name: " CLIENT

echo "Creating IAM User: "s3-$CLIENT
aws iam create-user --user-name s3-$CLIENT --output json

aws iam create-access-key --user-name s3-$CLIENT --output json

aws iam add-user-to-group --user-name s3-$CLIENT --group-name s3-users

aws iam put-user-policy --user-name s3-$CLIENT --policy-name $CLIENT-s3-buckets --policy-document file://userpolicy.json
