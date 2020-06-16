aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
aws configure set default.region us-east-1

aws ecr get-login-password | docker login --username AWS --password-stdin 926110576269.dkr.ecr.us-east-1.amazonaws.com
docker build -t 926110576269.dkr.ecr.us-east-1.amazonaws.com/helloworld:latest .
docker push 926110576269.dkr.ecr.us-east-1.amazonaws.com/helloworld:latest

kubectl rollout restart deployment/helloworld-deployment

# kubectl set image deployment/helloworld-deployment helloworld=926110576269.dkr.ecr.us-east-1.amazonaws.com/helloworld:latest

k


# #!/bin/bash -e

# # this is most likely namespaced repo name like myorg/veryimportantimage
# SOURCE_IMAGE=926110576269.dkr.ecr.us-east-1.amazonaws.com/helloworld
# # using it as there will be 2 versions published
# TARGET_IMAGE=926110576269.dkr.ecr.us-east-1.amazonaws.com/helloworld

# # lets make sure we always have access to latest image
# TARGET_IMAGE_LATEST="${TARGET_IMAGE}:latest"

# aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}
# aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
# aws configure set default.region ${EB_REGION}
# aws ecr get-login-password | docker login --username AWS --password-stdin 926110576269.dkr.ecr.us-east-1.amazonaws.com

# # Push image to ECR
# ###################
# docker tag ${SOURCE_IMAGE} ${TARGET_IMAGE_LATEST}
# docker push ${TARGET_IMAGE_LATEST}