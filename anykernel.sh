# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Shuna by ItoRenz
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=rolex
device.name2=redmi4a
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

ui_print "Welcome To Jura Tempest Federation"
ui_print "               Shuna              "
ui_print "           Oni Princess           "
ui_print "          Tempest Family          "

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel boot install
dump_boot;

ui_print "*********************"
ui_print " "
ui_print "SSSSSS S    S S    S SSSSSS SSSSSS"
ui_print "S      S    S S    S S    S S    S"
ui_print "S      S    S S    S S    S S    S"
ui_print "SSSSSS SSSSSS S    S S    S SSSSSS"
ui_print "     S S    S S    S S    S S    S"
ui_print "     S S    S S    S S    S S    S"
ui_print "SSSSSS S    S SSSSSS S    S S    S"
ui_print "             TEMPEST              "
ui_print "************ ItoRenz *************"
ui_print "*******************"

write_boot;
## end boot install


# shell variables
#block=vendor_boot;
#is_slot_device=1;
#ramdisk_compression=auto;

# reset for vendor_boot patching
#reset_ak;

## AnyKernel vendor_boot install
#split_boot; # skip unpack/repack ramdisk since we don't need vendor_ramdisk access

#flash_boot;
## end vendor_boot install
