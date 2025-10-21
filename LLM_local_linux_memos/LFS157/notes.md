# LFS 157 Introduction to Serverless on Kubernetes

-----

### Introduction to Serverless. 


- **What is Serverless?**: There are 2 approaches of the term. One is FaaS- Fucntion as a service and Serverless. 

- Serverless is an abstract term, it refers to the experience a user or customer has and represents a continuum of how close one needs to work with hardware and infrastructure. 

![](images/serverless.png)

- As we move on the axis we see that along with a decreasin convern for infrastructure, there is also a decomposition of the workload and a reduction it its size. Serveless is an approach and architectural pattern, FaaS, providing a concrete way to apply the technology and ideals. 

- Characteristics of Functions:
1. Allow the developer to focus on code rather than infrastructure and deployment artifacts. 
2. Create smaller artifacts and fewer lines of code because they have fewer responsibilities. 
3. They can be either event-driven (triggered by adatabase, object sore, pub-sub) or deployed as REST endpoints and accessed via HTTP. 
4. They are easy to manage because they do not rely of underlying storage. 
5. They are isomorphic- meaning that each fucntion has to conform to a given runtime interface. 

---

- **Serverless Platforms**: serveless platform is responsible for auto-scaling, which are divided into 2 forms:

1. Scaling functions down to save costs and reduce load on the system when functions are idle. Not all platforms support scaling to zero and scaling backfrom zero replicas tends to involve a latency penalty called-> "cold-start" as the code is re-deployed or re-initialized. 

2. Scaling up functions proprtially as demand on a particular endpoint increases. 

- **NB!** that developers should care less about infrastructure, and write small blocks of code that are easy to deploy..

---

### State of Serverless of CNCF

---

- CNCF splits into offerings: which can be istalled and operated on a cluster and offerings which are hosted as a SaaS product. 

- Smallest primitive for workloads in k8s is the Pod, which can be made up of one or more containers- such as the main workload and then a helper, such as proxy or a log collector. The pod loads the code and the user-space from a container image which is sotred in a container registry. 

- to access Pods within a cluster, various k8s networking primiteves come intoplay, such as a Service, load balancer and igress. 

- bare essentials for serverless on k8s are :

1. Container image with function code or an executable inside.
2. Registry to host the conytainer image. 
3. A Pod to run the container image. 
4. A Service to access the Pod. 

- Projects may add components on top of this stack, such as a UI, and API gateway, Ingress automation, auto-scaling, APIs and many more. 

--- 

- **Serverless 1.0 vs Serverless 2.0**

- **Serverless 1.0**: cloud vendors create independent products without concern of portability or migrating between products. Moving AWS lambda to Azure function: would include: reworking he signature, different way zip file is structured, difference in manageged services accessibility, ability zones, regions and limittation to RAM and functions. 

![](images/serverless1.png)

- **Serverless 2.0**: workloads are far more portable than 1.0. Is stored in an OCI-compatible container image. Exposes an HTTP server on port 8080.Can be configured with environment variables. 

- Below is example of Serverless 2.0 projects

![](images/serverless2.png)

----

- **OpenFaaS**: created so developers could use their own hardware to run functions using Docker Containers. It has: 
1. Buld Templates
2. Serving runtime
3. Events
4. Scale from Zero
5. Managed

- tagline of OpenFaaS is “Serverless Functions Made Simple”. 

- **PLONK**: Prometheus, Linux, OpenFaaS, NATS and Kubernetes are combined, we get the PLONK stack, much like LAMP (Linux, Apache, MySQL, and PHP) or JAM (JavaScript APIs Markdown).

![](images/plonk.png)


- In order to have the Plonk stack requires Conteiner Registry and Container Runtime such as Docker or Containerd.

- **PLONK INFRASTRUCTURE LAYER**: 
1. Docker provides a packaging image format, which is portable between clouds. 
2. Container registry holds each version of our function, meaning that we can version it and benefit from distribution, security scanning and mary other features from other CNCF projects like Harbor Registry. 
3. Kubernetes- provides the control plane to turn our function: adding fail-over, High availability scale-out and secret management. 

- **PLONK APPLICATION LAYER**: 
1. OpenFaaS Gateway- is similar to a reverse proxy like Nginx, kong or Caddy. Main job- to expose and manage containers running our functions. It does have its own REST API and can be automated. Popular client is -faas-cli. 
2. Prometheus-  for metrics and instumentation. used for understanding health and performance.Alert manager is used to fire off alerts to notify. 
3. NATS- provides a way to queue up requests and defer them to a later execution. 


-**PLONK GitOps Layer/IaaC LAYER**- Github- to build and deploy functions using its  Travis integration or its own Github action and container registy. GitLab- full suite of tools that can create pipelines. 

----

- **Conceptual Architecture for OpenFaaS**

![](images/openfaasworkflow.png)

- Application layer to show all components working together. Each function is a Docker image, which means it needs a name and a tag. The tag can be used for version control with semver. One of the endpoints si a service, which goes to show that microservices and function can co-exist and work well together with Serverless. 

- Interaction with OpenFaaS happens through REST API, metrics will be available through Prometheus. 

- Core functionality provided by OpenFaaS Gateway: 
1. Create, list, update and delete functions.
2. Scale function replicas. 
3. Invoke a function.
4. Query health, metrics, and scaling status of functions.
5. Create, list and delete secrets
6. View logs from functions.
7. Queue-up asynchronous requests.

- Three ways of interactin with the REST API tend to be: 
1. Using CLI (faas-cli)
2. Using the built-in UI
3. Via rest API directly from application or via cURL.

----

- **Events, Triggers and Invocations**: All communication within OpenFaaS happens over HTTP using rest. It is poweful when coupled with events and triggers. 

- A trigger is a way to invoke a function, with a simple HTTP call being the simplest option. Most OpenFaaS are built with the connector-sdk, open source add-on that lets developers write connectors between an even source and functions.

- Triggers include: 
1. Apache Kafka- pub/sub system used by enterprise companies.
2. cron- time-based invocation
3. SQS- trigger via AWS SQS
4. NATS- a high-speed messaging CNCF project
5. Minio- an open source S3 replacement and object store
6. RabbitMQ- traditional message queue
7. MQTT- pub/sub system ofter used with IOT devices. 


----
