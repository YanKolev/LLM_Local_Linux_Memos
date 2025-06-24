#### Introduction to Cloud Infrastructure Technologies (LFS151)

##### 1. Introduction

##### 2. Virtualization

##### 3. Infrastructure as a service- IaaS

##### 4. Platform as a service- PaaS

##### 5. Containers

##### 6. Containers: Micro oses for containers

##### 7. Containers: Container Orchestration

##### 8. Unikernels

##### 9. Microservices

##### 10. Software-defined networking and Networking for containers

##### 11. Software-defined sotrage and storage management for containers

##### 12. DevOps and CI/CD

##### 13. Tools for cloud infrastructure: Configuration management

##### 14. Tools for cloud infrastructure: Build and release

##### 15. Tools for cloud infrastructure: Key-value pair storage

##### 16. Tools for cloud infrastructure: Image building

##### 17. Tools for cloud infrastructure: Debugging, loggingand monitoring for containeraized applications

##### 18. Service mesh

##### 19. IoT

##### 20. Serverless Computing

##### 21. Distributed Tracing

---

##### 1. Introduction

- Key features of Cloud Computing:

1. Speed and Agility
2. Cost
3. Easy Access to Reources
4. Maintenance
5. Multi-tenancy
6. Reliability
7. Scalability and Elasticity
8. Security

---

- Cloud deployment models:

  1. Private Cloud: designate and operated solely for one organization.
  2. Public Cloud: open to the public
  3. Hybrid Cloud: mix between private and public
  4. Community Cloud: formed by multiple organizations sharing common cloud infra
  5. Distributed Cloud: formed by distributed systems connected to a single network
  6. Multicloud: one org, uses multiple clod providers to run its workload-to avoid vendor lock in
  7. Poly Cloud: one org, uses multiple clouds for specific services

---

- Virtualization: the ability to create a virtual version of a physical compute resource, including virtual hardware platform, OS, virtual storage device and virtual compute resource.

---

- Virtual Machine (VM): represents isolated collection of emulated resources, behaving like an actual physical system.

---

- Hypervisor: specialized virtualization software that runs on a host machine. Its capable of creating multiple isolated virtual operating environments, each composed of virtualized resources that are then made available to guest systems. They have 2 different classes.

- Type 1 hypervisor: native or bare-metal- runs directly on top of a physical host machine's hardware, without the need for a host OS.

- Found in enterprise settings:

  - AWS Nitro
  - IBM z/VM
  - Microsoft Hyper-V
  - Nutanix AHV
  - Oracle VM Server for SPARC
  - Oracle VM Server for x86
  - Red Hat Virtualization
  - VMWare ESXi
  - Xen.

- Type 2 hypervisor: hosted, runs on top of the host OS. Typically they are for end-users.

  -Found in:

  - Parallels Desktop for Mac
  - VirtualBox
  - VMware Player
  - VMware Workstation.

- Exceptions: hypervisors matching both categories, often used for redundancy reasons under hypervisors from type 1 and type 2. They are Linux kernel modules that act as both types of hypervisors.

  Examples:

  - KVM
  - bhyve

- Hypervisors enable virtualization of computer hardware such as CPU, disk, network, RAM and allow installation of guest VMs on top of them. Its possible to create multiple guest VMs with different OS on a single hypervisor(Ex. Linux native machine as host, with type 2 hypervisor can have multiple guest machines with different OS- Linux and Windows).

- Virtualization allows hardware to become virtualized, virtual systems may be created with the help of emulators as well. System emulations that occurs on both system and user space levels, such as QEMU. QEMU is flexible to allow usage in conjuction with a hypervisor such as KVM.
