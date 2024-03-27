# telefonica space

- When you use the tf-rke2 terrafom module. Also is recommended execute the vpc-peering module to avoid have connections 
problems between the vpc network of cluster-mgmt and the vpc of digital twins.

- When you use the subnets terraform module. May be it's necessary to execute the vpc-peering module to avoid have connections
problems between the vpc network of cluster-mgmt and the vpc network of digital twins

- When use the subnets terraform module keep in mind:
    - AWS CIDRs not already assigned
    - ```subnet_region```: the name must be the same as ***name of the cluster***
    - ```subnet_outpost```: the name must be the same as ***name of the cluster***
    - ```tags```: the ```kubernetes.io/cluster/```:
        - to cluster called opentwins in edge ``` ex: kubernetes.io/cluster/edge-clusters-opentwins```
        - to cluster called opentwins in region ``` ex: kubernetes.io/cluster/region-clusters-opentwins```