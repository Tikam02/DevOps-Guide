# Installing Helm
Helm is the package manager for Kubernetes, and you can read detailed background information in the [CNCF Helm Project Journey report](https://www.cncf.io/cncf-helm-project-journey-report/).

## Installation Procedure
This guide shows how to install the Helm CLI. Helm can be installed either from source, or from pre-built binary releases.

# From the Binary Releases
Every release of Helm provides binary releases for a variety of OSes. These binary versions can be manually downloaded and installed.

1. Download your desired [version](https://github.com/helm/helm/releases)
2. Unpack it (tar -zxvf helm-v3.0.0-linux-amd64.tar.gz)
3. Find the helm binary in the unpacked directory, and move it to its desired destination (mv linux-amd64/helm /usr/local/bin/helm)


## From Script
Helm now has an installer script that will automatically grab the latest version of Helm and install it locally.

You can fetch that script, and then execute it locally. It's well documented so that you can read through it and understand what it is doing before you run it.

```
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```

## Through Package Managers
The Helm community provides the ability to install Helm through operating system package managers. These are not supported by the Helm project and are not considered trusted 3rd parties.

### Mac OS
```
brew install helm
```

### Chocolatey (Windows)
Members of the Helm community have contributed a Helm package build to [Chocolatey](https://chocolatey.org/). This package is generally up to date.
```
choco install kubernetes-helm
```

### Linux Debian/Ubuntu based
Members of the Helm community have contributed a [Helm package](https://helm.baltorepo.com/stable/debian/) for Apt. This package is generally up to date.

```
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```
### From Snap
The [Snapcrafters community](https://github.com/snapcrafters) maintains the Snap version of the [Helm package](https://snapcraft.io/helm):
```
sudo snap install helm --classic
```


# From Source (Linux, macOS)
Building Helm from source is slightly more work, but is the best way to go if you want to test the latest (pre-release) Helm version.
You must have a working Go environment.
```
$ git clone https://github.com/helm/helm.git
$ cd helm
$ make
```

If required, it will fetch the dependencies and cache them, and validate configuration. It will then compile helm and place it in bin/helm.

