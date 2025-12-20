### Getting Started with OpenTelemetry- LFS148

----

- What is Observability? - is a measure of how well the internal states of a system can be inferred from knowledge of its external outputs. AKA how easy you can understand whats happenning inside a system. (application or service).

- Distributed system is a network of independent computers or nodes, working together to perform tasks as if they were a single system. Modern systems are used in conjuction with clod computing, where different parts of an application run on different servers to share resources and balance the workload. (in this situation observability becomes crucial).

- How to make a distributed system observable? Need to model its state in a way that lets us reason about its behaviour. The model is composed of three factors: 

1. Workload: the operations a system performs to fulfill its objectives, when a user send a request > distributed system breaks it down into smaller tasks handled by different services. Often called transactions
2. Software abstractions: provides the structure of the distributed system. This includes elements such as a load balancers, services, pods and containers and more.
3. Rerources: physical machines that provide the computational resources > RAM, CPU, HDD, network. 

- Workload and Resource Analysis: 

![](images/intro.png)


- Often app developers typically contentrate on workload-related aspects, where are operationas teams tend to look at physical resources.

- to Understand a system we must combine inssights from multiple angles and figure out how they relate to one another. This is done by a combinations of logs, metrics and traces. 

---

