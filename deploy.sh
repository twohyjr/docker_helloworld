# setup aws configuration
aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
aws configure set default.region us-east-1

# build/push image to aws repo
aws ecr get-login-password | docker login --username AWS --password-stdin 926110576269.dkr.ecr.us-east-1.amazonaws.com
docker build -t 926110576269.dkr.ecr.us-east-1.amazonaws.com/helloworld:latest .
docker push 926110576269.dkr.ecr.us-east-1.amazonaws.com/helloworld:latest

# restart the deployment object
aws eks update-kubeconfig --name helloworld-cluster
kubectl rollout restart deployment/helloworld-deployment