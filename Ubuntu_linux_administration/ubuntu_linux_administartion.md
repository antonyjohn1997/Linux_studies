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
    
#################       










#######################




##
mkdir links
ls -ld links/
ls -ldi links/
ls -ldi links/ links/.


1. mkdir links

    This command creates a directory named links in the current working directory. After running it, you will have a directory called links/.

2. ls -ld links/

    This lists details about the links/ directory itself (not its contents). The -l option provides a long listing format, and the -d option ensures the listing is for the directory itself, rather than its contents.
    Example output:

    drwxr-xr-x 2 user user 4096 Jan 28 12:00 links/

        2: The number 2 represents the number of hard links to the directory. A directory has at least two hard links: one for the directory itself (links/) and one for its entry in its parent directory (..).

3. ls -ldi links/

    This command lists the inode number and details for the links/ directory.
    The -i option displays the inode number of the file or directory.
    The -d option ensures that the listing is for the directory itself, rather than its contents.
    Example output:

    1234567 drwxr-xr-x 2 user user 4096 Jan 28 12:00 links/

        1234567: This is the inode number. Every file or directory on a filesystem has a unique inode, which stores metadata like ownership, permissions, and the disk location of the data.

4. ls -ldi links/ links/.

    This command lists the inode numbers and details for both the links/ directory and its . (current directory) entry. The . is a special entry within every directory that refers to the directory itself.
    The output will show the inode number for both the links/ directory and the . entry, and they should have the same inode number.
    Example output:

    1234567 drwxr-xr-x 2 user user 4096 Jan 28 12:00 links/
    1234567 drwxr-xr-x 2 user user 4096 Jan 28 12:00 links/.

        1234567: Both the directory links/ and its . entry share the same inode number, indicating that they are linked to the same inode. This is because the . entry in a directory refers to the directory itself.

Hard links in the context of directories:

    A hard link is a reference to a file or directory by its inode number. In the case of directories, a hard link means that the directory has multiple references to it.
    For any directory, at least two hard links exist:
        One for the directory itself (e.g., links/).
        One for its parent directory’s entry (..), which is used to reference the parent directory from within any subdirectory.
    When you create additional hard links to a directory or file, the link count (2 in the example) will increase, showing how many references point to that inode.
    
    
##
mkdir links/d1
ls -ldi links/ links/.
ls ldi links/links/. links/d1/..


1. mkdir links/d1

    This command creates a subdirectory named d1 inside the links/ directory.
    After running this command, the structure will look like:

    links/
    └── d1/

2. ls -ldi links/ links/.

    This command lists the inode number and details for the links/ directory and its . (current directory) entry.
    Here’s the breakdown:
        links/: This refers to the links/ directory itself.
        links/.: This refers to the special . entry inside the links/ directory, which always points to the directory itself.

Example output (assuming inode number 1234567 for both):

1234567 drwxr-xr-x 2 user user 4096 Jan 28 12:00 links/
1234567 drwxr-xr-x 2 user user 4096 Jan 28 12:00 links/.

    The number 2 (the second column) indicates the link count for both links/ and links/.. This is because a directory has at least two hard links:
        One for the directory itself (links/).
        One for the . entry, which points to the directory itself from inside the directory.

The inode number (1234567) for both links/ and links/. will be the same, showing that they both reference the same inode.
3. ls -ldi links/links/. links/d1/..

    This command lists the inode number and details for two things:
        links/links/.: This is the . entry inside the links/links/ subdirectory. It points to the links/links/ directory itself.
        links/d1/..: This is the .. entry inside the links/d1/ subdirectory. It points to the parent directory of links/d1/, which is links/.

Let’s break this down:

    links/links/.: This refers to the links/links/ directory itself, and its inode number should match the inode number of links/links/.
    links/d1/..: This refers to the parent directory of links/d1/, which is links/. The .. entry is special, pointing to the parent directory, and the inode number for links/d1/.. will match the inode number of links/.

Example output (assuming inode number 1234567 for both):

1234567 drwxr-xr-x 2 user user 4096 Jan 28 12:00 links/links/.
1234567 drwxr-xr-x 2 user user 4096 Jan 28 12:00 links/d1/..

    Both links/links/. and links/d1/.. share the same inode number (1234567), which points to the links/ directory.
    
    
##
ls -ld /etc
drwxr-xr-x 138 root root 12288 Jan 26 17:21 /etc


the default hardlink /etc and /etc .
the except this remaining 136 hardlinks contain in /etc

##
/etc/ itself: This is the directory entry for /etc. It counts as one hard link.
/etc/. (the . entry inside /etc): This is the special directory entry that points to the directory itself. The . entry always refers to the directory it is contained in. This counts as the second hard link.

    
    
##
cd links/
echo hello > file1
ln file1 file2
ls -li
cat file1 
cat file2


 1. cd links/

    This command changes the current working directory to links/. After running this, you will be inside the links/ directory, which is where you'll perform the rest of the operations.

2. echo hello > file1

    This command creates a new file named file1 in the links/ directory and writes the string hello into it.
    The file file1 is created with the content hello, and its inode will be assigned. At this point, file1 has 1 hard link (itself).

3. ln file1 file2

    This command creates a hard link to file1 and names it file2.
    A hard link means that both file1 and file2 will point to the same inode. This means they share the same data, and changes made to one will be reflected in the other.
    After running this command:
        file1 and file2 now point to the same inode, which holds the content hello.
        The link count for this inode increases to 2, as both file1 and file2 are referencing the same underlying data.

4. ls -li

    The ls -li command lists the files in the current directory (links/) along with their inode numbers.
    The -i option shows the inode number of each file, and the -l option gives detailed information (including the link count).

Example output:

1234567 -rw-r--r-- 2 user user 6 Jan 28 12:00 file1
1234567 -rw-r--r-- 2 user user 6 Jan 28 12:00 file2

    1234567: This is the inode number for both file1 and file2, showing that they point to the same data.
    2: This is the link count, which shows how many hard links are pointing to the inode. Since file1 and file2 are hard links to the same inode, the link count is 2.

