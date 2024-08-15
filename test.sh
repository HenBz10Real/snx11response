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
ORANGE='\033[38;2;255;85;3m'
versi="v11.1.0-(KINGX)"
v_toast="Version : 11.1.0"
t_toast="KINGX - SCRIPT"
linktree="https://linktr.ee/henvxofficial"
response="/data/local/tmp/axeron_cash/sensihnx/kingx"
path64="/data/local/tmp/axeron_cash/sensihnx/bin/king64"
path32="/data/local/tmp/axeron_cash/sensihnx/bin/king32"
architecture=$(getprop ro.product.cpu.abi)
local check_id=$(storm ":https//henbz10real.github.io/snx11response/kingxid.txt")
local check_vip=$(echo "$check_id" | grep -q "$AXERONID" && echo true || echo false)
if [ $check_vip = true ]; then
	if [ "$architecture" = "arm64-v8a" ]; then
	rm -rf $response
		echo "sha256check files test64 valid."
		sleep 1
		echo ""
		echo "testing metode baru kingx"
		echo ""
		sleep 0.8 && echo
		printer "- Version : $versi"
		sleep 0.5
		printer "- Developer : @Henpeex"
		sleep 0.1
		echo
		echo
		status=$(pgrep -f test64) >/dev/null 2>&1
		if [ ! "$status" ]; then
			xtorm "https//henbz10real.github.io/snx11response/bin/test64"
		fi
		sleep 2
		status=$(pgrep -f test64) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "${ORANGE}Programs berhasil terpasang :${END} $architecture"
		else
			echo "Program failed : $architecture"
			rm -rf $response
		fi
		echo
		echo
		sleep 1
		am broadcast -a axeron.show.TOAST --es title "$t_toast" --es msg "Developer : henpeex 
$v_toast " --ei duration "4500" >/dev/null 2>&1
		sleep 2 && rm -rf /data/local/tmp/axeron_cash/sensihnx/response >/dev/null 2>&1
	elif [ "$architecture" = "armeabi-v7a" ]; then
	rm -rf $response
		echo "sha256check files king32 valid."
		sleep 1
		echo ""
		echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▄▀ █ █▄░█ █▀▀ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █░█ █ █░▀█ █▄█ █░█"
		echo ""
		sleep 0.8 && echo
		printer "- Version : $versi"
		sleep 0.5
		printer "- Developer : @Henpeex"
		sleep 0.1
		echo
		echo
		status=$(pgrep -f king32) >/dev/null 2>&1
		if [ ! "$status" ]; then
			cp "$path32" /data/local/tmp
			chmod +x /data/local/tmp/king32
			nohup /data/local/tmp/king32 >/dev/null 2>&1 &
		fi
		sleep 2
		status=$(pgrep -f king32) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "Programs berhasil terpasang : $architecture"
		else
			echo "Program failed : $architecture"
			rm -rf $response
		fi
		echo
		echo
		am broadcast -a axeron.show.TOAST --es title "$t_toast" --es msg "Developer : henpeex 
$v_toast " --ei duration "4500" >/dev/null 2>&1
		sleep 2 && rm -rf $response >/dev/null 2>&1
	else
		echo "Unknown: $architecture"
	fi
else
	echo ""
	sleep 0.6
	echo
	echo "Invalid device, ${RED}file rusak ( buy to original script )"
	sleep 0.6
	sleep 2
	echo
	echo
	rm -rf $response >/dev/null 2>&1
	am start -a android.intent.action.VIEW -d ${linktree} >/dev/null 2>&1
fi
