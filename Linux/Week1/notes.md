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