5. cat file1

    This command displays the contents of file1. Since file1 contains hello, the output will be:

    hello

6. cat file2

    This command displays the contents of file2. Since file2 is a hard link to file1, it points to the same inode and data. Therefore, the output will also be:

hello

##
rm file1
cat file2


1. rm file1

    This command deletes file1 from the filesystem.
    However, since file1 and file2 are hard links to the same inode (the same underlying data), deleting file1 does not delete the actual data. The inode and data are still intact because file2 is still pointing to it.
    After running this command, the link count for the inode will decrease by 1. If the link count was 2 (before the deletion), it will now be 1.

2. cat file2

    Since file2 still exists and is pointing to the same inode (the same data) as file1 did, running cat file2 will still show the contents of the file.
    The output will be:

hello


##
ln -s /usr/share/doc .
ls -l
cd doc
pwd
pwd -P
cd ..
ls


1. ln -s /usr/share/doc .

    This command creates a symbolic link (symlink) named doc in the current directory (.) that points to /usr/share/doc.
    ln -s is used to create a symbolic (or soft) link. Unlike hard links, symbolic links can link to directories or files across different filesystems, and they contain a reference to the target's path.
    After this command, in the current directory, you’ll have a symlink called doc, which points to /usr/share/doc.

2. ls -l

    This command lists the files and directories in the current directory with detailed information (permissions, links, owner, group, size, modification time, and name).
    After creating the symlink, you’ll see an entry for the doc symlink, similar to this:

    lrwxrwxrwx 1 user user 21 Jan 28 12:00 doc -> /usr/share/doc

    l at the beginning indicates that this is a symlink.
    rwxrwxrwx shows the permissions (read, write, execute for everyone).
    The 21 is the length of the symlink (the number of characters in the path /usr/share/doc).
    The doc -> /usr/share/doc part shows that the symlink doc points to /usr/share/doc.

3. cd doc

    This command changes the current directory to doc. Since doc is a symlink to /usr/share/doc, you’ll be taken to /usr/share/doc when you run this command.

4. pwd

    pwd (print working directory) shows the absolute path of the current directory.
    If you ran this after cd doc, you would see:

    /usr/share/doc

    This is because doc is a symbolic link to /usr/share/doc, and when you cd into it, you are taken to the target of the symlink.

5. pwd -P

    pwd -P shows the physical path (without following symbolic links).
    When you run pwd -P inside /usr/share/doc (after following the symlink doc), the output will be:

    /usr/share/doc

    In this case, it looks the same because /usr/share/doc is the actual physical directory, not a symlink. However, if you had been inside a directory that was a symlink itself, pwd -P would show the actual physical directory path, not the symlink path.

6. cd ..

    This command moves you up one level in the directory structure. Since you’re in /usr/share/doc, after running cd .., you will be moved to /usr/share.

7. ls

    This command lists the contents of the current directory (/usr/share after cd ..).
    You should see an entry for doc (the symlink you created earlier), along with other files and directories that exist in /usr/share.
    
    
    
    
##
ln -s /usr/share/doc .
ls -l
cd doc
pwd
/home/vagrant/links/doc
pwd -P
cd ..
ls

1. ln -s /usr/share/doc .

    This command creates a symbolic link named doc in the current directory (.) that points to /usr/share/doc.
    ln -s is used to create a symbolic (or soft) link, which is different from a hard link. A symbolic link contains a reference to the path of the target file or directory.

In this case, you’re creating a symlink called doc, which points to /usr/share/doc.
2. ls -l

    This command lists the files and directories in the current directory with detailed information.
    After running ln -s, you would see something like this:

    lrwxrwxrwx 1 user user 21 Jan 28 12:00 doc -> /usr/share/doc

    l at the start indicates that this is a symbolic link.
    The number 21 is the length of the target path (/usr/share/doc).
    doc -> /usr/share/doc indicates that the doc symlink points to /usr/share/doc.

3. cd doc

    This command changes the current directory to doc. Since doc is a symbolic link pointing to /usr/share/doc, you will now be inside /usr/share/doc (the target directory).

4. pwd

    pwd shows the absolute path of the current directory.
    After running cd doc, you’ll see:

    /home/vagrant/links/doc

    This is the symlink's path in the current directory (/home/vagrant/links/doc). This path is where the symlink resides, not the target path of the symlink.

5. pwd -P

    pwd -P shows the physical path of the current directory (i.e., without following symlinks).
    When you run pwd -P after cd doc, the output will be:

    /usr/share/doc

    This shows the actual physical directory where the symlink points (the target path), which is /usr/share/doc.

6. cd ..

    This command moves you up one level in the directory structure. Since you’re inside /usr/share/doc, running cd .. will move you up to /usr/share.

7. ls

    This command lists the contents of the current directory, which is now /usr/share.
    You will see an entry for doc (the symlink) pointing to /usr/share/doc, as well as other files and directories in /usr/share.

What Are Symbolic Links?

A symbolic link (or symlink) is a special type of file that acts as a reference or pointer to another file or directory. Symlinks are often used to create shortcuts or links to files and directories located in different places in the filesystem.
Why Use Symbolic Links?

Symbolic links are useful in several situations:

    Shortcuts: They allow you to create a shortcut to a file or directory without having to duplicate the data.
    Cross-filesystem links: Unlike hard links, symlinks can link to files or directories on different filesystems.
    Managing Configurations: Symlinks are often used for configuration files. For example, linking a configuration file in a common directory (like /etc/) to a specific file or directory elsewhere on the system.
    Ease of access: They make it easier to access deeply nested files or directories by creating a simpler, shorter path.

Size of a Symbolic Link

