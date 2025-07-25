# Introduction to Kubernetes (LFS158)

### 1. Introduction

### 2. From Monolith to Microservices

### 3. Container Orchestration

### 4. Kubernetes

### 5. Kubernetes Achitecture

### 6. Installing Kubernetes

### 7. Minikube: Installing local Kuberneets Clusters

### 8. Accessing Minikube

### 9. Kubernetes Building Blocks

### 10. Authentication, Authorization, Admision control

### 11. Services

### 12. Deploy Standalone application

### 13. Kubernetes Volume management

### 14. Configmaps And Secrets

### 15. Ingress

### 16. Advanced Topics

---

---

### 1. Introduction

---

**Overview**

- beginning to use Kubernetes for container orchestration who need guidelines on how to start transforming their organization with Kubernetes and cloud native patterns.

---

### 2. From Monolith to Microservices

---

**Overview**

- What is a Monolith? - Being a large, single piece of software which continuously grows, it has to run on a single system which has to satisfy its compute, memory, storage, and networking requirements. The hardware of such capacity is not only complex and extremely pricey, but at times challenging to procure.

- Since the entire monolith application runs as a single process, the scaling of individual features of the monolith is almost impossible. It internally supports a hardcoded number of connections and operations. However, scaling the entire application can be achieved by manually deploying a new instance of the monolith on another server, typically behind a load balancing appliance - another pricey solution.

- During upgrades, patches or migrations of the monolith application downtime is inevitable and maintenance windows have to be planned well in advance as disruptions in service are expected to impact clients. While there are third party solutions to minimize downtime to customers by setting up monolith applications in a highly available active/passive configuration, they introduce new challenges for system engineers to keep all systems at the same patch level and may introduce new possible licensing costs.

---

- Microservices: (Modern way of chopping into pieces a large infrastructure with a modular approach) - Microservices can be deployed individually on separate servers provisioned with fewer resources - only what is required by each service and the host system itself, helping to lower compute resource expenses.

- Microservices-based architecture is aligned with Event-driven Architecture and Service-Oriented Architecture (SOA) principles, where complex applications are composed of small independent processes which communicate with each other through Application Programming Interfaces (APIs) over a network. APIs allow access by other internal services of the same application or external, third-party services and applications.

---

### 3. Container Orchestration

---

**Overview**

- Container images allow us to confine the application code, its runtime, and all of its dependencies in a pre-defined format. The container runtimes like runC, containerd, or cri-o can use pre-packaged images as a source to create and run one or more containers. These runtimes are capable of running containers on a single host, however, in practice, we would like to have a fault-tolerant and scalable solution, achieved by building a single controller/management unit, a collection of multiple hosts connected together. This controller/management unit is generally referred to as a container orchestrator.

---

**Container Orchestration**

- What is a Container? - They are application-centric method to deliver high-performing, scalable application on any infrastructure of your choice. Containers are best suited to deliver microservicesby providing portable, isolated virtual environments for applications to run without interference from other running applications.

![](images/containers.png)

- Microservices are lightweight application written in various programming language with specific dependencies, libraries and environmental requirements. To ensure that application has everything it needs to run successfully it is packaged together with its dependencies.

- Containers encapsulate microservices and their dependencies byt do not run them dirrectly. Containers run container images.

- A container image bundles the application along with its runtime, libraries, and dependencies. and it represents the source of a container deployed to offer an isolated executable enviroment for the application. Containers can be deployed from a specific image on many platforms, such as workstations, VMs, public cloud... etc.

---

**Container Orchestration**

- In Dev environments, running containers on a single host for development and testing of applications may be suitable option. However, when migrating on to a QA and PROD environments, that is no longer viable option because the applications nad services need to meet specific requirements:

  - fault tolerance,
  - on-demand scalability
  - optimal resource usage
  - auto-discovery to automatically discover and communicate with each other
  - accessibility from the outside world
  - seamless updates/rollbacks without any downtime

- Container orchestrators are tools which group systems together to form clusters where containers deployment and management is automated at scale while meeting the requirements. Those clustered systems confer the advantages of distributed systems, such as increase in- performance, efficiency, reliability, workload distribution and reduced latency.

- There are many container orchestration tools: Amazon Elastic Container, Azure Container instances, Azure Service Fabric, Kubernetes, Nomad, Docker swarm.

- Why we use them? - we can manually maintain a couple of containers or write scripts to manage the lifecycle of dozens of containers, orchestrators make things much easier for users especially when it comes to managing hundreds or thousands of containers running on a global infrastructure.

- With container orcestrators we can:

  - Group hosts together while creating a cluster, in order to leverage the benefits of distributed systems.
  - Schedule containers to run on hosts in the cluster based on resources availability.
  - Enable containers in a cluster to communicate with each other regardless of the host they are deployed to in the cluster.
  - Bind containers and storage resources.
  - Group sets of similar containers and bind them to load-balancing constructs to simplify access to containerized applications by creating an interface, a level of abstraction between the containers and the client.
  - Manage and optimize resource usage.
  - Allow for implementation of policies to secure access to applications running inside containers.

- Deployment of Container Orchestration: Most container orchestrators can be deployed on the infrastructure of our choice - on bare metal, Virtual Machines, on-premises, on public and hybrid clouds. Kubernetes, for example, can be deployed on a workstation, with or without an isolation layer such as a local hypervisor or container runtime, inside a company's data center, in the cloud on AWS Elastic Compute Cloud (EC2) instances, Google Compute Engine (GCE) VMs, DigitalOcean Droplets, IBM Virtual Servers, OpenStack, etc.

- In addition, there are turnkey cloud solutions which allow production Kubernetes clusters to be installed, with only a few commands, on top of cloud Infrastructures-as-a-Service. These solutions paved the way for the managed container orchestration as-a-Service, more specifically the managed Kubernetes as-a-Service (KaaS) solution, offered and hosted by the major cloud providers.

---

### 4. Kubernetes

---

![](images/kubernetes.png)
**Overview**

- What is Kubernetes? - Open-source system for automating deployment, scaling and management of containerized appliactions.

- called also k8s, inspired by Googl'es Borg system > a container and workload orchestrator for its global operations. Writen in Go.

- . Several features/objects of Kubernetes that can be traced back to Borg, or to lessons learned from it, are:

  - API servers
  - Pods
  - IP-per-Pod
  - Services
  - Labels.

---

**Kubernetes Features**

1. Automatic bin packing
   Kubernetes automatically schedules containers based on resource needs and constraints, to maximize utilization without sacrificing availability.
2. Designed for extensibility
   A Kubernetes cluster can be extended with new custom features without modifying the upstream source code.
3. Self-healing
   Kubernetes automatically replaces and reschedules containers from failed nodes. It terminates and then restarts containers that become unresponsive to health checks, based on existing rules/policy. It also prevents traffic from being routed to unresponsive containers.
4. Horizontal scaling
   Kubernetes scales applications manually or automatically based on CPU or custom metrics utilization.
5. Service discovery and load balancing
   Containers receive IP addresses from Kubernetes, while it assigns a single Domain Name System (DNS) name to a set of containers to aid in load-balancing requests across the containers of the set.

6. Automated rollouts and rollbacks
   Kubernetes seamlessly rolls out and rolls back application updates and configuration changes, constantly monitoring the application's health to prevent any downtime.
7. Secret and configuration management
   Kubernetes manages sensitive data and configuration details for an application separately from the container image, in order to avoid a rebuild of the respective image. Secrets consist of sensitive/confidential information passed to the application without revealing the sensitive content to the stack configuration, like on GitHub.
8. Storage orchestration
   Kubernetes automatically mounts software-defined storage (SDS) solutions to containers from local storage, external cloud providers, distributed storage, or network storage systems.
9. Batch execution
   Kubernetes supports batch execution, long-running jobs, and replaces failed containers.
10. IPv4/IPv6 dual-stack
    Kubernetes supports both IPv4 and IPv6 addresses.

- Additional Features: Kubernetes supports common Platform as a Service specific features such as application deployment, scaling, and load balancing, but allows users to integrate their desired monitoring, logging and alerting solutions through optional plugins.

- For example, support for role-based access control (RBAC) is stable only as of the Kubernetes 1.8 release, while cronjob support is stable only as of release 1.21.

- **NB!** One of the main strengths- portability. It can be deployed in many environments such as local or remote Virtual Machines, bare metal, or in public/private/hybrid/multi-cloud setups.

---

---

---

### 5. Kubernetes Achitecture

---

---

---

**Kubernetes Cluster Architecture**

- Kubernetes Architecture can be described as: cluster of compute systems ategorized by their distinct roles

- 1. One or more control plane.
- 2. One or more worker nodes (optional but recommended)

- Components of Kubernetes Cluster:

![](images/kubernetescluster.png)

---

---

**Control Plane Node**

- provides a running environment for the control plane agents responsible for managing the state of a Kubernete cluster, and its braind behind all oprations inside the cluster. The control plane components are agent with very distict roles in the cluster's management. In order to communicate with k8s cluster > user sends requests to the control plane >CLI tool/web UI/API.

- **Important to keep control plane running at all costs.** Losing control plane may introduce downtime, causing service disruption to clients with possible loss of business. To ensure such fault tolerance we need to have control plane node replicas. They need to be configured in High-availabilit(HA) mode.

