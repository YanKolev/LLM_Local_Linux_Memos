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

---

##### KVM Overview

- KVM (Kernel-based Virtual Machine) is a full virtualization solution for Linux on x86 hardware.

- KVM is a loadable virtualization module of the Linux kernel and it convers the kernel into a hypevisor capable of managing guest Virtual Machines.

- Originally designed for the x86 hardware, it has also been ported to FreeBSD, S/390, PowerPC, IA-64, and ARM as well.

- High-level overview of the KVM/QEMU Virtualization environment:

![](images/kvm.png)

- KVM is open source software that provides hardware-assisted virtualization to support various OS- Linux distros, Windows, Solaris, etc.

- KVM enables device abstraction of network interfaces, disk but NOT THE PROCESSOR! KubeVirt, QEMU and virt- manager are examples of user tools for KVM Virtual Machine management.

- KVM supports nested guests- allowing VMs to run within VMs. Also supports hotpluggable device such as CPUs and PCI devices. **Overcomming** ( This means that more virtualized CPUs and memory can be allocated to virtual machines than there are physical resources on the system. This is possible because most processes do not access 100% of their allocated resources all the time.) is possible as well as for the allocation of additional virtualized resourecs that may not be available on the system. To achieve it KVM dynamically swaps resources from another guest that is not using the type of resource needed.

- KVM benefits: open source, can reduce costs, supports many different OSes, para-virtualization of Ethernet cards, disk I/O, scalable, advanced security.

---

##### Virtual Box

- Virtual vox is an x86 and AMD64/Intel64 product from Oracle, capable of running guest OSes. Easy to use multi-platform type-2 hypervisor.

- Benefits: open source, free to use, runs on Linux, Windows, macOS and Solaris, provides teleportaion-live migration.

---

##### Vagrant Overview

- Benefits of VMs:

  - Reproductible environment
  - Management of multiple projects, each isolated and restricted in its own environment.
  - Sharing the environment with other teammates
  - Keeping the development and deployment enviroments in sync
  - Consistently running the same VM on different OSes leveraging hypervisors such as VirtualBox, VMware and KVM.

  Vagrant by HashiCorp helps automation of VMs management by providing end-to-end lifecycle utility- the vagrand CLI. Its cross platform and a key feature is extensibility. Usually shipped with limited features but can be extended with plugins. Supports Docker- allowing management of Containers and Virtual Machines.

**Vagrantfile**

- it describes how VMs should be configured and provisioned. It is a text file with Ruby syntax, containing all the information about configuring and provisioning set of machines.

- It may include the machine type, image, networking, provider-specific information, and provisioner details. While it is portable, there should be only one Vagrantfile per project.

