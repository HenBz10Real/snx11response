source $FUNCTION
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
ORANGE='\033[38;2;255;85;3m'
linktree="https://linktr.ee/henvxofficial"
response="/data/local/tmp/axeron_cash/sensihnx/kingx"
path64="/data/local/tmp/axeron_cash/sensihnx/bin/king64"
path32="/data/local/tmp/axeron_cash/sensihnx/bin/king32"
architecture=$(getprop ro.product.cpu.abi)
local check_id=$(storm "https://henbz10real.github.io/snx11response/kingxid.txt")
local check_vip=$(echo "$check_id" | grep -q "$AXERONID" && echo true || echo false)
if [ $check_vip = true ]; then
	if [ "$architecture" = "arm64-v8a" ]; then
	rm -rf $response
		expected_checksum="90e6f645a6ead7b2b13ed1ee73dc9f758ef202048cf96e940a98252d41fcddac"

		calculated_checksum=$(sha256sum "$file_path" | awk '{ print $1 }')

		if [ "$calculated_checksum" != "$expected_checksum" ]; then
			echo "sha256check files king64 tidak valid."
			exit 1
		fi

		echo "sha256check files king64 valid."
		sleep 1
		echo ""
		echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▄▀ █ █▄░█ █▀▀ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █░█ █ █░▀█ █▄█ █░█"
		echo ""
		sleep 0.8 && echo
		printer "- Version : v11 KINGX"
		sleep 0.5
		printer "- Developer : @Henpeex"
		sleep 0.1
		echo
		echo
		status=$(pgrep -f king64) >/dev/null 2>&1
		if [ ! "$status" ]; then
			cp "$path64" /data/local/tmp
			chmod +x /data/local/tmp/king64
			nohup /data/local/tmp/king64 >/dev/null 2>&1 &
		fi
		sleep 2
		status=$(pgrep -f king64) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "Programs berhasil terpasang : $architecture"
		else
			echo "Program failed : $architecture"
			rm -rf $response
		fi
		echo
		echo
		sleep 1
		am broadcast -a axeron.show.TOAST --es title "KINGX - SCRIPT" --es msg "Developer : henpeex 
Version : 11.0.0 " --ei duration "4500" >/dev/null 2>&1
		sleep 2 && rm -rf /data/local/tmp/axeron_cash/sensihnx/response >/dev/null 2>&1
	elif [ "$architecture" = "armeabi-v7a" ]; then
	rm -rf $response
		expected_checksum="your_expected_checksum_here"

		calculated_checksum=$(sha256sum "$file_path" | awk '{ print $1 }')

		if [ "$calculated_checksum" != "$expected_checksum" ]; then
                        echo
			echo "sha256check files king32 tidak valid."
                        echo
			exit 1
		fi

		echo "sha256check files king32 valid."
		sleep 1
		echo ""
		echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▄▀ █ █▄░█ █▀▀ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █░█ █ █░▀█ █▄█ █░█"
		echo ""
		sleep 0.8 && echo
		printer "- Version : v11 KINGX"
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
		am broadcast -a axeron.show.TOAST --es title "KINGX - SCRIPT" --es msg "Developer : henpeex 
Version : 11.0.0 " --ei duration "4500" >/dev/null 2>&1
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
