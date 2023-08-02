#!/system/bin/sh

if $BOOTMODE; then
    ui_print "- Installing from Magisk / KernelSU app"
else
    ui_print "*********************************************************"
    ui_print "! Install from recovery is NOT supported"
    ui_print "! Recovery sucks"
    ui_print "! Please install from Magisk / KernelSU app"
    abort    "*********************************************************"
fi

mv -f "$MODPATH/SNFix.dex" "/data/adb/"

# Android 8.0 or newer
if [[ "$(getprop ro.build.version.sdk)" -lt 26 ]]; then
    ui_print ""
    ui_print "Functionality is limited on Android 7 and older."
    ui_print "Hardware-backed attestation will not be disabled."
    ui_print ""

    # Remove Zygisk module, but keep props and scripts
    rm -rf "$MODPATH/zygisk"
    rm -rf "/data/adb/SNFix.dex"
fi

chmod 755 "$MODPATH/service.sh" "$MODPATH/post-fs-data.sh"
