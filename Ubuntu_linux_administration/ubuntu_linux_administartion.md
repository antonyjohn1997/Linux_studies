## Ubuntu Linux  Administration 

 

git clone https://github.com/theurbanpenguin/lfcs 

 

Cd lfcs 

Cd all-courses 

Ls  

Ubuntu.yml   Vagrantfile 

 

A Vagrantfile is a configuration file used by Vagrant, a tool for managing virtual machine environments. The Vagrantfile is written in Ruby and defines the configuration and provisioning details for the virtual machines (VMs) that Vagrant creates. 

sudo apt install vagrant 

Vagrant box update  

Vagrant up 

Vagrant ssh ubuntu1  

We connected to ubuntu 1 server  

 

What is Vagrant? 

Vagrant is a tool that helps you create and manage virtual machines (VMs) quickly and easily. It’s like a helper that makes it simple to create a working "computer" inside your real computer. 

    Why Use Vagrant? 

    To test software or projects in isolated environments (so it doesn’t affect your main computer). 

    To ensure consistency across team members or different systems. 

 

What is a Virtual Machine (VM)? 

A virtual machine is like a "computer inside your computer." 

    It has its own operating system (e.g., Ubuntu, Windows). 

    It runs separately, so even if you mess something up, it doesn’t affect your main computer. 

 

How Does Vagrant Work? 

    Vagrant Box: 

    A box is like a starting "template" or "base image" for the virtual machine. 

    For example: The ubuntu/focal64 box contains the Ubuntu 20.04 operating system. 

    Vagrantfile: 

    The Vagrantfile is a file where you write instructions for Vagrant. 

    It tells Vagrant what to do with the box, like: 

    How much RAM and CPU to give the VM. 

    What IP address the VM should use. 

    What software to install in the VM. 

    Commands: 

    Vagrant uses simple commands like: 

    vagrant up → Create and start the VM. 

    vagrant halt → Stop the VM. 

    vagrant destroy → Delete the VM. 

 

 

Vagrant box update   

==> ubuntu1: Box 'ubuntu/focal64' not installed, can't check for updates. 

==> ubuntu2: Box 'ubuntu/focal64' not installed, can't check for updates. 

 

 

The output you're seeing indicates that Vagrant couldn't find the ubuntu/focal64 box installed on your system. This happened because the virtual machines (ubuntu1 and ubuntu2) defined in your Vagrantfile rely on the box ubuntu/focal64, but it hasn't been downloaded or added yet. 

 

 

## 

Nproc 

Number of processes   

## 

Free –h 

Ip –4 addr show 

Exit  

To exit from a server 

## 

Ssh-keygen 

The ssh-keygen command is used to generate a pair of SSH keys: a public key and a private key. These keys are primarily used for secure authentication in systems like Linux servers, Git repositories, or virtual machines. 

 

Where the SSH Key is Stored 

By default, the private key is stored in: 

~/.ssh/id_rsa 

The public key is stored in: 

~/.ssh/id_rsa.pub 

## 

ssh-copy-id vagrant@12.22.22.55 

The command ssh-copy-id vagrant@12.22.22.55 is used to copy your public SSH key to the remote server (in this case, 12.22.22.55 for the vagrant user). Once the public key is copied, you can log into the server securely without typing a password every time. 

After ssh-copy-id 

Once the public key is copied, you can log in to the server like this: 

ssh vagrant@12.22.22.55 

No password is needed because the SSH key pair is used for authentication. 

 

When you use the ssh-copy-id command, it automatically handles the necessary file permissions for you, so you don’t need to manually run chmod on the authorized_keys file or the .ssh directory. 

How to Use Multiple SSH Keys with ssh-copy-id 

    Check Your SSH Keys: 

    List all your public keys by looking in the ~/.ssh directory: 