- Only one of the control plane nodes is dedicated to actively managing the cluster, the control plane components stay in sync across the control plane node replicas. This type of configuration adds resiliency to the cluster's control plane, should the active control plane node fail.

- To make the Kubernetes cluster state persistent-> all cluster configuratio data is saved to a istributed key-value store which only holds cluster state related data, no client workload generated data.

- The key-value store may be configured on the conrol plane (stacked topology) or on its dedicated host (external topology) to help reduce the chances of data store loss by decoupling i from the other control plane agents.

- In the stacked key-value store topology, HA control plane replicas ensure the key-value store's resilency as well. However that is not the case with external key-value store topology where the dedicated key-value store hosts have to be separately repolicated for HA, a configuration that introduces the need for additional hardware- > additional operational costs.

---

---

**Control Plane Node Components**

- control plane node runs the following essential control plane components and agents: API server, scheduler, controller managers and key-value store.

- control plane node runs- container rintime, node agent (kubelet), proxy (kube-proxy), optional add-ons for observability- dashboard, cluster level monitoring, and logging.

---

- **API SERVER**

---

- All administarative tasks are coordinated by the kube-apiserver, a central control plane component runing on the control plane node.

- The API server intercepts RESTful calls from users, administrators, developers, operators and external agents, then validates and processes them. During processing the API server reads the K8s cluster's current state from the key-value store, and after a call's execution the resilting state of the k8s cluster is saved in the key-value store for persistence.

- The API server is the oncrol control plane component to talk to the key- value store. both to read from and to save kubernetes cluster state information > acting as a middle interface for any other control plane agent inquiring about the cluster's state.

- The API server is highly configurable and customizable. It can scale horizontally, but it also supports the addition of custom secondary API servers, a configuration that transfors the primary API server into a proxy to all secondary, custom API server, routing all incoming RESTFUL calls to them based on custom defined rules.

---

- **Scheduler**

- The role of the kube-scheduler is to assign new workload objects, such as pods encapsulating containers, to nodes- typically worker nodes. Duging the scheduling process, decisions are made based on current Kubernetes cluster state and new workload object's requirements.

- The schedulers obtains from the key-value store, vi a the API server, resource usage data for each worker node in the cluster. The scheduler also receives from the API server the new workload object's requirements which are part o its configuration data. Requirements may include contstraints that users and operators set, such as scheduling work on a node labeled with disk==ssd key-value pair.

- The scheduer also takes n account QoS(Quality of Service) requirements, data locality, affinity, anti-affinity, taints, tolration, cluster topology, etc. Once all the cluster data is available the scheduling algorithm filters the nodes with predicates to isolate the possible node candidates which then are scored with priorities in order to select the one node that satisfies all requirements for hosting the new workload. The outcome of the decision process is communicated back to the API server, which den deelgates the workload deployment with other control plane agents.

- The scheduler is highly configurable and customizable through schduling polcies, plugins and profiles. Additional custome schedulers are also supported, then the objects configuraton data should include the name of the custome schduler expected to make the schduling decision for that particular object, if no such data is include the default schduler is selected instead.

- A scheduler is extremely important and complex in multi-node Kubernetes cluster, while in a sngle-node Kubernetes cluster possibly used for learning and development purposes, the scheduler job is quite simple.

---

**Controller managers**

- Controller managers are components of the control plane node running controllers or operator processes to regulate the state of the K8s cluster. Controllers are watch loop processes continuously running and comparing the cluster's desired state( provided by objects configuration data) with its current state (obtained from the key-value store via the API server). In case of mismatch, corrective action is taken in the cluster until its current state matches the desired state.

- The kube-controller-manager runs controllers or operators responsible to act when nodes become unavailable, to ensure container pod counts are as expected to create endpoints, service accounts and API access tokens.

- The cloud-controller manager runs- controllers or operators responsible to interact wit hthe underlying infrastructure of a cloud provider when nodes become unavailable to manage storage volumes when provided by a cloud service and to manage a load balancing and routing.

---

**Key-Value data store**

- **etcd** is open source project under CNCF. etcd is a strongly consistent, distributed key-value data store used to persist a Kubernetes cluster's state. New data is written to the data store only by appending to it, data is never replaced in the data store. Obsolete data is compacted or shredded periodically to minimize the sie of the data store.

- out of all control plane components, only the API server is able to communicate with the etcd data store.

- etcd's CLI management tool- edcdctl, provides snapshot save and restore capabilities which come n handly especially for a single etcd instance Kubernetes cluster- common in development and learning environments. However in stage nad production environments, it is extremely important to replicate the data stors in HA mode for cluster configuration data resiliency.

- Some Kubernetes cluster bootstrapping tools, such as kubeadm, by default provision stacked etcd control plane nodes, where the data store runs alongside and shares resources with the other control plane components on the same control plane node.

![](images/stackedetcd.png)

- For data isolation from the control plane components, the bootstrapping process can be configured for an external etcd topology, where the data store is provisioned on a dedicated separate host, this reducing the cahnces of an etcd failure.

![](images/externaletcd.png)

- Both Stacked and external etcd topologies support HA configurations. etcd is based on the RAFT consensus Algo > which allows a collection of mahines to work as a coherent group that can survive the failures of some of its memebrs. ANy given time, one of the nodes in the group wil be the leader and the rest of them will be followers.

- etcd handles leader elections and can tolerate node failure, including leader node failures. Any node can be treated as a leader.

- The leader/followers hierarchy is distinct fomr the primary/secondary hierarchy meaning that neither node is favored for the leader role and neither node outrands other nodes. A leader will remain active until it fails at which point in time a new leader is elected by the group of healthy followers.

![](images/leaderfollower.png)

---

**Worker Node Overview**

- worker node provide a running environment for client applicatios. These apps are microservices running as application containers. In k8s the application container are encapsulated in PODS, controlled by the cluster control plane agent running on the control plane nodes.

- Pods are schedulerd on worker nodes, where they find required compute, memory and storage resources to run, and networking to talk to each other and the outside worlds. A pod is the smalled scheduling work unit in K8s. It is a logical collection of one or more container schdeculed together nad the collection can be started, stopped or rescheduled as a single unit of work.

- In a multi-worker Kubernetes cluster, the network traffic between client users and the containerized applications deployed in PODS is handled directly by the worker nodes, and its not routed through the control plane node.

---

**Worker Node Components**

- A worker node has the following components, contaiainer runtime, node agent- kubelet, kubelet-CIR shims, proxy- kube-proxy and add-ons (for DS, observability components> dashboards, cluster-level monitoring and logging and device plugins).

- Container Runtime: k8s is described as "container orchestration engine" it lacks the capability to directly handle nad run containers. In order to managea containr's lifecycles Kubernetes requires a container runtime on the node where a pod and its container are to be scheduled. A runtime is required on each node of a k8s cluster, both control plane and worker.

- Recommendntation is run the K8s control plane coponents as containers, hence the necessity of a runtime on the control plane nodes. k8s supports- CRI-O, containerd, Docker engine, Mirantis Container Runtime.

---

**Node agent- kubelet**

- The kubelet is an agent running on each node, contro plane and workers and it communicates with the control plane. It recieves POD definitions, primarily from the API server and interacts with the container runtime on the node to run containers associated with the POD. It also monitos the health and resources of pods running containers.

- The Kubelet connects to container runtimes through a plugin based interface- the Container Runtime interface (CRI). CRI consists of protocl buffers , gRPC API, libraries and addtional specification and tools in order to connect to interchangeable container runtimes, kubelet uses a CRI shim- an application which provides a clear abstaction layer between kubelet and the container runtime.

- Container runtime interface diagram:

![](images/CRI.png)

- The kubelet acting as grpc client connects to the CRI shim acting as grpc server to perform container and image operations. The CRI implements two services: ImageService and RuntimeService. The ImageService is responsible for all image-related operations, while the RuntimeService is responsible for all pod and container-related operations.

---

**kubelet- CRI shims**

- Originally the kubelet agent supported only a couple of container runtimes, first Docker Engine, followed by rkt, through a unique interface model integrated directly in the kubelet source code. However, this approach was not intended to last forever even thugh it was especially beneficial for docker. After tht k8s migrated to CRI- a flexible method to integrate with various container runtimes without the need to recompile its source code.

- Shims are Container Runtime Interface (CRI) implementations, interfaces or adapters, specifi to each ocntainer runtime supported by K8s.

---

**cri-containerd**

- cri-containerd allows containers to be directly created and managed with containerd at kubelet's request

![](images/CRI-containerd.png)

**CRI-O**

- CRI-O enables the use of any Open Container Initiative (OCI) compatible runtime with k8s, such as runC:

![](images/CRI-O.png)

**dockershim and cri-dockerd**

- before later k8s update, the dockershim allowed containers to be created and managed by invoking the Docker Engine and its internal runtime containerd. Due to Docker Engine's popularity, this shim was the default. after modern updates the dockershim is no longer maintained by the k8s project, its specific code is removed from the kubelet source code, thus will no longer be supported by the kubelet node agent of k8s.

