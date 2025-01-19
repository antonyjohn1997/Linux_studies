General Commands

Updating and Installing Packages

## Update the package list:

 sudo apt update

Sample Output:

Hit:1 http://archive.ubuntu.com/ubuntu focal InRelease
Get:2 http://security.ubuntu.com/ubuntu focal-security InRelease [114 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
...
Reading package lists... Done

## Install a package (e.g., info):

 sudo apt install info

Sample Output:

Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  info
0 upgraded, 1 newly installed, 0 to remove and 5 not upgraded.
Need to get 205 kB of archives.
After this operation, 510 kB of additional disk space will be used.
Do you want to continue? [Y/n]

Getting Help and Documentation

## Manual pages for a command (e.g., wget):

 man wget

Sample Output:

WGET(1)                             GNU Wget                            WGET(1)

NAME
    Wget - The non-interactive network downloader.

SYNOPSIS
    wget [option]... [URL]...

## Display help for wget directly:

 wget --help

Sample Output:

GNU Wget 1.21.2, a non-interactive network downloader.

Usage: wget [OPTION]... [URL]...

Mandatory arguments to long options are mandatory for short options too.
  -V,  --version          display the version of Wget and exit
  -h,  --help             print this help

## Pipe the help output to less for easier navigation:

 wget --help | less

Sample Output:
(Scrollable text; press q to exit.)

## Determine the type of wget:

 type wget

 it will tell you where the wget command is located in your system, specifically the path to the binary file that gets executed when you type wget.

Sample Output:

wget is /usr/bin/wget

## info then type / then type on search wget 

## Search for details about wget using info:

 info wget

Sample Output:

File: wget.info,  Node: Top,  Next: Overview,  Up: (dir)

Wget Manual
***********

GNU Wget is a free utility for non-interactive download of files from the Web.

File and Directory Management

## Change directory:

cd


## List files in a directory:

 ls

Sample Output:

Documents  Downloads  Pictures  Videos

## Show hidden files:

 ls -a

Sample Output:

.  ..  .bashrc  .profile  Documents  Downloads

## Display detailed file information:

 ls -l

Sample Output:

total 12
drwxr-xr-x 2 user user 4096 Jan 19 11:22 Documents
drwxr-xr-x 2 user user 4096 Jan 19 11:22 Downloads
-rw-r--r-- 1 user user    0 Jan 19 11:23 example.txt

## Display human-readable file sizes:

ls -lh

Sample Output:

total 12K
drwxr-xr-x 2 user user 4.0K Jan 19 11:22 Documents
drwxr-xr-x 2 user user 4.0K Jan 19 11:22 Downloads
-rw-r--r-- 1 user user    0 Jan 19 11:23 example.txt

## List files sorted by time:

 ls -lht

Sample Output:

total 12K
-rw-r--r-- 1 user user    0 Jan 19 11:23 example.txt
drwxr-xr-x 2 user user 4.0K Jan 19 11:22 Downloads
drwxr-xr-x 2 user user 4.0K Jan 19 11:22 Documents

Creating and Managing Files

## Create files with specific names:

 touch this_is_my_story
 touch "this is my story"
 touch another\ four\ word\ name
 touch another-four-word-name

Sample Output:

(No output; creates empty files with the specified names.)

Verify created files:

ls

Sample Output:

another-four-word-name  another four word name  this is my story  this_is_my_story

Networking Commands

## Display IP address information:

 ip addr

Sample Output:

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:1a:2b:3c:4d:5e brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.100/24 brd 192.168.1.255 scope global dynamic eth0
       valid_lft 86394sec preferred_lft 86394sec

## Connect to a remote server via SSH:

 ssh ubuntu@10.0.70.110

Sample Output:

The authenticity of host '10.0.70.110 (10.0.70.110)' can't be established.
ECDSA key fingerprint is SHA256:abc123xyz456.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '10.0.70.110' (ECDSA) to the list of known hosts.
ubuntu@10.0.70.110's password:

Exploring System and User Files

## List the contents of /etc:

 ls -l /etc

Sample Output:

total 2444
drwxr-xr-x 3 root root    4096 Jan 19 11:20 apache2
-rw-r--r-- 1 root root     300 Jan 19 11:20 passwd
...

## View /etc/passwd file (contains user information):

 cat /etc/passwd

Sample Output:

root:x:0:0:root:/root:/bin/bash
user:x:1000:1000:User:/home/user:/bin/bash