The size of a symbolic link is relatively small, typically depending on the length of the target path it points to. For example:

    If the target is /usr/share/doc, the symlink will store this path.
    The size of the symlink is the length of the target path plus some additional space for the symlink's metadata. Typically, the size of a symlink is around 20 to 100 bytes, depending on the length of the path.

For example, in the ls -l output, you might see something like this:

lrwxrwxrwx 1 user user 21 Jan 28 12:00 doc -> /usr/share/doc

    The length of the symlink is 21 bytes, as it stores the 21 characters of /usr/share/doc.

Key Differences Between Symlinks and Hard Links:

    Symlinks:
        Can link to files and directories across different filesystems.
        Can be used to link to non-existent files (broken symlink).
        Can be identified by ls -l with an l at the beginning.
        Can have a size depending on the length of the target path.

    Hard Links:
        Can only link to files, not directories.
        Cannot span across different filesystems.
        They are indistinguishable from the original file (no special marker like l in ls -l).
        Do not have a size related to the target path; they share the same inode as the original file.
        
        
        
##
ln -s file2 file3
ls -l
cat file3

Let’s go through each command and explain what’s happening:
1. ln -s file2 file3

    This command creates a symbolic link (symlink) named file3 that points to file2.
    ln -s is used to create a symbolic link (also known as a soft link), where file3 will not contain the actual data of file2, but instead will store the path to file2.
    After this command, file3 becomes a symlink pointing to file2. Any operation on file3 will be redirected to file2 because it references the path of file2.

2. ls -l

    This command lists the files and directories in the current directory with detailed information (permissions, links, owner, group, size, modification time, and name).
    After creating the symbolic link, you’ll see something like this:

    -rw-r--r-- 1 user user 123 Jan 28 12:00 file2
    lrwxrwxrwx 1 user user  5 Jan 28 12:01 file3 -> file2

    -rw-r--r--: This shows the regular file file2 with read and write permissions for the owner, and read permissions for others.
    lrwxrwxrwx: This shows that file3 is a symbolic link (the l at the start), with read, write, and execute permissions for everyone (since it is a symlink).
    file3 -> file2: The -> file2 part shows that file3 is pointing to file2.

3. cat file3

    cat file3 will display the contents of file3. Since file3 is a symlink to file2, this command will show the contents of file2.
    The cat command will follow the symlink file3 and display whatever is inside file2, because file3 is just a pointer to file2.
    
    
If file2 contains the text:

Hello, this is file2!

Then when you run cat file3, you will see:

    Hello, this is file2!

This demonstrates how symbolic links work by redirecting operations to the target file.

##

vim file3
cat file2


1. vim file3

    Since file3 is a symbolic link pointing to file2, when you run vim file3, you are actually editing file2 (because file3 redirects to file2).
    In Vim, you can make changes to file2 through file3. Any edits made in vim file3 will affect file2, as both file3 and file2 are essentially pointing to the same file data.
    Example: If file2 originally contains:

Hello, this is file2!

and you change it to:

    Hello, this is modified file2!

    Then the change will be saved to file2.

2. cat file2

    After editing file3 (which edits file2), running cat file2 will display the contents of file2 (which were modified via file3).
    If you changed the contents of file2 through vim file3, then cat file2 will now show the updated content.
    Example: After editing file2 through file3 to say:

Hello, this is modified file2!

Running cat file2 will display:

Hello, this is modified file2!

##file permissions in linux

* read =4 in octal and  100 in binary
read a file or list directory content
* write = 2 in octal and 010 in binary
create or delate files in directories , write to existing files 
* execute = 1 in octal and 001 in bainary
enter a directoy or execute program or script 

* default permissions for files = 666
* default permissions for derectories =777

 
* the current umask value afftect default permissions  002

The umask (user file creation mask) is a setting that determines the default file permissions for newly created files and directories. It acts as a mask, restricting certain permissions by "removing" permissions from the default values.
What Does umask 002 Mean?

The umask value is typically a three-digit number, where each digit corresponds to a set of permissions for the owner, group, and others respectively. The umask value subtracts permission bits from the default values of 666 (for files) and 777 (for directories).

Here’s a breakdown of the umask value 002:
Default Permissions:

    For files: 666 (rw-rw-rw-)
    For directories: 777 (rwxrwxrwx)

The umask value 002 means:

    Owner (user): No restrictions (default permissions are preserved).
    Group: Remove write permissions.
    Others: Remove write permissions.

File Permissions Calculation:

    File permissions (666) - umask (002) = 664
        664 means: rw-rw-r-- (read and write permissions for owner and group, read-only for others).
    Directory permissions (777) - umask (002) = 775
        775 means: rwxrwxr-x (read, write, and execute permissions for owner and group, read and execute for others).

Detailed Explanation:

    Owner (user): The owner of the file or directory will have read, write, and execute permissions for directories (rwx), and read and write permissions for files (rw-).
    Group: The group will have read and write permissions for files and directories, but no execute permission for files. For directories, execute permission (search permission) is retained.
    Others: Others will have read-only permission for files and read and execute permission for directories.

Example of Permissions:

    If you create a file with umask 002, it will have 664 permissions (rw-rw-r--), meaning the owner and group can read and write, while others can only read.
    If you create a directory with umask 002, it will have 775 permissions (rwxrwxr-x), meaning the owner and group can read, write, and execute, while others can read and execute, but cannot modify or create files inside the directory.

Summary:

    The umask 002 means:
        Files: Default permissions are rw-rw-r-- (664), where the owner and group have read and write access, and others have read-only access.
        Directories: Default permissions are rwxrwxr-x (775), where the owner and group have full access (read, write, execute), and others can read and execute, but not write.
        
##
umask
0002
touch f1
ls -l f1
mkdir dirone
ls -ld dirone
umask 0
umask


1. umask

    The umask command shows the current umask value, which defines the default permissions for new files and directories.
    In your case, you are setting the umask to 0002, which affects the default file and directory permissions for newly created files and directories.