- As a result, Docker, Inc., and Mirantis have agreed to introduce and maintain a replacement adapter, cri-dockerd that would ensure that the Docker Engine will continue to be a container runtime option for Kubernetes, in addition to the Mirantis Container Runtime (MCR). The introduction of cri-dockerd also ensures that both Docker Engine and MCR follow the same standardized integration method as the CRI-compatible runtimes.

![](images/dockershim.png)

---

**Proxy- kube-proxy**

- Kube-proxy network agent whch runs on each node, control plane nd workers, responsible for dynami updates and maintenance of all networking rules on the node. it abstracts the details of pods networking and forwards connection requests to the containers in the Pods.

-Kube-proxy is responsible for TCP, UDP and SCTP stream forwarding on random forwarding across a set of POD backends of an application and its implements forwarding rules defined by users through Service API objects.

- Kube-proxy node agent operates in conjunction with the iptables of the node. Iptables is a firewall utinility created for the linux os that can be managed by users via CLI.

---

**ADD-ONS**

- Add-ons are cluster features and functionality not yet available in k8s and therefore we need 3rd pary plugs and services.

- DNS, Dashboard, Monitoring, Logging, Device Plugins.

---

**Networking CHallenges**

- Decoupled microservices based applications rely heavily on networking in order to mimic the tight-coupling once available in the monolithic era. As conetainerized microservices orchestrator it needs to address a few distinct networking challenges:

      - container to container communication inside pods.
      - pod to pod communiation on the same node and acrss cluster nodes
      - service to pod communication within the same namespace and across cluster namespaces
      - external to service communication for clients to access applications in a cluster.

- all of these challenges must be addressed by a kubernetes cluster and its plugins.

**Container-to- Container** communication inside pods:

- making use of the underlying host operating system's kernel virtualization features, a container runtime creates an isolated network space for each contaner it starts. On Linux, this isolated network space is referred to as network namespace.

- a network namespace can be shared across containers or with the host operating syste,

- When a grouping of containers defined by a POD is started, a special infrastructure Pause container is initialized by the Container Runtime for the sole purpose of creating a network namespace for the Pod. All additional containers, created through user requests, running inside the POD will share the Pause container's network namespace so that they can all talk to each other via localhost.

**Pod-to-Pod comunication across nodes**

- In a Kubernetes cluster Pods, groups of containers, are scheduled on nodes in a nearly unpredictable fashion. Regardless of their host node, Pods are expected to be able to communicate with all other Pods in the cluster, all this without the implementation of Network Address Translation (NAT). This is a fundamental requirement of any networking implementation in Kubernetes.

- The Kubernetes network model aims to reduce complexity, and it treats Pods as VMs on a network, where each VM is equipped with a network interface - thus each Pod receiving a unique IP address. This model is called "IP-per-Pod" and ensures Pod-to-Pod communication, just as VMs are able to communicate with each other on the same network.

- Containers share the Pod's network namespace and must coordinate ports assignment inside the Pod just as applications would on a VM, all while being able to communicate with each other on localhost - inside the Pod.

- containers are integrated with the overall Kubernetes networking model through the use of the Container Network Interface (CNI) supported by CNI plugins. CNI is a set of specifications and libraries which allow plugins to configure the networking for containers. While there are a few core plugins, most CNI plugins are 3rd-party Software Defined Networking (SDN) solutions implementing the Kubernetes networking model. In addition to addressing the fundamental requirement of the networking model, some networking solutions offer support for Network Policies. Flannel, Weave, Calico, and Cilium are only a few of the SDN solutions available for Kubernetes clusters.

![](images/CNIcoreplugins.png)

- The container runtime offloads the IP assignment to CNI, which connects to the underlying configured plugin, such as Bridge or MACvlan, to get the IP address. Once the IP address is given by the respective plugin, CNI forwards it back to the requested container runtime.

**External-to-Pod Communication**

- A successfully deployed containerized application running in Pods inside a Kubernetes cluster may require accessibility from the outside world. Kubernetes enables external accessibility through Services, complex encapsulations of network routing rule definitions stored in iptables on cluster nodes and implemented by kube-proxy agents. By exposing services to the external world with the aid of kube-proxy, applications become accessible from outside the cluster over a virtual IP address and a dedicated port number.

---

---

---

### 6. Installing Kubernetes

---

---

---

**Kubernetes Configuration types**

1. ALL-in-One Single-Node Installation: all the control plane and workder components are installed and running on a single-node. while its useful for learning, development and testing its not recommended for production purposes

2. Single-Conrol Plane and Multi-Worker installation: we havea single control plane node running a stacked etcd instance. multiple worker nodes can be managed by the control plane node.

3. Single-Contol Plane with single-node etcd and a multi-workder Installation: single control plane node with external etcd instance. multiple worker nodes can be managed by the control plane node.

4. Multi-Contol Plane and Multi- Worker Installation: multiple control plane nodes configured for High-Availability (HA), with each control plane node running a stacked etcd instance. The Etcd instances are also configured in an HA etcd clisted and multiple worker nodes can be managed by the HA control plane.

5. MUlti-Control Plane with Multi-node etcd and multi-worker installation: multiple control plane nodes configured in HA mode, with each control plane node paired with an external etcd instace. The External etcd instances are also configured in an HA etcd cluste and multiple workder nodes can be managed by HA control plane. Most advanced cluster config + recommended for production environments.

- NB! With the complexing increasesing, the hardware resource requirement also grow.

---

**Infrastructure for Kubernetes**

- Upon a decision is made on the installation type, there needs to be an infrastructure support most common requirements fall into fields of :

1. set up k8s on bare metal, public cloud, private or hybrid cloud?
2. Which OS? Linux? Red-Hat or Debian or Windows?
3. Which networking CNI solution is needed?

---

**Installing Local Learning Clusters**

- There are different variations of k8s clusters that we can implement.

1. Minikube: single and multi-node local k8s cluster recommended for a learning environment deployed on a single host.
2. Kind: multi-node K8s cluster deployed in a docker containers acting as kubernetes nodes, for learning
3. Docker Desktop: Including a local k8s for docker users.
4. Podman Desktop: Including kubernetes integration for Podman Users.
5. Microk8s: local and cloud k8s cluster for developer and production from Canonical
   6.K3S- lightweight cluster for local deployments, originally from Rancher.

---

**Installing Production Clusters with Deployment Tools**

- There are several recommended tools: kubeadm, kubespray, kops.

- Kibeadm: first-class citizen of k8s ecosystem- recommended method to bootstrap a multi-node producting ready HA k8s clusters, on premises or in the cloud. it can also bootstrap a single-node cluster for leanring. it does not support the provisioning of hosts thay should be provisioned separately with a tool of admin's choice.

- Kubespray: known as kargo, allows installation of HA production ready clusters on AWS, GCP, Azure, Open stack, vSphere or bare metal. is based on Ansible and is available fro most linux distros.

- kops: enables to create, upgrade and maintain production-grade HA kubernetes clustrs from the CLI, it can provision the required infrastructure as well, currently AWS an GCE are officially suppored. Support for Digital Ocean and OpenStack is in beta.

- Windows support fo Kuberntes- at time of these notes- only Windows Server 2019 and Windows Server 2022 are suppored by Kubernetes, but the control plane nodes are limited to running on Linux only.

---

---

---

### 7. Minikube: Installing local Kubernetes Clusters

---

---

---

**Overview**

- Minikube- easiers most flexible and popular methods to run all in one or multi node local Kubernets cluster isolated by VM or Cotnainers run directly on workstations. Its a tool responsible for installation of Kubernets components, cluster bootstrapping and cluster tear-down when no longer needed. It includes additional features aimed to ease the user interaction with the kubernetes cluster, but its a fully functional non-production kuberernetes cluster for learnning purposes.

---

**Minikube**

- Minikube is one of the easiers , most flexible and popular methods to run an all in one or multi-node local Kubernetes cluster Directly on a local workstation.

- It installs and runs on any native OS such as Linux, MacOs or Windows, In order to take full advantage of all its features, a Type-2 Hypervisor or a Container Runtime should be installed on the local workstation, to run in conjuction with Minikube. The role of the hypervisor or container runtime is to offer an isolated infrastructure for the Minikube kubernttes cluster components, that is easily reporducible, easy to use and tear down.

- The isolation of the cluster components from our daily environment ensure tht once no longer needed, the minikube components can be safely removed leaving beind con configuration canges to our workstations thus no traces of their experience. This does not mean however that we are responsible for the provisioning of any VMs or containers with guest OS with the help of the hypervisors or container runtime. Minikune includes the ncessary adapters to interact directly with the isolation software of choice to build all its infrastructure as log as the type-2 hypervisor or container runtime is installed on our workstation.

- Minikube is built on the capabilities of the libmachine library originally designed by Docker to buld Virtual machine container hosts on any physical infrastructure. Making Minikube very flexible.

- Minikube can be also installed without an isolation software, on bare metal > leading to in permanent configuration changes to the host OS. To prevent such permanent onfiguration changes, a second form of isolation can be achieved by installing Minikube inside a VM provisioned with a Type-2 Hypervisor of choice, and a desktop OS of choice (with GUI). As a result when installed inside VM Minikube will end up making configuration changes to the guet environment, still isolated from the host workstation. Therefore, now we have two distinct methods to isolate the minikube environment from our host workstation.

