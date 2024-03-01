# A Critique of the CAP Theorem

[paper](docs/A-Critique-of-the-CAP-Theorem.pdf)

隔离性：单副本多对象，一致性：多副本，单对象

CAP -> PACELC -> delay-sensitivity framework（availability->operation latency）

CAP -> HAT

delay-sensitivity framework:Availability,Delay-sensitive,Network faults,Fault tolerance,Consistency[ADNFC]

| Consistency level      | write    latency | read      latency |
| ---------------------- | ---------------- | ----------------- |
| linearizability        | O(d)             | O(d)              |
| sequential consistency | O(d)             | O(1)              |
| causal consistency     | O(1)             | O(1)              |




strong consistency:linearizability,sequential consistency,one-copy serializability





## Word

ambiguities

formalization

illusion

catastrophically

empirically

retrospect

intuitive

noteworthy

proviso

aforementioned

