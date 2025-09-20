# LPI Linux Essentials
---

## Chapters

---

### Chapter 1 - Introduction to Linix

---

- Introduction to Linux. Linus originally named the project Freax, however, an administrator of the server where the development files were uploaded renamed it Linux, a portmanteau of Linus’ name and UNIX. The name stuck.

- GNU is a recursive acronym for “GNU’s Not Unix,” and it’s pronounced just like the African horned antelope that is its namesake.

- Linux started in 1991 as a hobby project of Linus Torvalds, a Finnish-born computer scientist studying at the University of Helsinki. Frustrated by the licensing of MINIX, a UNIX-like operating system designed for educational use, and its creator’s desire not to make it a full operating system, Linus decided to create his own OS kernel.

- From this humble beginning, Linux has grown to be the dominant operating system on the Internet, and arguably the most important computer program of any kind. Despite adopting all the requirements of the UNIX specification, Linux has not been certified, so Linux really isn’t UNIX! It’s just… UNIX-like.

- Prior to and alongside this development was the GNU Project, created by Richard Stallman in 1983. 

- Linux is Open Source: The source code may be written in any of hundreds of different languages. Linux happens to be written in C, a versatile and relatively easy language to learn, which shares history with the original UNIX. This decision, made long before it’s utility was proven, turned out to be crucial in its nearly universal adoption as the primary operating system for internet servers.

- People that say their computer runs Linux usually refer to the kernel, tools, and suite of applications that come bundled together in what is referred to as a distribution.
  
----

### Chapter 2 - Operating Systems. 

---



- An operating system is software that runs on a computing device and manages the hardware and software components that make up a functional computing system.

![](images/Essentials/osdiagram.png)


- Decision Points for choosing an OS: 
1. Role
2. Function
3. Life Cycle
4. Stability
5. Compatibility
6. Cost
7. Interface
   
---


### Chaper 3 - Working in Linux

----

- Using Linux everyday will increase the "fluency" with it.
  
- Applications need only follow the kernel’s Application Programming Interface (API) and therefore don’t have to worry about the implementation details. Each application behaves as if it has a large block of memory on the system; the kernel maintains this illusion by remapping smaller blocks of memory, sharing blocks of memory with other applications, or even swapping out untouched blocks to disk.
  
-  kernel also handles the switching of applications, a process known as multitasking. A computer system has a small number of central processing units (CPUs) and a finite amount of memory. The kernel takes care of unloading one task and loading a new one if there is more demand than resources available. When one task has run for a specified amount of time, the CPU pauses it so that another may run.

---

- There are 3 major categories for linux software: 
1. **Server Applications**: Software that has no direct interaction with the monitor and keyboard of the machine it runs on. Its purpose is to serve information to other computers, called clients. Sometimes server applications may not talk to other computers but only sit there and crunch data.
2. **Desktop Applications**: Web browsers, text editors, music players, or other applications with which users interact directly. In many cases, such as a web browser, the application is talking to a server on the other end and interpreting the data. This is the “client” side of a client/server application.
3. **Tools**: A loose category of software that exists to make it easier to manage computer systems. Tools can help configure displays, provide a Linux shell that users type commands into, or even more sophisticated tools, called compilers, that convert source code to application programs that the computer can execute.


---


- Early usage was for web-servers. Viewed by a web browser using HTTP/ HTTPS (Hypertext Transfer Protocol + Secured). 
- Then webpages could be static or dynamic. Web Browser requests a static page > web servers sends the file as it apears on the disk. Dynamic page: web server  > sends the request > to an application > application generates content. 

- Use inn private clouds: ownCloud / Nextcloud use it under the GNU AGPLv3 license. 

---

- Usage as Database Server: Database server applications form the backbone of most online services. Dynamic web applications pull data from and write data to these applications. For example, a web program for tracking online students might consist of a front-end server that presents a web form. When data is entered into the form, it is written to a database application such as MariaDB. When instructors need to access student information, the web application queries the database and returns the results through the web application.

- MariaDB is a community-developed fork of the MySQL relational database management system. It is just one of many database servers used for web development as different requirements dictate the best application for the required tasks.