- The isolation software can be specified by the user with --driver option, otherwise Minikube will try to find a preferred method for the host OS of the workstation.

- Once dedicated on the isolation method, the next step is to determine the required number of Kubernetes cluster nodes, and their sizes in terms of CPU, memory and disk space. Minikube invokes the hypervisor of choice to provision the infrastructure VMS which will host the Kuberenetes cluster nodes, or the runtime of choice to run infrastructure containrs that host the cluster nodes.

- Regardless of the isolation method and expected cluster and node sizes, a local minikube Kubernetes cluster will ultimately be impacted and/or limited by the physical resource of the host workstation.

- We have to be mindful of the needs of he host OS and any utilities it may be running, then the needs of the hypervisor or the container runtime, and finally the remaining resources that can be allocated to our Kubernetes cluster. for learning environmend reccomendations are - 2cpu cores, 2 gb ram- 8GB RAM recommended and 20+ GB disk storage space. IF there is a migration of big production based clusted this should be adjusted.

- THe kubernetes nodes are expected to access the internet as wel for software update, container image downloads and for client accessibility.

-After the nodes provisioning phase, Minikube invokes kubeadm to bootstrap the kubernetes cluster components inside the previously provisioned nodes. We need to ensure that we have the needed hardware and software to built our environment.

---

**Requirements for minikube**

- use one of the most robust and stable isolation methods as a driver, the VirtualBox hypervisor, to provision the VM(s) which host the components of the Kubernetes cluster. While no longer the preferred driver due to slower startup times when compared with other methods, it is still one of the most stable drivers for Minikube on Linux and Windows. However, the VirtualBox hypervisor is no longer compatible with macOS on ARM chipset (M1, M2, and M3), therefore Docker will be used instead.

- VT-x/AMD-v virtualization- may need to be enabled on the local workstation for certain hypervsiors.

- kubectl- command line client (CLI) is a binary used to access and manage any Kubernetes cluster. It is installed through Minikube and accessed through the minikube kubectl command, or it can be installed separately and run as a standalone tool.

- Type-2 hypervisor or container runtime: without a specified driver,Minikube will try to find an installed hypervisor or a runtime, in the following order of preference(On a linux host): docker, kvm2, podman, vmware and virtualbox. If multiple isolation software installations are found, such as docker and virtualbox Minikune will picker docker over virtualbox if no desired driver is specified by the user.

- Hypeviros and cntainer runtimesuppored by various workstation OSes:

      1. Linux- VirtualBox, KVM2 and QEMU hypervisors or docker and podman runtimes
      2. MacOS- virtualbox, hyperkit, vmware fusion, parallels and quemu hypervisors or docker/podman runtimes.
      3. Windows- virtualbox, hyperv, vmware workstation, qemu hypervisors or docker and podman runtimes.

- NB! Minikube supports a **--driver=node** on Linux, an optionm that runsthe Kubernetes Components bare-metal directly on the host OS and not inside a VM. With this option a Docker installation is requiredand a Linux OS on the local workstation but no hypervisor installation (for advanced users)

- Internet connection on the first Minikunbe run-> is needed for packages, dependencies updates and to pull images needed to initialize the Minikube Kubernetes cluster components. Subsequent Minikube runs will require an internet connection onlywhen a new container images needed to be pulled from a public container registry or when deployed containerized application need it for client accessibility. Once a container images has been pulled it can be reused from the local container runtime image cache without internet connection.

---

**Minikube Linux Install**

- Minikube on Ubuntu Linux LTS with VirtualBox v7.0.

- no other isolation software is installed on the workstation.

- Steps:

1. Verify the virtualization support on the Linux OS:

```
$ grep -E --color 'vmx|svm' /proc/cpuinfo
```

2. Download and install VirtualBox.

3. Download and install Minikube (offisial installation guide x86-64>Stable) Update tthat most up to date package repositiries are used in the process.

- this is binary download option, distribution neutral installation approach:

```
$ curl -LO \
https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64

$ sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

- NB! we can replace /latest/ with a particular version, such as /v1.31.2/ will download that specified Minikube version.

4. Start minikube. (it can be staretd with the minikube start command).

- the command bootstraps a single-node cluster with the latest supported stable Kubernetes version release. for specific kubernetes version the **-kuberentes-version** option can be used as such: /v1.31.2/ will download that speified Minikube version.

```
minikube start
```

- for specific version we can make it like:

```
minikube start --kubernetes-version=v1.27.1
```

- In case there are other vitualization driver candidates for minikube on the workstation,it is good practice to supply the desired driver with ** --driver=virtualbox**

```
$ minikube start --driver=virtualbox
```

- **NB!** -if there is an error message that reads "Unable to pick a default driver" > Minikube was not able to locate an one of the supproted hypervisors or runtimes. The recommendation is to install or re-install a desired isolation tool and ensure its executable is found in the default **PATH** of your OS distribution.

- **NB!** - if there is an error message that reads "The vboxdrv kernel module is not loaded" means tht the critical VirtualBox kernel module may not be available. Workarounds:

  - re-install Virtualbox on workstation
  - install C compiler that may be missing from workstation and then build the kernel modle. for ubutin 22.04 LTS OS - can be build with **sudo /sbin/vboxconfig**

- after rebuild is finished- start minikube with vritualbox using the start command and then can be cheked with status command

```
$ minikube status
```

- to stop minikube

```
$ minikube stop
```

- to remove minikube

```
$ minikube delete
```

---

**Minikube MacOS Install**

- Use case: virtualbox v0.7 / Docker Desktop, NO other isolation software is installed on Mac. (There is no KyperKit, VMware Fusion, Paralles or QEMU)

- If Mac is with Inter processor-> VirtualBox Hypervisor. M1,M2, M3 workstations> Docker Desktop

- **NB!** - For other hypervisors or container runtimes and minikube versions steps may vary- READ THE MANUAL!

- Steps:

1. Docker Desktop for Mac from official page.
2. Instal Minikube (official installation guide)
3. Check known issues
4. Binary download option with:

```
$ curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-darwin-amd64

$ sudo install minikube-darwin-amd64 /usr/local/bin/minikube
```

- ARM64:

```
$ curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-darwin-arm64

$ sudo install minikube-darwin-arm64 /usr/local/bin/minikube
```

5. Start Minikube:

```
$ minikube start --driver=docker
```

6. Check minikube status
7. Stop/Delete comands are the same as previous linux install

---

**Minikube Windows Install**

- Minikube installation windows 10 and 11 with VirtualBox v7.0, instalation assume no other isolation software is installed on Windows workstation.

- Steps:

1. Verify virtualization support for windows system.

```
PS C:\WINDOWS\system32> systeminfo
```

2. Install VirtualBox hypervisor for widosts hosts with the .exe package.
3. install the minikube via the installer.exe package.
4. Start Minikube

```
PS C:\WINDOWS\system32> minikube start --driver=virtualbox
```

5. Check Status

```
PS C:\WINDOWS\system32> minikube status
```

6.Stop/remove minikube.

---

**Command Breakdown Notes**

- **minikube start**: by default selects a driver isolation software, such as a hypervisor or a container runtime, if one (VirtualBox) or multiple are installed on the host workstation. In addtion downloads latest Kubernetes version components. After download- provisions single VM named **minikube** (min 2 CPUs, Memory-6GB, Disk-20gb) or docker container to host the default single-node all in one kubernetes cluster.

- once the node is provisionend, it bootstraps the Kuberenetes control plane (with kubeadm tool) and it installs the latest version of the default container runtime, Docker, that will serve as running environment for the containerized application we will deploy to the Kubernetes cluster.

- the command generates a default minikube cluster withthe specifications described aboce and it will store these specs so that we can restart th default cluster whnever desired. The object that stores the specification of our cluster is called **profile**. Minikube allows users to create custome reusable clusterss that can be all managed from a single com,mand line client.

- **minikube profile**: allows us to view the status of all our clusters in a table formatted output, if you have created only the default minikubeclister- we could list the properties that define with. Command looks like:

```
$ minikube profile list
```

- the rerun will look like:

```
|----------|------------|---------|----------------|------|---------|---------|-------|--------|
| Profile  | VM Driver  | Runtime |       IP       | Port | Version | Status  | Nodes | Active |
|----------|------------|---------|----------------|------|---------|---------|-------|--------|
| minikube | virtualbox | docker  | 192.168.59.100 | 8443 | v1.28.3 | Running |     1 | *      |
|----------|------------|---------|----------------|------|---------|---------|-------|--------|
```

- table presents the columns associated with the default properties such as the profile name: minikube, the isolation driver: VirtualBox, the container runtime: Docker, the Kubernetes version: v1.28.3, the status of the cluster - running or stopped. The table also displays the number of nodes: 1 by default, the private IP address of the minikube cluster's control plane VirtualBox VM, and the secure port that exposes the API Server to cluster control plane components, agents and clients: 8443.

- **Creation of multiple reusable clisters** : we can use the command **minikube start**, with the custom profiles with **--profile or -p** flags. Several of the isolation drivers support craetion of node VMs or node containers of custome sizes as well.

- Examples of complex start commands that allow custome clusters with minikube. TO be used with already **Installed** Docker/Podman drivers. NO need for **CNI**

```
$ minikube start --kubernetes-version=v1.27.10 \
  --driver=podman --profile minipod

