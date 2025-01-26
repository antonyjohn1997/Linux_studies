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


 