- A database stores information and also allows for easy retrieval and querying. Some other popular databases are Firebird and PostgreSQL. You might enter raw sales figures into the database and then use a language called Structured Query Language (SQL) to aggregate sales by product and date to produce a report.


----

- Email Servers. 3 different tasks required to get email between people: 

1. **Mail Transfer Agent (MTA)** .The most well known MTA (software that is used to transfer electronic messages to other systems) is Sendmail. Postfix is another popular one and aims to be simpler and more secure than Sendmail.

2. **Mail Delivery Agent (MDA)**. Also called the Local Delivery Agent, it takes care of storing the email in the user’s mailbox. Usually invoked from the final MTA in the chain.

3. **POP/IMAP Server**. The Post Office Protocol (POP) and Internet Message Access Protocol (IMAP) are two communication protocols that let an email client running on your computer talk to a remote server to pick up the email.

- Dovecot is a popular POP/IMAP server owing to its ease of use and low maintenance. Cyrus IMAP is another option. Some POP/IMAP servers implement their own mail database format for performance and include the MDA if the custom database is desired. People using standard file formats (such as all the emails in one text file) can choose any MDA.

---

- **File Sharing**:  for Windows centric file sharing-**Samba**. Allows linux machine to behave like a windows machine so it can share files and participate in awindows domain. 

- **Netatalk project**: allows a linux machine to perform as a Apple Macintosh file server. Based on NFS- network File system. 

- **DNS**- Domain name system, oldest network directory systems. Convers IP to a unique identifier of a computer on the internet. Holds global information like the address of the MTA for a given domain name. 


- DNS is focused mainly on computer names and IP addresses. **LDAP**- Lightweight Directory Access Protocols is common directory system which powers Microsoft Active Directory. IN LDAP, an object is sotred in a tree and the position of that object on the tree can be used to rerive information about the object and what it stores. OpenLDAP is dominant program used in Linux Infra. 

- **Dynamic Host Configuration Protocl (DHCP)**- When a computer boots up, it needs an IP address for the local network so it can be uniquely identified. DHCP's job is to **listen for requrest and assign a free address from the DHCP pool**. ISC DHCP-is the most common open source DHCP server. 

---

- **Package management**: 

1. The Debian distribution, and its derivatives such as Ubuntu and Mint, use the Debian package management system. At the heart of Debian package management are software packages that are distributed as files ending in the .deb extension.

- The lowest-level tool for managing these files is the dpkg command. This command can be tricky for novice Linux users, so the Advanced Package Tool, apt-get (a front-end program to the dpkg tool), makes management of packages easier. Additional command line tools which serve as front-ends to dpkg include aptitude and GUI front-ends like Synaptic and Software Center.

2. RPM package management: RPM makes use of an .rpm file for each software package. This system is what distributions derived from Red Hat, including Centos and Fedora, use to manage software. Several other distributions that are not Red Hat derived, such as SUSE, OpenSUSE, and Arch, also use RPM.

- ‌⁠​​⁠​ Like the Debian system, RPM Package Management systems track dependencies between packages. Tracking dependencies ensures that when a package is installed, the system also installs any packages needed by that package to function correctly. Dependencies also ensure that software updates and removals are performed properly.

- The back-end tool most commonly used for RPM Package Management is the rpm command. While the rpm command can install, update, query and remove packages, the command line front-end tools such as yum and up2date automate the process of resolving dependency issues.

---

- **Security**

1. Cookies: As you browse the web, a web server can send back the cookie, which is a small piece of text, along with the web page. Your browser stores this information and sends it back with every request to the same site. Cookies are normally only sent back to the site they originated from, so a cookie from example.com wouldn’t be sent to example.org.

- However, many sites have embedded scripts that come from third parties, such as a banner advertisement or Google analytics pixel. If both example.com and example.org have a tracking pixel, such as one from an advertiser, then that same cookie will be sent when browsing both sites. The advertiser then knows that you have visited both example.com and example.org.

- With a broad enough reach, such as placement on social network sites with “Like” buttons and such, a website can gain an understanding of which websites you frequent and figure out your interests and demographics.

2. Passwords: Do not share them! Use 2fa, password manager. Division of access (root and admin) or RBAC.

----

