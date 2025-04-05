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

---

**Exploring the Filesystem**

- Using the tree command is a good way to get a higher view of the filesystem. You can use **tree -d** to view just the directories and to suppress listing file names.

**Hard Links**

- The **ln** utility is used to create hard links and with the -s option, soft links. also known as symbolic links or symlinks.

```
$ ln file1 file2

$ ls -li file1 file2
```

- Hard links are very useful and they save space, but you have to be careful with their use, sometimes in subtle ways. For one thing, if you remove either file1 or file2 in the example, the inode object (and the remaining file name) will remain, which might be undesirable, as it may lead to subtle errors later if you recreate a file of that name.

**Soft (Symbolic) Links**

- They are created with the -s option:

```
$ ln -s file1 file3

$ ls -li file1 file3
```

- Symbolic links take no extra space on the filesystem (unless their names are very long). They are extremely convenient, as they can easily be modified to point to different places. An easy way to create a shortcut from your home directory to long pathnames is to create a symbolic link.

- Unlike hard links, soft links can point to objects even on different filesystems, partitions, and/or disks and other media, which may or may not be currently available or even exist. In the case where the link does not point to a currently available or existing object, you obtain a dangling link.

---

**Directory History Navigation**

- **cd** command remembers where you were last, and lets you get back there with cd -.
- **pushd** - can be used to change directory as well but remembers more than the last visited directory. It pushes your starting directory onto a list.
- **popd** - will send you back to those directories **IN REVERSE ORDER** Most recent directory will be the first one retrieved with popd.
- **dirs** - displays the list of directories.

---

**Working with files**

| **Command** | **USAGE**                                                                                                                                                                                                                                                                                        |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **cat**     | Used for viewing files that are not very long; it does not provide any scroll-back                                                                                                                                                                                                               |
| **tac**     | Used to look at the file backwards,starting with the last line.                                                                                                                                                                                                                                  |
| **less**    | Used to view larger files because it is a paging progam. It pauses at each screen full of text, provides scroll-back capabilities and lets you search and nagigate within the file **!NB** Use / to search for a pattern in the forward direction and ? for a pattern in the backward direction. |
| **tail**    | Used to print the last 10 lines of a file by defailt. You can change the number of lines by doing -n 15 or just -15 if you wanted to look at the last 15 lines instead of the default.                                                                                                           |
| **head**    | The opposite of tail, by default, it prints the first 10 lines of a file.                                                                                                                                                                                                                        |

---

**touch** - is often used to set or update the access, change and modify times of files. It resets file's timestamp to match the current time.

- You can also create an empty file using **touch**

```
$ touch <filename>
```

It creates empty file as a placeholder for a later purpose.

- touch also provides several useful options **-t** option allows you to set the date and timestamp of the file to a specific value.

```
$ touch -t 12091600 myfile
```

This sets the **myfile**'s timestamp to 4 p.m. Dec 9th (12 09 1600)

---

**mkdir and rmdir**

- mkdir is used to create a directory:

```
mkdir sampdir
```

It creates a sample directory named sampdir under the current directory

```
mkdir /usr/sampdir
```

It creates a sample directory called sampdir under /usr

**rmdir** - used to remove a directory. The directory must be empty or the command will fail. To remove a directory and all of its contents you have to do **rm -rf**.

**Moving, Renaming or Removing a file**

- **mv** does two things: rename a file, move file to another location while possibly changing its name at the same time.

- when removing a file its a good practice to run it with interactive prompt ( **rm -i**)

| **Command** | **Usage**                   |
| ----------- | --------------------------- |
| **mv**      | Rename a file               |
| **rm**      | Remove a file               |
| **rm -f**   | Forcefully remove a file    |
| **rm -i**   | Interactively remove a file |

---

**Renaming or Removing a Directory**

**rmdir** works only empty directories, otherwise there will be an error

**rm -rf** its an easy way to remove a whole filesystem tree recursively. TO BE USED WITH CAUTION!

| **Command** | **Usage**                                 |
| ----------- | ----------------------------------------- |
| **mv**      | Rename a directory                        |
| **rmdir**   | Remove an empty directory                 |
| **rm -f**   | Forcefully remove a directory recursively |

---

**Modifying the Command Line Prompt**

- The PS1 variable is the character string that is displayed as the prompt on the command line. Most distributions set PS1 to a known default value, which is suitable in most cases. However, users may want custom information to show on the command line. For example, some system administrators require the user and the host system name to show up on the command line as in:

```
student@r9 $
```

