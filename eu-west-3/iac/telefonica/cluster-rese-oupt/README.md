# Considerations

- Before execute this module, execute the s3-bucket module if not already deployed. It has the configurations files to execute automations in cloud-init EC2 intances.

## sgs

- if not exists, include this sgs

```
  ~ resource "aws_security_group" "rke2_cluster_sgs" {
        id                     = "sg-064b13cdf2503140e"
      ~ ingress                = [
          - {
              - cidr_blocks      = []
              - description      = "elbv2.k8s.aws/targetGroupBinding=shared"
              - from_port        = 30138
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = [
                  - "sg-020c4f23357ac4daa",
                ]
              - self             = false
              - to_port          = 30138
            },
```