2. umask 0002

    umask 0002 sets the current umask value to 0002. This means:
        Owner: No restrictions (full permissions are allowed).
        Group: No restrictions (full permissions are allowed).
        Others: Write permission is removed, allowing only read and execute permissions.
    As a result, new files will have 664 permissions (rw-rw-r--), and new directories will have 775 permissions (rwxrwxr-x).

3. touch f1

    The touch f1 command creates an empty file named f1. Since the umask is 0002, the default file permissions will be 664 (rw-rw-r--).
    This means:
        Owner has read and write permissions (rw-).
        Group has read and write permissions (rw-).
        Others have read-only permission (r--).

4. ls -l f1

    The ls -l f1 command lists the detailed information about f1. After creating f1 with umask 0002, you should see something like:

    -rw-rw-r-- 1 user group 0 Jan 28 12:00 f1

    The file f1 has 664 permissions (rw-rw-r--), meaning:
        Owner: read/write (rw-).
        Group: read/write (rw-).
        Others: read-only (r--).

5. mkdir dirone

    The mkdir dirone command creates a directory named dirone. Since the umask is 0002, the default directory permissions will be 775 (rwxrwxr-x).
    This means:
        Owner has read, write, and execute permissions (rwx).
        Group has read, write, and execute permissions (rwx).
        Others have read and execute permissions, but not write (r-x).

6. ls -ld dirone

    The ls -ld dirone command lists the detailed information about the directory dirone. After creating dirone with umask 0002, you should see something like:

    drwxrwxr-x 2 user group 4096 Jan 28 12:00 dirone

    The directory dirone has 775 permissions (rwxrwxr-x), meaning:
        Owner: read, write, and execute (rwx).
        Group: read, write, and execute (rwx).
        Others: read and execute (r-x).

7. umask 0

    umask 0 sets the umask value to 0000, which means there are no restrictions on the default permissions for newly created files and directories.
    As a result, new files will have 666 permissions (rw-rw-rw-), and new directories will have 777 permissions (rwxrwxrwx).

8. umask

    The umask command, after setting it to 0, shows the current umask value, which will now be 0000.
    This means no permissions will be removed when creating files or directories, so the default permissions for files will be 666 (rw-rw-rw-), and for directories, it will be 777 (rwxrwxrwx).
    
##

touch f2
ls -l f2
mkdir dirtwo
ls -ld dirtwo
umask 077
touch f3
ls -l f3


1. touch f2

    The touch f2 command creates an empty file named f2.
    Since no umask value has been explicitly set yet, the default umask applies.
    Default umask is typically 022 for most systems, so the resulting permissions for the file will be 644 (rw-r--r--).
        Owner: Read and write (rw-).
        Group: Read-only (r--).
        Others: Read-only (r--).
    After running this command, you can check the permissions with ls -l f2:

    -rw-r--r-- 1 user user 0 Jan 28 12:00 f2

2. ls -l f2

    The ls -l f2 command lists detailed information about the file f2.
    The permissions will be shown as 644 (rw-r--r--), where:
        The owner (user) can read and write the file.
        The group and others can only read the file.

3. mkdir dirtwo

    The mkdir dirtwo command creates a directory named dirtwo.
    Directories typically have 777 permissions (rwxrwxrwx) by default.
    Default umask is 022, so the resulting directory permissions will be 775 (rwxrwxr-x).
        Owner: Full permissions (rwx).
        Group: Full permissions (rwx).
        Others: Read and execute permissions (r-x), but no write access.

4. ls -ld dirtwo

    The ls -ld dirtwo command lists detailed information about the directory dirtwo.
    The permissions will be shown as 775 (rwxrwxr-x), where:
        The owner (user) can read, write, and execute inside the directory.
        The group can also read, write, and execute inside the directory.
        Others can read and execute (search and list contents), but cannot modify or create files inside the directory.

5. umask 077

    The umask 077 command sets the umask value to 077.
        This means:
            Owner: No permission restrictions (full permissions).
            Group: No permission restrictions (full permissions).
            Others: No read, write, or execute permissions.
    With this umask, new files and directories will have more open permissions for the owner and group, but no permissions for others.

6. touch f3

    The touch f3 command creates an empty file named f3.
    Since the umask is now 077, the default file permissions will be calculated as:
        Default file permissions are 666 (rw-rw-rw-), and then the umask 077 removes read, write, and execute permissions for others.
        The resulting permissions for f3 will be 660 (rw-rw----).
            Owner: Read and write (rw-).
            Group: Read and write (rw-).
            Others: No permissions (---).

7. ls -l f3

    The ls -l f3 command lists detailed information about the file f3.
    The permissions will be shown as 660 (rw-rw----), meaning:
        The owner (user) has read and write permissions.
        The group also has read and write permissions.
        Others have no permissions at all.
        
        
        
##
touch f2
ls -l f2
mkdir dirtwo
ls -ld dirtwo
umask 077
touch f3
ls -l f3


Commands and Expected Output:

    touch f2
        This command creates an empty file named f2.
        With the default umask (likely 022), the default file permissions for f2 will be 666 (rw-rw-rw-), and the umask removes write permissions for group and others, so the final permissions will be 644 (rw-r--r--).

$ touch f2
$ ls -l f2

Expected Output:

-rw-r--r-- 1 user user 0 Jan 28 12:00 f2

Explanation: f2 has 644 permissions.

    mkdir dirtwo
        This command creates a directory named dirtwo.
        By default, directory permissions are 777 (rwxrwxrwx), but the umask 022 removes write permissions for the group and others, so the resulting directory permissions will be 755 (rwxr-xr-x).

$ mkdir dirtwo
$ ls -ld dirtwo

Expected Output:

drwxr-xr-x 2 user user 4096 Jan 28 12:01 dirtwo

Explanation: dirtwo has 755 permissions.

    umask 077
        The umask 077 command sets a new umask value, which means no permissions will be granted to the group and others.
        The owner will still have full permissions (read, write, and execute).