```
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
      # Every Vagrant development environment requires a box.
      # You can search for boxes at
      # ht‌t‌ps://app.vagrantup.com/boxes/search
      config.vm.box = "ubuntu/focal64"

      # Set the HOSTNAME of the guest VM
      config.vm.hostname = "vagrant-host"

      # Create a private network, which allows host-only access
      # to the machine using a specific IP
      config.vm.network "private_network", ip: "192.168.56.100"

      # Vagrant VirtualBox provider specific VM properties
      config.vm.provider "virtualbox" do |vb|
           # Set VM name to be displayed in the VirtualBox VM Manager window
           vb.name = "vagrant-vm"
           # Customize the amount of CPUs on the VM
           vb.cpus = 2
           # Customize the amount of memory (2GB RAM) on the VM
           vb.memory = 2048
      end

      # Share an additional folder to the guest VM. The first argument is
      # the path on the host to the actual folder. The second argument is
      # the path on the guest to mount the folder. And the optional third
      # argument is a set of non-required options.
      # config.vm.synced_folder "../data", "/vagrant_data"

      # Vagrant shell provisioner to automatically
      # install packages 'vim', 'curl', 'podman'
      config.vm.provision "shell", inline: <<-SCRIPT
           sudo apt update
           sudo apt install -y vim curl
           sudo mkdir -p /etc/apt/keyrings
           curl -fsSL ht‌tps://download.opensuse.org/repositories/devel:kubic:libcontainers:unstable/xUbuntu_$;(lsb_release -rs)/Release.key | gpg --dearmor | sudo tee /etc/apt/keyrings/devel_kubic_libcontainers_unstable.gpg > /dev/null
           echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/devel_kubic_libcontainers_unstable.gpg] htt‌ps://download.opensuse.org/repositories/devel:kubic:libcontainers:unstable/xUbuntu_$;(lsb_release -rs)/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:unstable.list > /dev/null
           sudo apt update -qq
           sudo apt -y upgrade
           sudo apt install -qq -y podman
           echo NGINX PODMAN CONTAINER RUNNING ON VIRTUALBOX VM > /vagrant-demo
           echo Provisioned at: >> /vagrant-demo
           date >> /vagrant-demo
      SCRIPT

      # Vagrant Podman provisioner automatically installs Podman
      # and then runs the 'nginx' image in a container
      # (We have pre-installed Podman because of provisioner bugs)
      config.vm.provision "podman" do |p|
           p.run "nginx"
      end
end

```

- The vagrant command reads the configuration given in the configuration file and does different operations, like up, ssh, destroy, etc. The vagrant command also has sub-commands like box to manage Box images, rdp to connect to VMs using Remote Desktop Protocol (RDP), etc.

---

**Vagrant Boxes**

- Boxes are package format for the Vagrant environment.
  The Vagrantfile requires an image, which is then used to instantiate Virtual Machines. In the example above, we have used ubuntu/focal64 as the base image. If the image is not available locally, then it can be downloaded from a central image repository such as Vagrant Cloud box repository provided by HashiCorp. Box images can be versioned and customized to specific needs simply by updating the Vagrantfile accordingly.

---

**Providers**

- Are a underlying engines or hypervisors used to provision VMs or containers. Although the default Vagrant provider is VirtualBox, it also supports Hyper-V, VMware, and Docker out of the box. Custom providers such as AWS may be configured as well.

---

**Synced Folders**

- With the Synced Folders feature, we can sync a directory on the host system with a VM, which helps the user manage shared files/directories easily. In our example, if we uncomment the line describing the synced folder attribute, then the ../data folder from the current working directory of the host system would be shared with the /vagrant_data folder of the VM.

```
# config.vm.synced_folder "../data", "vagrant_data"
```

---

**Provisioning**

- allow us to automatically install software and make configuration changes after the machine is booted. It is part of the vagrant up process. There are many types of provisioners available, such as File, Shell, Ansible, Puppet, Chef, Docker, Podman, Puppet, and Salt. In the example below, we used Shell as the provisioner to update the VM and then install the vim and curl packages.

```
config.vm.provision "shell", inline: <<-SCRIPT
     sudo apt update
     sudo apt install -y vim curl
SCRIPT
```

---

**Plugins**

- Mainly used to extend the functionality of Vagrant.

---

**Networking**

- Vagrant provides high-level networking options for port forwarding, network connectivity, and network creation. These networking options represent an abstraction that enables cross-provider portability. That is, the same Vagrantfile used to provision a VirtualBox VM could be used to provision a VMware machine.

---

**Multi-Machine**

- A project's Vagrantfile may describe multiple VMs, which are typically intended to work together or may be linked between themselves.

---

**Vagrant Benefits**

- It automates the setup of one or more VMs, which results in saved time, increased productivity, and lower operational costs.
- It introduces consistency in infrastructure provisioning through Vagrantfile.
  -It is a flexible cross-platform tool.
- It provides support for Docker containers in addition to VMs provisioned with VMware, VirtualBox, and Hyper-V.
- It is easy to install and configure.
- It is very useful in multi-developer teams.

---
