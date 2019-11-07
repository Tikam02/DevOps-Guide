# Puppet Commands

### FACTER

| Command | Description |
| ------- | ----------- |
| `facter` | show all facters |
| `facter osfamily` | show OS Family facter |
| `facter -y` | show facters in YAML|
| `facter -j` | show facters in JSON |
| `facter -p | grep pe_` | get Puppet Enterprise version |
| `facter -p | grep aio` | get Puppet agent All-in-one version |
| `notify { "OS is ${::facts['operatingsystem']}": }` | use fact inside a manifest using 'facter' function |
| `notify { "OS is $::operatingsystem": }` | use fact inside manifest directly |
| `$::operatingsystemmajrelease` | get OS major release from manifest |

### PUPPET AGENT

| Command | Description |
| ------- | ----------- |
| `puppet agent --test (or -t)` |Apply catalog using -verbose, -ignorecache, -no-daemonize -detailed-exit-codes, -show_diff |
| `puppet agent -t --debug` |Run in debug mode with more output |
| `puppet agent -t --noop ` | Run simulation (no changes to system)|
| `puppet agent -t --environment development` | Run catalog for different environment than whats configured in Puppet Agent's conf file |
| `puppet agent --disable` | Disable puppet agent from running on node|
| `puppet agent --enable` | Enable puppet agent to run on node |
| `puppet resource package` | show all installed packages |
| `puppet resource package apache ensure=present/absent` | install or remove package |
| `puppet resource` | show all managed resources |
| `puppet agent -t --graph` |show a graph of all dependencies found in a catalog, stored in a .dot image |



 






