$ umask 077

    touch f3
        This creates an empty file named f3 with the umask 077 applied. The default permissions for files are 666 (rw-rw-rw-), and umask 077 removes all permissions for the group and others, resulting in 660 (rw-rw----) permissions.

$ touch f3
$ ls -l f3

Expected Output:

-rw-rw---- 1 user user 0 Jan 28 12:02 f3

Explanation: f3 has 660 permissions (rw-rw----), where:

    Owner: Read and write (rw-).
    Group: Read and write (rw-).
    Others: No permissions (---).

Final Summary of Commands and Results:

$ touch f2
$ ls -l f2
-rw-r--r-- 1 user user 0 Jan 28 12:00 f2

$ mkdir dirtwo
$ ls -ld dirtwo
drwxr-xr-x 2 user user 4096 Jan 28 12:01 dirtwo

$ umask 077

$ touch f3
$ ls -l f3
-rw-rw---- 1 user user 0 Jan 28 12:02 f3

Summary:

    File f2: Created with 644 permissions (rw-r--r--).
    Directory dirtwo: Created with 755 permissions (rwxr-xr-x).
    File f3: Created with 660 permissions (rw-rw----) after applying umask 077.


##
To make the umask setting persist across sessions, you need to add the umask command to a login script. A login script is executed whenever you log into the system, and adding the umask command there will ensure that the desired umask value is automatically applied to all sessions.
What This Means:

    When you add a umask command to a login script, you are telling the system to apply a default umask value every time a user logs in. This ensures that the file and directory permissions are consistent across sessions, even if the default umask value is different.

Common Login Scripts:

    ~/.bash_profile or ~/.profile: For bash or sh shells (most common for Linux users).
    ~/.bashrc: For interactive non-login bash shells.
    
    
## chmod

umask
op:0002

echo hello > new_file
cat new_file
op:
hello
ls -l new_file
-rw-r--r-- 1 user group 6 Jan 28 10:00 new_file

chmod -v 006 new_file
   


This command explicitly sets the permissions for the file new_file to 006.
Breakdown of 006:

    First digit (0): Special mode bits (not used here).
    Second digit (0): Owner has no permissions.
    Third digit (0): Group has no permissions.
    Fourth digit (6): Others have read (4) and write (2) permissions.

Result:

    After running chmod -v 006 new_file, the permissions will change to:

------rw- 1 user group 6 Jan 28 10:00 new_file

This means:

    Owner: No permissions (---).
    Group: No permissions (---).
    Others: Can read and write (rw-)
    
The -v option in the chmod command stands for verbose.

When you use chmod -v, it provides detailed output about what changes were made to the file's permissions. Essentially, it displays a message confirming the change.
Example:

chmod -v 006 new_file

Output:

mode of 'new_file' changed from 0644 (rw-r--r--) to 0006 (------rw-)     
    
* cat new_file
shows : permission deniedd
    
* chmod -v g=rw new_file
op:
mode of 'new_file' changed from 0006 (------rw-) to 0066 (----rw-rw-)

    g=rw is a symbolic mode for chmod. It specifies:
        g: Apply this change to the group permissions.
        =: Set the exact permissions (replacing the existing ones).
        rw: Give the group read (r) and write (w) permissions.
    The -v flag (verbose) will show a confirmation message about the change.

Result:

    Only the group permissions for new_file will be updated.
    Other permissions (owner and others) will remain unchanged.

* ls -l new_file
  op:
  ----rw-rw- 1 user group 6 Jan 28 10:00 new_file

Owner: No permissions (---).
Group: Read and write permissions (rw-).
Others: Read and write permissions (rw-).       

  
* chmod -v 666 new_file
* cat new_file
* chmod -v o= new_file
* chmod -v g-w new_file


    chmod 666 sets the permissions of the file new_file to rw-rw-rw- (octal 666).
        Owner: Read and write (rw-).
        Group: Read and write (rw-).
        Others: Read and write (rw-).

Example Output (of chmod -v):

mode of 'new_file' changed from ----rw-rw- to rw-rw-rw-

Permissions after this command:

rw-rw-rw- 1 user group 6 Jan 28 10:00 new_file

2. Command:

cat new_file

Explanation:

    This displays the contents of the file new_file.
    Since the file still has read permissions for the owner, group, and others (from chmod 666), you can read the file without issues.

Example Output (if the file contains "hello"):

hello

3. Command:

chmod -v o= new_file

Explanation:

    o= removes all permissions for others.
        o= means "set permissions for others to nothing."
    After this, others cannot read, write, or execute the file.

Example Output (of chmod -v):

mode of 'new_file' changed from rw-rw-rw- to rw-rw----

Permissions after this command:

rw-rw---- 1 user group 6 Jan 28 10:00 new_file

    Owner: Read and write (rw-).
    Group: Read and write (rw-).
    Others: No permissions (---).

4. Command:

chmod -v g-w new_file

Explanation:

    g-w removes the write permission from the group.
    After this, the group can only read the file.

Example Output (of chmod -v):

mode of 'new_file' changed from rw-rw---- to rw-r-----

Permissions after this command:

rw-r----- 1 user group 6 Jan 28 10:00 new_file

    Owner: Read and write (rw-).
    Group: Read only (r--).
    Others: No permissions (---).
    
## advanced permissions using symbols
umask 7
umask 
0007

mkdir -p upper/{d1,d2}  
tree upper

touch upper/d1/file1
ls -lR upper/
chmod -vR a+X upper
  
 
 
1. Command:

umask 7
umask

Explanation:

    umask 7 sets the umask value to 0007.
        A umask subtracts permissions from the default system permissions when creating new files or directories.
        0007 means others (o) and the group (g) will have no permissions by default. Only the owner will get full permissions.

Default permissions for new files/directories with umask 7:

    Files: 666 (rw-rw-rw-) - 007 = 660 (rw-rw----)
    Directories: 777 (rwxrwxrwx) - 007 = 770 (rwxrwx---)

Example Output:

