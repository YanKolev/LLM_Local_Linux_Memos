## Linux Unhatched

### Chapter 1 + 2 

What is Linux?

- Before we determine what makes Linux such a great asset to your skill-set, let’s define it first. Linux is operating system software that runs on a hardware computer system. An operating system is software that allows other programs like word processors and web browsers to be installed and run on a computer.

- Different commands:
  - the **ls** command displays a listing of information about files.
  - command [options…] [arguments…] is the syntax.
  -

- An argument can be used to specify something for the command to act upon. Example: if we put a name of a directory as a argument for ls, it will list the contents of the directory. (Directory as an argument)
  

- Options can be used to alter the behavior of a command. On the previous page, the ls command was used to list the contents of a directory. In the following example, the -l option is provided to the ls command, which results in a "long display" output, meaning the output gives more information about each of the files listed:

```
ls -l - long display
```

- Often the character is chosen to be mnemonic for its purpose, like choosing the letter l for long or r for reverse. By default, the ls command prints the results in alphabetical order, so adding the -r option will print the results in reverse alphabetical order.

```
ls -r - reverse
```

- Multiple options can be used at once, either given as separate options as in -l -r or combined like -lr. The output of all of these examples would be the same:

```
ls -l -r
ls -rl
ls -lr
```
---

- we can use the aptitude command to understand alteration of the behaviour of its command options
  
```
-v can be used for verbose

aptitude -vv moo
aptiture -vvv moo
```

### Chapter 3 

- **PWD**: Printing working directory. Its used to discover where you are currently within the filesystem. 

```
pwd [OPTIONS]
```

- virtual machines employ a prompt that displays the current working directory, emphasized with the color blue.

### Chapter 4 

- **CD**: Changing Directories. Useful way to move around the directory tree. 
```
cd [options] [path]
```

- Directories are equivalent to folders on Windows and Mac OS. Like these more popular operating systems, a Linux directory structure has a top level. It is not called "My Computer", but rather the root directory and it is represented by the / character. To move to the root directory, use the / character as the argument to the cd command.

---

- There are two types of paths: absolute and relative. Absolute paths start at the root of the filesystem, relative paths start from your current location.

- Shortcut **..**- Regardless of which directory you are in, DOTS, always represent One directory higher relative to the current one. (or the parent one).

- Shortcut **.**- represents you current directory. 
- Shortcut **~**- home directory of the current user. 

---

Upto chapter 5