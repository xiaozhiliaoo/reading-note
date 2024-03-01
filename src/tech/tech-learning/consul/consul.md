# Consul简介

Consul is a service mesh solution providing a full featured control plane with service discovery, configuration, 
and segmentation functionality. 

Hashicorp：delivers consistent workflows to provision, secure, connect, and run any infrastructure for any application.

## 提供的新架构，解决方案



## FAQ

线上容器里面是怎么连上的consul？

consul使用模式？线上部署模式？教务总共三个node，service全部在node上，其他电商的node就是service.

service -> consul client(3 pod) -> consul server()

Consul Agent，Server，Client，Consul cluster，


## Using Lib

[memdb](https://github.com/hashicorp/go-memdb)

[bolt](https://github.com/boltdb/bolt)

[serf](https://www.serf.io/)

https://github.com/Ecwid/consul-api

## Paper

- [SWIM:Scalable Weakly-consistent Infection-style Process Group Membership Protocol](https://www.cs.cornell.edu/projects/Quicksilver/public_pdfs/SWIM.pdf)

- [Lifeguard:Local Health Awareness for More Accurate Failure Detection](https://arxiv.org/abs/1707.00788)

- [Vivaldi:A Decentralized Network Coordinate System](https://sites.cs.ucsb.edu/~ravenben/classes/276/papers/vivaldi-sigcomm04.pdf)
  - [Network Coordinates in the Wild](https://www.seltzer.com/assets/publications/Network-Coordinates-in-the-Wild.pdf)
  - [On Suitability of Euclidean Embedding for Host-Based Network Coordinate Systems](https://www-users.cse.umn.edu/~zhang089/Papers/Lee-Suitability-tonfinal.pdf)

- [Raft: In search of an Understandable Consensus Algorithm](https://raft.github.io/raft.pdf)


## Wiki

[Network_tomography](https://en.wikipedia.org/wiki/Network_tomograph)


[Failure_detector](https://en.wikipedia.org/wiki/Failure_detector)