ls ~/.ssh/*.pub 

This will show you all the .pub files, each representing a different public key, such as: 

    id_rsa.pub 

    id_ed25519.pub 

    id_ecdsa.pub 

 

Copy a Specific Key: If you want to use a specific public key (for example, id_ed25519.pub), you can specify it with the -i option when running ssh-copy-id: 

ssh-copy-id -i ~/.ssh/id_ed25519.pub vagrant@12.22.22.55 

 

This tells ssh-copy-id to copy only the id_ed25519.pub key to the remote server. 

 

Why Use ssh-copy-id? 

    It simplifies the process of setting up passwordless SSH login. 

    Instead of manually editing the authorized_keys file on the remote server, this command handles it for you. 

 

How It Works (Behind the Scenes) 

Here’s what happens step-by-step when you run: 

ssh-copy-id vagrant@12.22.22.55 

    Check Your Local Public Key: 

    The tool finds your public key file (e.g., ~/.ssh/id_rsa.pub). 

    Log In to the Remote Server: 

    It connects to the remote server (12.22.22.55) as the vagrant user. 

    It will prompt for the vagrant user's password to log in. 

    Copy the Public Key: 

    Once logged in, it appends the contents of your public key file (id_rsa.pub) to the remote server’s ~/.ssh/authorized_keys file. 

    Verify the Key: 

    The tool checks to make sure the key was successfully added. 

 

 

Then log into remote server 

ssh vagrant@12.22.22.55 

Enter passphrase for key '/home/vagrant/.ssh/id_rsa': 

Type the passphrase you set earlier.means if we have created a password when we created the private key. 

Then we entered into remote server. 

## 
Cat .ssh/authorised_keys  
 we can see our public key copied to remote server on remote server. 

 

## 

Eval $(ssh-agent) 

You want to connect to a remote server securely using SSH. You have an SSH private key (stored on your computer, like ~/.ssh/id_rsa) and its matching public key (copied to the remote server). 

If your private key has a passphrase, you’ll have to enter it every time you use the key to connect to the server. 

    ssh-agent is a helper program. 

    It stores your private key in memory (so it doesn’t keep asking for your passphrase). 

    Once the key is added to ssh-agent, you don’t need to enter the passphrase again for the rest of your session. 

ssh-agent: 

This starts the SSH agent. 

    eval: 

    The eval command tells your shell to take the output of ssh-agent and execute it. This sets the environment variables (SSH_AUTH_SOCK and SSH_AGENT_PID) in your shell. 

    $(...): 

This captures the output of ssh-agent and passes it to eval. 

What Happens Next? 

    You need to add your private key to the agent using: 

ssh-add ~/.ssh/id_rsa 

    This asks for the passphrase for your private key and stores the decrypted key in the agent’s memory. 

    After this, you can connect to servers without typing the passphrase again: 

ssh user@remote-server 

## 

Remote graphical access 

 

A VNC server (Virtual Network Computing server) is a software application that allows you to remotely control and interact with another computer's desktop environment over a network. It works by sharing the graphical user interface (GUI) of one computer (the server) so that it can be accessed and controlled from another computer (the client).-y tight 

Connect to remote server 

Ssh vagrant@123.23.23.23 

We entered into remote server 

Sudo apt install –y xfce4 xfce4-goodies  
select display manager, by default gdm3 

Sudo apt install –y tightvncserver 

Vncserver 

Vncserver kill :1 

Nano ~/ .vnc/xstartup 

Enter xrdb $HOME/ .Xresourses 

Start xfce4& 

Ctrl + x 

Vncserver 

Then come a window to enter remote server ip details , fill , then will come another window click continue then enter password for gui console, then we enter into gui console . Then  

## 

Tty 

When you log in to the GUI using VNC and open a terminal window, the tty command shows which pseudo-terminal (PTY) you are using. A pseudo-terminal is a software-emulated terminal, typically created when you open a terminal window in a graphical environment. 

    In a VNC session, you are interacting with the system through the graphical desktop environment. When you open a terminal in this GUI session, you are allocated a pseudo-terminal device like /dev/pts/0, /dev/pts/1, etc. 

    This device represents the terminal session you're using within the graphical environment. 

 

## 

Shell shortcuts 

Ctrl + a : Move to start of the line  

Ctrl +e: move to the end of the line 

!! : repeat the last command and arguments 

Esc + . : repeat the last argument 

Cd: move to the home directory 

Cd -: move to the prev directory 

Ctrl + r: recall prev command  

 

## 

Vagrant up ubuntu1 

It start the ubuntu1 vm . 

## 

Vagrant up  

Which means it starts all vms 

## 

Vagrant ssh ubuntu1 

Conneceted to ubuntu1 vm 

## 

Ls – la 

## 

Cat /etc/shadow 

Error : permission denied 

Sudo !! 

This means sudo cat /etc/shadow 

Shows the op 

## 

/etc/shadow 

In Linux, /etc/shadow is a system file that stores encrypted passwords and related information for user accounts. It is a critical file for system security and is readable only by the root user or processes with sufficient privileges. 

 

## 

Mkdir  ~/dir3/dir4 

    mkdir: 

    This stands for make directory. It creates new directories in the filesystem. 

    ~/: 

    The ~ symbol represents the home directory of the current user. 

    For example: 

    If your username is abc then ~/ is equivalent to /home/abc. 

    dir2/dir3: 

    dir2 is the parent directory. 

    dir3 is the child directory you want to create inside dir2. 

 

What If dir2 Doesn't Exist? 

    By default, mkdir will throw an error if you try to create dir3 inside a non-existent dir2. 

    Example Error: 

mkdir: cannot create directory ‘/home/antony/dir2/dir3’: No such file or directory 

 

## 

To create both dir2 and dir3 at the same time (if dir2 doesn't already exist), use the -p flag: 

 

mkdir -p ~/dir2/dir3 

The -p flag tells mkdir to create parent directories as needed. 

## 

ls -R ~/dir2 

-R: Recursively lists the contents of dir2 and its subdirectories. 

Op 

dir2: 

dir3 

## 

mkdir -p ubuntu/{14,16,18,20,22}.04/{current,gold} 

ls -R~ubuntu 

Op: 

/home/antony/ubuntu: 

14.04  16.04  18.04  20.04  22.04 

  

/home/antony/ubuntu/14.04: 

current  gold 

  

/home/antony/ubuntu/14.04/current: 

  

/home/antony/ubuntu/14.04/gold: 

  

/home/antony/ubuntu/16.04: 

current  gold 

  

/home/antony/ubuntu/16.04/current: 

  

/home/antony/ubuntu/16.04/gold: 

  

/home/antony/ubuntu/18.04: 

current  gold 

  

/home/antony/ubuntu/18.04/current: 

  

/home/antony/ubuntu/18.04/gold: 

  

/home/antony/ubuntu/20.04: 

current  gold 

  

/home/antony/ubuntu/20.04/current: 

  

/home/antony/ubuntu/20.04/gold: 

  

/home/antony/ubuntu/22.04: 

current  gold 

  

/home/antony/ubuntu/22.04/current: 

  

/home/antony/ubuntu/22.04/gold: 

 

## 

Sudo apt install –y tree 

he command sudo apt install -y tree is used to install the tree command-line utility on a Linux system that uses the apt package manager (like Ubuntu or Debian). 

The tree utility is a program that displays the directory structure of a path or directory in a tree-like format. 

Tree ~/ubuntu  or tree ubuntu 

Op: 

/home/antony/ubuntu 

├── 14.04 

│   ├── current 

│   └── gold 

├── 16.04 

│   ├── current 

│   └── gold 

├── 18.04 

│   ├── current 

│   └── gold 

├── 20.04 

│   ├── current 

│   └── gold 

└── 22.04 

    ├── current 

    └── gold 

  

15 directories, 0 files 

 
##
  touch file1
  
The touch command in Linux is used to create an empty file or update the timestamp (access and modification time) of an existing file. Here's an explanation of the command touch file1:

File Creation:

  If file1 does not exist in the current directory, the touch command creates an empty file   named file1.

Update Timestamp:

    If file1 already exists, touch updates its last access and modification time to the current time.
 

##
 ls -l file1

op:
-rw-rw-r-- 1 user user 0 Jan 25 10:00 file1

Here:

    0 indicates the file is empty.
    The timestamp shows when the file was created or last modified.
    
##
    
    file file1

 The file command in Linux is used to determine the type of a file. 

 eg;
 
 file ubuntu_linux_administartion.md
 
 ubuntu_linux_administartion.md: Unicode text, UTF-8 text, with very long lines (353)
 
##
 
 !l

    If a command starting with l (like ls) exists in your shell history, !l will recall and execute the most recent command starting with l.
    For instance:

ls -l

If you ran this earlier, typing !l will re-run ls -l.

##
redirection
> file2

The > symbol in Linux is used for redirection. 

It creates an empty file named file2 if it doesn't already exist.
If file2 already exists, it overwrites the file and makes it empty.

this is equivalent to command : 

touch file2

but with the additional effect of clearing the contents of file2 if it exists.

##
cp /etc/hosts .
ls -l hosts
> hosts
then it clear the data in the hosts 

##

ls -l /etc/hosts /etc/Hosts
ls: cannot access '/etc/Hosts': No such file or directory
-rw-r--r-- 1 root root 242 Dec 30 23:37 /etc/hosts


ls -l /etc/hosts /etc/Hosts > file1
ls: cannot access '/etc/Hosts': No such file or directory


Explanation:

    ls -l:
        Lists the detailed information of files or directories in the long format (including permissions, ownership, size, modification time).

    /etc/hosts:
        This is a system file in Linux that maps IP addresses to hostnames. It typically exists on your system.

    /etc/Host:
        This seems like a typo. The correct path is /etc/hosts, but /etc/Host might not exist, and if it doesn't, you'll get an error.

    > file1:
        The output is redirected to the file file1. This means any output from the ls -l command will be written to file1, not displayed on the terminal.
        
        
        
The reason you're not seeing the error message in file1 is because of how the output redirection (>) works. By default, > only captures standard output (stdout), not standard error (stderr).

In the case of a non-existent file (like /etc/Host), the error message is sent to stderr, and since you're redirecting only stdout, the error message doesn't get captured.


##

ls -l /etc/hosts /etc/Hosts 2> file2

2> file2:

    This redirects standard error (stderr) to file2. The error message generated for the non-existent file /etc/Hosts will be written to file2.
    
ls -l /etc/hosts /etc/Hosts 2> file2
-rw-r--r-- 1 root root 242 Dec 30 23:37 /etc/hosts

cat file2
ls: cannot access '/etc/Hosts': No such file or directory


##

ls -l /etc/hosts /etc/Hosts &> file3

cat file3
ls: cannot access '/etc/Hosts': No such file or directory
-rw-r--r-- 1 root root 242 Dec 30 23:37 /etc/hosts
    
 &> file3:

This part of the command captures both stdout (standard output) and stderr (standard error) and redirects them to file3.
&> is a shorthand for redirecting both stdout and stderr to a file.

##
ls -l /etc/hosts /etc/Hosts &>> file3 
cat file3

ls: cannot access '/etc/Hosts': No such file or directory
-rw-r--r-- 1 root root 242 Dec 30 23:37 /etc/hosts
ls: cannot access '/etc/Hosts': No such file or directory
-rw-r--r-- 1 root root 242 Dec 30 23:37 /etc/hosts
        
        
   &>> file3:

    This part of the command redirects both standard output (stdout) and standard error (stderr) to the file file3.
    The difference between &> and &>> is that:
        &> will overwrite the file each time you run the command.
        &>> will append to the file, meaning it will add new output or errors to the end of file3 instead of replacing the previous contents.
        
        
##
echo "8.8.8.8 google" | sudo tee -a file4
op:
8.8.8.8 google

                    
 echo "8.8.8.8 google":

    The echo command outputs the string "8.8.8.8 google".
    This is the IP address 8.8.8.8 and the hostname google.

| (Pipe):

    The pipe (|) sends the output of the echo command (the string "8.8.8.8 google") to the next command.

sudo:

    The sudo command is used to run the following command with superuser (root) privileges. While echo itself doesn't require special privileges, the tee command will need it if you're trying to modify a file that needs elevated permissions.

tee -a file4:

    The tee command receives the string "8.8.8.8 google" and writes it to the file file4.
    The -a option tells tee to append the content to the file rather than overwriting it. This means the new content will be added to the end of file4.
    
    
    
##

cp file1 cp_demo


cat file1
-rw-r--r-- 1 root root 242 Dec 30 23:37 /etc/hosts
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration$ cat file2
ls: cannot access '/etc/Hosts': No such file or directory
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration$ cp file1 cp_demo
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration$ cd cp_demo
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ ls
file1
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ cat file1
-rw-r--r-- 1 root root 242 Dec 30 23:37 /etc/hosts
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ cd ..
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration$ cp file2 cp_demo/file1
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration$ cd cp_demo
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ ls
file1
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ cat file1
ls: cannot access '/etc/Hosts': No such file or directory
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ 


The cp command without specific options, the destination file or folder is overwritten if it already exists. To avoid this and preserve previous versions of files, you can use different options with cp.

##
cp --backup=numbered file1 cp_demo/file1


/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration$ cat file1
-rw-r--r-- 1 root root 242 Dec 30 23:37 /etc/hosts
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration$ cp --backup=numbered file1 cp_demo/file1
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration$ cd cp_demo
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ cat file1
-rw-r--r-- 1 root root 242 Dec 30 23:37 /etc/hosts
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ ls
file1  file1.~1~
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ cat file1.~1~
ls: cannot access '/etc/Hosts': No such file or directory


##
rm

The rm command is used to delete (remove) files and directories. Once deleted, they cannot be recovered unless you have a backup or use special tools for data recovery.


a. Remove a Single File

rm file1.txt

    Deletes the file file1.txt from the current directory.

b. Remove Multiple Files

rm file1.txt file2.txt file3.txt

    Deletes all the specified files (file1.txt, file2.txt, file3.txt).
Let’s go over the rm and mv commands in Linux, along with their examples and practical usage.
1. rm Command (Remove Files and Directories)

The rm command is used to delete (remove) files and directories. Once deleted, they cannot be recovered unless you have a backup or use special tools for data recovery.
Basic Syntax

rm [options] file_or_directory

Examples of rm
a. Remove a Single File

rm file1.txt

    Deletes the file file1.txt from the current directory.

b. Remove Multiple Files

rm file1.txt file2.txt file3.txt

    Deletes all the specified files (file1.txt, file2.txt, file3.txt).

c. Remove a Directory

rm -r my_folder/

    Removes the folder my_folder and all its contents (files and subfolders).
    The -r option stands for recursive, meaning it will go into subdirectories and delete everything.
 
 
 rm -rf ubuntu/
 
 The command rm -rf ubuntu/ will recursively and forcefully delete the ubuntu/ directory and all its contents, including subdirectories and files, without asking for confirmation. 
 
##
 mv
 
 
 The mv command is used to move files/directories from one location to another or to rename them.
 
 


2. mv Command (Move or Rename Files and Directories)

The mv command is used to move files/directories from one location to another or to rename them.
Basic Syntax

mv [options] source destination

Examples of mv
a. Rename a File

mv old_name.txt new_name.txt

    Renames old_name.txt to new_name.txt.

b. Move a File to Another Directory

mv file1.txt /home/antony/Documents/

    Moves file1.txt to /home/antony/Documents/.
    
    
 
 
## aliases

alias

To see all currently defined aliases.

##

type ls

The type command checks how the shell interprets the ls command.
It shows whether ls is:

    An alias (a shortcut defined by the user).
    A shell built-in command (part of the shell itself).
    An external binary (a program stored on disk).
    
1. If ls is an Alias    
type ls
op:
ls is aliased to `ls --color=auto`

This means ls is set as an alias with the option --color=auto, which adds color to the output for better readability.
    
    
    
2. If ls is an External Command

type ls

Output:

ls is /bin/ls

    This means ls is an external binary located in the /bin directory.    
    
    
3. If ls is a Built-in Command

type cd

Output:

cd is a shell builtin

    This is just an example with cd. ls is typically not a shell built-in but an external binary.    
    
##
/ls

Aliases are shortcuts for commands. For example, many systems alias ls to include extra options, such as ls --color=auto for colored output.


The backslash (\) tells the shell to ignore any alias for the command.
It ensures that you are using the original version of the ls command (the one from /bin/ls or /usr/bin/ls).

    
 * Check if ls is aliased:

type ls

Output:

ls is aliased to `ls --color=auto`

* Run ls Normally (with Alias):

ls

Output (colored output):

file1  file2  dir1

* Run \ls to Ignore Alias:

\ls

Output (no color, plain output):

file1  file2  dir1   

##

\ls -F

The command \ls -F in Linux combines two concepts:

 *   \ls: Bypasses any alias for the ls command, ensuring you run the original, unmodified ls command.
 *   -F option: Adds a character at the end of file and directory names to indicate their type. For example:
        / for directories.
        * for executable files.
        @ for symbolic links.
    
    
 op:

 file1.txt  script.sh*  docs/  symlink@
   
file1.txt: A regular file.
script.sh: An executable file.
docs/: A directory.
symlink: A symbolic link.
    
    
    
##

cp /etc/hosts .
copying /etc/hosts to current directory

again run cp /etc/hosts . 
this time the previous copied will overwrite .to avoid this i want to a notifiaction 

alias cp='cp -i'

cp /etc/hosts .
op:
cp: overwrite './hosts'? 

we got the notification , enter y or n

another method:

alias safecp='cp --backup'

safecp /etc/hosts .
op:
cp: overwrite './hosts'? here we got notification prev alias , so we we have to remove that 

unalias cp

safecp /etc/hosts .

ls 

then op will be 
hosts and hosts~


##

cp /etc/hosts .
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ ls
file1  file1.~1~  hosts
antony@antony-HP-Laptop-15s-eq1xxx:/media/antony/8AFC4B69FC4B4F1F/sample projects/Linux_studies/Ubuntu_linux_administration/cp_demo$ diff /etc/hosts hosts

here no op , bcz there is no diff bw /etc/hosts and hosts

* The command diff /etc/hosts hosts compares two files: /etc/hosts and hosts. It outputs the differences between these two files line by line.

* If there are differences between the two files, diff will show the changes required to make the two files identical.
If the two files are identical, there will be no output. 

##

nano hosts

added 1.0.0.1 cf

diff /etc/hosts hosts
op:
9a10
> 1.0.0.1 cf

* 9a10:

    This tells us the type of difference and its location:
        9: Refers to line 9 in the /etc/hosts file.
        a: Stands for "add." It means a line is present in the hosts file after line 9 of /etc/hosts.
        10: Refers to the line number in the hosts file where the extra line is found.

* > 1.0.0.1 cf:

    This is the content of the additional line in the hosts file that is missing in /etc/hosts.

##

diff hosts /etc/hosts 
10d9
< 1.0.0.1 cf


* 10d9:

    10: Refers to line 10 in the hosts file.
    d: Stands for "delete." It means that the line in the hosts file should be deleted to make it identical to /etc/hosts.
    9: Refers to where the deletion would align with line 9 in /etc/hosts.

* < 1.0.0.1 cf:

    This is the line from the hosts file that is not present in /etc/hosts and needs to be removed to make the files identical.


##
text editors

* vim

vim hosts

i : to edit the file
esc + x : to save 
esc + :wq : for save and  exiting
esc + :q! : to exit without saving forcefully

* vim +1 hosts

this open the hosts file and curser points to first line

* vim +$ hosts

this goes to end of hosts file

* vim +/google/ hosts

the curser will goes to the line contain google 

* vimtutor 

will give all information about vim text editor


##
sed


a stream editor in Linux. It allows you to perform text manipulation and transformations on the input stream (such as a file or data piped from another command) without opening a full-fledged editor. sed is used for tasks like text substitution, insertion, deletion, and more, all through command-line operations.


i: The command to insert text before the specified line.

* sed -i '$d' hosts


    sed: The stream editor used for text manipulation.
    -i: This option tells sed to edit the file in place, meaning the file will be modified directly rather than outputting the changes to the terminal.
    $: This represents the last line of the file. In sed, $ refers to the last line, regardless of how many lines the file contains.
    d: The delete command in sed, which removes the specified line.
    hosts: This is the file on which the operation will be performed.

Effect:

    $d: Deletes the last line of the hosts file.
    -i: The change will be applied directly to the hosts file, modifying it without asking for confirmation.



* tail hosts

tail is used to display the last few lines of the file named hosts.


* sed -i '1i # This is the hosts file' hosts


is used to insert the text # This is the hosts file at the beginning (line 1) of the file hosts.
Breakdown of the Command:

    sed: The stream editor used to perform text manipulations.
    -i: The -i flag tells sed to edit the file in place, meaning the changes will be directly applied to the hosts file, rather than outputting to the terminal.
    '1i # This is the hosts file':
        1: Refers to line 1, meaning the change will be made at the very beginning of the file.
        i: The insert command in sed, which inserts text before the specified line (in this case, before line 1).
        # This is the hosts file: The text that will be inserted before line 1.
    hosts: The file on which the operation will be performed.

Effect:

This command will add the text # This is the hosts file as a comment at the very top of the hosts file.

* sed -i 's/google/googledns/' hosts

is used to replace the first occurrence of the word "google" with "googledns" on each line of the hosts file.
Breakdown of the Command:

    sed: The stream editor used to perform text manipulation.
    -i: This option edits the file in place, meaning the changes will be applied directly to the hosts file without printing anything to the terminal.
    's/google/googledns/':
        s: This stands for "substitute," a command in sed used to replace text.
        google: The text pattern that will be replaced.
        googledns: The replacement text that will replace google.
        The / delimiters separate the pattern and the replacement text.
    hosts: This is the file on which the operation is applied.

Effect:

This command will replace the first occurrence of the word "google" with "googledns" on each line of the hosts file. The change will be applied in place.

* cat hosts

* sed -i '$i 8.8.8.8 google' hosts

is used to insert the line 8.8.8.8 google before the last line of the file hosts.

* sed -i '$a 8.8.8.8 google' hosts
    
    is used to append the line 8.8.8.8 google after the last line of the file hosts.
    
## Managing Linux Permissions    
* stat /etc/hosts

The command stat /etc/hosts in Linux is used to display detailed information about the file /etc/hosts, including file permissions, owner, size, and timestamps (such as the last access time, modification time, and change time).
    
* ls -l /etc/hosts

op:
-rw-r--r-- 1 root root 247 Jan 26 17:21 /etc/hosts

1. File Permissions: -rw-r--r--

    The first character - indicates that this is a regular file. If it was a directory, it would be d, and if it was a symbolic link, it would be l.
    The next 9 characters represent the file permissions for the owner, group, and others:
        rw-: The owner (root) has read and write permissions, but no execute permission.
        r--: The group (root) has read permission only (no write or execute).
        r--: Others (everyone else) have read permission only.

2. Number of Links: 1

    This indicates the number of hard links to this file. For regular files, this is typically 1.
    A hard link means the file can have multiple names pointing to the same content (in different directories).

3. Owner: root

    This shows the user who owns the file. In this case, the owner is root (the superuser).

4. Group: root

    This shows the group that the file belongs to. In this case, the file belongs to the root group.
    Groups allow you to manage permissions for multiple users.

5. File Size: 247

    This is the size of the file in bytes. The file /etc/hosts has a size of 247 bytes.

6. Last Modification Time: Jan 26 17:21

    This indicates the last modification time of the file.
        The file was last modified on January 26 at 17:21 (in the local timezone).
        This time includes the date and time when the file was last changed.

7. File Path: /etc/hosts

    This is the path to the file. In this case, it's the system file /etc/hosts.

Summary:

    -rw-r--r--: The file is a regular file, with read and write permissions for the owner (root), and read-only permissions for the group and others.
    1: The file has 1 hard link.
    root root: The file is owned by the root user and the root group.
    247: The file size is 247 bytes.
    Jan 26 17:21: The file was last modified on January 26 at 17:21.
    /etc/hosts: The file path.
    
    

-: This indicates that the item is a regular file.
d: This would indicate a directory.
l: This would indicate a symbolic link (symlink).


*  A symbolic link (symlink) is a special type of file in Linux that acts as a pointer or reference to another file or directory. It doesn't contain the actual data of the file; instead, it contains a path to another file or directory on the system. This is why symbolic links are also called soft links.

      
##
stat -c %a /etc/service

The command stat -c %a /etc/service is used to display the permissions of the file or directory /etc/service in a numeric format.
Breaking it Down:

    stat: This command displays detailed information about a file or directory, such as its size, access time, modification time, and permissions.

    -c: This option allows you to specify a custom output format. The format is defined by the following string after -c.

    %a: This tells stat to display the file permissions in octal (numeric) format. Permissions are shown as a 3-digit number, where each digit represents the permissions for the owner, group, and others respectively.

    /etc/service: This is the path to the file or directory whose permissions you want to check. In this case, /etc/service refers to a file or directory in the /etc directory.
    
    
    op:
      644
      
 * stat -c %A /etc/service
 
 The command stat -c %A /etc/service is used to display the permissions of the file or directory /etc/service in a human-readable (symbolic) format.
Breaking it Down:

    stat: This command is used to display detailed information about a file or directory, such as its size, access time, modification time, and permissions.

    -c: This option allows you to specify a custom output format. The format is defined by the following string after -c.

    %A: This tells stat to display the file permissions in symbolic format (e.g., rwxr-xr-x).
        The first character represents whether the file is a directory (d), regular file (-), or a symbolic link (l).
        The next nine characters show the permissions for owner, group, and others.

    /etc/service: This is the path to the file or directory whose permissions you want to check. In this case, /etc/service refers to a file or directory in the /etc directory.
    
    op:
    
    -rw-r--r--
    
               
    
