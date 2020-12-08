<p align="center">
  <img src="https://i1.wp.com/www.associazionegeart.com/wp-content/uploads/2017/10/unibo-logo-big.png?ssl=1" width="280">
</p>


## Building a Cloud IaaS Infrastructure using Amazon Web Services (AWS)
<p align="justify">
In the following steps I will describe the creation of a small computing infrastructure using Amazon Web Services (AWS). On top of the infrastructure an HT Condor cluster was configured and tested to run a scientific application. The condor cluster consisted of 3 working nodes and a master node which was also configured to serve as a working node. The scientific application run was an implementation of Support Vector Machines (SVM) to train and predict secondary structure of a set of test proteins. 
</p>

<p align="center">
  <img src="https://cdn.mos.cms.futurecdn.net/u27XxjDb49PgyDaHXMcd2i.jpg" width="350">
</p>

### 1.   Configuring the AWS instances
<p align="justify">
In total, 2 virtual machines (instances) with Red Hat Enterprise Linux (RHEL) 7.6 operating system were configured using Amazon Web Services Cloud Computing (https://aws.amazon.com/). The two instances corresponding to 1 worker node and a master node (also configured to function as a worker node) were of the type t2.medium (2 vCPUs, 4GB of RAM), and were configured in the same time zone to allow communication via private IP addresses: us-east-1b was chosen for being one of the cheepest regions provided by AWS. Furthermore, a shared security group was configured to allow all outbound communications, and TCP, UDP and ICMP inbound communication protocols from within the same security group and my personal computer. This was particulary important to allow communication between the nodes, for configuring the Network Attached Storage (NAS) and to transfer the files used for training and testing from my personal computer to the virtual machines via the SCP protocol.  
</p>

<p align="center">
  <img src="https://imagesfinalproject.s3.amazonaws.com/InboudSecurityRules.png" width="600">
</p>

### 2.   Creating a volume and configuring a DNS and NAS
<p align="justify">
When the instances were created, each of them contained a 10Gb SSD memory that included the operating system and software necessary to operate. Furthermore, a 100GB magnetic hard drive volume was created, mounted and configured as a Direct Attached Storage (DAS) attached to the master node. Diferently from the exercise performed in class, the new volume was created empty and a partition (xvdf1) containing a ext4 POSIX file system for linux was configured and mounted on a subdirectory of the home directory. The following line code was added to the /etc/fstab file in order to mount the partition containing the ext4 fs into our home directory subdirectory:
</p>

`/dev/xvdf1     /home/ec2-user/data_svm  ext4 defaults 0 0`


In order to create the Network Attached Storage (NAS), a NFS server and client (nfs-utils) was installed in the master node containing the DAS, and the worker node respectively. 


**Since some of the files transfered were heavy, the md5 checksum string of several files was obtained and compared before and after the transfer to ensure data integrity.**

## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/Anacristina0914/SVM-container/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
