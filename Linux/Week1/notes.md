# Heading 1

## Heading 2

### Heading 3

#### Heading 4

##### Heading 5

###### Heading 6

It copies the html rules for headings. Two spaces is like <_br_> from html

# Test Heading 1

Some text

## Subheading 1

More text

---

How to bold text add \*\* or double underscore:

**bold**- prefferd method

**bold2**

How to make text italic use 1 asterics:

_Italic example_

It can be also used with 1 underscore on both sides.

If you want the text to be both bold AND Italic- 3 \*

**_Example of both_**

~~crossed off~~

==highlight== / extended feature of makrdown and its not supported by github. So we can use the mark html element
<mark>highlight</mark>.

Also superscript and subscript will ot work so we need to used the html tags:

This is a <sup>superscript</sup>

X<sup>2</sup>

This is a <sub>subsctipt</sub>

H<sub>2</sub>O

Emojis- it will not work

:smile:

How to show code

`code` - shows code on 1 line

```
let x = 1;
let y = 5;
```

By surrounding them with 3 (```) It preservves the indentation. you can even label it with the language that you use so it will be rendered in the syntax according.

how do you create a link? [this is a link ] + ()
in the parenthesis you put the link that you want to lead to.

[example link](https://google.com)

you can also use <https://google.com>

Images have the same syntax but we need to place ! before the parenthesis+ bracket structure.

Example: ! + [ ] + () = ![]()
in the square brackets you can use the alt text
in the parethesis you can place the png/webp/jpeg format. OR uRL that points to an image.

Block quote >

> This is a start of a block quote
>
> > nested quote

Horizontal rule:

---

---

---

space + dash/underscore/star - surrounded by empty space in order to divide it.

Lists is marked with
Ordered list :

1. Item 1
2. Item 2
3. Item 3

Unordered list \* /+ / -

- item 1
- item 2

* item 3

- item 4

* item 5

To nest them you need to use TAB

- item 1
  - item 1.1

You can also make ordered list inside unordered .

Table from github:

| Col 1 | Col 2   |
| ----- | ------- |
| This  | is      |
| an    | example |
| table | with    |
| two   | columns |

Checkboxes:

- [ ] unchecked box

- [x] checked

# LFS 101 Linux Foundation

## Week 1

### Chapters 1-7

### Chapter 1

#### Course Introduction

- Brief introduction to the course.

### Chapter 2

#### The Linux Foundation

- Linux foundation introduction and overview. Information provided for Linux Foundation Events and Education.

- Linux foundation is the umbrella organization for many critical open source projects that power, corporations, spanning all industry sectors. Its work today extends far beyond Linux, fostering innovation at every layer of the software stack.

- Linux foundation training is for the community and by the community. Linux training is disribution-flexible, technically advanced, and created with the leader of Linux development community.

- There are three major distribution families within Linux: Red hat, SUSE and Debian.

### Chapter 3

### Linux Philosophy and Concepts

#### Linux History

- Linux is open source computer operating system, initially developed on and for Intel x86-based PCs. Created by Linus Torvalds in Helsinki, Finland in 1991. From a project to write his own operating system kernel. In 1992, Linux was re-licensed usingthe General Public License (GPL) by GNU (project of the FSF- free software Foundation). In 1998, IBM and Oracle announced their support for it.

#### Linux Philosophy

- Linux borrows heavily from the well-established Unix operating systems. Files are stored in a hierarchial filesystem, with the nop node of the system being the **root** of simply "/". Linux makes its components available via files or object that look like files. Devices, processes and network sockets are representented by file-like objects and can often be worked with using the same utilities for regular files. Linu is fully miltitasking (i.e., multiple threads of execution are performed symiltaneously), multiuser operating system with built-in networking and service processes knows as deamons in the Unix world.

#### Linux Terminology:

1. **Kernel**: the brain of the operating system. Glue between hardware and applications.
2. **Distribution**: Collection of software making up a Linux-based OS.(RHEL, Fedora, Ubuntu).
3. **Boot loader**: program that boots the operating systeam (GRUB, ISOLINUX).

4. **Service**: Program that runs as a backgroud process.(httpd, nfsd, ntpd, ftpd, named).

5. **Filesystem**: Method for storing and organizing files (ext3, ext4, FAT, XFS, XFS, NTFS, Btrfs).

6. **X Window System**: Provides the standart toolkit and protocol to build GUI on nearly all Linux systems.

7. **Desktop Environment**: Graphical user interface on top of the operating system. (GNOME, KDE, Xfce, Fluxbox).

8. **CommandLine**: Interface for typing commands on top of the operating system.

9. **Shell**: Command line interpreter that interprets the command line input and instructs the operating system to perform any necessary tasks and commands. (bash, tsch, zsh).

### Chapter 4

### Linux Basics And System Startup

#### Boot Process

- Linux boot process is the procedute of initializing the system. It consists of everything that happens from the switching ON of the power to fully operational user interface.

**List of processes of the boot process**:

![](https://d36ai2hkxl16us.cloudfront.net/thoughtindustries/image/upload/a_exif,c_fill,w_400/v1/course-uploads/e0df7fbf-a057-42af-8a1f-590912be5460/9ar15losorzh-TheBootProcess.png)

---

**BIOS**: (focusing mainly on x86 family). When the PC is powered on, the Basic Input/Output System (BIOS) utilizes the hardware and tests the main memory. The process is called _POST_ (Power On Selt Test). The Bios software is stored on a read-only memory(ROM) chip on the motherboard. After this the remainder of the boot process is controlled by the OS.

**BIOS PROCESS DIAGRAM**

![](https://d36ai2hkxl16us.cloudfront.net/thoughtindustries/image/upload/a_exif,c_fill,w_400/v1/course-uploads/e0df7fbf-a057-42af-8a1f-590912be5460/orte9udfxh4n-asset-v1_LinuxFoundationXLFS101x1T2023typeassetblockLFS101x_2023_CourseImages_1-5_Image_9.png)

---

**MASTER BOOT RECORD (MBR), EFI Partition, and Boot Loader**

- Upon complition of POST, system control passes from BIOS -> **boot loader**. The boot loader is sually stored on of the system's storage devices (HDD, SSD) in ehter the boot sector or the EFI partition (Extensible Firmware Interface). Up to this stage the machine does not access any mass storage media. Information is loaded from **CMOS** values.

- Most common boot loaders are GRUB( Grand Unified Boot loader), ISOLINUX (removable media), and DAS U-boot(for booting on embeded devices/appliances). When booting the boot loader is responsible for loading the kernel image and the initial RAM dis or filesystem into memory.

- Systems using the BIOS/MBR method, the boot loader resides at the first sector of the HDD, also known as the Master Boot Record. Size of 512 bytes, starting the boot loader examines the partititon table and finds bootable partition. After its found searches for secont stage boot loader (GRUB) and loads into RAM.

- Systems using EFI/UEFI, UEFI reads Boot Manager data to determine which UEFI application is to be launched and from where. Firmware launches UEFI application, for example GRUB, as defined in the boot entry in the firmware's boot manager. Second stage boot loader resited under **/boot**. Splash screen is displayed with option for a choice between OS / and/or kernel to boot. After selection, boot loader loads the kerned of the OS into RAM and passes control over it. Kernels are always compressed so the first order of operations is to uncompress themselves. After this will check and analyze any hardware device built into kernel.

---

**KERNEL**

- The boot loader loads both the _kernel_ and an initial RAM-based file system (_initramfs_) into memory, so it can be used directly by the kernel.

- Upon loading in RAM, the kerner immediately unitializes and confugures the computer's memory and all the hardware attached to the system. All processors, I/O subsystems, storage decives and necessary user space appliactions.

![](https://d36ai2hkxl16us.cloudfront.net/thoughtindustries/image/upload/a_exif,c_fill,w_400/v1/course-uploads/e0df7fbf-a057-42af-8a1f-590912be5460/uhozrmi9v8vc-l.kernel.png)

---

**THE INITIAL RAM DISK (initramfs)**

- The _initramfs_ filesystem image contains programs and binary files that perform all actions needed to mountthe proper root filesystem, including providing the kernel functionality required for the specific filesystem that will be used. Also loading the device drivers and mass storage controllers, by taking advantage of the **udev** system (user device), which is reponsible for figuring out which devices are present, locating device drivers and loading them. After root filesystem is found, its checked for errors and mounted.

- The _mount_ program instructs the operating system that a filesystem is ready for use and associates it with a particular point in the overall hierarchy of the filesystem (_mount point_). If its successful the initramfs is cleared from RAM and the _init_ program is on the root filesystem (**/sbin/init**) is executed. init handles the mounding and pivoting over the final real root filesystem. If special hardware drivers are needed before the mass storage can be accessed, they must be in the initramfs image.

---

**TEXT-MODE LOGIN**

- At the end of the boot process, _init_ starts a number of text-mode prompts. They enable usage of username and password and later command shell access.

![](https://d36ai2hkxl16us.cloudfront.net/thoughtindustries/image/upload/a_exif,c_fill,w_400/v1/course-uploads/e0df7fbf-a057-42af-8a1f-590912be5460/t4bzq5q8a3at-tml.png)

---

**sbin/init and Services**
