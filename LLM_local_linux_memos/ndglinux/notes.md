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

### Chapter 5

---

- Listing files. ls is also used to list the contents of a directory. 
  ```
  ls [Options] [file]
  ```
- if you combine with -l flag you can see permissions ownership or timestamps.
- Each line printed will correspond to a file contained within the directory. info can be broken down into fields separated by spaces. Fields are as: 

![](images/Unhatched/filetype.png)

- There are also: Permissions, user owner, group owner and filesize. 

![](images/Unhatched/filetype2.png)

- As well as timestap, filena and symbolic links.
![](images/Unhatched/symbollinks.png)

---

- File Sorting: ls by DEFAULT outputs sorted files alpahabetically. It can also sort by other methods. 

```
-t will sort the files by timestamp (ls -lt)
-S will sort the files by size (ls -l -S)
-r will reverse the order of any type of sort. (ls -lSr)
```

---
### Chapter 6
---
- Administrative Access. Preventing regular user from executing these command helps protect the system. 

- **su** command: 

```
su OPTIONS USERNAME
```

- su command allows you to temporarily act as a different user. it does this by creating a new shell. the shell is simply a text imput console that lets you type commands. 

- Utilizing the shell option is recommended as the login shell fully configures the new shell with the setting of the new user 
  
```
su - 
su -l 
su --login
- exit - to exint 
```
- for su command, password is required. 

---

- **sudo** command:
  
```
sudo [OPTIONS] COMMAND
```

- sudo allows user to execute a command as another use without creating a new shell. instead to execute a command with administrative privileges, use it as an argument to to the sudo command. 
  
- Like su, sudo commands assumes by default the root user arround should be used to execute commands. 
  
- sudo can be used to swtich to other user accounts as well. To specify a different user account we can use the -u option. 
- 
---

### Chapter 7

---

- Permissions- they determine the ways different user can interacti with a file or directory. 

![](images/Unhatched/filepermissions.png)

- there are also different kind of Permission types. Read, Write and execute. 

![](images/Unhatched/permissiontypes.png)

---

### Chapter 8

---

- Changing File permissions. **chmod** command is used to change the permissions of a file directory. Only the root user or the use who owns the file is able to change the permissions of a file. 

- chmod is named after modes of access, so > chmod = CHange the MODes of access. 

- There are two types of techniques for changing permissions with the **chmod** command. symbolic and octal. 

- symbolic- good for changing one se of permissions at a time. 

- octal- or numeric requires knowled of the octal value of each of the permissions and requires all three set of permissions (user, group, other) to be specified every time. 

---

- Symbolic method. 

```
chmod [<SET><ACTION><PERMISSIONS>]... FILE

# To use the symbolic method of chmod first indicate which set of permissions is being changed. 
```
- <**SET**> symbols table: 
![](images/Unhatched/symbolicmethodset.png)

- <**ACTION**> symbols table:
![](images/Unhatched/symbolicmethodaction.png)

- <**PERMISSIONS**> sumbols table:
![](images/Unhatched/symbolicmethodpermissions.png)

- After that a space and the pathnames for the file to assign those permissions. 

- example:
```
# START
-rw-r--r-- 1 sysadmin sysadmin 647 Dec 20  2017 hello.sh 

#ADDING CHMOD

chmod u+x hello.sh
# u= user owner permission set
# += character to indicate a permission is being added
# x = execute permissions


# AFTER CHMOD 
-rwxr--r-- 1 sysadmin sysadmin 647 Dec 20  2017 hello.sh 

# to run it we need **./** = command should be run from the current directory.

```
