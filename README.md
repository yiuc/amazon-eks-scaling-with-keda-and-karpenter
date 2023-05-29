## Amazon EKS scaling with KEDA and Karpenter
<p>
<img src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white" />
<img src="https://img.shields.io/badge/python%20-%2314354C.svg?&style=for-the-badge&logo=python&logoColor=white"/>
<img src="https://img.shields.io/badge/AWS%20-%23FF9900.svg?&style=for-the-badge&logo=amazon-aws&logoColor=white"/> 
<img src="https://img.shields.io/badge/docker%20-%230db7ed.svg?&style=for-the-badge&logo=docker&logoColor=white"/>
<img src="https://img.shields.io/badge/AWS-EKS-orange"/>
<img src="https://img.shields.io/badge/KEDA-2.5.0-blue"/>
<img src="https://img.shields.io/badge/Karpenter-0.3.0-green"/>
</p>

# EKS with KEDA HPA & Karpenter cluster autoscaler
This repository contains the necessary files and instructions to deploy and configure [KEDA](https://keda.sh/) (Kubernetes-based Event Driven Autoscaling) and [Karpenter](https://github.com/awslabs/karpenter) (Kubernetes Node Autoscaler) on an Amazon Elastic Kubernetes Service (EKS) cluster.

KEDA enables autoscaling of Kubernetes pods based on the number of events in event sources such as Azure Service Bus, RabbitMQ, Kafka, and more. Karpenter is a Kubernetes node autoscaler that scales the number of nodes in your cluster based on resource usage.

*** 
## Sample Usecase 
<p align="center">
  <img  src="https://github.com/aws-samples/amazon-eks-scaling-with-keda-and-karpenter/blob/main/img/Keda.gif?raw=true">
</p>

## Prerequisites

Before you begin, ensure that you have the following prerequisites:

- An active AWS account.
- Kubernetes command-line tool (`kubectl`) installed.
- [eksctl](https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
- [helm](https://helm.sh/)

## Installation

To install KEDA and Karpenter on your AWS EKS cluster, follow these steps:

1. Clone this repository to your local machine or download it as a ZIP file.
   ```shell
   git clone https://github.com/aws-samples/amazon-eks-scaling-with-keda-and-karpenter.git
   ```

2. Navigate to the repository's directory.
   ```shell
   cd amazon-eks-scaling-with-keda-and-karpenter
   ```

3. Update environmentVariables.sh file in /deployment

| Variable Name               | Description                                                                                         |
|-----------------------------|-----------------------------------------------------------------------------------------------------|
| `AWS_REGION`                | The AWS region.                                                                                     |
| `ACCOUNT_ID`                | The AWS account ID.                                                                                 |
| `TEMPOUT`                   | Temporary output file. This used to temp. store CFN for karpenter                                   |
| `DYNAMODB_TABLE`            | The name of the DynamoDB table.                                                                     |
| `CLUSTER_NAME`              | The name of the EKS cluster.                                                                        |
| `KARPENTER_VERSION`         | The version of Karpenter.                                                                           |
| `NAMESPACE`                 | The Kubernetes namespace for KEDA.                                                                  |
| `SERVICE_ACCOUNT`           | The Kubernetes service account for KEDA.                                                            |
| `IAM_KEDA_ROLE`             | The IAM role for KEDA.                                                                              |
| `IAM_KEDA_SQS_POLICY`       | The IAM policy for KEDA to access SQS.                                                              |
| `IAM_KEDA_DYNAMO_POLICY`    | The IAM policy for KEDA to access DynamoDB.                                                         |
| `SQS_QUEUE_NAME`            | The name of the SQS queue.                                                                          |
| `SQS_QUEUE_URL`             | The URL of the SQS queue.                                                                           |
| `SQS_TARGET_DEPLOYMENT`     | The target deployment for KEDA to scale based on SQS messages.                                      |
| `SQS_TARGET_NAMESPACE`      | The target namespace for the deployment that KEDA scales based on SQS messages.                     |

4. To strat deployment run
    ```shell
    sh ./deployment/_main.sh
    ```

5. You will be asked to verfiy the account in context
<p align="center">
  <img  src="https://github.com/aws-samples/amazon-eks-scaling-with-keda-and-karpenter/blob/main/img/accountverify.jpg?raw=true">
</p>

6. Select your deployment option

<p align="center">
  <img  src="https://github.com/aws-samples/amazon-eks-scaling-with-keda-and-karpenter/blob/main/img/deploymentverify.jpg?raw=true">
</p>

🚨 If you are experiencing error while deploying Karpenter, it can be due to Karpenter repository currently supports limited version and you may be havign old version in environmentVariables.sh. Please follow steps below:🚨

- <span style="color:green;font-weight:700;font-size:20px">Please check latest karpenter version from https://karpenter.sh -> Getting Started. environmentVariables should match with supported version</span>
<br>
  <img  src="https://github.com/aws-samples/amazon-eks-scaling-with-keda-and-karpenter/blob/main/img/Karpenterversion.jpg">

- <span style="color:green;font-weight:700;font-size:20px">Check file createkarpenter.sh under deployment-->karpenter line 80 - 90 and compare with karpneter getting started helm https://karpenter.sh/</span>
<br>
<img  src="https://github.com/aws-samples/amazon-eks-scaling-with-keda-and-karpenter/blob/main/img/karpenterhelm.jpg">

## 🚨 Cleanup 🚨


## Configuration

The repository contains the necessary configuration files for deploying KEDA and Karpenter. You can modify these files to suit your specific requirements. Here are some important files to note:

- [/deploy/keda](https://github.com/aws-samples/amazon-eks-scaling-with-keda-and-karpenter/tree/main/deployment/keda): Contains the deployment files for KEDA components.
- [/deploy/karpenter](https://github.com/aws-samples/amazon-eks-scaling-with-keda-and-karpenter/tree/main/deployment/karpenter): Contains the deployment files for Karpenter components.

Feel free to modify these files according to your needs.


## Acknowledgements

- [KEDA](https://keda.sh/) - Kubernetes-based Event Driven Autoscaling
- [Karpenter](https://github.com/awslabs/karpenter) - Kubernetes Node Autoscaler
## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

