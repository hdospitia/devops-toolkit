#!/usr/bin/bash
set -o pipefail
set -uvxe

# This script aims to deploy an Oracle VirtualBox VM.

vmname=test-vm
vmpath=/media/dani/data/vms/${vmname}
ostype=Linux_64
cpu_count=4
memory_size=8192
vram_size=128
storage_filename=${vmname}.vdi
storage_size=20000
storage_controller_name=sata
storage_controller_type=IntelAhci
storage_system_bus_type=sata
cdrom_controller_name=ide
cdrom_system_bus_type=ide
os_iso_file=/home/dani/Downloads/Parrot-htb-5.1_amd64.iso

VBoxManage createvm --name ${vmname} --basefolder ${vmpath}\
    --ostype ${ostype} --register

VBoxManage createmedium --filename ${storage_filename} --size ${storage_size}

VBoxManage storagectl ${vmname} --name ${storage_controller_name} \
    --add ${storage_system_bus_type} --controller ${storage_controller_type}

VBoxManage storageattach ${vmname} --storagectl ${storage_controller_name} \
    --port 0 --device 0 --type hdd --medium ${storage_filename}

VBoxManage storagectl ${vmname} --name ${cdrom_controller_name} --add ${cdrom_system_bus_type}

VBoxManage storageattach ${vmname} --storagectl ${cdrom_controller_name} \
    --port 0 --device 0 --type dvddrive --medium ${os_iso_file}

VBoxManage modifyvm ${vmname} --memory ${memory_size} --vram ${vram_size} \
    --cpus ${cpu_count} --ioapic on --boot1 dvd --boot2 disk --boot3 none --boot4 none \
    --usbxhci on --accelerate3d on --graphicscontroller vmsvga




