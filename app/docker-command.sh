#KEDA -Build the image

docker buildx build -t sqs-reader --platform=linux/amd64 -f keda/Dockerfile ./keda
docker login
docker tag sqs-reader:latest khanasif1/sqs-reader:v0.12
docker push khanasif1/sqs-reader:v0.12


#KARPENTER -Build the image

docker buildx build -t karpenter-sqs-reader --platform=linux/amd64 -f karpenter/Dockerfile ./karpenter
docker login
docker tag karpenter-sqs-reader:latest khanasif1/karpenter-sqs-reader:v0.2
docker push khanasif1/karpenter-sqs-reader:v0.2