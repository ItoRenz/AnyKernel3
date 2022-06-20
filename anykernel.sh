# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=mi8937
device.name2=santoni
device.name3=rolex
device.name4=riva
device.name5=rova
device.name6=land
device.name7=prada
device.name8=ugglite
device.name9=ugg
device.name10=tiare
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel boot install
dump_boot;

patch_cmdline androidboot.usbconfigfs androidboot.usbconfigfs=true

write_boot;
## end boot install

# Check for 4.9 support
umount /vendor
mount -o ro /dev/block/bootdevice/by-name/cust /vendor
if [ -f /vendor/build.prop ]; then
	if [ -f /vendor/etc/vintf/manifest.xml ] ; then
		grep "target-level=\"2\"" /vendor/etc/vintf/manifest.xml
	elif [ -f /vendor/manifest.xml ] ; then
		grep "target-level=\"2\"" /vendor/manifest.xml
	else
		false
	fi

	if [ $? -eq 0 ]; then
		ui_print "WARNING: Your vendor doesn't seems like supporting kernel 4.9."
	fi
fi
umount /vendor