The prompt above could be implemented by setting the PS1 variable to: **\u@\h \$**.

For example:

```
$ echo $PS1
\$
$ PS1="\u@\h \$ "
student@r9 $ echo $PS1
\u@\h \$
student@r9 $
```

- By convention, most systems are set up so that the root user has a pound sign (**#**) as their prompt.

---

### File Search

---

#### Standard File Streams

- When commands are executed, by default there are three standard file streams (or descriptors) always open for use: standard input (standard in or **stdin**), standard output (standard out or **stdout**) and standard error (or **stderr**).

- Usually, stdin is your keyboard, and stdout and stderr are printed on your terminal. stderr is often redirected to an error logging file, while stdin is supplied by directing input to come from a file or from the output of a previous command through a pipe. stdout is also often redirected into a file. Since stderr is where error messages (and warning) are written, usually nothing will go there.

- In Linux, all open files are represented internally by what are called file descriptors. Simply put, these are represented by numbers starting at zero. stdin is file descriptor 0, stdout is file descriptor 1, and stderr is file descriptor 2. Typically, if other files are opened in addition to these three, which are opened by default, they will start at file descriptor 3 and increase from there.

---

**I/O Redirection**

- Through the command shell, we can redirect the three standard file streams so that we can get input from either a file or another command, instead of from our keyboard, and we can write output and errors to files or use them to provide input for subsequent commands.

- For example, if we have a program called do_something that reads from stdin and writes to stdout and stderr, we can change its input source by using the less-than sign (<) followed by the name of the file to be consumed for input data:

```
$ do_something < input-file
```

If you want to send the output to a file, use the greater-than sign (>) as in:

```
$ do_something > output-file

```

you can do both at the same time as in:

```
$ do_something < input-file > output-file
```

Because stderr is not the same as stdout, error messages will still be seen on the terminal windows in the above example.

If you want to redirect stderr to a separate file, you use stderr’s file descriptor number (2), the greater-than sign (>), followed by the name of the file you want to receive everything the running command writes to stderr:

```
$ do_something 2> error-file
```

NOTE: By the same logic, do_something 1> output-file is the same as do_something > output-file.

A special shorthand notation can send anything written to file descriptor 2 (stderr) to the same place as file descriptor 1 (stdout): 2>&1.

```
$ do_something > all-output-file 2>&1
```

bash permits an easier syntax for the above:

```
$ do_something >& all-output-file
```

---

**PIPES**

- The UNIX/Linux philosophy is to have many simple and short programs (or commands) cooperate together to produce quite complex results, rather than have one complex program with many possible options and modes of operation. In order to accomplish this, extensive use of pipes is made. You can pipe the output of one command or program into another as its input.

In order to do this, we use the vertical-bar, pipe symbol (|), between commands as in:

```
$ command1 | command2 | command3
```

- This is extraordinarily efficient because **command2** and **command3** do not have to wait for the previous pipeline commands to complete before they can begin processing at the data in their input streams; on multiple CPU or core systems, the available computing power is much better utilized and things get done quicker.

- Furthermore, there is no need to save output in (temporary) files between the stages in the pipeline, which saves disk space and reduces reading and writing from disk.

---

**File Search**

- **Main Commands:**

  1.**locate**

  2.**find**

**locate**

- **locate** utility program performs a search while taking advantage of a previously constructed database of files and directories on your system, matching all entries that contain a specified character string.

- To avoid long lists, we can use **grep** as a filter. **grep** will print only the lines that contain one or more specified strings.

```
$ locate zip | grep bin
```

- This will list all the files and directories with both zip and bin in their name.

- **locate** utilizes a database created by a related utility, **updatedb**. Most Linux systems run this automatically once a day. However, you can update it at any time by just running **updatedb** from the command line as the root user.

---

**Wildcards and Matching Filenames**

- Wildcard can allow you to search for specific characters.

| **Wildcard** | **Matches**                                                                                             |
| ------------ | ------------------------------------------------------------------------------------------------------- |
| **?**        | Matches any single character                                                                            |
| \*           | Matches any string of characters                                                                        |
| **[set]**    | Matches any character in the set of characters, for ex **[adf]** will match any occurrence of a,d, or f |
| **[!set]**   | Matches any character not in the set of characters                                                      |

- To search for files using the ? wildcard, replace each unknown character with ?. For example, if you know only the first two letters are 'ba' of a three-letter filename with an extension of .out, type ls ba?.out.

- To search for files using the _ wildcard, replace the unknown string with _. For example, if you remember only that the extension was .out, type ls \*.out.
