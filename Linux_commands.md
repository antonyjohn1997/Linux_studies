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

