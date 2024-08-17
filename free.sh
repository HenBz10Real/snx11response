$AXFUN
RED="\033[31m"
local bin="/data/local/tmp/main"
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
architecture=$(getprop ro.product.cpu.abi)
	if [ "$architecture" = "arm64-v8a" ]; then
		mv /data/local/tmp/axeron_cash/sensi/bin/arm64 $bin
	elif [ "$architecture" = "armeabi-v7a" ]; then
	  	mv /data/local/tmp/axeron_cash/sensi/bin/arm32 $bin
	fi
local d=done
local reponse="/data/local/tmp/axeron_cash/sensi/free"
echo ""
  rm -rf $response > /dev/null 2>&1
  sleep 1
  echo ""
  echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▀▀ █▀█ █▀▀ █▀▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █▀░ █▀▄ ██▄ ██▄"
  echo ""
  sleep 0.8 && echo
  printer "- Version : v11.3.0 Free Version"
  sleep 0.5
  printer "- Developer : @Henpeex"
  sleep 0.1
  echo
  echo
if [ "$1" = kill ]; then
	if ! pgrep -f main >/dev/null 2>&1; then
		echo "Program is stopped in the background."
		rm /data/local/tmp/main
	else
		echo "Program failed to stop."
	fi
else
	if ! pgrep -f main >/dev/null 2>&1; then
		chmod +x /data/local/tmp/main
		nohup /data/local/tmp/main >/dev/null 2>&1 &
	fi
	sleep 2
	if pgrep -f main >/dev/null 2>&1; then
		echo "Program is running in the background."
	else
		echo "Program failed to run"
	fi
fi
  local sc="https://linktr.ee/henvxofficial"
  rm -rf $reponse > /dev/null 2>&1
  sleep 5 && am start -a android.intent.action.VIEW -d ${sc} > /dev/null 2>&1
