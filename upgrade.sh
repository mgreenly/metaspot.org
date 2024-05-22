#!/bin/sh


# instance_ip=$(cd infra; terraform output -json| jq .aws_instance_default.value --raw-output)

echo "#"
echo "# starting package update"
echo "#"
#ssh "admin@$instance_ip" sudo apt update
ssh "admin@metaspot.org" sudo apt update

echo "#"
echo "# starting package upgrade"
echo "#"
ssh "admin@metaspot.org" sudo apt upgrade