## View .bashrc file (user shell configuration):

 less .bashrc

## View .profile file (user profile settings):

 less .profile

## View /etc/profile file (global profile settings):

 less /etc/profile

Archiving and Compressing Files

## Extract a .tar.gz file:

 tar xzf nmap-7.70.tar.gz

 The command tar xzf nmap-7.70.tar.gz is used in Linux to extract the contents of a compressed tarball file named nmap-7.70.tar.gz.


## navigating the linux file system 

Cd  

Ls 

Pwd 

Mkdir 

Touch 

Nano file1 

Cp file1 newdata/ 

Cp file* newdata/        all files named file copied to newdata/ 

Rm file?      it remove all file with name file and single digit 

Suppose we have file1 file2 file3 file12 file13 , when we run this command then file12 and file 13 still remain there. 
##
Rm file* 

This remove all file named file with any digit 

 
##
Mv ../file* .      this move all files from preve directory to current directory 

Ls  
then we can see all moved files in here 
##
Rmdir newdata/   it remove directory called newdata . 

 
##
Locate adduser 

The locate command in Linux is used to quickly find files or directories on your system. 
##
Sudo updatedb 

The sudo updatedb command updates the locate database on your Linux system. This database is used by the locate command to quickly search for files and directories. 
##
/var/log/syslog 

The /var/log/syslog file is a log file in Linux systems that contains general system activity logs, including messages from the kernel, system services, and various software. It is one of the most important log files for monitoring and troubleshooting system events. 

 
##
Cat /etc/group | grep ubuntu 

Cat /etc/group | grep ubuntu >> newfile 

Cat newfile 

The /etc/group file is a configuration file in Linux systems that defines the groups on the system. It contains information about user groups and their associated members. 

Purpose of /etc/group 

    Groups: A group is a collection of users. Groups are used to assign permissions for files and directories to multiple users at once, rather than individually. 

    Group Membership: The file contains the list of users that belong to each group. 

 

Example /etc/group File 

root:x:0:root 

    Group name: root 

    Group password: x (not used) 

    GID: 0 (ID for the root group, typically the primary administrative group) 

    Members: root 

 

| grep ubuntu: 

The pipe (|) sends the output of the cat /etc/group command to grep, which searches through the output for the string ubuntu. 

    grep ubuntu filters and only shows lines that contain the string ubuntu. This can match group names, group members, or any part of the line with "ubuntu". 

>> newfile: 

The >> operator appends the output of the previous command to a file named newfile. If newfile doesn't exist, it will be created. 

    Append: >> ensures that the output is added to the end of the file rather than overwriting the file. If you used >, it would overwrite the file. 

 

Cat /etc/group | grep ubuntu > newfile 

 

> newfile: 

The > operator redirects the output of the previous command to a file named newfile. 

    Overwrite: If newfile already exists, it will be overwritten with the new content. If it doesn't exist, it will be created. 

## 

Head /etc/group 

will display the first 10 lines of the /etc/group file, similar to: 

root:x:0:root 

daemon:x:1:daemon 

bin:x:2:bin,sys 

sys:x:3:sys 

adm:x:4:syslog 

tty:x:5:tty 

staff:x:6:staff 

lp:x:7:lp 

disk:x:8:disk 

games:x:9:games 

 

## 

Tail /etc/group 

Print last 10 lines 

## 

Cut –d :  -f3  /etc/group 

the command cut -d : -f3 /etc/group is used to extract and display the third field from each line of the /etc/group file, where the fields are delimited by a colon (:). 

Explanation: 

    cut: The cut command is used to split a file into sections based on delimiters. 

    -d :: This option tells cut to use a colon (:) as the delimiter between fields. 

    -f3: This option specifies that you want to extract the third field (the Group ID (GID)) from each line. 

    /etc/group: This is the file being processed, which contains information about system groups. 

Example /etc/group Line: 

root:x:0:root 

daemon:x:1:daemon 

bin:x:2:bin,sys 

sys:x:3:sys 

adm:x:4:syslog 

Output: 

Running cut -d : -f3 /etc/group will produce: 

0 

1 

2 

3 

4 

 

## 

Cut –d :  -f3 /etc/group | sort  -n 

Print values from small to large 

## 

Cut –d: -f3 /etc/group | sort –rn 

Print values from large to small 

## 

 

Wc /etc/group 

The command wc /etc/group is used to display the word count (i.e., the number of lines, words, and characters) in the /etc/group file. 

 

 

 

 

 

 

 

 