$ minikube start --nodes=2 --kubernetes-version=v1.28.1 \
  --driver=docker --profile doubledocker

$ minikube start --driver=virtualbox --nodes=3 --disk-size=10g \
  --cpus=2 --memory=6g --kubernetes-version=v1.27.12 --cni=calico \
  --container-runtime=cri-o -p multivbox

$ minikube start --driver=docker --cpus=6 --memory=8g \
  --kubernetes-version="1.27.12" -p largedock

$ minikube start --driver=virtualbox -n 3 --container-runtime=containerd \
  --cni=calico -p minibox

```

- After cluster profiles are available the default minikube and custom the table in the profile list will look different (with more profiles).

- Active marker will indicate the target cluster profile of the minikube command line tool, the target cluster can be set to minibox with the command

```
$ minikube profile minibox
```

- it can be also set to default with the:

```
$ minikube profile minikube
$ minikube profile default
```

---

**Command Breakdown Notes part 2**

- for commands as **start, stop,node, etc** are profile aware, meaning that the user is required to explicitly specify the target cluster of the command, through its profile name.

- the default minikube cluster, can be managed without specifying profile name. Stopping and re-starting clusters, minibox cluster (explicintly) and default minikube cluster (implicityly) like:

```
$ minikube stop -p minibox

$ minikube start -p minibox

$ minikube stop

$ minikube start
```

- to display the version of the current Minikube

```
$ minikube version
```

- Completion is helpful post installation. For ubuntu is:

```
$ sudo apt install bash-completion

$ source /etc/bash_completion

$ source <(minikube completion bash)

- and then run the command to confirm:

$ minikube completion bash
```

- to allow users to list the nodes of a cluster, add new control plane/worker nodes, delete existing cluster nodes, start ot stop individual nodes of a cluster

```
$ minikube node list

$ minikube node list -p minibox

```

- to display cluster control plane node's IP address or another nodes' IP with the --node or -n flags.

```
$ minikube ip

$ minikube -p minibox ip

$ minikube -p minibox ip -n minibox-m02

```

- when a cluster config is no longer of user, the cluster profile can be deleted. detele command is profile aware- **it deletes the default minikube cluster i fno profile is specified, or a custom cluster if its profile is specified**.

```
$ minikube delete

$ minikube dele -p minibox

```

-Note to self- Minikube command line refrence pages.

---

---

---

### 8. Accessing Minikube

---

---

---

**Overview**

- Healthy runninng K8s cluster can be accessed via any one of the following methods: CLI tools and scripts, web-bases UI, APIs from CLI.

1. CLI- kubectl is the Kuberentes Command line interface (CLI) to manage resource and application. very flexible, can be used solo or part of scripts/tools. once required credentials and clster access points have been configured for kubeCTL, it can be use remotely from anywhere to access a cluster.

2. Web based UI - Kubernetes dashboard.

3. API- main component of the K8s control plane is the API server- responsbile for exposing the Kuberentes APIs. accessible via both CLI and dashboard Ui.

- API server is accessible through its endpoints by agents and users possessing the requred credentials.

- API directory Tree:

![](images/apidirectory.png)

- Api directory tree of kubernetes can be divided into three independed group types:

- Core group (/api/v1): Pods, Services, Nodes, Namespaces, ConfigMaps, Secrets

- Named group (/apis/$NAME/$VERSIOn)-
  API version that have different level of stability:

  - Alpha level: it may be dropped at any point in time without notice.

  ```
     /apis/batch/v2alpha1.
  ```

  - Beta level: it is well-tested, but the semanditcs of objects may change in incompativle ways in a subsequent beta or stable release.

  ```
  /apis/certificates.k8s.io/v1beta1.
  ```

  - Stable level- appears in releases software for many subsequest versions

  ```
     /apis/networking.k8s.io/v1.
  ```

- System-wide: consist of system-wide API endpoints (/healthz, /logs, /metrics, /ui, etc.)

---

**Kubectl**

- **Overview**: allows us to mange local Kubernetes clusters local clusters like Minikube or remote cloud clusters. It is installed **BEFORE** installing an starting Minikube, but it can also installed after cluster bootsrapping step.

- A minikube installation has its own kubectl CLI installed and ready to use.

- However, it is somewhat inconvenient to use as the kubectl command becomes a subcommand of the minikube command. Users would be required to type longer commands, such as minikube kubectl -- <subcommand> <object-type> <object-name> -o --option, instead of just kubectl <subcommand> <object-type> <object-name> -o --option. While a simple solution would be to set up an alias, the recommendation is to run the kubectl CLI tool as a standalone installation.

- once installed **kubectl** receives its configuration automatically from Minikube Kubernetes cluster access.

-NB with diferent k8s cluster setups, we may need to manually configure the cluster access points and certificates required by kubectl to securely access the cluster.

- Check k8s documentation for methods of kubectl.

---

**kubectl Linux install**

- we need to install the kubectl binary

```
$ curl -LO "htt‌‌ps://dl.k8s.io/release/$(curl -L -s \
htt‌‌ps://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

$ sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

```

- to install specific version of kubectl:

```
$ curl -LO ht‌‌tps://dl.k8s.io/release/v1.28.3/bin/linux/amd64/kubectl
```

- version verification can be made with:

```
$ kubectl version --client
```

- post installation shell autocompletion

```
$ sudo apt update && sudo apt install -y bash-completion

$ source /usr/share/bash-completion/bash_completion

$ source <(kubectl completion bash)

$ echo 'source <(kubectl completion bash)' >> ~/.bashrc
```

---

**kubectl macOS install**

- it can be installed with the homebrew package manager.

- to install it , we need stable binary

```
$ curl -LO "htt‌ps://dl.k8s.io/release/$(curl -L -s \
https://dl.k8s.io/release/stab...)/bin/darwin/amd64/kubectl"

$ chmod +x ./kubectl

$ sudo mv ./kubectl /usr/local/bin/kubectl

$ sudo chown root: /usr/local/bin/kubectl
```

- to install specific kubectl version we need the following command:

```
$ curl -LO htt‌ps://dl.k8s.io/release/v1.28.3/bin/darwin/amd64/kubectl
```

- Homebrew installation goes like:

```

$ brew install kubectl

or

$ brew install kubernetes-cli

The installed version can be verified with:

$ kubectl version --client
```

- after those install we can add shell outcompletion.

---

**kubectl Windows install**

- we need the binary and to make use of the curl command. once downloaded the binary needs to be added to the PATH

```
example of path:

https://dl.k8s.io/release/v1.28.3/bin/windows/amd64/kubectl.exe


```

- if curl is installed from the CLI:

```
curl -LO "htt‌ps://dl.k8s.io/release/v1.28.3/bin/windows/amd64/kubectl.exe"
```

- to check installation

```
$ kubectl version --client
```

- after installation shell autocompletion can be istalled with POWERSHELL.

---

**kubectl Configuration file**

- to access th e k8s cluster, thee kubectl clined needs the control plane done endpoint and appropriate credentials to be able to securely interact with the API server running on the control plane node.

- When starting Mnikube, the process creates by default a configuration file **config** in the **.kube** directory, residing in the user's **home** directory.

- the configuration file has all the connection details required by kubectly. The kubectl binary parses this file to find the control plane node's connection endpoint, along with thre required credentials. Multiple kubeconfig files can be configured with a cingle kubectl client.

- to look at the connection details we can either display the contend of the **~/.kube/confing** or run

```
$ kubectl config view
/lists the config file's content to securely access the server
```

-Once kubectl is installed we can display information about the Minikube Kubernetes cluster with the **kubectl cluster -info**

```
$ kubectl cluster-info
/shows control plane's Ip address and the endpoint of the coredns server
```

- **NB!** with the installed kubernetes cluster installed by Minikube in the directory ~/.kube/config automatically, this is not the case for kubernetes clusters installed by other tools. In other cases the config file has to be created manually with sometimes re-configured to suit various networking and client/sever setups.

---

**Kubernetes Dashboard**

- provides web-based user interface for Kubernetes cluster management. Minikube installs the dashboard as an addon, but it is disabled by defalt. Priord to using the dashboard we are required to enable the dashboard addon, together with the usage metrics from the Kubernetes cluster.

- to access the dashboard from Minikube, we can use the minikubedashboard command and also enable the required addons with:

```
$ minikube addons list

$ minikube addons enable metrics-server

$ minikube addons enable dashboard

$ minikube addons list

$ minikube dashboard

```

- if the browser is not opened we can troubleshoot with the following command:

```
$ minikube dashboard --url
```

- thn we need to copy paste the displayed URL in a new tab. logout/login or reboot may be needed.

---

**APIs with kubectl proxy**

- when we type **kubectl proxy** command, kubectl authenticates with the API server on the control plane node and makes services available on the default proxy port 8001.

```
$ kubectl proxy
```

- it locks the terminal for as long as the proxy is running, unless we run it in the background (with kubectl proxy &).

- When kubectl proxy is running we can send request to the APi over the localhost on th default proxy port 8001 (from another terminal since the proxy lock the first terminal when running in the foreground)

```
$ curl http://localhost:8001
```

- with curl we requested all the API endpoints from the API server. we can explore several path combination with curl or with a browser:

```
http://localhost:8001/api/v1