$ umask 7
$ umask
0007

2. Command:

mkdir -p upper/{d1,d2}
tree upper

Explanation:

    mkdir -p upper/{d1,d2}:
        Creates a directory called upper with two subdirectories d1 and d2.
        The -p option ensures that intermediate directories are created if they don’t exist.

    tree upper:
        Displays the directory structure of upper and its contents.

Example Output:

$ mkdir -p upper/{d1,d2}
$ tree upper
upper
├── d1
└── d2

3. Command:

touch upper/d1/file1
ls -lR upper/

Explanation:

    touch upper/d1/file1:
        Creates an empty file file1 inside the d1 subdirectory of upper.

    ls -lR upper/:
        Lists the contents of the upper directory recursively, showing details of all files and directories.

Example Output:

$ touch upper/d1/file1
$ ls -lR upper/
upper/:
total 8
drwxrwx--- 2 user group 4096 Jan 28 10:00 d1
drwxrwx--- 2 user group 4096 Jan 28 10:00 d2

upper/d1:
total 0
-rw-rw---- 1 user group 0 Jan 28 10:00 file1

upper/d2:
total 0    

chmod -vR a+X upper

 Run chmod -vR a+X upper/

chmod -vR a+X upper/

This command does the following:

    -v shows the changes made.
    -R applies the change recursively to all files and directories inside upper/.
    a+X adds execute permissions to:
        directories (because you need execute permission to enter them).
        files that already have execute permission.
        
        
##
touch another_newfile

ls -l another_newfile
-rw-rw---- 1 antony antony 0 Jan 29 00:37 another_newfile
here others permissions are blocked 

chmod -v +x another_newfile
mode of 'another_newfile' changed from 0660 (rw-rw----) to 0770 (rwxrwx---)



chmod -v a+x another_newfile

mode of 'another_newfile' changed from 0770 (rwxrwx---) to 0771 (rwxrwx--x)

##
* owenership of a file can be controlled with chown and chgrp commands

cat new_file
op:hello
chmod 006 new_file
cat new_file
permission denied
ls -l new_file
-------rw- 1 vagrant vagrant 29 jan 25 1543 new_file
chown root new_file 
sudo !!
ls -l new_file
-------rw- 1 root vagrant 29 jan 25 1543 new_file
cat new_file
permission denied
id
sudo chgrp sudo new_file
ls -l new_file
-------rw- 1 root sudo 6 29 jan 25 15.43 new_file
cat new_file
hello
id
uid=1000(vagrant) gid=1000(vagrant) groups=1000(vagrant)

##
The minimum permissions for a file and a directory in Linux depend on the basic operations that you need to perform with them.
1. Minimum Permission for a File:

For a file, the minimum permissions required for basic access are:

    Read (r) permission: Allows the file to be viewed or read.
    Write (w) permission: Allows modifying the file.
    Execute (x) permission: Allows running the file if it's a script or a program.

