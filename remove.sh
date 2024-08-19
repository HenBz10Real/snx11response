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
  local king64="/data/local/tmp/king64"
  local fozx64="/data/local/tmp/fozx64"
  local gtrx64="/data/local/tmp/gtrx64"
  local sizePath="/data/local/tmp/hxfun"
  ORANGE='\033[38;2;255;85;3m'
  sleep 1 && rm -rf /data/local/tmp/axeron_cash/sensihnx/
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
  settings_output() {
    settings delete global disable_window_blurs
    settings delete global accessibility_reduce_transparency
    settings delete global zram_enabled
    settings delete global wifi_power_save
    settings delete global mobile_data_always_on
    settings delete global enhanced_processing
    settings delete secure screensaver_enabled
    settings delete secure assistant
    settings delete global google_core_control
    settings delete secure adaptive_connectivity_enabled
    settings delete global device_idle_constants
    settings delete global activity_manager_constants
    settings delete global job_scheduler_constants 
    settings delete global job_scheduler_quota_controller_constants
    settings put secure multi_press_timeout 400
    settings put secure long_press_timeout 400
    pkill -f king64
    pkill -f king32
    pkill -f gtrx64
    pkill -f gtrx32
    pkill -f fozx64
    pkill -f main
    pkill -f fozx32
    rm $sizePath
  }
  settings_output >/dev/null 2>&1