http://localhost:8001/apis/apps/v1

http://localhost:8001/healthz

http://localhost:8001/metrics
```

---

**API authentication**

- If we do not use the **kubectl proxy** we need to authenticate to the API server when sending API requests. We can authenticate by providing a Bearer Token when using curl command or by proving a set of keys and certificates.

- Bearer Token: an access token that can be generated by the authentication server (the API server on the control plane node ) at the client's request.

- Using bearer token, the client can securely communicate with the Kubernetes API server without providing additional authentication details, and then access resources. The token may need to be provided again for subsequent resource access requests.

- To create access token for the **default** ServiceAccount and grant special permission to access the root directory of the API (special permission that was not necessary if the kubectl proxy was used).

- The special permission will be a set through a RBAC policy. The policy of the **clusterrole** defined below which is granted through the **clusterorolebuinding** definition. The special permission is only needed to access the root directory of the API, but not needed to access /api , /apis or other subdirectories.

The commands areas follows:

```
$ export TOKEN=$(kubectl create token default)

$ kubectl create clusterrole api-access-root --verb=get --non-resource-url=/*

$ kubectl create clusterrolebinding api-access-root --clusterrole api-access-root --serviceaccount=default:default

Retrieve the API Server endpoint:

$ export APISERVER=$(kubectl config view | grep https | cut -f 2- -d ":" | tr -d " ")


# Confirm that the APISERVER stored the same IP as the Kubernetes control plane IP by issuing the following two commands and comparing their outputs:

$ echo $APISERVER

# Returns
htt‌ps://192.168.99.100:8443

$ kubectl cluster-info

# Returns
Kubernetes control plane is running at htt‌ps://192.168.99.100:8443 ...
```

- Access the API Server using the curl command

```
$ curl $APISERVER --header "Authorization: Bearer $TOKEN" --insecure
```

- we can run additioanl curl commands to retrieve details about specific API groups. These commands should work even without the special permission defined and granted to the default ServiceAccount Associated with the access token

```
$ curl $APISERVER/api/v1 --header "Authorization: Bearer $TOKEN" --insecure

$ curl $APISERVER/apis/apps/v1 --header "Authorization: Bearer $TOKEN" --insecure

$ curl $APISERVER/healthz --header "Authorization: Bearer $TOKEN" --insecure

$ curl $APISERVER/metrics --header "Authorization: Bearer $TOKEN" --insecure
```

- instead of the access token, we can extract the cliend certificate, client key and certificate autheority data from the **.kube/config** file. Once extracted they can be encoded and then passed with a curl command for authentication.

- The command only works with the base 64 encoded cliend certificate, key and certificate authority data (illustrative purposes)

```
$ curl $APISERVER --cert encoded-cert --key encoded-key --cacert encoded-ca
```

---

---

---

### 9. Kubernetes Building Blocks

---

---

---

#### Kubernetes Object Model

**Overview**

- Kubernetes become a industry leader due to its advanced application lifecycle management capabilities- via its rich object model. The model had few features that are represented as persistend entities in the k8s cluster:

- what containerized applications are running.
- the nodes where the containerized applications are deployed.
- application resource consumption
- policies attached to applications, like restart/upgrade, fault tolerance, ingress/egress.

- with each oject we declare our intent, or the desired state of the object, in the **spec** section. k8s system manages the status section for objects, where it records the actual state of the object.

- at any given moment, the K8s Contropl plane tries to match the object's actual state to the object desired state. Object definition manifest must include other fields that specify the version of the API we are referencing as the **apiVersion** , the object type as **kind**, and additional data helfupl to the cluster or user- **metadata**.

- in certain object definitions, we find different sections that replace spec, they are **data** and **stringData**. Both sections facilitate the declaration of information that should be stored by their respecive objects.

- in k8s object types are : Nodes, namespaces, Pods, ReplicaSets Deployments, DaemonSets.

- when we create an object, the object's configuration data section from below the spec field as to be submitted to the Kubernetes API server. The API request to create an object must have the spec section, describing the desired state as well as other details. the API server accepts objec definitions in a JSON format, most ofthen we provide such definition manifests in YAML format >> converted by **kubectl** in a JSON payload and sent to the server.

---

**Nodes**

- Nodes are virtual identities assigned by k8s to the systems part of the cluster- whether Virtual Machines, bare-metal, containers, etc. These identitites are unique to each system and are used by the cluster for resources accounting and monitoring purposes. Which helps with workload as management throught the cluster.

- Each node is managed with the help of 2 k8s node agents- kubelet nad kube-proxy, while the node also hosts a container runtime. The runtime is needed to run all containerized workload on the node- control plane agents and user workloads.

- kubelet and kube-proxy node agents are responsible for executing all local workload management related tasks- interact with the runtime to run containers, monitor containers and node health, report anby issues and node state to the API server, and manage network traffic to containers.

- on thier functions there are two types of nodes: **control plane** and **worker**. Typical k8s cluster includes at least one control plane node, but it may include multiple control plane nodes for the HA(high availability) of the control plane. With that cluster also includes one or more worker nodes to provide resource redudndacy in th ecluster. There are cases for bootstrapping sincle-all-in-one cluster as a single node on single VM, bare-metal or container when high-availability and resource redundancy are not of importance.

- minikube allows usto bootstrap multi-node clusters with dedicated control plane nodes, however if the host system has limited physical resources we can bootsrat single-all-in-one cluster as a single node on a single VM or container and explore from thre.

- Node identities are created and assigned during the cluster bootstrapping process by the tool responsible to initialize the cluster agents. Minikube uses default kubeadm bootstrapping tool to initialize the control plane node during the init phase and grow the cluster by adding worker or control plane nodes with the join phase.

- Control plane nodes run the contol plane agents, such as API server, Scheduler, Controller Manager and etcd in addition to the kubelet and kube-proxy node agents , the container runtime and the addo-ons fo container networking, monitoring logging DNS, etc.

- worker nodes run the kubelet and kube-proxy node agents the container runtime and add-ons for container networking, monitoring, logging.

- the Control plane node and worker node represent the k8s cluster. A cluster's nodes are system distributed either on the same private network, across different networks, even across different cloud networks.

---

**Namespaces**

- If we are using the same K8s cluster for multiple users and teams, we can partition the cluster into virtual sub-clusters using namespaces. The names of the resources/objects created inside a Namespace are unique , **but not across namespaces in the cluster**

- we can check a list of ann Namespaces with the command

```
kubectl get namespaces
```

- k8s crates 4 namespaces out of the box: 1. kube-system 2. kube-public 3. kube-node-lease 4. default

- **kube-system** namespace contains the objects created by the Kubernetes system, mostly the control plane agents.

- **kube-public** is special Namespace, which is unsecured and readable by anyone, used for special purposes such as exposing public (non-sensitive) information about the cluster.

- **kube-node-lease** newest namespace, which holds node lease objects used for node heartbeat data.

- **default** namespace containers the objects and resourecs created by administrators and developers, objects are assigned to it by default unless another Namespace name is provided by the user.

- **NB**- Good practice is to create additional namespaces as desired to virtualize the cluster and isolate users, developer teams, application or tiers.

- to create namespaces we would use the following command:

```
$ kubectl create namespace new-namespace-name
```

- Namespaces are one of the modest desired features of Kubernetes, securing its lead against competititos, as it provides solution to multi-tenancy requirement.

- Resourec quotas help users limit the overall resources consumed within Namespaces while Limitedranges help limit the resources consumed by individual Containers and their enclosing objects inn a namespace.

---

**Pods**

- A pod is the smallest k8s workload object. IT is the unit of deployment in K8s, which represents a single instance of the application.

- A pod is logical collection of one or more containers, enclosing and isolating them to ensure that they:

- are scheduled together on the same host with the Pod.

- share the same network namespac, meaning that they share a single IP address originally assigned to the pod.

- Have access to mount the same external storage(volumes) and other common dependencies.

![](images/kubernetespods.png)

- Pods are ephemeral in nature, and **they do not have the capability to self-heal themselves**. That is the reason they are used with controllers or operators (controllers=operators), which handle Pods's replication, fault tolerance, self-healing etc. Examples of controllers: **Deployments, RepicaSets, DeaemonSets, Jobs**.

- When an operator is used to manage an application, the Pod's specification is nested in the controller's definition using the pod template.

- example of stand-alone pod object's definition in YAML format, wtihout an operator.

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    run: nginx-pod
spec:
  containers:
  - name: nginx-pod
    image: nginx:1.22.1
    ports:
    - containerPort: 80
```

- this is a declarative method to define an object, and can server as a template for a much more complex pod definition manifest if needed.

- The **apiVersion field must specify** v1 for the POd object definition, the second required field is kind-> specifying the POD object type. The third required field is metadata, holds the object's name and optional labels and annotations. The fourth required field spec marks the beginning of the block defininng the desired state of the pod object- also named **PodSpec**.

- In the example our pod creates a single container running on the nginx:1.22.1 - image pulled from a container image registry(dockerhub).

- The containerport field specifies the contaier port to be exposed by k8s resources for inter-application access or external client access.
- spec contents are evaluated for scheduling purposes, then the kubelet of the selected node becomes responsible for running the container image with the help of the container runtime of the node. The pods's name and labels are used for workload accounting purposes.

- the definition manifest if stored by a **def-po.yaml** file is loaded into the clusterto run the desired POD and its associated container image.

- example is with create/ but advanced k8s practioners may opt to use apply instead:

```
$ kubectl create -f def-pod.yaml
```

- writing up definition manifests, may prove to be time consuging because YAML is **extemely sensitive to indentation**. When edition such definition manifests keepin mind that each indent is two blank spaces wide and TAB should be omitted.

- imperatively, we can sumply run the POD defined above without the definition manifest as:

```
$ kubectl run nginx-pod --image=nginx:1.22.1 --port=80
```

- the command generates a definition manifest in YAML, but we can generate a JSON definition file just as easily with :

```
$ kubectl run nginx-pod --image=nginx:1.22.1 --port=80 \
--dry-run=client -o json > nginx-pod.json
```

Both the YAML and JSON definition files can serve as templates or can be loaded into the cluster respectively as such:

```
$ kubectl create -f nginx-pod.yaml
$ kubectl create -f nginx-pod.json
```

- **NB!** practice Pod operations with additional commands such as:

```
$ kubectl apply -f nginx-pod.yaml
$ kubectl get pods
$ kubectl get pod nginx-pod -o yaml
$ kubectl get pod nginx-pod -o json
$ kubectl describe pod nginx-pod
$ kubectl delete pod nginx-pod
```

---

**Labels**

- labels in k8s are key-value pairs attached to Kubernetes objects such as Pods, ReplicaSets, Nodes, Namespaces and Persistent Volumes.

- Labels are sed to organize and select subset of objects, based on the requirements in place. Many objects can have the same label/s. Labels do not provide uniqueness to objects. Controllers use labels to logically group together decoupled objects, rather than using objectss names or IDs.

- In the diagram we have two label keys: **app** and **env**. Based on our requirements: we have given different values to our four Pods. The label **env=dev** logically selects and groups the top two Poads, while the label **app=frontend** logically selects and groups the left two Pods. We can select one of the forus pods- bottom left by selecting two labels: **app=frontend AND env=qa**.

![](images/labels.png)

---

**Label Selectors**

- Controllers or operators and Services, use label selectors to select a subset of objects. Kubernetes supports two types of Selectors:

- **Equality-Based Selectors** : allow filtering of objects based on Label keys and values. Matching is achieved using the =, == (equals, used interchangeably), or != (not equals) operators. For example with **env==dev** or **env=dev** we are selecting the objects where the env label key is set to value dev.

- **Set-Based Selectors** : allows filtering of objects based on a set of values. We can use **in,notin** operators for label values, and **exist/does not exist** operators for label keys. For example with **env in (dev,qa)** we are slecting objects where env label is se to either dev or qa with !app we select objects with no label key app.

![](images/labels2.png)

---

**ReplicationControllers**

- a complex operator that ensures a specified number of replicas of a POD are running at any given time the desired version of the application container, by contstantly comparing the actual state with the desired state of the managed application. If there are mode Pods than the desired count the replication controller randomly terminates the number of Podds exceeding the desired count and if there are fewer Pods than the desired count, then the replication controller requests addtional pods to be created until the actual count matches the desired count.

- Generally we do not deploy a pod independently as it would not be able to restart itself if terminad in error because a pod misses the much desired self-healing feature that k8s otherwise promises. The recommendd method is to use some type of an operator to run and manage pods.

- in addition, ReplicationController operator, also supports application updates.

- Default recommended controller is the deployment which configures a ReplicaSet controller to manage application Pod's lifecycle.

---

**ReplicaSets**

- ReplicaSet is in part the next- generation ReplicationController as it implements the replication and self-healing aspects of the Replication Controller. ReplicaSets supports both equality- and set-based selectors, while ReplicationControllers only support equality-based selector.

- When a single instance the risk of crashing is really high. To avoid such issues- we can run parallel multiple instances of the application > High Availability.

- The lifecycle of the application defined by a POD will be overseen by a controller- The ReplicaSet. With its help we can scale ne number of PODS running a specific application container image. Scaling can be accomplished manually or with the use of autoscaller.

- In the example: a ReplicaSet, with the replica count set to 3 for a specific Pod Template. Pod 1, Pod 2 and Pod 3 are identical, running the same application container image, being cloned from the same Pod template.

- For now the current state matches the desired state, keep in mind however th 3 Pod replicas are identical-> running an instance of the same application, same configuration, they are distict through unique Pod name nad Ip address. The Pod object ensures that the application can be individually placed on any worker node of the cluster as a result of the scheduling process.

![](images/replicasets.png)

- example of ReplicaSet object's definition manifest in YAML. Uses declarative method and it can serve as a template to more complex ReplicaSet definition if needed:

```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: guestbook
  template:
    metadata:
      labels:
        app: guestbook
    spec:
      containers:
      - name: php-redis
        image: gcr.io/google_samples/gb-frontend:v3
```

- the definition manifest if stored by redis-rs.yaml file is loaded into the cluster to run a set of three identical Pod replicas and their associated container image. While create is in the example below, advanced k8s users may choose apply instead:

```
$ kubectl create -f redis-rd.yaml

```

- **NB!** practice and check commands as:

```
$ kubectl apply -f redis-rs.yaml
$ kubectl get replicasets
$ kubectl get rs
$ kubectl scale rs frontend --replicas=4
$ kubectl get rs frontend -o yaml
$ kubectl get rs frontend -o json
$ kubectl describe rs frontend
$ kubectl delete rs frontend


```

- ReplicaSet : one of the Pods is forced to unexpectedly terminate (due to insufficient resources, timeout, hosting node crashed).

- image displaying the replicaset:

![](images/replicaset2.png)

- the replicaSet detects that the current state is no longer matching the desired state and triggers a request for an additional Pod to be create, thus ensuring that the currrent state matches the desired state.

![](images/replicaset3.png)

- ReplicaSets can be used independently as Pod controllers byt they only offer a limited set of features. A set of complementary features are provided by Deploymnts (the recommended controllers for the orchestration of pods).

- deployments manage the createtion, deletion and updates of Pods. a deployment automatically creates a ReplicaSet which then creates a Pod. there os no need to manage ReplicaSets and pods seprately, the deployment will manage them on our behalf.

---

**Deployments**

- Deployment object provide declarative updates to Pods and ReplicaSets. The DeploymentController is part of th control plane node's controller manager, and as a controller it also ensures that the current state always matches the desired state of our running containerized application. It allows for seamless application updates and rollbacks knows as -> RollingUpdate strategy through rollouts and rollbacks and it directly manages its ReplicaSets for application scaling. It also supports a disruptive, less popular update strategy called Recreate.

- example of a Deployment objects's definition manifest in a YAML format. Represents the declarative method to define an object and can serve as a template for much more complex deployment definition manifest if desired:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-deployment
  template:
    metadata:
      labels:
        app: nginx-deployment
    spec:
      containers:
      - name: nginx
        image: nginx:1.20.2
        ports:
        - containerPort: 80
```

- File Breakdown:

1. apriVersion field is the first required field and it specifies the API endpoint on the API server which we want to connect to.
2. kind- specifying the object type > Deplyment, but it can be many different thins such as (Por, ReplicaSet, Namespace, Service).
3. metadata- holds the object's basic information such as name, annotations, labels and namespaces.
4. spec- marks the beginning of the block defining the desired state of the Deployment object. (3 replicas, that is 3 instances of th POD are running at any given time.). The Pods are created using the Pood Template defined in spec.template. A nested object such as the Pod being part of a Deployment, retains its metadata and spec and loses its own apiVersion and king- both being replaced by template. In spec.template.spec we defined the desired state of the Pod. Our Pod creates a single container running the nginx:1.20.2 from Docker hub.

- The definition manifest if stored by a def-deploy.yaml file is loaded into the cluster to run a set of three identical por replicas and their associated container image, together with their managing ReplicaSet. While create is exemplified below, advanced users might choose- apply

```
$ kubectl create -f def-deploy.yaml
```

- Imperatively, we can simply run the Deployment defined above without the definition manifest as such. The following is a multi-line command that should be srelect in its entirety for copy/paste.

```
$ kubectl create deployment nginx-deployment \
--image=nginx:1.20.2 --port=80 --replicas=3
```

- when we need a sterter definition manifest, knowing how to generate one can be a life-saver. The imeprative command with addtional flags such as dry-run and the yaml output can generate the definition template instead of running the Deployment, while the tempalte is then stored in the nginx-deploy.yaml file.

```
$ kubectl create deployment nginx-deployment \
--image=nginx:1.20.2 --port=80 --replicas=3 \
--dry-run=client -o yaml > nginx-deploy.yaml
```

- there is option so we can generate a deployment definition manifest in JSON:

```
$ kubectl create deployment nginx-deployment \
--image=nginx:1.20.2 --port=80 --replicas=3 \
--dry-run=client -o json > nginx-deploy.json
```

- to load both Yaml and Json definition files can server as templates or can be loaded into the cluster respectivelly as such:

```
$ kubectl create -f nginx-deploy.yaml
$ kubectl create -f nginx-deploy.json
```

- Once the Deployment object is created the Kubernetes system attaches the status field to the object and populates it with all necessary status fields.

- In the grapth below is a new Deployment which creates a ReplicaSet A which then creates 3 Pods, with each Pod Templlate configured to run one nginx:1.20.2 container image. In this case the replicaSet A is associated with the nginx representing a state of the Deployment, its recorded as Revision 1.

![](images/Deployment1.png)

- when we need to push updates to the application managed by the Deployment object. lets change the Pods tempatete and updated the container image from nginx:1.20.2 to nginx:1.21.5. The Deployment triggers a new ReplicaSet B for the new container image versioned 1.21.5 and this association represents a new recorded state of the Deployment, Revision 2. The seamless transition between the two ReplicaSets, from ReplicaSet A with three Pods versioned 1.20.2 to the new ReplicaSet B with three new Pods versioned 1.21.5, or from Revision 1 to Revision 2, is a Deployment rolling update.

- **Rolling update** is triggered when we update specific properties of the Pod Template for a deployment. While planed canges such as updating the container image, container port, volumes, and mounts would trigger a new Revision, other operations taht are dynamic in nature like scaling or labeling the deployment do not trigger a rolling update, this do not change the Revision number.

- Once the rolling pdate has completed, the Depoloyment will show both ReplicaSets A nd B where A is scaled to 0(zero) pods and B is scaled to 3 Pods. This is how the Deployment records its prior state configuration setting , known as Revisions.

![](images/Deployment2.png)

- Explanation: Once ReplicaSet B and its 3 pods versioned 1.21.5 are ready the Deployment starts actively managing them. However, the Deployment keeps its prior configuration states saved as Revision which play a key factor in the rollback capacity of the Deployment- returning to a prior known configuration state. In our example if the performance of the new nginx:1.21.5 is not satisfactory, the Deployment can be rolled back to a prior Revision, in this case from Revision 2 back to Revision 1 running nginx:1.20.2 once again.

![](images/Deployment3.png)

- **NB!** practice commands:

```
$ kubectl apply -f nginx-deploy.yaml --record
$ kubectl get deployments
$ kubectl get deploy -o wide
$ kubectl scale deploy nginx-deployment --replicas=4
$ kubectl get deploy nginx-deployment -o yaml
$ kubectl get deploy nginx-deployment -o json
$ kubectl describe deploy nginx-deployment
$ kubectl rollout status deploy nginx-deployment
$ kubectl rollout history deploy nginx-deployment
$ kubectl rollout history deploy nginx-deployment --revision=1
$ kubectl set image deploy nginx-deployment nginx=nginx:1.21.5 --record
$ kubectl rollout history deploy nginx-deployment --revision=2
$ kubectl rollout undo deploy nginx-deployment --to-revision=1
$ kubectl get all -l app=nginx -o wide
$ kubectl delete deploy nginx-deployment
$ kubectl get deploy,rs,po -l app=nginx
```

---

**DaemonSets**

- Daemonsets are operators designed to manage node agents. They resemble ReplicaSet and Deployment operators when managing multiple Pod Replicas and application updates. but the DaemonSets present a distinct fueature that enforces a single pod replicate to be placed per Node, on all the Nodes or on a select subset of nodes.

- In contrast ReplicaSet and Deployment operators by default have no controle over the scheduling and placement of multiple Pod replicas on the same Node.

- DaemonSet operatorrs are commonly used in cases when we need to collect monitoring data from all nodes or to run storage networking or proxy daemons on all nodes, to ensure that we have a specific type of Pod running on all nodes at all times. They are critical API resources in multi-node Kubernetes clusters.

- The kube-proxy agent running as a pod on every single node in the cluster or the Calico or Cilium networking node agent implementing the Pod Networking across all nodes of the cluster are examples of applications managed by the DaemonSet operators.

- When na Node is added to the cluster a Pod from a given DaemonSet is automatically placed on it. Although it ensures an automated process, the DaemonSet's Pods are placed on all cluster's Nodes by the controller itself, and not with the help of the default Scheduler. Wehen any one Node crashes or it is removed from the cluster, the respecive DaemonSet operated Pods are garbage collected. If a daemonSet is deleted all pod replicas it created are deleted as well.

- The placement of DaemonSet Pods is still governed by scheduling properties which may limit its Pods to be placed only on a subset of the cluster's Nodes. This can be achieved with the help of Pod schduling properties such as nodeSelectors, node affinity rules, taints and tolerations. This ensures the Pods of a DaemonSet are placed only on specific Nodes, such as workers if desired. However the default Schduler can take over the schduling process if a corresponding feature is enabled accepting again node affinity rules.

- example of a DaemonSet object's definion manifest in yaml:

```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: fluentd-agent
  namespace: default
  labels:
    k8s-app: fluentd-agent
spec:
  selector:
    matchLabels:
      k8s-app: fluentd-agent
  template:
    metadata:
      labels:
        k8s-app: fluentd-agent
    spec:
      containers:
      - name: fluentd
        image: quay.io/fluentd_elasticsearch/fluentd:v4.5.2
```

- if stored by fluentd-ds.yaml file is loaded into the cluster to run a set of identical Pod replicas, with their associated container image, matching in count the number of cluster nodes.

```
$ kubectl create -f fluentd-ds.yaml
```

- **NB!** Reviews following topics:

```
$ kubectl apply -f fluentd-ds.yaml --record
$ kubectl get daemonsets
$ kubectl get ds -o wide
$ kubectl get ds fluentd-agent -o yaml
$ kubectl get ds fluentd-agent -o json
$ kubectl describe ds fluentd-agent
$ kubectl rollout status ds fluentd-agent
$ kubectl rollout history ds fluentd-agent
$ kubectl rollout history ds fluentd-agent --revision=1
$ kubectl set image ds fluentd-agent fluentd=quay.io/fluentd_elasticsearch/fluentd:v4.6.2 --record
$ kubectl rollout history ds fluentd-agent --revision=2
$ kubectl rollout undo ds fluentd-agent --to-revision=1
$ kubectl get all -l k8s-app=fluentd-agent -o wide
$ kubectl delete ds fluentd-agent
$ kubectl get ds,po -l k8s-app=fluentd-agent
```

---

---

---

### 10. Authentication, Authorization, Admision control

---

---

---

#### Overview

---

- To access and manage Kubernetes resources or objects in the cluster, we need to access a specific API nedpoint on the API server. Each access request goes through the following access control stages:

1. Authentication: authenticate a user based on credentials provided as part of API requests.

2. Authorization: authorizes the API requests submitted by the authenticated user.

3. Admission control: Software modules that validate and/or modify user requests.

![](images/AAA.png)

---

**Authentication**

- k8s does not have an object called user nor does it store usernames or other related details in its objective store. However even without that, kubernetes can use usernames for the authentication phase of the API access control, and to request logging as well.

- types of users that k8s supports:

1. Normal users- they are managed outside of the kubernetes cluster via intedependent services like User/Client certificates, a file listing usernames/passwords, google account.

2. Service Accounts- allow in-cluster processes to communicate with the API server to perform various operations. Most of the Service Accounts are created automatically via the API server, but they can also be created manually. The Service Accounts are tied to a particular Namespace and mount the respective credentials to communicate with the API server as Secrets.

---

- if properly configured, k8s can also support annonymous requests, along with requrest from Normal Users and Service Accounts. User impersonation is also supported allowing a user to act as another user > helpful for administrators when troubleshooting authorization policies.

- for authetntication k8s uses series of authentication modules:

1. X509 Client Certificates
   To enable client certificate authentication, we need to reference a file containing one or more certificate authorities by passing the --client-ca-file=SOMEFILE option to the API server. The certificate authorities mentioned in the file would validate the client certificates presented by users to the API server. A demonstration video covering this topic can be found at the end of this chapter.
2. Static Token File
   We can pass a file containing pre-defined bearer tokens with the --token-auth-file=SOMEFILE option to the API server. Currently, these tokens would last indefinitely, and they cannot be changed without restarting the API server.
3. Bootstrap Tokens
   Tokens used for bootstrapping new Kubernetes clusters.
4. Service Account Tokens
   Automatically enabled authenticators that use signed bearer tokens to verify requests. These tokens get attached to Pods using the Service Account Admission Controller, which allows in-cluster processes to talk to the API server.
5. OpenID Connect Tokens
   OpenID Connect helps us connect with OAuth2 providers, such as Microsoft Entra ID (previously known as Azure Active Directory), Salesforce, and Google, to offload the authentication to external services.
6. Webhook Token Authentication
   With Webhook-based authentication, verification of bearer tokens can be offloaded to a remote service.
7. Authenticating Proxy
   Allows for the programming of additional authentication logic.

- it is possible to enable multiple autheticators, and the first module to successfully authenticate the request short-circuits the evaluation. To ensure successful user authentication, we should enable at least 2 methods: service account tokens auth and one of the user authenticationrs.

---
