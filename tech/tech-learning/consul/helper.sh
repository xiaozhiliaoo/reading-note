consul agent -dev -node machine

consul members

consul members -detailed

curl localhost:8500/v1/catalog/nodes

dig @127.0.0.1 -p 8600 machine.node.consul

mkdir consul.d

consul agent -data-dir=/consul/data -config-dir=/consul/config -retry-join=th147:8301 -retry-join=th148:8301 -retry-join=th149:8301 -client=0.0.0.0 -datacenter=bj-th -ui

