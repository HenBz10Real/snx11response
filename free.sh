source $FUNCTION
RED="\033[31m"
printer() {
text="$1"
  color="$2"
 i=0
   while [ $i -lt ${#text} ]; do
     echo -en "\e[${color}m${text:$i:1}\e[0m"
 sleep 0.02
   i=$((i + 1))
 done
echo
}
d=done
echo ""
  sleep 1
  echo ""
  echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▀▀ █▀█ █▀▀ █▀▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █▀░ █▀▄ ██▄ ██▄"
  echo ""
  sleep 0.8 && echo
  printer "- Version : v11.0.0 Free Version"
  sleep 0.5
  printer "- Developer : @Henpeex"
  sleep 0.1
  echo
  sleep 1
  echo
  printer " Script located by henpeex succes ( $d )"
  toast " 𝗦𝗘𝗡𝗦𝗜𝗫 𝗕𝗬 𝗛𝗘𝗡𝗣𝗘𝗘𝗫 "
  sleep 0.4
  echo 
  echo 
  sleep 0.2
  optimazion_freefire() {
    internal="/storage/emulated/0/"
    pm disable --user 0 com.google.android.gms/com.google.android.gms.auth.managed.admin.DeviceAdminReceiver
    pm disable --user 0 com.google.android.gms/com.google.android.gms.mdm.receivers.MdmDeviceAdminReceiver
    dumpsys deviceidle whitelist -com.google.android.gms
    rm -rf "$internal"Android/data/com.dts.freefireth/files/ImageCache/*
    rm -rf "$internal"Android/data/com.dts.freefiremax/files/ImageCache/*
    settings put system font_scale 1
    pm log-visibility --disable com.dts.freefireth> /dev/null 2>&1
    pm log-visibility --disable com.dts.freefiremax> /dev/null 2>&1
    for a in $(dumpsys package com.google.android.gms|grep gms/|cut -f10 -d " "|sort|uniq);do cmd activity force-stop "$a";done
    toast " 𝗦𝗘𝗡𝗦𝗜𝗫 𝗕𝗬 𝗛𝗘𝗡𝗣𝗘𝗘𝗫 "
  }
  optimazion_freefire > /dev/null 2>&1 &
  sleep 1
  adaptive_sensivity() {
    wm size 1152x2624
  }
  adaptive_sensivity > /dev/null 2>&1
  local sc="https://linktr.ee/henvxofficial"
  rm -rf /data/local/tmp/axeron_cash/sensix/response > /dev/null 2>&1
  sleep 4 && am start -a android.intent.action.VIEW -d ${sc} > /dev/null 2>&1
