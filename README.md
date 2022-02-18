
# Welcome

![Bayport](/Bayport_Logo.png)

Welcome to Bayport's DevOps skills assessment.
Please use this template to create your own repository of this test and share your repo with us. Please answer all questions on this assessment.
# General Instructions
* Click on the "Use This Template" button. This will allow you to create a copy of this repository on your own GitHub account.
* Give your repository a name. Keep the repository public as you'll need to share it with us to review.
* When you've completed all the questions, share your repository with us by sending us the repo's URL.
# Linux
* What is the command to list the contents of a direcory, line by line and ordered by size ascending in human readable format?
	ls -lShr  (used man ls -to check the -S arg)

* How would you add a DNS server to a network interface in Linux?
	Add a nameserver entry to /etc/resolv.conf , unclear whats meant by interface, can set for different domains, not interface afaik	

* If the DNS server you've just added is not reachable, how can you get any particular hostname to resolve locally? 
	Add an entry to /etc/hosts with the IP and dns name 

* How would you check for SELinux related errors?
	start by inspecting syslog and /var/log/audit/audit.log

* Write the commands to add 30GB disk space to a logical volume named "docker" that belongs to a logical group named "docker-group".
	lvextend -L +30G docker-group/docker

* In the root of this repository, create a Bash script called "listit.sh", when executed, this script must do the following (in order):
    * Create a file called directories.list that contains the directory names only of the current directory.
    * Add a line at the beginning of the directories.list file that reads "line one's line".
    * Output the first three lines of directories.list on the console.
    * Accept an integer parameter when executed and repeat the previous question's output x amount of times based on the parameter provided at execution.
* Commit and push your changes.

# Docker
* In the root of this repository, create a Dockerfile that is based on the latest mariadb image.
    * Expose port 3307.
    * Define an evironment variable called BRUCE with a value of WAYNE.
    * Run a command that will output the value from BRUCE into a file called BATCAVE in the root directory of the container. 
* Create a Bash script in the root of this repository called FLY.sh that will do the following:
    * Install Docker if it is not yet installed.
    * Ensure the installed version of Docker is the latest version available.
    * Start a container using the image you've craeted above with your Dockerfile - this container must run as follows:
        * It must be named ALFRED.
        * It must mount /var/lib/mysql to the host operating system to /var/lib/mysql.
        * It must mount /BATCAVE to the host operating system. *** Notes below
    * Checks whether a container exists called ALFRED and if it does, removes an recreates it. 
    * Create a schema in the database called "wayneindustries" with one table in it called "fox" with columns "ID" and "Name". in db.sql
    * Insert an entry with ID "50" and Name "BATMOBILE". in db.sql
* Create an encrypted file called "secret" in the root of this repository that contains the root password of the database (the password must be "thisisadatabasepassword123456789!"). - Needed to look this up
* Change your Bash script to start the conainer using the root password from the "secret" file.
* Commit and push your changes.

*** BATCAVE mount.
Could not get this to work and left out. From the docker reference, creating a new volume mount should work in this case as it will copy the contents from the image but this only seems to work on directories. Straight bind mount from host overrides the content of whats in the image so I knew thats not what you wanted.


# OpenShift / OKD
For the questions below, please make use of the OpenShift CLI (oc) where applicable.
* Write the command used to login to a remote OpenShift cluster.
* Write the command to add the "cluster-admin" cluster role to a user called "clark".
* Write the command used to list all pods in the "smallville" project (namespace).
* Write the command to scale an application (deployment config) called "dailyplanet" to 2 pods.
* Write the command to gain remote shell access to a pod called "lex" in the "smallville" project (namespace).
* Write the command to export a secret called "loislane" in JSon format, the secret is in the "dailyplanet" project (namespace).
* Add a file called "Krypton" (in YAML format) to this repo that contains the resource defintion for a Persistent Volume Claim with the following properties:
    * Points to a Persistent Volume called "zod".
    * Requests 5GB of storage.
    * The volume can be mounted as read-write by more than one node.
# General
* How would you ensure any change made to this Dockerfile is source controlled, approved, tested and deployed. Explain which tools you will use as if this was going into a production environment. git does this, use a prod branch and pull request to merge it after approvals. Testing and security scans can be part of your build pipeline before adding the image to your artifact repo.
* Commit and push your changes.
