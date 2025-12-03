### LFEL1009 Getting started with OpenTofu

---

- Managing infrastructure can be complicated > in order to achieve consistency, its easier to define infrastructure as code- IaC. There are two ways to write it: declarative, where you describe the desired outcome, and imperative, where you list the steps to get there. 

- OpenTofu, simiral to Terraform.
- When provisioning the manual way face the following challenges: Human Error, Inconsistency, Scalability Issues, Time Consumption, Limited Agility. manual provisionin provides more hands-on contol over every step > but more  error prone. 

- Benefits of IaC: Consistency and Reliability, Automation and Efficiency, Version Control and Traceability, Scalability, Faster Recovery and Deployment, Cost efficiency.

---

- Declarative vs Imeperative Approaches: declarative also knows as functional and imperative (procedural) > boils down to what vs how. 

- Declarative: describes end state of the infrastructure. IaC tool determines how to make it happen. Simple and easy to use. It focuses on result, but keeps environments consistent since the tool handles the details automatically. But its harder to troubleshoot.

- Imperative: defines exact steps or commands to reach the desired state, with specific instructions. Gives more control over how tasks are done.

---

- OpenTofu: OpenTofu is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. OpenTofu can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

- OpenTofu > fork of Terraform due to different license. 

---

- **Installation**

- initial steps: 
```
1. Download the Installer script:

curl -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh

2. Grant execute permissions and review the script:

chmod +x install-opentofu.sh && less install-opentofu.sh

3. Install using the script:

./install-opentofu.sh --install-method standalone
```

- **core workflow** 

1. Write: You define resources that may span multiple cloud providers and services. For example, you might create a configuration to deploy an application on virtual machines within a Virtual Private Cloud (VPC) network, complete with security groups and a load balancer.

2. Plan:  During the planning phase, OpenTofu generates a detailed execution plan outlining its specific infrastructure actions. This plan describes precisely which resources will be created, updated, or destroyed by comparing the current state of your infrastructure with the desired state defined in your configuration files. By providing this execution plan, OpenTofu allows you to review and understand all proposed changes before they are implemented, ensuring that the modifications align with your expectations and reducing the risk of unintended consequences.

3. Apply: Once you approve the execution plan, OpenTofu implements the proposed changes by performing the necessary operations in the correct sequence. It respects all resource dependencies to maintain the integrity of your infrastructure. This means that resources are created, updated, or destroyed in an order that ensures each resource is ready when another depends on it.

