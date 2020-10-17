# Installing VirtualBox

VirtualBox is a hypervisor used to run operating systems in special environment, called virtual machines, on top of the existing operating system.

## Installation Procedure

* Make sure the host modules are installed for your distribution. Kernel headers may also be needed if your operating system does not come with one by default.
* Install the virtualbox package. Use your distributions package manager.
    - For `apt` use `$ sudo apt install virtualbox`
    - For `pacman` user `$ sudo pacman -Syu virtualbox`

## Using custom kernel

If using a custom kernel with `CONFIG_MODULE_SIG_FORCE` enabled, the modules must be signed manually with a key generated during kernel compilation.

Navigate to your kernel tree folder and execute the following command:
```sh
# for module in `ls /lib/modules/$(uname -r)/kernel/misc/{vboxdrv.ko,vboxnetadp.ko,vboxnetflt.ko}` ; do ./scripts/sign-file sha1 certs/signing_key.pem certs/signing_key.x509 $module ; done
```

## Manually load the VirtualBox kernel module

To load the modules manually, the command `# modprobe vboxdrv` should be run.

For more advanced configuration `vboxnetadp` and `vboxnetflt` can be used. These modules are need for bridged and hostonly networking feature.

## Accessing the USB devices in guest

For accessing USB devices inside guest, the authorized users must be in the `vboxusers` groups.

---

> More detailed instructions, common problem and their solutions can be found at the [Arch Wiki for VirtualBox](https://wiki.archlinux.org/index.php/VirtualBox)
