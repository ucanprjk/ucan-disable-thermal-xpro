SKIPMOUNT=false

PROPFILE=true

POSTFSDATA=true

LATESTARTSERVICE=true

REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

REPLACE="
"

print_modname() {

  ui_print "           U C A N       P R O J E C T  ʕ⁠·⁠ᴥ⁠·⁠ʔ          "
  sleep 1
  ui_print "Codename           : UCAN Disable Thermal XPro"
  sleep 1
  ui_print "GitHub             : ucanprjk"
  sleep 1
  ui_print "Website            : https://ucanprjk.github.io/ucanproject/"
  sleep 1
  ui_print "Telegram Channel   : https://t.me/uchanProject"
  sleep 1
  ui_print "Publisher          : UCAN Project"
  sleep 1

  ui_print "---------------------------------------------"
  ui_print "        UCAN DEVICE SCANNER INITIALIZED"
  ui_print "---------------------------------------------"
  sleep 2

  ui_print "Checking your device"
  sleep 1

  ui_print "° DATE      : $(date +"%Y-%m-%d") "
  sleep 1
  ui_print "° DEVICE    : $(getprop ro.product.name) "
  sleep 1
  ui_print "° BRAND     : $(getprop ro.product.system.brand) "
  sleep 1
  ui_print "° MODEL     : $(getprop ro.product.model) "
  sleep 1
  ui_print "° BOARD     : $(getprop ro.product.board) "
  sleep 1
  ui_print "° ANDROID   : $(getprop ro.build.version.release) "
  sleep 1
  ui_print "° ROM       : $(getprop ro.build.display.id) "
  sleep 1
  ui_print "° CPU ABI   : $(getprop ro.product.cpu.abi) "
  sleep 1
  ui_print "° KERNEL    : $(uname -r) "
  sleep 1
  ui_print "° SOC       : $(getprop ro.soc.model) "
  sleep 1
  ui_print "° HARDWARE  : $(getprop ro.hardware) "
  sleep 2

  ui_print "---------------------------------------------"
  ui_print "Preparing UCAN Thermal Engine..."
  ui_print "---------------------------------------------"
  sleep 1

  ui_print "PREPARE TO INSTALL"
  sleep 1

    ui_print " [■□□□□□□□□□] 10% "
    sleep 1
    ui_print " [■■□□□□□□□□] 20% "
    sleep 1
    ui_print " [■■■□□□□□□□] 30% "
    sleep 1
    ui_print " [■■■■■□□□□□] 50% "
    sleep 1
    ui_print " [■■■■■■□□□□] 60% "
    sleep 1
    ui_print " [■■■■■■■□□□] 70% "
    sleep 1
    ui_print " [■■■■■■■■□□] 80% "
    sleep 1
    ui_print " [■■■■■■■■■□] 90% "
    sleep 2
    ui_print " [■■■■■■■■■■] 100% "

  sleep 1
  ui_print "                    D O N E !!!!                    "
  sleep 1

  ui_print "UCAN Thermal Engine Successfully Installed"
  sleep 1

  ui_print "Join Telegram Channel For Updates"
  ui_print "https://t.me/uchanProject"

  sleep 1

  /system/bin/am start -a android.intent.action.VIEW -d "https://t.me/uchanProject"

  busybox sleep 1

  ui_print "                     R E B O O T                      "

}

on_install() {

  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2

}

set_permissions() {

  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm $MODPATH/system/bin/P0 0 0 0755 0755
  set_perm $MODPATH/system/bin/P1 0 0 0755 0755

}