At a minimum, for a file, you typically need read (r) permission to access its content. If you want to modify it, you need write (w) permission. If you want to execute it (if it's a script or a program), you need execute (x) permission.
Minimum file permissions:

    For a regular file: rw- (read and write) or r-- (read-only).
        rw- (Read and write permission for the owner, but no permissions for group and others): rw-------.
        r-- (Read permission for the owner, but no permissions for group and others): r--------.

2. Minimum Permission for a Directory:

For a directory, the minimum permissions needed for basic usage are:

    Read (r) permission: Allows listing the contents of the directory (i.e., seeing the files inside it).
    Execute (x) permission: Allows entering the directory (using cd) and accessing the files inside it.
    Write (w) permission: Allows adding, removing, or renaming files within the directory.

For a directory to be useful, at least execute (x) permission is required to access the directory and enter it.
Minimum directory permissions:

    For the owner to access and use the directory: r-x (read and execute permissions).
    For the directory to be accessible by others: You need execute permission for the group and others to be able to enter the directory.
        r-x (read and execute for the owner and group): r-xr-xr-x.

Summary of Minimum Permissions:

    File:
        Minimum read-only access: r-- (read-only for the owner).
        Minimum writable access: rw- (read-write for the owner).

    Directory:
        Minimum access to enter: --x (execute for others, no read).
        Minimum for the owner to read and enter: r-x (read and execute).

In short, the minimum for a directory is r-x (for the owner), and the minimum for a file is r-- (for read-only access).

## 

sudo mkdir -m 751 /shared
ls -ld /shared
drwxr-x--x 2 root root 4096 Jan 29 15:54 /shared
* here root comes as owner and group bcz of sudo
cd /shared/
ls
permission denied

sudo vim /shared/file1
enter : this is a file

sudo ls -l
-rw-r--r-- 1 root root 15 Jan 29 16:02 file1

cat file1
this is a file

cd 
cat /shared/file1
this is a file
##
How umask Works:

The umask value subtracts permissions from the default permissions. It is a 3-digit value, where each digit corresponds to user, group, and others respectively.

    umask 022: This means:
        Owner: Subtract 0 from the default permissions (so the owner gets rw-).
        Group: Subtract 2 from the default permissions (so the group gets r--).
        Others: Subtract 2 from the default permissions (so others get r--).

So, with a umask of 022, the default permissions when creating files will be 644 (rw-r--r--) and directories will have 755 (rwxr-xr-x).
What does umask 007 do?

    Owner: Subtract 0 (no change to default permissions).
    Group: Subtract 0 (no change to default permissions).
    Others: Subtract 7 (removes read, write, and execute permissions for others).

So, umask 007 would result in the following default permissions:

    Files: rw-rw---- (owner and group have read-write permissions, others have no permissions).
    Directories: rwxrwx--- (owner and group have full permissions, others have no permissions).

In Summary:

    A typical umask for a Linux terminal is 022, which results in files having rw-r--r-- permissions and directories having rwxr-xr-x.
    umask 007 is less common and restricts access for "others" completely, leaving only the owner and group with full access.

##searching for a content

* ls -ltr

The command ls -ltr is a combination of options used with the ls command to list files and directories in a specific way. Here's what each option does:

    -l: Long listing format – This option shows detailed information about each file or directory, such as permissions, number of links, owner, group, size, and the last modified date.
    -t: Sort by modification time – This option sorts the files and directories by their last modification time, with the most recently modified files appearing last.
    -r: Reverse order – This option reverses the order of the files. In combination with -t, it will show the most recently modified files first (in reverse order, meaning oldest files come last).
   
   
   op:
        
  $ ls -ltr
-rw-r--r-- 1 antony antony  324 Jan 28 16:02 file3
-rw-r--r-- 1 antony antony  567 Jan 29 11:14 file2
-rw-r--r-- 1 antony antony  896 Jan 29 12:56 file1


* ls -lhSr

-S: Sort by file size – This option sorts the files and directories by their size, with the largest files appearing first.

-r: Reverse order – This option reverses the sorting order. If used with -S, it will list the files from the smallest to the largest.

op:

-S: Sort by file size – This option sorts the files and directories by their size, with the largest files appearing first.

-r: Reverse order – This option reverses the sorting order. If used with -S, it will list the files from the smallest to the largest.


* find -type f -name '*.html'

find: This is the command used to search for files and directories in a directory hierarchy.

-type f: This option specifies that you want to find files (not directories). The f stands for "file." This ensures that only files will be included in the search results, excluding directories, symbolic links, etc.

-name '*.html': This option specifies the name pattern to match. In this case, it will look for files with the .html extension.

    The * is a wildcard that matches any string of characters, so this will match any file ending with .html.
    For example, it will match files like index.html, about.html, contact.html, etc.

op:

./index.html
./pages/about.html
./contact.html


* find /usr/share/doc -type f -name '*.html'

    ind: This command is used to search for files and directories in a directory hierarchy.

    /usr/share/doc: This specifies the starting directory for the search. The command will search within the /usr/share/doc directory and all its subdirectories for the specified files.

    -type f: This option tells find to search only for files (not directories, symlinks, or other types).

    -name '*.html': This option restricts the search to files whose name ends with .html. The * is a wildcard that matches any characters before .html.

What this does:

    It will search the /usr/share/doc directory and its subdirectories for files with the .html extension.
    
    
op:
/usr/share/doc/package1/manual.html
/usr/share/doc/package2/README.html


* find /usr/share/doc -type f -name '*.html' -exec cp {} ~/links/ \;

The command find /usr/share/doc -type f -name '*.html' -exec cp {} ~/links/ \; is used to search for .html files in the /usr/share/doc directory (and its subdirectories) and copy them to the ~/links/ directory.
Breakdown of the command:

    find /usr/share/doc: This tells find to start searching from the /usr/share/doc directory.

    -type f: This restricts the search to files only (ignoring directories, symlinks, etc.).

    -name '*.html': This restricts the search to files whose name ends with .html (e.g., index.html, manual.html, etc.).

    -exec cp {} ~/links/ \;: This part tells find to execute a command for each file it finds. The cp command is used to copy the file:
        {} is a placeholder that represents the current file found by find.
        ~/links/ is the destination directory where the file will be copied.
        \; ends the -exec command.

What happens when you run this command:

    find searches for all .html files inside /usr/share/doc and its subdirectories.
    For each .html file found, it executes the cp command to copy that file to the ~/links/ directory (which is typically the links folder inside your home directory).
    If the ~/links/ directory does not exist, the command will fail unless you create it beforehand.

Example:

Let's say you have the following files in /usr/share/doc/:

    /usr/share/doc/package1/manual.html
    /usr/share/doc/package2/readme.html

If you run the command, these files will be copied to ~/links/, so after the command is executed, ~/links/ will contain:

    manual.html
    readme.html
    
* find -type f -name '*.html' -delete
    
 find → Searches for files.
-type f → Finds only regular files (not directories).
-name '*.html' → Finds files with a .html extension.
-delete → Deletes the found files permanently.

*  find / -maxdepth 1 -type l   
    
    
find / → Starts searching from the root directory (/).
-maxdepth 1 → Limits the search to only the first level (i.e., no subdirectories).
-type l → Finds only symbolic links (l stands for link).

op:

/bin
/lib
/lib64
/sbin

  
This means that /bin, /lib, /lib64, and /sbin are symbolic links inside /.

  
  
 Understanding -maxdepth 1 in find Command

The -maxdepth option in the find command controls how deep the search goes into directories.
Example Explanation

When you run:

find / -maxdepth 1 -type l

It means:

    Start searching from the root directory (/).
    -maxdepth 1 means only check the first level (i.e., the / directory itself).
    Do not search inside any subdirectories.
    -type l means look for symbolic links only.

📌 Example:

Let's assume the / directory contains:

/
├── bin       → symlink to `/usr/bin/`
├── boot      → regular directory
├── lib       → symlink to `/usr/lib/`
├── home      → regular directory
├── etc       → regular directory
└── usr       → regular directory

If we run:

find / -maxdepth 1 -type l

Output might be:

/bin
/lib

This means /bin and /lib are symbolic links, and the command does not check inside /usr/, /etc/, or /home/.

 
  
* sudo nano /etc/hosts
deleted google entry
  
  
* find /etc -mmin 5
* find /etc -mmin +5
* find /etc -mmin -5
then we can see /etc/hosts


The -mmin option in the find command helps to find files based on modification time (in minutes).

Since you edited /etc/hosts (by deleting the Google entry), let's understand how these commands work:
1️⃣ find /etc -mmin 5 (Exact 5 Minutes Ago)

find /etc -mmin 5

    This searches for files modified exactly 5 minutes ago.
    It's rare to find files that were modified at that exact minute.

2️⃣ find /etc -mmin +5 (More than 5 Minutes Ago)

find /etc -mmin +5

    This finds files modified more than 5 minutes ago.
    For example, if a file was modified 10 minutes ago, it will be listed.
    But if it was just modified 3 minutes ago, it will not be shown.

3️⃣ find /etc -mmin -5 (Less than 5 Minutes Ago)

find /etc -mmin -5

    This finds files modified within the last 5 minutes.
    Since you just edited /etc/hosts, it should appear in the results.
    
    
* find /etc -mmin -5 -type f

-type f → Limit results to files only (ignores directories).

##
sudo apt update
sudo apt install -y mlocate
locate -S
locate hosts
locate -b hosts
locate -br '^hosts$'
rm hosts
locate -br '^hosts$'
locate -ebr '^hosts$'
locate -eibr '^hosts$'

##
sudo apt search python3 
sudo apt search python3 | wc -l
sudo apt search python3 --names-only | wc -l
sudo apt search '^python3' --names-only | wc -l
sudo apt search '^python3$' --names-only | wc -l
sudo apt search '^python3$' --names-only

wc -l /etc/ssh/sshd_config
grep '^#' /etc/ssh/sshd_config
grep -v '^#' /etc/ssh/sshd_config
grep -vE '^(#|$)' /etc/ssh/sshd_config
grep password /etc/ssh/sshd_config
grep -i password /etc/ssh/sshd_config
grep -i '^password' /etc/ssh/sshd_config
grep 'yes$' /etc/ssh/sshd_config
grep '^#.*yes$' /etc/ssh/sshd_config
grep '^[^#].*yes$' /etc/ssh/sshd_config


##

passwd --help
find --help
man find
man passwd
man 5 passwd
man man
ls /usr/share/doc


## archieving tools and linux

man tar
sudo du -sh /etc
sudo tar -cf etc.tar /etc
ls -lh etc.tar
tar -tf etc.tar
tar -xf etc.tar
ls
cd etc
pwd
sudo rm /etc/hosts
cat /etc/hosts
sudo tar -xf ~vagrant/etc.tar etc/hosts
!ca 
cat /etc/hosts

##
cd -
cd ls -lh
can see etc.tar
gzip etc.tar
ls -lh
can see etc.tar.gz
gunzip etc.tar.gz
ls -lh
can see etc.tar

bzip2 etc.tar
ls -lh
can see etc.tar.bz2
bunzip2 etc.tar.bz2
xz -z etc.tar
ls -lh
can see etc.tar.xz
unxz etc.tar.xz
ls -lh
can see etc.tar

##
sudo -i 
time tar -cf etc.tar /etc
time tar -czf etc.tar.gz /etc
time tar -cjf etc.tar.bz2 /etc
time tar -cJf etc.tar.xz /etc

ls -lh
tar -cJf doc.tar.xz /usr/share/doc &> /dev/null &
ps

##
find /usr/share/doc -type f -name '*.html' | cpio -ov > backup.cpio
mkdir restore && cd restore
ls
cpio -idv --no-absolute-filenames < ~/backup.cpio
ls
tree


## elevating user previlages

su
asking password, not know thw password
sudo passwd root
new passoword:
retype password:
password successfully updated
su
give the new password we have set .we switched to root user

su command in Linux stands for "substitute user" or "switch user". It allows you to switch to another user account, typically to the root user, to perform administrative tasks.


id

The id command in Linux is used to display the user ID (UID) and group ID (GID) of the current user or a specified user.

ps

The ps command in Linux is used to display information about running processes on the system.


op:
  PID TTY          TIME CMD
 1234 pts/0    00:00:00 bash
 5678 pts/0    00:00:00 ps


    PID: Process ID (Unique ID assigned to each process)
    TTY: Terminal (TTY) name where the process is running (pts/1 means a pseudo-terminal session)
    TIME: CPU time used by the process (both are 00:00:00, meaning they haven't used much CPU)
    CMD: Command that started the process

What These Processes Mean

    bash (PID 26439)
        This is your terminal shell (Bash), which you are currently using.
    ps (PID 27956)
        This is the ps command itself, which you just ran to check running processes.
        It disappears immediately after execution.
        

exit
 is used to exit the su session
 
 * su -l or su -
 switch to the root user with a login shell
 
  This switches to root and loads the root user's environment (as if you logged in directly).
It asks for the root password.
The prompt will change from $ (regular user) to # (root).


exit or ctrl+D

to return to your original user

su -l ubuntu
switch to another user .
asking password , not know then 
sudo su - ubuntu

This switches to ubuntu without asking for its password because sudo runs as root.
It loads the full environment of the ubuntu user (like su -l).
If you have sudo access, it will only ask for your own password (not ubuntu's password).

id 
Running the id command in Linux shows information about your user ID (UID), group ID (GID), and groups the ubuntu user belong to.

exit 
we can exit from ubuntu user

man su

sudo passwd -l root
op:
passwd: password expiry information changed

       
The output passwd: password expiry information changed indicates that the root password has been locked successfully. However, this message is just a confirmation that the system has updated the password expiry information for the root account, which includes locking the password.
What Happens After Locking the Root Account:

    The root user's password is disabled, meaning the root account cannot be used to log in directly (via su or login).
    This is typically done to prevent direct root access, increasing system security by forcing users to access administrative privileges through sudo.

What You Can Do Next:

    Verify if the root account is locked:
    Run the following command to check the account status:

sudo passwd -S root

Output might look like this:

root LK 2025-01-30 0 99999 7 -1 (Locked)

    LK: Means locked.
    If it's PS, the account is unlocked.

To Unlock the Root Account:
If you want to unlock the root account again (allow login), use:

sudo passwd -u root



* sudo su -l:

    You will not need the root password since sudo allows you to run the command with root privileges.
    You will be switched to the root user, even if the root account is locked, because sudo gives you the necessary permission to run su as root.
    The root account is still locked (it doesn't get unlocked by sudo su -l), but the sudo access lets you temporarily become the root user.


##
sudo -l

##














  
