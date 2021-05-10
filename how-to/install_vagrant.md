# Install Vagrant
Vagrant is a tool for building and managing virtual machine environments in a single workflow which lowers development environment setup time and increases production parity. 

## Notice
The Package Manager method's explanation is based on Ubuntu distribution of GNU/Linux. For more distributions explanations, please visit [Vagrant's Official Website](https://www.vagrantup.com).

## Installation Guide
You can either download the latest version from [Vagrant](https://www.vagrantup.com/downloads) website and install it, or use your package manager instead.
Here's an explanation of both methods:
* #### Using Zip File
* #### Using Package Manager

### Using Zip File
First, download the Vagrant's latest zip file on your host using:
```
wget https://releases.hashicorp.com/vagrant/2.2.16/vagrant_2.2.16_linux_amd64.zip
```
After the file has been downloaded, you need to unzip the file using the command below:
```
unzip vagrant_2.2.14_linux_amd64.zip
```
In order to use the command globally, copy the extracted contents to binary directory:
```
sudo cp vagrant /usr/local/bin/
```
You can confirm the installation by checking the version:
```
vagrant version
```
### Using Package Manager
In this method, as the [Vagrant's Official](https://www.vagrantup.com/downloads) download page mentions, you need to run these commands in order:
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install vagrant
```
And check the installed version using:
```
vagrant version
```
## Start With Vagrant

### Making A Directory
It's better to create a directory to store your VM's Vagrantfile:
```
mkdir vagrant && cd vagrant
```

### Initialize Vagrant
To initialize your first VM, use:
```
vagrant init
```
This command, will create a Vagrantfile which configures your VM. You can change it with your own customizations.

### Boxs
Vagrant boxes help you create your VM based on different platforms. They include a readily-available Vagrantfile which can be altered. Boxes can be downloaded
from the [Official Vagrant's](https://app.vagrantup.com) Boxes page.
Use this command to initialize your VM with Ubuntu 20.04:
```
vagrant init ubuntu/focal64
```
Another option would be configuring Vagranfile:
```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
end
```
Use this command to see all your Vagrant boxes:
```
vagrant boxes list
```

### Basic Commands
* To run your VM:
```
vagrant up
```

* To shut down your VM:
```
vagrant halt
```

* To suspend your VM:
```
vagrant suspend
```

* To validate the Vagrantfile:
```
vagrant validate
```

* To provision your VM:
```
vagrant provision
```

* To run your VM without provisioning:
```
vagrant up --no-provision
```

* To SSH into your VM:
```
vagrant ssh
```
If you are using VirtualBox's GUI, the default user and password of your VM would be **'vagrant'** and **'vagrant'**. 

* To destroy your VM and associated files and drives:
```
vagrant destroy
```

* To destroy it with force:
```
vagrant destroy -f
```
* To check your VM status
```
vagrant status
```

* To check all your VMs' status
```
vagrant global-status
```

* To reload your VM:
```
vagrant reload
```

# References
* [Vagrant Docs](https://www.vagrantup.com/docs)
