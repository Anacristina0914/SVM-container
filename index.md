<p align="center">
  <img src="https://i1.wp.com/www.associazionegeart.com/wp-content/uploads/2017/10/unibo-logo-big.png?ssl=1" width="280">
</p>


## Building a Cloud IaaS Infrastructure using Amazon Web Services (AWS)
<p align="justify">
In the following steps I will describe the creation of a small computing infrastructure using Amazon Web Services (AWS). On top of the infrastructure an HT Condor cluster was configured and tested to run a scientific application. The condor cluster consisted of 3 working nodes and a master node which was also configured to serve as a working node. The scientific application run was an implementation of Support Vector Machines (SVM) to train and predict secondary structure of a set of test proteins. 
</p>

<p align="center">
  <img src="https://cdn.mos.cms.futurecdn.net/u27XxjDb49PgyDaHXMcd2i.jpg" width="380">
</p>

### 1.   Configuring the AWS instances
<p align="justify">
In total, 3 virtual machines (instances) with Red Hat Enterprise Linux (RHEL) 7.6 operating system were configured using Amazon Web Services Cloud Computing (https://aws.amazon.com/). The three instances corresponding to 2 worker nodes and a master node (also configured to function as a worker node) were of the type t2.medium (2 vCPUs, 4GB of RAM), and were configured in the same sub network to allow communication via private IPv4 addresses: us-east-1b was chosen for being one of the cheepest regions provided by AWS. Furthermore, a shared security group was configured to allow all outbound communications, and TCP, UDP and ICMP inbound communication protocols from within the same security group and my personal computer. This was particularly important to allow communication between the nodes, for configuring the Network Attached Storage (NAS), to test connectivity using <i>ping</i> requests, and to transfer the files used for training and testing from my personal computer to the virtual machines via the SCP protocol.  
</p>

<p align="center">
  <img src="https://imagesfinalproject.s3.amazonaws.com/InboudSecurityRules.png" width="650">
</p>

### 2.   Creating a volume and configuring a DNS and NAS
#### Master node  
<p align="justify">
When the instances were created, each of them consisted of a 10Gb SSD memory that included the operating system and software necessary to operate. Furthermore, a new 100 GB magnetic hard drive volume was created in the AWS console by following: volumes > create volume. The configuration is shown in the image below:
</p>

<p align="center">
  <img src="https://imagesfinalproject.s3.amazonaws.com/Volume+creation.png" width="650">
</p>

<p align="justify">
Once the volume was created, it was attached to the instance by choosing the option actions > attach volume and selecting the instance (in this case our master node) to which we wanted to attach the volume created. We need to perform this step prior to mounting the volume.
</p>  

<p align="justify">
Once the new volume had been created and attached to the master instance, the new volume configured and mounted as a Direct Attached Storage (DAS) into the master node. Diferently from the exercise performed in class, the new volume was created empty, and a partition (xvdf1) containing a ext4 POSIX file system for linux was configured using <i>mkfs</i> and mounted on a subdirectory of the home directory. 
</p>

<p align="justify">
In order to make the master node easily identifiable, the prompt was configured by adding the <b>1.</b> line at the end of the bashrc configuration file and then typing the <b>2.</b> command on the console:
</p>

1. `PS1="\[\033[01;32m\]\u@Master\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "`    
2. `source .bashrc`

<p align="justify">
The following line of code was added to the /etc/fstab file in order to mount the partition containing the ext4 file system (fs) into our home directory subdirectory "data_svm", and then we used <i><b>mound -a</i></b> to mount all the partitions contained in the /etc/fstab file:
</p>
 
`/dev/xvdf1     /home/ec2-user/data_svm  ext4 defaults 0 0`

<p align="justify">
After the volume was mounted into the 'data_svm' directory, a NFS server (nfs-utils) was installed into the master node in order to create the Network Attached Storage (NAS). The NFS server was configured and activated. The /etc/exports file was modified to indicate which directory was to be shared and to which IP addresses, and then the <i>exportfs -r</i> command was used to start sharing the data. The line added to the exports file is listed below.
</p>

`/home/ec2-user/data_svm 172.31.0.0/16(rw,sync,no_wdelay)`

<p align="justify">
In this way the "data_svm" folder which would contain the data necessary to run our scientific application would be shared among all of our working nodes. When configuring the /etc/exports file we need to make sure that all the IPv4's of the machines with which the volume will be shared are listed, otherwise the volume won't be shared. This becomes a problematic when we want to add more nodes, because we would need a single line of code for every new node we introduce to the cluster. To avoid this we added a single line to indicate the NFS server to share the volume with all the instances in the sub network domain 172.31, the /16 indicates that we are using a subnetwork mask and not a specific IP address. It is worthwile to mention that this does not represent a significant security risk, since all the instances belong to the same private network, meaning only the machines created within the same private network will be capable of accessing the shared volume.  
</p>

<p align="justify">
In order to create a computer cluster, HTCondor was installed in the master node. 


**Since some of the files transfered were heavy, the md5 checksum string of several files was obtained and compared before and after the transfer to ensure data integrity.**

## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.

<p align="center">
  
# Thank you
<img src='https://media1.giphy.com/media/3WY8qMF9l3ldK/giphy.gif'  height="150" width="150">
</p>
