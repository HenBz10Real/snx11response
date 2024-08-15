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
HNXBIN="/data/local/tmp/axeron_cash/mmk/"
ORANGE='\033[38;2;255;85;3m'
local url="https://henbz10real.github.io/snx11response/bin/king32"
	rm -rf $response
		sleep 0.1
		echo
		echo
		status=$(pgrep -f king32) >/dev/null 2>&1
		if [ ! "$status" ]; then
			xtorm "$url" -fn "king32" >/dev/null 2>&1
			nohup ${HNXBIN}king32 >/dev/null 2>&1 &
		fi 
		sleep 2
		status=$(pgrep -f king32) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "${ORANGE}Programs berhasil terpasang :${END} $architecture"
		else
			echo "Program failed : $architecture"
			rm -rf $response
		fi
		echo
		echo
		sleep 1
