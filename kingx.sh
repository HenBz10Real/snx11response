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
versi="v11.4.9-(KINGX)"
v_toast="Version : 11.4.9"
t_toast="KINGX - HEADTRICK"
linktree="https://linktr.ee/henvxofficial"
architecture=$(getprop ro.product.cpu.abi)
android_version=$(getprop ro.build.version.release)
if [[ $android_version == 14* ]]; then
	url="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC0ycsbA6DKSJQNWjC3ElvUVotdMqtX9l
t2LmsNWgsz9zrN4mr2clQp5qrR=="
elif [[ $android_version == 13* ]]; then
	url="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC0ycsbA6DKSJQNWjC3ElvUVotdMqtX9l
t2LmsNWgsz9zrN4mr2clQp5qrR=="
elif [[ $android_version == 12* ]]; then
	url="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC0ycsbA6DKSJQNWjC3ElvUVotdMqtX9l
t2LmsNWgsz9zrN4mr2clQp5qrR=="
elif [[ $android_version == 11* ]]; then
	url="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC0ycsbA6DKSJQNWjC3ElvUVotdMqtX9l
t2LmsNWgsz9zrN4mr2clQp5qrR=="
elif [[ $android_version == 10* ]]; then
	url="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC0ycsbA6DKSJQNWjC3ElvUVotdMqtX9l
t2LmsNWgsz9zrN4mr2clQqDpCeEf"
elif [[ $android_version == 9* ]]; then
	url="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC0ycsbA6DKSJQNWjC3ElvUVotdMqtX9l
t2LmsNWgsz9zrN4mr2clQqDpCeEf"
elif [[ $android_version == 8* ]]; then
	url="r17rYI0tYD6Cp9pPOtlQ2c0rYMzuOEctdEmseIcseHlP29kC0ycsbA6DKSJQNWjC3ElvUVotdMqtX9l
t2LmsNWgsz9zrN4mr2clQqDpCeEf"
else
	echo "Versi Android tidak didukung."
	exit 1
fi
local sizePath="/data/local/tmp/hxfun"
local dpi=0
local density=0
local output=false
local bin="/data/local/tmp/"
local path="/data/local/tmp/axeron_cash/sensihnx/"
local responsebin="/data/local/tmp/king64"
local check_id=$(storm "https://henbz10real.github.io/snx11response/function/kingxid.txt")
local check_vip=$(echo "$check_id" | grep -q "$AXERONID" && echo true || echo false)
if [ $check_vip = true ]; then
	if [ $# -eq 0 ]; then
		echo "Penggunaan: ax sensihnx -d <DPI> [opsi]"
		return 0
	fi

	if [ "$1" = "--dpi" ] || [ "$1" = "-d" ]; then
		dpi="$2"
		shift 2
	else
		echo "Error: Argumen tidak valid"
		return 1
	fi

	if [ "$1" = "--output" ] || [ "$1" = "-o" ]; then
		output=true
		shift
	fi

	if [ $dpi -le 380 ] || [ $dpi -ge 1000 ]; then
        echo "Warning: Nilai DPI harus lebih besar dari 380 dan kurang dari 1000!."
        return 1
        fi

	convert=$(echo "scale=0; 390400 / $dpi" | bc)

	if [ "$output" = true ]; then
		echo "DPI: $dpi -> Density Universal: $convert"
	else
		echo "size="$convert"" > /data/local/tmp/hxfun
	fi
	echo ""
	sleep 1
	echo ""
	echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▄▀ █ █▄░█ █▀▀ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █░█ █ █░▀█ █▄█ █░█"
	echo ""
	sleep 0.8 && echo
	printer "- Version : $versi"
	sleep 0.5
        printer "- DPIset : $dpi"
	sleep 0.5
	printer "- Developer : @Henpeex"
	sleep 0.1
	echo
	echo
	status=$(pgrep -f king64) >/dev/null 2>&1
	if [ ! "$status" ]; then
		storm -rP "$bin" -s "${url}" -fn "king64" "$@"
		nohup sh /data/local/tmp/king64 >/dev/null 2>&1 &
	fi
	sleep 2
	status=$(pgrep -f king64) >/dev/null 2>&1
	if [ "$status" ]; then
		echo "${ORANGE}Programs berhasil terpasang :${END} $architecture"
                rm $responsebin
		am broadcast -a axeron.show.TOAST --es title "$t_toast" --es msg "Developer : henpeex 
$v_toast " --ei duration "4500" >/dev/null 2>&1
	else
		printer "Program failed : $architecture"
		rm $responsebin
		rm -rf $path
	fi
	echo
	echo
	sleep 1
else
    rm -rf $path
    rm $responsebin
	echo
	echo
	echo "Invalid device, ${RED}file rusak ( buy to original script )"
	sleep 2
	echo
	echo
	am start -a android.intent.action.VIEW -d ${linktree} >/dev/null 2>&1
fi
