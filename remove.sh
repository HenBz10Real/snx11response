$AXFUN
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
  END='\033[0m'
  local pathking="/data/local/tmp/king64"
  local pathfozx="/data/local/tmp/fozx64"
  local pathgtrx="/data/local/tmp/gtrx64"
  local sizeath="/data/local/tmp/hxfun"
  ORANGE='\033[38;2;255;85;3m'
  echo ""
  sleep 1
  echo ""
  echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▀█ █▀▄▀█ █░█
▄█ ██▄ █░▀█ ▄█ █ █░█   █▀▄ █░▀░█ ▀▄▀"
  echo ""
  sleep 0.8 && echo
  printer "- Version : v11 Remove ( Uninstaller )"
  sleep 0.5
  printer "- Developer : @Henpeex"
  echo 
  echo 
  sleep 1
  echo "${ORANGE}all scripts stop automatically :${END} successfully "
  echo
  echo
  if ! pgrep -f king64 >/dev/null 2>&1; then
      pkill -f king64
  else
      rm $sizeath
  fi
  if ! pgrep -f gtrx64 >/dev/null 2>&1; then
      pkill -f gtrx64
  else
      rm $sizeath
  fi
  if ! pgrep -f fozx64 >/dev/null 2>&1; then
      pkill -f fozx64
  else
      rm $sizeath
  fi
  settings_output() {
    settings put secure multi_press_timeout 400
    settings put secure long_press_timeout 400
    rm $sizeath
    rm $pathking
    rm $pathfozx
    rm $pathgtrx
    cmd notification post -S bigtext -t 'SENSIXPRO+' 'Tag' 'Remove Berhasil ( jika mau main lagi silahkan aktifin sensix terlebih dahulu )'
  }
  settings_output >/dev/null 2>&1
