## AWS 

- [AWS ARN](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html)

- [AWS IAM](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html)

- ARN
- Amazon Resource Names (ARNs) uniquely identify AWS resources. We require an ARN when you need to specify a resource unambiguously across all of AWS, such as in IAM policies, Amazon Relational Database Service (Amazon RDS) tags, and API calls. 

- get contexts
``` kubectl config get-contexts ```

- use contexts

```kubectl config use-context arn:aws:eks:<region-name>:<arn-id>:cluster/<cluster-name>```

- update cluster config 

```aws eks update-kubeconfig --region <region-name> --name <cluster-name>```
