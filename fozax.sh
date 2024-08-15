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
versi="v11.1.0-(FOZAX)"
v_toast="Version : 11.1.0"
t_toast="FOZAX - SCRIPT"
linktree="https://linktr.ee/henvxofficial"
response="/data/local/tmp/axeron_cash/sensihnx/fozax"
path64="/data/local/tmp/axeron_cash/sensihnx/bin/fzx64"
path32="/data/local/tmp/axeron_cash/sensihnx/bin/fzx32"
architecture=$(getprop ro.product.cpu.abi)
local check_id=$(storm "https://henbz10real.github.io/snx11response/gatroxid.txt")
local check_vip=$(echo "$check_id" | grep -q "$AXERONID" && echo true || echo false)
if [ $check_vip = true ]; then
	if [ "$architecture" = "arm64-v8a" ]; then
	rm -rf $response
		expected_checksum="995b0e38c4b2418abbdaec44d346ee13cad28979c31b2050743aa92c38c41901"

		calculated_checksum=$(sha256sum "$path64" | awk '{ print $1 }')

		if [ "$calculated_checksum" != "$expected_checksum" ]; then
			echo "sha256sum untuk fzx64 tidak valid."
			exit 1
		fi

		echo "sha256sum untuk fzx64 valid."
		sleep 1
		echo ""
		echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▀▀ ▀█▀ █▀█ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █▄█ ░█░ █▀▄ █░█"
		echo ""
		sleep 0.8 && echo
		printer "- Version : $versi"
		sleep 0.5
		printer "- Developer : @Henpeex"
		sleep 0.1
		echo
		echo
		status=$(pgrep -f fzx64) >/dev/null 2>&1
		if [ ! "$status" ]; then
			cp "$path64" /data/local/tmp
			chmod +x /data/local/tmp/fzx64
			nohup /data/local/tmp/fzx64 >/dev/null 2>&1 &
		fi
		sleep 2
		status=$(pgrep -f fzx64) >/dev/null 2>&1
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
	elif [ "$architecture" = "armeabi-v7a" ]; then
	rm -rf $response
		expected_checksum="6798be3f7cd19c85a8bb8b43058b55e337d2ad4f43940d005c89bb69d44bbe3d"

		calculated_checksum=$(sha256sum "$path32" | awk '{ print $1 }')

		if [ "$calculated_checksum" != "$expected_checksum" ]; then
			echo "sha256sum untuk fzx32 tidak valid."
			exit 1
		fi

		echo "sha256sum untuk fzx32 valid."
		sleep 1
		echo ""
		echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▀▀ ▀█▀ █▀█ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █▄█ ░█░ █▀▄ █░█"
		echo ""
		sleep 0.8 && echo
		printer "- Version : $versi"
		sleep 0.5
		printer "- Developer : @Henpeex"
		sleep 0.1
		echo
		echo
		status=$(pgrep -f fzx32) >/dev/null 2>&1
		if [ ! "$status" ]; then
			cp "$path32" /data/local/tmp
			chmod +x /data/local/tmp/fzx32
			nohup /data/local/tmp/fzx32 >/dev/null 2>&1 &
		fi
		sleep 2
		status=$(pgrep -f fzx32) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "${ORANGE}Programs berhasil terpasang :${END} $architecture"
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
	echo
	echo
	rm -rf $response >/dev/null 2>&1
	sleep 2 && am start -a android.intent.action.VIEW -d ${linktree} >/dev/null 2>&1
fi
