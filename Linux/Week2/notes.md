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

## Week 2

### Chapters 8-14

---

#### Chapter 8: Command-Line Operations

- Introduction to the Command Line.
- Advantages of the command line tools:

1.  No GUI overhead is incurred.
2.  Every task can be accomplished in the CLI
3.  Easy implementation of scripts.
4.  You can sign into remote machines anywhere on the Internet.
5.  Initiation of graphical applications directly from the command line
6.  Graphical tools may change appearance, while CLI does not\*

- **Terminal emulator** emulates a standalone terminal within a window of the desktop. It behaves like pure text terminal. Types of terminals include- gnome-terminal, xterm, konsole.

- To open easily terminal in GNOME quickest way is Applications > System Tools > Terminal or Applications > Utilities > Terminal.

- On most GNOME-based distributions, you can always open a terminal by right-clicking anywhere on the desktop background and selecting Open in Terminal. If this does not work, you may need to install and activate the appropriate package, usually called gnome-shell-extension-apps-menu.

  You can also hit Alt-F2 and type gnome-terminal.

---

**Basic Utilities**

- **cat** : used to type out a file (or combine files)
- **head** : used to show the first few lines of a file
- **tail** : used to show the last few lines of a line
- **man** : used to view documentation

**Basic Elements**

Most input lines entered at the shell prompt have three basic elements:

- **Command**
- **Options**
- **Arguments**

The command is the name of the program or script you are executing. It may be followed by one or more options (or switches) that modify what the command may do. Options usually start with one or two dashes, for example, **-p** or **--print**, in order to differentiate them from arguments, which represent what the command operates on.

---

**sudo**

- When a user is configured with **sudo** capabilities, it means its provided with administrative(admin) privileges. **sudo** allows users to run programs using the security privileges of another
  user, generally root.

- Steps for settin up and running sudo:
  - If not enabled , Open CLI > type **su** > press Enter > provide root password >Enter > (if nothing is printed, its by design for security measures) > After that the prompt changes to **#**
  ```
  $ su Passowrd:
  #
  ```
  After that creation of a configuration file to enable the user account to use sudo. This file is created in **/ect/sudoers.d/**
  if you have username **student** it would look like this
  ```
  # echo "student ALL = (ALL) ALL" > /etc/sudoers.d/student
  ```
  Some Linux distributions will 'complain' if you do not also change permissions on the file by doing:
  ```
  # chmod 444
  /etc/sudoers.d/student
  ```
- When using sudo, by default you will be prompted to give a password (your own user password) at least the first time you do it within a specified time interval. It is possible (though very insecure) to configure sudo to not require a password or change the time window in which the password does not have to be repeated with every sudo command.

---

- Switching Between the GUI and the command line. In nature Linux is highly customizable, it will allow you to drop the graphical interface (temporary or permanently).
- Most Linux distributions give an option during installation (or have more than one version of the install media) to choose between a desktop or workstation (with a graphical user interface) or server (usually without one).

- Linux production servers are usually installed without the GUI, and even if it is installed, usually do not launch it during system startup. Removing the graphical interface from a production server can be very helpful in maintaining a lean system, which can be easier to support and keep secure.

---

**Virtual Terminals**

- **Virtual Terminals** (VT) are console sessions that use the entire display and keyboard outside of a graphical enviourment.
- Such terminals are considered "virtual" because, although there can be multiple active terminals, only one terminal remains visible at a time. A VT is not the same as a command line terminal window; you can have many of those visible simultaneously on a graphical desktop.

- One virtual terminal (usually VT 1 or VT 7) is reserved for the graphical environment, and text logins are enabled on the unused VTs.

- To switch between VTs, press CTRL-ALT-function key for the VT. For example, press CTRL-ALT-F6 for VT 6. Actually, you only have to press the ALT-F6 key combination if you are in a VT and want to switch to another VT.

![](images/virtualterm.png)

**Turning Off the Graphical Desktop**

- Linux distributions can start and stop the graphical desktop in various ways. The exact method differs among distributions and between versions. For the newer system-based distributions, the display manager is run as a service, and you can stop the GUI desktop with the systemctl utility. In addition, most distributions will also work with the telinit command, as in:

  $ sudo systemctl stop gdm (or sudo telinit 3)

  and restart it (after logging into the console) with:

  $ sudo systemctl start gdm (or sudo telinit 5)

---

**Basic Operations**

- **Logging In and Out**
  Once your session is started (either by logging into a text terminal or via a graphical terminal program), you can also connect and log into remote systems by using Secure SHell (SSH). For example, by typing ssh student@remote-server.com, SSH would connect securely to the remote machine (remote-server.com) and give student a command line terminal window, using either a password (as with regular logins) or cryptographic key to sign in without providing a password to verify the identity.

---

- **Rebooting and Shutting Down**
  The preferred method to shut down or reboot the system is to use the shutdown command. This sends a warning message, and then prevents further users from logging in. The init process will then control shutting down or rebooting the system. It is important to always shut down properly; failure to do so can result in damage to the system and/or loss of data.

  When administering a multi-user system, you have the option of notifying all users prior to shutdown, as in:

```
$ sudo shutdown -h 10:00 "Shutting down for scheduled maintenance."
```

---

**Locating Applications**

One way to locate programs is to employ the **which** utility

```
$ which diff
```

If which does not find the program,where is a good alternative because it looks for packages in a broader range.

```
$ whereis diff
```

---

**Accessing Directories**

- When you first log into a system or open a terminal, the default directory should be your home directory. You can see the exact location by typing echo $HOME.

| Command        | Result                                          |
| -------------- | ----------------------------------------------- |
| **pwd**        | Displays the present working directory          |
| **cd** or cd ~ | Change to yourr home directory, ~(tilde)        |
| **cd** ..      | Change to parent directory (..)                 |
| **cd** -       | Change to previous working directory, (- minus) |

---

**Understanding Absolute and Relative Paths**

**Absolute pathname method**

- Absolute paths always start with /.

```
$ cd /usr/bin
```

**Relative pathname method**

- A relative pathname starts from the present working directory. Relative paths never start with /.

```
$ cd ../../usr/bin
```

**Example of path hierarchy**

![](images/t4oojwkxnuix-LFS101x_2023_CourseImages-05.png)
