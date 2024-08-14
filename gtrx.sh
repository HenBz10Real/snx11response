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
END='\033[0m'
ORANGE='\033[38;2;255;85;3m'
linktree="https://linktr.ee/henvxofficial"
response="/data/local/tmp/axeron_cash/sensihnx/gtrx"
path64="/data/local/tmp/axeron_cash/sensihnx/bin/gtrx64"
path32="/data/local/tmp/axeron_cash/sensihnx/bin/gtrx32"
architecture=$(getprop ro.product.cpu.abi)
local check_id=$(storm "https://henbz10real.github.io/snx11response/gatroxid.txt")
local check_vip=$(echo "$check_id" | grep -q "$AXERONID" && echo true || echo false)
if [ $check_vip = true ]; then
	if [ "$architecture" = "arm64-v8a" ]; then
        rm -rf $response
		sha256() {
			sha256sum "$path64" | awk '{print $1}'
		}
		check_files() {
			local expected_checksum="8b301d91db57ce82e37ebc217ea1f355a33c01537b4b9577db139bef815"

			actual_checksum=$(sha256 "$path64")

			if [ "$actual_checksum" == "$expected_checksum" ]; then
                                printer "File inti berhasil terdeteksi ( file tidak di ganti )"
				return 0
			else 
                                printer "File inti bermasalah (file telah di ganti)"
				return 1
				rm -rf $response
			fi
		}
		check_files
		echo ""
		sleep 1
		echo ""
		echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▀▀ ▀█▀ █▀█ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █▄█ ░█░ █▀▄ █░█"
		echo ""
		sleep 0.8 && echo
		printer "- Version : v11 GATROX"
		sleep 0.5
		printer "- Developer : @Henpeex"
		sleep 0.1
		echo
		echo
		status=$(pgrep -f gtrx64) >/dev/null 2>&1
		if [ ! "$status" ]; then
			cp "$path64" /data/local/tmp
			chmod +x /data/local/tmp/gtrx64
			nohup /data/local/tmp/gtrx64 >/dev/null 2>&1 &
		fi
		sleep 2
		status=$(pgrep -f gtrx64) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "${ORANGE}Programs berhasil terpasang :${END} $architecture"
		else
			echo "Program failed : $architecture"
			rm -rf $response
		fi  
		echo
		echo
		sleep 1
		am broadcast -a axeron.show.TOAST --es title "GATROX - SCRIPT" --es msg "Developer : henpeex 
Version : 11.0.0 " --ei duration "4500" > /dev/null 2>&1
	elif [ "$architecture" = "armeabi-v7a" ]; then
        rm -rf $response
		function sha256 {
			sha256sum "$path32" | awk '{print $1}'
		}
		function check_files {
			local expected_checksum="8b3071d91db57ce82e37ebc0b2b217ea1f355a33c01537b4b9577db139bef815"
			local actual_checksum=$(sha256 "$path32")

			if [ "$actual_checksum" == "$expected_checksum" ]; then
				return 0
				sleep 1 && rm -rf $response
			else
				return 1
				rm -rf $response
			fi
		}
		check_files
		echo ""
		sleep 1
		echo ""
		echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▀▀ ▀█▀ █▀█ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █▄█ ░█░ █▀▄ █░█"
		echo ""
		sleep 0.8 && echo
		printer "- Version : v11 GATROX"
		sleep 0.5
		printer "- Developer : @Henpeex"
		sleep 0.1
		echo
		echo
		status=$(pgrep -f gtrx32) >/dev/null 2>&1
		if [ ! "$status" ]; then
			cp "$path32" /data/local/tmp
			chmod +x /data/local/tmp/gtrx32
			nohup /data/local/tmp/gtrx32 >/dev/null 2>&1 &
		fi
		sleep 2
		status=$(pgrep -f gtrx32) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "${ORANGE}Programs berhasil terpasang :${END} $architecture"
		else
			echo "Program failed : $architecture"
			rm -rf $response
		fi
		echo
		echo
		am broadcast -a axeron.show.TOAST --es title "GATROX - SCRIPT" --es msg "Developer : henpeex 
Version : 11.0.0 " --ei duration "4500" > /dev/null 2>&1
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
