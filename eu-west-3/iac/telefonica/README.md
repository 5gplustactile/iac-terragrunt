# telefonica space

- When you use the tf-rke2 terrafom module. Also is recommended execute the vpc-peering module to avoid have connections 
problems between the vpc network of cluster-mgmt and the vpc of digital twins.

- When you use the subnets terraform module. May be it's necessary to execute the vpc-peering module to avoid have connections
problems between the vpc network of cluster-mgmt and the vpc network of digital twins