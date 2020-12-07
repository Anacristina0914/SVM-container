<p align="center">
  <b>Welcome to the final presentation of BDP1</b>
</p>
<p align="center">
  <img src="https://i1.wp.com/www.associazionegeart.com/wp-content/uploads/2017/10/unibo-logo-big.png?ssl=1" width="300">
</p>


### Building a Cloud IaaS Infrastructure using Amazon Web Services (AWS)
<p align="justify">
In the following steps I will describe the creation of a small computing infrastructure using Amazon Web Services (AWS). On top of the infrastructure an HT Condor cluster was configured and tested to run a scientific application. The condor cluster consisted of 3 working nodes and a master node which was also configured to serve as a working node. The scientific application run was an implementation of Support Vector Machines (SVM) to train and predict secondary structure of a set of test proteins. 
</p>

<p align="center">
  <img src="https://cdn.mos.cms.futurecdn.net/u27XxjDb49PgyDaHXMcd2i.jpg" width="400">
</p>

## 1.   Configuring the AWS instances
<p align="justify">
In total, 4 virtual machines (instances) were configured using Amazon Web Services Cloud Computing Services (https://aws.amazon.com/). The four instances corresponding to the 3 worker nodes and the master (also worker node) were of the type t2.medium (2 vCPUs, 4GB of RAM) and were configured in the same time zone to allow communication via private IP addresses, us-east-1b was chosen for being one of the cheepest regions provided by AWS. Furthermore, a shared security group was configure to allow all outbound communications and all TCP, all UDP and ICMP inbound from within the same security group and my personal computer (since some of the data was transfered from my personal computer directly to the virtual machines.
  
<p align="center">
  <img src="https://imagesfinalproject.s3.amazonaws.com/InboudSecurityRules.png" width="650">
</p>
  
```markdown
Syntax highlighted code block

# Header 1
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
